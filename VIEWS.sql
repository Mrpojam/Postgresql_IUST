/*
    این ویو مشخصات افرادی که برای انتخابات ثبت نام کردند را برمیگرداند
*/
CREATE VIEW candidate_enrollment_details AS
SELECT Candidate.NID, Enrolled.Name, Enrolled.Age, Enrolled.Gender,
   	Enrolled.degree, Enrolled.Political_background, Enrolled.Qualification,
   	Enrolled.EType, Enrolled.BornCountry, Election.name AS election_name
FROM Candidate
JOIN Enrolled ON Candidate.enrolled_id = Enrolled.NID
JOIN Election ON Candidate.election_id = Election.NID;



/*
این ویو افرادی که برای کاندید شدن تایید صلاحیت شده اند را برمیگرداند.
*/
CREATE VIEW candidate_qualification AS
SELECT Enrolled.NID, Enrolled.Name, Enrolled.Age, Enrolled.Gender,
   	Enrolled.degree, Enrolled.Political_background, Enrolled.Qualification,
   	Enrolled.EType, Enrolled.BornCountry
FROM Enrolled


/*
این ویو تعداد رای افراد را در انتخابات ریاست جمهوری برمیگرداند
*/
CREATE VIEW president_votes AS
    SELECT vote, year, COUNT(*) as vote_count
	FROM VEPresident
	GROUP BY year, vote ORDER BY year DESC, vote_count DESC;

/*
این ویو برنده انتخابات هر سال ریاست جمهوری را برمیگرداند
*/
CREATE VIEW president_result AS
    SELECT president_votes.year, Enrolled.Name AS winner_name, president_votes.vote_count AS winner_vote_count
    FROM president_votes
    JOIN Enrolled ON president_votes.vote = Enrolled.NID
    WHERE president_votes.vote_count = (
      SELECT MAX(president_votes_inner.vote_count)
      FROM president_votes AS president_votes_inner
      WHERE president_votes_inner.year = president_votes.year
    );

/*
این ویو مشخصات هر رای مجلس را بدست میاورد
*/
CREATE VIEW parilmanet_votes AS
SELECT Enrolled.*, VEParlimanet.year,
   	CASE WHEN VEParlimanet.v1 = Enrolled.NID THEN 1 ELSE 0 END +
   	CASE WHEN VEParlimanet.v2 = Enrolled.NID THEN 1 ELSE 0 END +
   	CASE WHEN VEParlimanet.v3 = Enrolled.NID THEN 1 ELSE 0 END +
   	CASE WHEN VEParlimanet.v4 = Enrolled.NID THEN 1 ELSE 0 END AS vote_count
FROM VEParlimanet
JOIN Enrolled ON VEParlimanet.v1 = Enrolled.NID OR
             	VEParlimanet.v2 = Enrolled.NID OR
             	VEParlimanet.v3 = Enrolled.NID OR
             	VEParlimanet.v4 = Enrolled.NID;

/*
این ویو برای هر شهر و سال تعداد رای های انتخابات محلس را برمیگرداند
*/
CREATE VIEW parlimant_votes_sum AS
SELECT SUM(vote_count) as vote, NID, City, year FROM parilmanet_votes
GROUP BY NID, city, year ORDER BY year DESC, vote DESC

/*
برنده های انتخابات هر شهر و سال را در مجلس برمیگرداند
*/
CREATE VIEW parlimant_winners AS
SELECT pvs.year, pvs.city, e.NID AS winner_name
FROM (
  SELECT year, city, MAX(vote) AS max_vote
  FROM parlimant_votes_sum
  GROUP BY year, city
) AS max_votes
JOIN parlimant_votes_sum pvs ON max_votes.year = pvs.year AND max_votes.city = pvs.city AND max_votes.max_vote = pvs.vote
JOIN enrolled e ON pvs.nid = e.nid AND pvs.city = e.city
ORDER BY pvs.year DESC, pvs.city;

/*
این ویو مشخصات هر رای خبرگان را بدست میاورد
*/
CREATE VIEW khebregan_votes AS
SELECT Enrolled.*, VEKhebregan.year,
   	CASE WHEN VEhebregan.v1 = Enrolled.NID THEN 1 ELSE 0 END +
   	CASE WHEN VEhebregan.v2 = Enrolled.NID THEN 1 ELSE 0 END +
   	CASE WHEN VEhebregan.v3 = Enrolled.NID THEN 1 ELSE 0 END +
   	CASE WHEN VEhebregan.v4 = Enrolled.NID THEN 1 ELSE 0 END AS vote_count
FROM VEhebregan
JOIN Enrolled ON VEhebregan.v1 = Enrolled.NID OR
             	VEhebregan.v2 = Enrolled.NID OR
             	VEhebregan.v3 = Enrolled.NID OR
             	VEhebregan.v4 = Enrolled.NID;

/*
این ویو برندگان مجلس خبرگان را برمیگرداند
*/
CREATE VIEW khebregan_votes_sum AS
SELECT SUM(vote_count) as vote, NID, year FROM khebregan_votes
GROUP BY NID, year ORDER BY year DESC, vote DESC


CREATE VIEW candidate_enrollment_details AS
SELECT Candidate.NID, Enrolled.Name, Enrolled.Age, Enrolled.Gender,
   	Enrolled.degree, Enrolled.Political_background, Enrolled.Qualification,
   	Enrolled.EType, Enrolled.BornCountry, Election.name AS election_name
FROM Candidate
JOIN Enrolled ON Candidate.enrolled_id = Enrolled.NID
JOIN Election ON Candidate.election_id = Election.NID;




CREATE VIEW candidate_qualification AS
SELECT Enrolled.NID, Enrolled.Name, Enrolled.Age, Enrolled.Gender,
   	Enrolled.degree, Enrolled.Political_background, Enrolled.Qualification,
   	Enrolled.EType, Enrolled.BornCountry
FROM Enrolled

CREATE VIEW president_votes AS
    SELECT vote, year, COUNT(*) as vote_count
	FROM VEPresident
	GROUP BY year, vote ORDER BY year DESC, vote_count DESC;


CREATE VIEW president_result AS
    SELECT president_votes.year, Enrolled.Name AS winner_name, president_votes.vote_count AS winner_vote_count
    FROM president_votes
    JOIN Enrolled ON president_votes.vote = Enrolled.NID
    WHERE president_votes.vote_count = (
      SELECT MAX(president_votes_inner.vote_count)
      FROM president_votes AS president_votes_inner
      WHERE president_votes_inner.year = president_votes.year
    );


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

CREATE VIEW parlimant_votes_sum AS
SELECT SUM(vote_count) as vote, NID, City, year FROM votes
GROUP BY NID, city, year ORDER BY year DESC, vote DESC


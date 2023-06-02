INSERT INTO voter(NID, name, Age, BornCountry)
VALUES
  (10, 'Ali', 25, 'iran'),
  (20, 'Fatima', 32, 'iran'),
  (30, 'Mohammad', 44, 'iran'),
  (40, 'Sara', 19, 'iran');
 
INSERT INTO Election (NID, name)
VALUES (0, 'President'), (1, 'President');

INSERT INTO EPresident(year, election_id) VALUES (1400, 0);
INSERT INTO EPresident(year, election_id) VALUES (1396, 1);


INSERT INTO Enrolled(NID, Name, Age, Gender, degree, Political_background, Qualification, EType, BornCountry)
VALUES
  (1, 'Ali', 25, 'Male', 'master', 'Conservative', true, 'President', 'iran'),
  (2, 'Maryam', 30, 'Female', 'phd', 'Liberal', true, 'President', 'iran'),
  (3, 'Hassan', 35, 'Male', 'phd', 'Moderate', true, 'President', 'iran'),
  (4, 'Narges', 28, 'Female', 'master', 'Conservative', true, 'President', 'iran');
  

INSERT INTO Candidate(NID, enrolled_id, election_id) VALUES
	(1, 2, 1), (2, 2, 1), (3, 2, 1), (4, 2, 1);


INSERT INTO VEPresident(NID, year, vote) VALUES
	(10, 1396, 2),
	(20, 1396, 2),
	(30, 1396, 2),
	(40, 1396, 4);

INSERT INTO VEPresident(NID, year, vote) VALUES
	(10, 1400, 1),
	(20, 1400, 1),
	(30, 1400, 1),
	(40, 1400, 3);
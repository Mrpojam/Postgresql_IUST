INSERT INTO voter(NID, name, Age, BornCountry)
VALUES
  (10, 'Ali', 25, 'iran'),
  (20, 'Fatima', 32, 'iran'),
  (30, 'Mohammad', 44, 'iran'),
  (40, 'Sara', 19, 'iran'),
  (11, 'Ali1', 25, 'iran'),
  (22, 'Fatima2', 32, 'iran'),
  (33, 'Mohamma3', 44, 'iran'),
  (44, 'Sara4', 19, 'iran');
 
INSERT INTO Election (NID, name)
VALUES (0, 'President'), (1, 'President'), (2, 'Majles'), (3, 'khebregan');

INSERT INTO EPresident(year, election_id) VALUES (1400, 0);
INSERT INTO EPresident(year, election_id) VALUES (1396, 1);
INSERT INTO VEKhebregan(year, election_id) VALUES(1398, 3);


INSERT INTO Enrolled(NID, Name, Age, Gender, degree, Political_background, Qualification, EType, City, BornCountry)
VALUES
  (1, 'Ali', 25, 'Male', 'master', 'Conservative', true, 'President','tehran', 'iran'),
  (2, 'Maryam', 30, 'Female', 'phd', 'Liberal', true, 'President','kerman', 'iran'),
  (3, 'Hassan', 35, 'Male', 'phd', 'Moderate', true, 'President','shiraz', 'iran'),
  (4, 'Narges', 28, 'Female', 'master', 'Conservative', true, 'President', 'tehran', 'iran'),
  (5, 'AliMajles', 25, 'Male', 'master', 'Conservative', true, 'Parlimanet','tehran', 'iran'),
  (6, 'MaryamMajles', 30, 'Female', 'phd', 'Liberal', true, 'Parlimanet','tehran', 'iran'),
  (7, 'HassanMajles', 35, 'Male', 'phd', 'Moderate', true, 'Parlimanet','tehran', 'iran'),
  (8, 'NargesMajles', 28, 'Female', 'master', 'Conservative', true, 'Parlimanet', 'tehran', 'iran'),
  (9, 'AliMajles2', 25, 'Male', 'master', 'Conservative', true, 'Parlimanet','kerman', 'iran'),
  (10, 'MaryamMajles2', 30, 'Female', 'phd', 'Liberal', true, 'Parlimanet','kerman', 'iran'),
  (11, 'HassanMajles2', 35, 'Male', 'phd', 'Moderate', true, 'Parlimanet','kerman', 'iran'),
  (12, 'NargesMajles2', 28, 'Female', 'master', 'Conservative', true, 'khebregan', 'tehran', 'iran'),
  
  (13, 'NargesMajles2', 28, 'Female', 'master', 'Conservative', true, 'khebregan', 'tehran', 'iran'),
  
  (14, 'NargesMajles2', 28, 'Female', 'master', 'Conservative', true, 'khebregan', 'tehran', 'iran'),
  
  (15, 'NargesMajles2', 28, 'Female', 'master', 'Conservative', true, 'khebregan', 'tehran', 'iran');
	
	  

INSERT INTO Candidate(NID, enrolled_id, election_id) VALUES
	(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 3, 1);

INSERT INTO Candidate(NID, enrolled_id, election_id) VALUES
	(5, 5, 2), (6, 6,2), (7, 7, 2), (8, 8, 2), (9, 9, 2), (10, 10, 2), (11, 11, 2), (12, 12, 2);


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
	

INSERT INTO VEParlimanet(NID, year, v1, v2, v3, v4) VALUES
	(10, 1398, 5, 6, NULL, NULL),
	(20, 1398, 5, 6, 7, 8),
	(30, 1398, 6, 7, NULL, NULL),
	(40, 1398, 6, NULL, NULL, NULL),
	(11, 1398, 9, 10, 11, 12),
	(22, 1398, 12, 11, 9, NULL),
	(33, 1398, 12, NULL, NULL, NULL),
	(44, 1398, 12, NULL, NULL, NULL);
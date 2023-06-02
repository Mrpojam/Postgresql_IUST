ALTER TABLE voter
ADD CONSTRAINT check_voter_age CHECK (Age >= 18);

ALTER TABLE Enrolled
ADD CONSTRAINT check_enrolled_age CHECK (Age >= 30 AND Age <= 70);

ALTER TABLE Enrolled
ADD CONSTRAINT check_enrolled_degree CHECK (degree = 'master' OR degree = 'phd' );

ALTER TABLE Enrolled
ADD CONSTRAINT check_enrolled_country CHECK (BornCountry = 'iran');

ALTER TABLE voter
ADD CONSTRAINT check_voter_country CHECK (BornCountry = 'iran');

CREATE INDEX idx_election ON Election(NID);

CREATE INDEX idx_enrolled ON Enrolled(NID);

CREATE INDEX idx_candidate ON Candidate(NID);

CREATE INDEX idx_VEpresident ON VEPresident(NID, year);

CREATE INDEX idx_VEparlimane ON VEParlimanet(NID, year);

CREATE INDEX idx_VEcity ON VECity(NID, year);

CREATE INDEX idx_VEKhebregan VEKhebregan(NID, year);

CREATE Index idx_Supervisor ON Supervisor(NID, year);

CREATE index idx_enrolled_supervisor ON Enrolled_Supervisor(NID, year);

CREATE TABLE voter(NID INT PRIMARY KEY,
          name VARCHAR(50),
          Age INTEGER,
          BornCountry CHAR(130));

CREATE TABLE Election (NID INT PRIMARY KEY,
					  name VARCHAR(20));

CREATE TABLE EPresident(
            year INT PRIMARY KEY,
            election_id INT REFERENCES Election(NID));
             
CREATE TABLE EParlimanet(
             year INT PRIMARY KEY,
				 City VARCHAR(30),		 
             election_id INT REFERENCES Election(NID));
             
CREATE TABLE EKhebregan( 
             year INT PRIMARY KEY,
             election_id INT REFERENCES Election(NID));
             
CREATE TABLE E_City_Village(year INT PRIMARY KEY,
               City VARCHAR(30),
				election_id INT REFERENCES Election(NID));
            
CREATE TABLE Enrolled(NID INT PRIMARY KEY,
           Name VARCHAR(40),
           Age INT,
           Gender VARCHAR(10),
           degree VARCHAR(40),
           Political_background VARCHAR(100),
           Qualification BOOL,
           EType VARCHAR(15),
           BornCountry VARCHAR(30));
           
CREATE TABLE Candidate(
		NID INT PRIMARY KEY,
        enrolled_id INT REFERENCES Enrolled(NID),  
		election_id INT REFERENCES Election(NID));

 
CREATE TABLE VEPresident(
			NID INT REFERENCES voter(NID),
            year INT,
            vote INT REFERENCES Candidate(NID),
            PRIMARY KEY (NID,year));
            
CREATE TABLE VEParlimanet(
	NID INT REFERENCES voter(NID),
             year INT,
             v1 INT REFERENCES Candidate(NID),
             v2 INT REFERENCES Candidate(NID),
             v3 INT REFERENCES Candidate(NID),
             v4 INT REFERENCES Candidate(NID),
             PRIMARY KEY(NID,year));
             
CREATE TABLE VECity(
			 NID INT REFERENCES voter(NID),
             year INT,
             v1 INT REFERENCES Candidate(NID),
             v2 INT REFERENCES Candidate(NID),
             v3 INT REFERENCES Candidate(NID),
             v4 INT REFERENCES Candidate(NID),
             PRIMARY KEY(NID,year));
            
CREATE TABLE VEKhebregan(
			 NID INT REFERENCES voter(NID),
             year INT,
             v1 INT REFERENCES Candidate(NID),
             v2 INT REFERENCES Candidate(NID),
             v3 INT REFERENCES Candidate(NID),
             v4 INT REFERENCES Candidate(NID),
             PRIMARY KEY(NID,year));
            

CREATE TABLE Supervisor(ID INT,
             EType VARCHAR(30),
             year INT,
             PRIMARY KEY(ID,EType));
            
CREATE TABLE Enrolled_Supervisor(NID int,
                ID INT,
                EType VARCHAR(20),
                year INT,
                Accepted VARCHAR(1));
                
CREATE TABLE candidate_EPresident(EPresident_year INT,
                 NID INT,
                 vote INT,
                 PRIMARY KEY(EPresident_year,NID));
                 
CREATE TABLE candidate_EParlimanet(EParlimanet_year INT,
                 NID INT,
                 vote INT,
                 PRIMARY KEY(EParlimanet_year,NID));
                 
CREATE TABLE candidate_EExpert(EExpert_year INT,
                 NID INT,
                 vote INT,
                 PRIMARY KEY(EExpert_year,NID));
                 
CREATE TABLE candidate_E_City_Village(EECV_year INT,
                 NID INT,
                   City varchar(30),
                 vote INT,
                 PRIMARY KEY(EECV_year,NID));
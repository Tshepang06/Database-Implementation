
/*Creation of Database*/
--Create Database Table
CREATE DATABASE [PHSOB_CLUB]
GO
/*Creation and Insertion of Tables*/
USE [PHSOB_CLUB]
GO
--Create Member Table
Create TABLE Member
(
    MemberID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(10) NOT NULL
);
GO
INSERT INTO Member( FirstName, LastName, DateOfBirth, Email, Phone)
VALUES
  ('Tumisang', 'Moloto', '2000-02-03', 'tumimoloto@gmail.com', '0814255722'),
  ('Beloved', 'Smithens', '1995-08-15', 'belovedsmith@gmail.com', '0799021907'),
  ( 'Marthinus', 'Johnson', '1990-04-22', 'marjohnson@gmail.com', '0876543210'),
  ( 'Davido', 'Brown', '1999-11-10', 'davidobrown@gmail.com', '0551234567'),
  ( 'Hannah', 'Davis', '1988-06-30', 'hannahdavis@gmail.com', '0449998888'),
  ( 'Michael', 'Will', '2005-03-18', 'michaelwill@gmail.com', '0997776666'),
  ('Jennifer', 'Hudson', '1993-12-07', 'jenniferhudson@gmail.com', '0223334444'),
  ('Daniel', 'Mash', '1987-09-26', 'danielmash@gmail.com', '0778889999'),
  ('Jessica', 'Mahlangu', '2001-01-14', 'jessmahlangu@gmail.com', '0112223333'),
  ( 'James', 'Jones', '1980-07-03', 'jamesjones@gmail.com', '0332221111'),
  ( 'Amanda', 'Wilson', '1996-05-19', 'amandawilson@gmail.com', '0887776666'),
  ( 'William', 'Taylor', '1992-09-01', 'williamtaylor@gmail.com', '0776665555'),
  ( 'Linda', 'Anderson', '1985-03-24', 'lindaanderson@gmail.com', '0556667777'),
  ('Christopher', 'Harris', '1997-10-12', 'christopherharris@gmail.com', '0998887777'),
  ( 'Karen', 'Clark', '1989-08-05', 'karenclark@gmail.com', '0945556666');
  
-- Create the Clubs table
CREATE TABLE Clubs 
(
    ClubID INT NOT NULL  PRIMARY KEY,
    ClubName VARCHAR(100),
    ClubDescription VARCHAR(500)
);
GO
INSERT INTO Clubs(ClubID,ClubName,ClubDescription)
VALUES
(101,'HockeyClub','Join our Hockey Club, where we embody values of dedication, sportsmanship, and teamwork while fostering a strong sense of community, all united by our passion for the game.'),
(102,'FootballClub','PHSOB FC offers a unique opportunity for players to be part of a team that receives the best in soccer skills coaching, at a club known for its family orientated environment and at one of the best sporting facilities in Pretoria'),
(103,'CricketClub','PHSOB FC offers a unique opportunity for players to be part of a team that receives the best in cricket skills coaching, at a club known for its family orientated environment and at one of the best sporting facilities in Pretoria'),
(104,'SqashClub','PHSOB FC offers a unique opportunity for players to be part of a team that receives the best in squash skills coaching, at a club known for its family orientated environment and at one of the best sporting facilities in Pretoria'),
(105,'RunningClub','PHSOB FC offers a unique opportunity for players to be part of a team that receives the best in running  skills coaching, at a club known for its family orientated environment and at one of the best sporting facilities in Pretoria');

-- Create the Locations table
CREATE TABLE Locations 
(
    LocationID INT NOT NULL  PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    L_Address VARCHAR(200) NOT NULL,
    City VARCHAR(50)  NOT NULL,
    L_State VARCHAR(50)  NOT NULL,
    ZipCode VARCHAR(10)  NOT NULL
);
GO
INSERT INTO Locations (LocationID, LocationName, L_Address, City, L_State, ZipCode)
VALUES
  (1, 'Gauteng Stadium', '123 Main Street', 'Johannesburg', 'Gauteng', '2000'),
  (2, 'Sunshine Arena', '456 Elm Avenue', 'Pretoria', 'Gauteng', '3000'),
  (3, 'Hillside Sports Complex', '789 Oak Road', 'Centurion', 'Gauteng', '4000'),
  (4, 'Greenfield Park', '101 Pine Lane', 'Randburg', 'Gauteng', '5000'),
  (5, 'Riverfront Arena', '222 Willow Street', 'Vereeniging', 'Gauteng', '6000'),
  (6, 'Meadowview Sports Center', '333 Birch Boulevard', 'Krugersdorp', 'Gauteng', '7000'),
  (7, 'Golden Gate Park', '444 Cedar Road', 'Benoni', 'Gauteng', '8000'),
  (8, 'Sunnydale Arena', '555 Maple Avenue', 'Midrand', 'Gauteng', '9000'),
  (9, 'Hometown Stadium', '666 Redwood Lane', 'Roodepoort', 'Gauteng', '10000'),
  (10, 'Central Sports Complex', '777 Oakwood Road', 'Germiston', 'Gauteng', '11000');
  
-- Create the Events table
CREATE TABLE Events 
(
    EventID INT NOT NULL PRIMARY KEY,
	LocationID INT FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
    ClubID INT FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID)
);
GO
INSERT INTO Events (EventID, LocationID, ClubID)
VALUES
  (201, 1, 101),
  (202,2, 104),
  (203, 3, 101),
  (204, 4, 102),
  (205, 5, 101),
  (206, 6, 103),
  (207, 7, 103),
  (208, 8, 101),
  (209, 9, 105),
  (210, 10, 104);
    
-- Create the Registrations table
CREATE TABLE Registrations 
(
    RegistrationID INT NOT NULL PRIMARY KEY,
    MemberID INT FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    EventID INT FOREIGN KEY (EventID) REFERENCES Events(EventID)
);
GO
INSERT INTO Registrations (RegistrationID, MemberID, EventID)
VALUES
  (111, 1, 201),
  (112,2,202),
  (113, 3,203),
  (114, 4,204),
  (115, 5,205),
  (116, 6,206),
  (117, 7,207),
  (118, 8,208),
  (119, 9,209),
  (120, 10,210);
 
-- Create the MemberRoles table
CREATE TABLE MemberRoles 
(
    RoleID INT NOT NULL PRIMARY KEY,
    RoleName VARCHAR(50)  NOT NULL
);
GO
INSERT INTO MemberRoles (RoleID, RoleName)
VALUES
  (1, 'Player'),
  (2, 'Coach'),
  (3, 'Team Captain'),
  (4, 'Assistant Coach'),
  (5, 'Goalkeeper'),
  (6, 'Scorer'),
  (7, 'Team Manager'),
  (8, 'Referee'),
  (9, 'Physiotherapist'),
  (10, 'Medical Team');
     
-- Create a table to represent the roles of members in specific clubs
CREATE TABLE MemberClubRoles
(
    MemberClubRoleID INT NOT NULL PRIMARY KEY,
    MemberID INT FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    ClubID INT   FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID),
    RoleID INT   FOREIGN KEY (RoleID) REFERENCES MemberRoles(RoleID)
);
GO
INSERT INTO MemberClubRoles (MemberClubRoleID, MemberID, ClubID, RoleID)
VALUES
  (1, 2, 102, 1),  
  (2, 5, 105, 7),  
  (3, 4, 101, 3), 
  (4, 1, 103, 4),  
  (5, 8, 105, 9), 
  (6, 6, 103, 5),  
  (7, 9, 105, 10),  
  (8, 3, 104, 2),  
  (9, 7, 102, 6), 
  (10, 10, 105, 8);  
  
CREATE TABLE EventDetails 
(
    EventDetailsID INT NOT NULL  PRIMARY KEY,
    EventName VARCHAR(100)  NOT NULL,
    EventDate DATE  NOT NULL,
    EventDescription VARCHAR(500),
	EventID INT FOREIGN KEY (EventID) REFERENCES Events(EventID)
);
GO
INSERT INTO EventDetails (EventDetailsID,EventName, EventDate, EventDescription,EventID)
VALUES
  (1, 'Sportacular Showdown','2023-11-05','The Ultimate Sports Spectacle',201),  
  (2, 'GameOn Expo', '2023-11-10','Where Sports Meet Entertainment',207), 
  (3, 'ChampionS Challenge Cup','2023-11-15', 'An Athletic Etavagnza',204), 
  (4, 'SportsFiesta 2023', '2023-11-20','Celebrating All Things Athletic',201),
  (5, 'Rivalry Rumble','2023-11-25', 'Intense Sports Competition',210), 
  (6, 'Athletes Ascent','2023-12-01', 'Reaching New Height Toghether',208),  
  (7, 'Extreme Athlon','2023-12-05', 'Pushing Limits,Breaking Barriers',209), 
  (8,'Sports Fusion Fest',  '2023-12-10','Where Passion and Play Collide',202), 
  (9, 'Victory Vortex', '2023-12-15','A Cyclone of Sporting Triumph',204),  
  (10,'SportsMania Madness', '2023-12-20', 'The Ultimate Fan Experience',207); 

USE [PHSOB_CLUB]
GO
--Create Queries
SELECT ED.EventDetailsID,ED.EventName,ED.EventDate,ED.EventDescription,ED.EventID, M.FirstName,M.LastName
FROM EventDetails ED
INNER JOIN Registrations R ON ED.EventID = R.EventID
INNER JOIN Member M ON R.MemberID = M.MemberID;
GO

--Create Queries
SELECT MCR.MemberID, MCR.ClubID, MR.RoleName
FROM MemberClubRoles MCR
LEFT JOIN MemberRoles MR ON MCR.RoleID = MR.RoleID;
GO

--Create  EventLocationView View
CREATE VIEW EventLocationView
AS
SELECT E.EventID,C.ClubName, ED.EventName,L.LocationName,L.L_Address,L.City,L.L_State,L.ZipCode
FROM Events E
INNER JOIN Clubs C ON E.ClubID = C.ClubID
INNER JOIN Locations L ON E.LocationID = L.LocationID
INNER JOIN EventDetails ED ON E.EventID = ED.EventID;
GO
--Display view
SELECT*
FROM EventLocationView
GO

--Create  ComplexEventSummary View
CREATE VIEW ComplexEventSummary
AS
SELECT E.EventID,ED.EventName,ED.EventDate,L.LocationName, C.ClubName,COUNT(R.RegistrationID) AS NumRegistrations
FROM Events E
INNER JOIN Clubs C ON E.ClubID = C.ClubID
INNER JOIN EventDetails ED ON E.EventID = ED.EventID
INNER JOIN Locations L ON E.LocationID = L.LocationID
LEFT JOIN Registrations R ON E.EventID = R.EventID
GROUP BY E.EventID, ED.EventName, ED.EventDate, L.LocationName, C.ClubName;
GO
--Display view
SELECT*
FROM ComplexEventSummary
GO

/*Creation of Procedures*/
USE [PHSOB_CLUB]
GO
-- Adds a new member to the database.
CREATE PROCEDURE AddMember
    @p_FirstName VARCHAR(50),
    @p_LastName VARCHAR(50),
    @p_DateOfBirth DATE,
    @p_Email VARCHAR(100),
    @p_Phone VARCHAR(15)
AS
BEGIN;
    INSERT INTO Members (FirstName, LastName, DateOfBirth, Email, Phone)
    VALUES (@p_FirstName, @p_LastName, @p_DateOfBirth, @p_Email, @p_Phone);
END;
GO

-- JoinClub
CREATE PROCEDURE JoinClub
  @p_MemberID INT,
  @p_ClubID INT,
  @p_RoleID INT
AS
BEGIN
  INSERT INTO MemberClubRoles (MemberID, ClubID, RoleID)
  VALUES (@p_MemberID, @p_ClubID, @p_RoleID);
END;
GO

-- RegisterMemberForEvent
CREATE PROCEDURE RegisterMemberForEvent
    @p_MemberID INT,
    @p_EventID INT
AS
BEGIN
    INSERT INTO Registrations (MemberID, EventID)
    VALUES (@p_MemberID, @p_EventID);
END;
GO

-- RegisterForEvent: Allows members to register for an event.
CREATE PROCEDURE RegisterForEvent
    @p_MemberID INT,
    @p_EventID INT
AS
BEGIN
    INSERT INTO Registrations (MemberID, EventID)
    VALUES (@p_MemberID, @p_EventID);
END;
GO

-- CalculateMemberStatsProcedure
CREATE PROCEDURE CalculateMemberStatsProcedure
      @p_TotalMember INT OUTPUT,
      @p_AverageAge FLOAT OUTPUT
AS   
BEGIN     
	   SELECT @p_TotalMember =COUNT(*) FROM Members
	   SELECT  @p_AverageAge =AVG(MemberID) FROM Members
END;
GO

-- InsertMemberClubRole
CREATE PROCEDURE InsertMemberClubRole
    @p_MemberID INT,
    @p_ClubID INT,
    @p_RoleID INT
AS
BEGIN
    INSERT INTO MemberClubRoles (MemberID, ClubID, RoleID)
    VALUES (@p_MemberID, @p_ClubID, @p_RoleID);
END;
GO

-- UpdateMemberClubRole
CREATE PROCEDURE UpdateMemberClubRole
    @p_MemberClubRoleID INT,
    @p_NewRoleID INT
AS
BEGIN
    UPDATE MemberClubRoles
    SET RoleID = @p_NewRoleID
    WHERE MemberClubRoleID = @p_MemberClubRoleID;
END;
GO

-- DeleteMemberClubRole
CREATE PROCEDURE DeleteMemberClubRole
    @p_MemberClubRoleID INT
AS
BEGIN
    DELETE FROM MemberClubRoles
    WHERE MemberClubRoleID = @p_MemberClubRoleID;
END;
GO

-- InsertLocation
CREATE PROCEDURE InsertLocation
    @p_LocationName VARCHAR(100),
    @p_Address VARCHAR(255),
    @p_City VARCHAR(100),
    @p_State VARCHAR(50),
    @p_ZipCode VARCHAR(10)
AS
BEGIN
    INSERT INTO Locations (LocationName, L_Address, City, L_State, ZipCode)
    VALUES (@p_LocationName, @p_Address, @p_City, @p_State, @p_ZipCode);
END;
GO

-- UpdateLocation
CREATE PROCEDURE UpdateLocation
    @p_LocationID INT,
    @p_LocationName VARCHAR(100),
    @p_Address VARCHAR(255),
    @p_City VARCHAR(100),
    @p_State VARCHAR(50),
    @p_ZipCode VARCHAR(10)
AS
BEGIN
    UPDATE Locations
    SET
        LocationName = @p_LocationName,
        L_Address = @p_Address,
        City = @p_City,
        L_State = @p_State,
        ZipCode = @p_ZipCode
    WHERE LocationID = @p_LocationID;
END;
GO

-- DeleteLocation
CREATE PROCEDURE DeleteLocation
    @p_LocationID INT
AS
BEGIN
    DELETE FROM Locations
    WHERE LocationID = @p_LocationID;
END;
GO

/*Creation of Backup*/ --Move folder called DBD361 to the C Drive in order for it to work before running the sql
--Full Backup
BACKUP DATABASE [PHSOB_CLUB]
TO DISK = 'C:\DBD361\Pcs.bak';
GO
--Differential Backup
BACKUP DATABASE [PHSOB_CLUB]
TO DISK = 'C:\DBD361\Pcs.bak'
WITH DIFFERENTIAL;
GO
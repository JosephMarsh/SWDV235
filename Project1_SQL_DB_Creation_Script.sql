/***************************************
* Project 1 DATABASE Creation Script
* By Joseph Marsh
***************************************/
CREATE DATABASE project1;
GO

USE project1;


CREATE TABLE customers
(
	customerID INT NOT NULL Identity PRIMARY KEY,
	firstName VARCHAR(30) NULL,
	lastName VARCHAR(30) NULL,
	emailAddress VARCHAR(40) UNIQUE NOT NULL,
	dateJoined DATE NOT NULL, 
	isCurrentMember BIT NOT NULL
);

CREATE TABLE comments
(
	commentID INT NOT NULL Identity PRIMARY KEY,
	dateSubmited DATETIME NOT NULL,
	customerComment VARCHAR(255) NOT NULL,
	customerID INT NOT NULL,
	FOREIGN KEY (customerID) references customers(customerID)
);


CREATE TABLE admins
(
	adminID INT NOT NULL IDENTITY PRIMARY KEY,
	firstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	emailAddress VARCHAR(40) NOT NULL,
	isAdmin BIT
);


INSERT INTO customers
    (firstName, lastName, emailAddress, dateJoined, isCurrentMember)
VALUES
    (NULL, 'Smith', 'gill123@gmail.com', '2003-12-01', 1 ), 
    ('Anne', NULL, 'AnneRocks@gmail.com', '2003-12-02', 1 ), 
    ('Bob', 'Thomas', 'BTsHouse@gmail.com', '2003-12-03', 0 ), 
    ('Edd', 'Edwarad', 'Sneeky@gmail.com', '2003-12-04', 1 ), 
    (NULL, NULL, 'random@gmail.com', '2003-12-05', 1 ), 
    ('Bob', 'Smith', 'BobRocks@gmail.com', '2003-12-8', 1 ), 
    ('Fred', 'Andrews', 'Andrews27@gmail.com', '2003-12-15', 1 ), 
    ('Salud', 'Aleixo', 'Boda34@gmail.com', '2003-12-22', 1 ), 
    ('Petunia', 'Stanislav', 'PetuniaFlower@gmail.com', '2003-12-25', 1 ), 
    ('Isabelle', 'Lamia', 'Lamia56@gmail.com', '2003-12-30', 1 ),
    ('Colten', 'Frank', 'Frankie432@gmail.com', '2004-01-02', 1 ), 
    (NULL, NULL, 'GimmieStuff@gmail.com', '2004-01-03', 1 ), 
    (NULL, NULL, 'NotABot@gmail.com', '2004-01-04', 0 ), 
    ('Eadgar', 'Karthik', 'ThickMess@gmail.com', '2004-01-05', 1 ), 
    ('Teodora', 'Sree', 'SeeSree123@gmail.com', '2004-01-07', 1 ), 
    ('Leonard', 'Galo', 'GalosHumor321@gmail.com', '2004-01-08', 1 ), 
    ('Viviana', 'Vuk', 'Vivivalley@gmail.com', '2004-01-12', 1 ),
    (NULL, 'Briana', 'Tomatopaste34653@gmail.com', '2004-01-15', 1 ), 
    ('Benigno', NULL, 'fsdfsdfsdfsdf6@gmail.com', '2004-01-18', 0 ), 
    ('Heckie', 'Daud', 'dittodude@gmail.com', '2004-01-20', 1 );


INSERT INTO comments

    (customerID, dateSubmited, customerComment)

VALUES
    (16, '2004-01-21', 'cool Site!'), 
    (5, '2004-01-26', 'Noice!'), 
    (3, '2004-01-29', 'Cannot get this thing to work...'), 
    (3, '2004-02-01', 'Nevermind, I figgured it out. :( '), 
    (16, '2004-02-11', 'Needs more Splostions!'), 
    (7, '2004-02-21', 'New Features Rock!'), 
    (3, '2004-02-21', 'Much Easier to use now!'), 
    (8, '2004-02-21', 'cool!'), 
    (5, '2004-02-22', 'Ohh an update I see...'), 
    (12, '2004-02-24', 'Colors on this site Suck!'), 
    (2, '2004-02-24', 'Hello... This thing work?'), 
    (5, '2004-03-25', 'Could you add more stuff please?'),
    (6, '2004-03-26', 'Are you Hireing People?'), 
    (6, '2004-03-30', 'Seriously... I need a Job.'), 
    (6, '2004-03-30', 'PLEEEEEEEEEEZZZZE!'), 
    (4, '2004-04-08', 'cool Site!'), 
    (17, '2004-04-09', 'PASTA!'), 
    (2, '2004-05-01', 'cool Site!');
	
INSERT INTO admins
    (firstName, LastName, emailAddress, isAdmin )
VALUES
    ('Joseph', 'Marsh', 'monsterousoperandi@vidjagaims.com', 1),
    ('Andrew', 'Todd', 'demonchild@vidjagaims.com', 0),
    ('Frank', 'Edwards', 'sneekydevil@vidjagaims.com', 0);

	go


	drop procedure SP_Get_User_ID

	create procedure SP_Get_User_ID
		@email varchar(40)
	AS
		Select TOP 1 customerID
		from  customers
		where emailAddress = @email;
	Go

	create procedure SP_Add_New_User
		@first varchar(30),
		@last varchar(30),
		@email varchar(40),
		@isCurrent BIT
	AS
		INSERT INTO customers
			(firstName, lastName, emailAddress, dateJoined, isCurrentMember)
		VALUES
			(@first, @last, @email, CURRENT_TIMESTAMP, @isCurrent );
	go

	CREATE PROCEDURE SP_Add_Comment
		@ID int,
		@comment VARCHAR(255)
	AS
		INSERT INTO comments
			(customerID, customerComment, dateSubmited )
		Values
			(@ID, @comment, CURRENT_TIMESTAMP);
	go
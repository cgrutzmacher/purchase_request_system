DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

CREATE TABLE User (
	ID				INT				PRIMARY KEY		AUTO_INCREMENT,
    userName		VARCHAR(20)		NOT NULL		UNIQUE,
    password		VARCHAR(10)		NOT NULL,
    firstName		VARCHAR(20)		NOT NULL,
    lastName		VARCHAR(20)		NOT NULL,
    phoneNumber		VARCHAR(12)		NOT NULL,
    email			VARCHAR(50)		NOT NULL,
    isReviewer		TINYINT(1)		NOT NULL,
    isAdmin			TINYINT(1)		NOT NULL,
    isActive		TINYINT(1)		DEFAULT 1 NOT NULL,
    dateCreated		DATE			NOT NULL,
    dateUpdated		DATE			NOT NULL,
	updatedByUser 	INT				DEFAULT 1 NOT NULL
);

CREATE TABLE PurchaseRequest (
	ID					INT				PRIMARY KEY		AUTO_INCREMENT,
    UserID				INT				NOT NULL,
    Description			VARCHAR(100)	NOT NULL,
    Justification		VARCHAR(255)	NOT NULL,
    DateNeeded			DATE			NOT NULL,
    DeliveryMode		VARCHAR(25)		NOT NULL,
    Status				VARCHAR(20)		NOT NULL DEFAULT 'New',
    Total				DECIMAL(10.2)	NOT NULL,
    SubmittedDate		DATETIME		NOT NULL,
    ReasonForRejection	VARCHAR(100)	NULL,
    IsActive			TINYINT(1)		DEFAULT 1 NOT NULL,
    DateCreated			DATETIME		DEFAULT CURRENT_TIMESTAMP NOT NULL,
    DateUpdated			DATETIME		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UpdatedByUser		INT				DEFAULT 1 NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User (ID)
);
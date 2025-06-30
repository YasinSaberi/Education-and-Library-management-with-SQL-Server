USE DB_project;
GO

DROP TABLE IF EXISTS Education.UserAccounts;

CREATE TABLE Education.UserAccounts (
    UserNationalCode NVARCHAR(10) PRIMARY KEY,
    LoginAccountUsername NVARCHAR(60) NOT NULL UNIQUE,
    AccountPasswordHash NVARCHAR(255) NOT NULL,
    AssignedUserRole NVARCHAR(35) NOT NULL,          
    IsAccountActive BIT NOT NULL DEFAULT 1,
    AccountCreationTimestamp DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_UserAccount_LinkToEntity FOREIGN KEY (UserNationalCode) REFERENCES Education.Userlink(EntityID)
);
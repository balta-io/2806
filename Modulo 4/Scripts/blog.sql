CREATE DATABASE [Blog]
GO

USE [Blog]
GO

-- DROP TABLE [User]
-- DROP TABLE [Role]
-- DROP TABLE [UserRole]
-- DROP TABLE [Post]
-- DROP TABLE [Category]
-- DROP TABLE [Tag]
-- DROP TABLE [PostTag]

CREATE TABLE [User] (
    [Id] INT NOT NULL IDENTITY(1, 1),
    [Name] NVARCHAR(80) NOT NULL,
    [Email] VARCHAR(200) NOT NULL,
    [PasswordHash] VARCHAR(255) NOT NULL,
    [Bio] TEXT NOT NULL,
    [Image] VARCHAR(2000) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,

    CONSTRAINT [PK_User] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_User_Email] UNIQUE([Email]),
    CONSTRAINT [UQ_User_Slug] UNIQUE([Slug])
)
CREATE NONCLUSTERED INDEX [IX_User_Email] ON [User]([Email])
CREATE NONCLUSTERED INDEX [IX_User_Slug] ON [User]([Slug])

CREATE TABLE [Role] (
    [Id] INT NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(80) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,

    CONSTRAINT [PK_Role] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Role_Slug] UNIQUE([Slug])
)
CREATE NONCLUSTERED INDEX [IX_Role_Slug] ON [Role]([Slug])

CREATE TABLE [UserRole] (
    [UserId] INT NOT NULL,
    [RoleId] INT NOT NULL,

    CONSTRAINT [PK_UserRole] PRIMARY KEY([UserId], [RoleId])
)

CREATE TABLE [Category] (
    [Id] INT NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(80) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,

    CONSTRAINT [PK_Category] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Category_Slug] UNIQUE([Slug])
)
CREATE NONCLUSTERED INDEX [IX_Category_Slug] ON [Category]([Slug])

CREATE TABLE [Post] (
    [Id] INT NOT NULL IDENTITY(1, 1),
    [CategoryId] INT NOT NULL,
    [AuthorId] INT NOT NULL,
    [Title] VARCHAR(160) NOT NULL,
    [Summary] VARCHAR(255) NOT NULL,
    [Body] TEXT NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,
    [CreateDate] DATETIME NOT NULL DEFAULT(GETDATE()),
    [LastUpdateDate] DATETIME NOT NULL DEFAULT(GETDATE()),

    CONSTRAINT [PK_Post] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryId]) REFERENCES [Category]([Id]),
    CONSTRAINT [FK_Post_Author] FOREIGN KEY([AuthorId]) REFERENCES [User]([Id]),
    CONSTRAINT [UQ_Post_Slug] UNIQUE([Slug])
)
CREATE NONCLUSTERED INDEX [IX_Post_Slug] ON [Post]([Slug])

CREATE TABLE [Tag] (
    [Id] INT NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(80) NOT NULL,
    [Slug] VARCHAR(80) NOT NULL,

    CONSTRAINT [PK_Tag] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Tag_Slug] UNIQUE([Slug])
)
CREATE NONCLUSTERED INDEX [IX_Tag_Slug] ON [Tag]([Slug])

CREATE TABLE [PostTag] (
    [PostId] INT NOT NULL,
    [TagId] INT NOT NULL,

    CONSTRAINT PK_PostTag PRIMARY KEY([PostId], [TagId])
)
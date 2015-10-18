
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/18/2015 14:34:59
-- Generated from EDMX file: C:\sandbox\godai-api\godai\DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [godai];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TypeCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cards] DROP CONSTRAINT [FK_TypeCard];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cards];
GO
IF OBJECT_ID(N'[dbo].[Types]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Types];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cards'
CREATE TABLE [dbo].[Cards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Damage] int  NOT NULL,
    [Health] int  NOT NULL,
    [ManaCost] int  NOT NULL,
    [Type_Id] int  NOT NULL
);
GO

-- Creating table 'CardTypes'
CREATE TABLE [dbo].[CardTypes] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cards'
ALTER TABLE [dbo].[Cards]
ADD CONSTRAINT [PK_Cards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CardTypes'
ALTER TABLE [dbo].[CardTypes]
ADD CONSTRAINT [PK_CardTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Type_Id] in table 'Cards'
ALTER TABLE [dbo].[Cards]
ADD CONSTRAINT [FK_TypeCard]
    FOREIGN KEY ([Type_Id])
    REFERENCES [dbo].[CardTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TypeCard'
CREATE INDEX [IX_FK_TypeCard]
ON [dbo].[Cards]
    ([Type_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
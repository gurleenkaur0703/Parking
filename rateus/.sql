CREATE DATABASE RateUs;

USE RateUs;

CREATE TABLE Organisation(
    ID varchar(10) PRIMARY KEY,
    Org_Name varchar(200),
    Owner_id varchar(10),
    Logo varchar(100),
    Address varchar(200),
    Listed_On DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE User_(
    ID varchar(10) PRIMARY KEY,
    User_Name varchar(100),
    Email varchar(200),
    Contact varchar(12),
    Password varchar(300),
    Created_ON DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Items(
ID varchar(10) PRIMARY KEY,
Item_Name varchar(100),
Org_ID varchar(10),
Added_On DATE DEFAULT CURRENT_TIMESTAMP
);

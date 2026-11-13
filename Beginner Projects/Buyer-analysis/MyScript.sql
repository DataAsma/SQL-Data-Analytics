--Creating the database to be used
CREATE DATABASE Buyer_Analysis;
USE Buyer_Analysis;

--Creating the table 'buyers'
CREATE TABLE buyers (
	buyer_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT NULL,
	country VARCHAR(50) NOT NULL,
	email VARCHAR(70) NOT NULL,
	purchase_amount DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_buyers PRIMARY KEY (buyer_id)
);
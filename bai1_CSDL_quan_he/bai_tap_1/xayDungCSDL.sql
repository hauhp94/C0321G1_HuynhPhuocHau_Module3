CREATE DATABASE `student-management`;
USE `student-management`;
CREATE TABLE student(
id INT NOT NULL,
name VARCHAR(50),
age INT ,
country VARCHAR(50) ,
PRIMARY KEY (`id`));
CREATE TABLE Class(
id INT NOT NULL,
`name` VARCHAR(50) ,
PRIMARY KEY (id));
CREATE TABLE Teacher(
id INT NOT NULL,
nameTeacher VARCHAR(50) ,
ageTeacher INT ,
country VARCHAR(50) ,
PRIMARY KEY (id));


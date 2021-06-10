CREATE DATABASE `student-management`;
CREATE TABLE `student-management`.`student`(
`id` INT NOT NULL,
`name` VARCHAR(50),
`age` INT ,
`country` VARCHAR(50) ,
PRIMARY KEY (`id`));
CREATE TABLE `student-management`.`Class`(
`id` INT NOT NULL,
`name` VARCHAR(50) ,
PRIMARY KEY (`id`));
CREATE TABLE `student-management`.`Teacher`(
`id` INT NOT NULL,
`name` VARCHAR(50) ,
`age` INT ,
`country` VARCHAR(50) ,
PRIMARY KEY (`id`));


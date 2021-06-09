CREATE DATABASE `student-management`;
CREATE TABLE `student-management`.`student`(
`id` INT NOT NULL,
`name` VARCHAR(50) NULL,
`age` INT NULL,
`country` VARCHAR(50) NULL,
PRIMARY KEY (`id`));
CREATE TABLE `student-management`.`Class`(
`id` INT NOT NULL,
`name` VARCHAR(50) NULL,
PRIMARY KEY (`id`));
CREATE TABLE `student-management`.`Teacher`(
`id` INT NOT NULL,
`name` VARCHAR(50) NULL,
`age` INT NULL,
`country` VARCHAR(50) NULL,
PRIMARY KEY (`id`));


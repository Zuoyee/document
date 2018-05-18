-- MySQL Script generated by MySQL Workbench
-- Fri May 18 16:08:06 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema activityplus
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema activityplus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `activityplus` DEFAULT CHARACTER SET utf8 ;
USE `activityplus` ;

-- -----------------------------------------------------
-- Table `activityplus`.`pcuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `activityplus`.`pcuser` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `logo` VARCHAR(70) NOT NULL,
  `evidence` VARCHAR(70) NOT NULL,
  `info` VARCHAR(150) NULL,
  `verified` INT NOT NULL,
  `account` VARCHAR(64) NULL,
  `password` VARCHAR(64) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `account_UNIQUE` (`account` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activityplus`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `activityplus`.`activity` (
  `id` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  `campus` INT NOT NULL,
  `enroll_condition` VARCHAR(50) NOT NULL,
  `sponsor` VARCHAR(50) NOT NULL DEFAULT 'pcuser_name',
  `type` INT NOT NULL DEFAULT 0,
  `pub_start_time` DATETIME NOT NULL,
  `pub_end_time` DATETIME NOT NULL,
  `detail` VARCHAR(150) NOT NULL,
  `enroll_way` VARCHAR(100) NULL,
  `enroll_end_time` DATETIME NULL,
  `reward` VARCHAR(30) NULL,
  `introduction` VARCHAR(50) NULL,
  `requirement` VARCHAR(50) NULL,
  `poster` VARCHAR(70) NULL,
  `qrcode` VARCHAR(70) NULL,
  `can_enrolled` INT NOT NULL DEFAULT 0,
  `verified` INT NOT NULL DEFAULT 0,
  `email` VARCHAR(255) NULL,
  `pcuser_id` INT NULL,
  PRIMARY KEY (`id`, `pcuser_id`),
  INDEX `fk_activity_pcuser_idx` (`pcuser_id` ASC),
  CONSTRAINT `fk_activity_pcuser`
    FOREIGN KEY (`pcuser_id`)
    REFERENCES `activityplus`.`pcuser` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
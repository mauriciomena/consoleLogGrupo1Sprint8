-- MySQL Script generated by MySQL Workbench
-- Mon Jun 21 16:08:54 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema verdumarket-test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema verdumarket-test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `verdumarket-test` DEFAULT CHARACTER SET utf8 ;
USE `verdumarket-test` ;

-- -----------------------------------------------------
-- Table `verdumarket-test`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`addresses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NULL DEFAULT NULL,
  `number` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `price` DECIMAL(10,0) NULL DEFAULT NULL,
  `stock` DECIMAL(10,0) NULL DEFAULT NULL,
  `stock_min` DECIMAL(10,0) NULL DEFAULT NULL,
  `stock_max` DECIMAL(10,0) NULL DEFAULT NULL,
  `categories_id` INT(11) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `week` VARCHAR(255) NULL DEFAULT NULL,
  `facts` TEXT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `categories_id` (`categories_id` ASC) VISIBLE,
  CONSTRAINT `products_ibfk_1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `verdumarket-test`.`categories` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`images` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `products_id` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `products_id` (`products_id` ASC) VISIBLE,
  CONSTRAINT `images_ibfk_1`
    FOREIGN KEY (`products_id`)
    REFERENCES `verdumarket-test`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`migrations` (
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`payments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`rolls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`rolls` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `avatar` VARCHAR(255) NULL DEFAULT NULL,
  `addresses_id` INT(11) NULL DEFAULT NULL,
  `roll_id` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `addresses_id` (`addresses_id` ASC) VISIBLE,
  INDEX `roll_id` (`roll_id` ASC) VISIBLE,
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`addresses_id`)
    REFERENCES `verdumarket-test`.`addresses` (`id`),
  CONSTRAINT `users_ibfk_2`
    FOREIGN KEY (`roll_id`)
    REFERENCES `verdumarket-test`.`rolls` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`states` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `number` INT(11) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `total` DECIMAL(10,0) NULL DEFAULT NULL,
  `payments_id` INT(11) NULL DEFAULT NULL,
  `users_id` INT(11) NULL DEFAULT NULL,
  `users_addresses_id` INT(11) NULL DEFAULT NULL,
  `states_id` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `payments_id` (`payments_id` ASC) VISIBLE,
  INDEX `users_id` (`users_id` ASC) VISIBLE,
  INDEX `states_id` (`states_id` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`payments_id`)
    REFERENCES `verdumarket-test`.`payments` (`id`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`users_id`)
    REFERENCES `verdumarket-test`.`users` (`id`),
  CONSTRAINT `orders_ibfk_3`
    FOREIGN KEY (`states_id`)
    REFERENCES `verdumarket-test`.`states` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`orderdetails` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantity` DECIMAL(10,0) NULL DEFAULT NULL,
  `subtotal` DECIMAL(10,0) NULL DEFAULT NULL,
  `orders_id` INT(11) NULL DEFAULT NULL,
  `products_id` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `orders_id` (`orders_id` ASC) VISIBLE,
  INDEX `products_id` (`products_id` ASC) VISIBLE,
  CONSTRAINT `orderdetails_ibfk_1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `verdumarket-test`.`orders` (`id`),
  CONSTRAINT `orderdetails_ibfk_2`
    FOREIGN KEY (`products_id`)
    REFERENCES `verdumarket-test`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `verdumarket-test`.`shippings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `verdumarket-test`.`shippings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NULL DEFAULT NULL,
  `number` INT(11) NULL DEFAULT NULL,
  `price` DECIMAL(10,0) NULL DEFAULT NULL,
  `orders_id` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `orders_id` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `shippings_ibfk_1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `verdumarket-test`.`orders` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

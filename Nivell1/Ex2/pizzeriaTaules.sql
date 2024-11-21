-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema s11Pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `s11Pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `s11Pizzeria`;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`state` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_id`),
  UNIQUE INDEX `state_id_UNIQUE` (`state_id` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(45) NULL,
  `state_state_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `state_state_id`),
  UNIQUE INDEX `location_id_UNIQUE` (`location_id` ASC) VISIBLE,
  INDEX `fk_location_state1_idx` (`state_state_id` ASC) VISIBLE,
  CONSTRAINT `fk_location_state1`
    FOREIGN KEY (`state_state_id`)
    REFERENCES `s11Pizzeria`.`state` (`state_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NOT NULL,
  `client_surname` VARCHAR(45) NOT NULL,
  `client_address` VARCHAR(45) NULL,
  `client_zip` VARCHAR(45) NULL,
  `client_phone` VARCHAR(45) NOT NULL,
  `location_location_id` INT NOT NULL,
  PRIMARY KEY (`client_id`, `location_location_id`),
  UNIQUE INDEX `client_phone_UNIQUE` (`client_phone` ASC) VISIBLE,
  UNIQUE INDEX `client_id_UNIQUE` (`client_id` ASC) VISIBLE,
  INDEX `fk_client_locations1_idx` (`location_location_id` ASC) VISIBLE,
  INDEX `location_location_id` (`location_location_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_locations1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `s11Pizzeria`.`location` (`location_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_orderType` ENUM('Onsite', 'Delivery') NULL,
  `order_price` DOUBLE NULL,
  `order_quantity` INT NOT NULL,
  `client_client_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_client1_idx` (`client_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `s11Pizzeria`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(45) NULL,
  `product_image` VARCHAR(45) NULL,
  `product_price` VARCHAR(45) NOT NULL,
  `product_type` VARCHAR(45) NOT NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `s11Pizzeria`.`category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`order_details` (
  `order_details_id` INT NOT NULL AUTO_INCREMENT,
  `order_details_quantity` INT NULL,
  `order_order_id` INT NOT NULL,
  `product_product_id` INT NOT NULL,
  PRIMARY KEY (`order_details_id`, `order_order_id`),
  INDEX `fk_order_details_order1_idx` (`order_order_id` ASC) VISIBLE,
  INDEX `fk_order_details_product1_idx` (`product_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `s11Pizzeria`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_details_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `s11Pizzeria`.`product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `store_address` VARCHAR(45) NULL,
  `store_zip` VARCHAR(45) NULL,
  `location_location_id` INT NOT NULL,
  `order_order_id` INT NOT NULL,
  PRIMARY KEY (`store_id`, `location_location_id`),
  INDEX `fk_store_location1_idx` (`location_location_id` ASC) VISIBLE,
  INDEX `fk_store_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_location1`
    FOREIGN KEY (`location_location_id`)
    REFERENCES `s11Pizzeria`.`location` (`location_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_store_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `s11Pizzeria`.`order` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `s11Pizzeria`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s11Pizzeria`.`worker` (
  `worker_id` INT NOT NULL AUTO_INCREMENT,
  `worker_name` VARCHAR(45) NOT NULL,
  `worker_surname` VARCHAR(45) NOT NULL,
  `worker_nif` VARCHAR(45) NOT NULL,
  `worker_phone` VARCHAR(45) NOT NULL,
  `worker_type` ENUM('chef', 'deliver') NOT NULL,
  `store_store_id` INT NOT NULL,
  PRIMARY KEY (`worker_id`),
  UNIQUE INDEX `worker_id_UNIQUE` (`worker_id` ASC) VISIBLE,
  UNIQUE INDEX `worker_nif_UNIQUE` (`worker_nif` ASC) VISIBLE,
  INDEX `fk_worker_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_worker_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `s11Pizzeria`.`store` (`store_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ticket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ticket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ticket` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sql_invoicing
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_invoicing
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_invoicing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Ticket` ;

-- -----------------------------------------------------
-- Table `Ticket`.`Venue organizers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Venue organizers` (
  `Venue_organizers_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Province` VARCHAR(45) NOT NULL,
  `Postal code` VARCHAR(45) NOT NULL,
  `Sales Channel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Venue_organizers_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Reseller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Reseller` (
  `Reseller_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Province` CHAR(2) NOT NULL,
  `Postal code` VARCHAR(45) NOT NULL,
  `Sales channel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Reseller_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Phone` INT NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Payment method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Payment method` (
  `Payment_method_id` INT NOT NULL AUTO_INCREMENT,
  `Payment method` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Payment_method_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Ticket` (
  `Ticket_id` VARCHAR(45) NOT NULL,
  `Venue_organizers_id` INT NOT NULL,
  `Reseller_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  `Payment_method_id` INT NOT NULL,
  `Ticket Price` DECIMAL(3,2) NOT NULL,
  `Quantity` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`Ticket_id`),
  INDEX `fk_Ticket_Reseller1_idx` (`Reseller_id` ASC) VISIBLE,
  INDEX `fk_Ticket_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Ticket_Payment method1_idx` (`Payment_method_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Venue organizers`
    FOREIGN KEY (`Venue_organizers_id`)
    REFERENCES `Ticket`.`Venue organizers` (`Venue_organizers_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ticket_Reseller1`
    FOREIGN KEY (`Reseller_id`)
    REFERENCES `Ticket`.`Reseller` (`Reseller_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ticket_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `Ticket`.`Customer` (`Customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ticket_Payment method1`
    FOREIGN KEY (`Payment_method_id`)
    REFERENCES `Ticket`.`Payment method` (`Payment_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Sales channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Sales channel` (
  `Channel_id` INT NOT NULL AUTO_INCREMENT,
  `Venue_organizers_id` INT NOT NULL,
  `Reseller_id` INT NOT NULL,
  `Channel_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Channel_id`),
  INDEX `fk_Sales channel_Venue organizers1_idx` (`Venue_organizers_id` ASC) VISIBLE,
  INDEX `fk_Sales channel_Reseller1_idx` (`Reseller_id` ASC) VISIBLE,
  CONSTRAINT `fk_Sales channel_Venue organizers1`
    FOREIGN KEY (`Venue_organizers_id`)
    REFERENCES `Ticket`.`Venue organizers` (`Venue_organizers_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sales channel_Reseller1`
    FOREIGN KEY (`Reseller_id`)
    REFERENCES `Ticket`.`Reseller` (`Reseller_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Commission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Commission` (
  `Commision_id` INT NOT NULL AUTO_INCREMENT,
  `Reseller_id` INT NOT NULL,
  `Ticket_id` INT NOT NULL,
  `Rate` DECIMAL(2,1) NOT NULL,
  PRIMARY KEY (`Commision_id`),
  INDEX `fk_Commission_Reseller1_idx` (`Reseller_id` ASC) VISIBLE,
  INDEX `fk_Commission_Ticket1_idx` (`Ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_Commission_Reseller1`
    FOREIGN KEY (`Reseller_id`)
    REFERENCES `Ticket`.`Reseller` (`Reseller_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Commission_Ticket1`
    FOREIGN KEY (`Ticket_id`)
    REFERENCES `Ticket`.`Ticket` (`Ticket_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ticket`.`Ticket_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ticket`.`Ticket_type` (
  `Ticket_type_id` INT NOT NULL,
  `Ticket_id` VARCHAR(45) NOT NULL,
  `Ticket_name` VARCHAR(45) NULL,
  PRIMARY KEY (`Ticket_type_id`),
  INDEX `fk_Ticket_type_Ticket1_idx` (`Ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_type_Ticket1`
    FOREIGN KEY (`Ticket_id`)
    REFERENCES `Ticket`.`Ticket` (`Ticket_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `sql_invoicing` ;

-- -----------------------------------------------------
-- Table `sql_invoicing`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_invoicing`.`clients` (
  `client_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_invoicing`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_invoicing`.`invoices` (
  `invoice_id` INT NOT NULL,
  `number` VARCHAR(50) NOT NULL,
  `client_id` INT NOT NULL,
  `invoice_total` DECIMAL(9,2) NOT NULL,
  `payment_total` DECIMAL(9,2) NOT NULL DEFAULT '0.00',
  `invoice_date` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `FK_client_id` (`client_id` ASC) VISIBLE,
  CONSTRAINT `FK_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `sql_invoicing`.`clients` (`client_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_invoicing`.`payment_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_invoicing`.`payment_methods` (
  `payment_method_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sql_invoicing`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_invoicing`.`payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `amount` DECIMAL(9,2) NOT NULL,
  `payment_method` TINYINT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_client_id_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_invoice_id_idx` (`invoice_id` ASC) VISIBLE,
  INDEX `fk_payment_payment_method_idx` (`payment_method` ASC) VISIBLE,
  CONSTRAINT `fk_payment_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `sql_invoicing`.`clients` (`client_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_invoice`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `sql_invoicing`.`invoices` (`invoice_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_payment_method`
    FOREIGN KEY (`payment_method`)
    REFERENCES `sql_invoicing`.`payment_methods` (`payment_method_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Script generated by MySQL Workbench
-- Tue Sep 25 15:05:48 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `idClient` INT NOT NULL,
  `idCommande` INT NOT NULL,
  PRIMARY KEY (`idClient`, `idCommande`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Commande` (
  `Dejeuner` INT NOT NULL,
  `Souper` INT NOT NULL,
  `Client_idClient` INT NOT NULL,
  `Client_idCommande` INT NOT NULL,
  PRIMARY KEY (`Dejeuner`, `Souper`, `Client_idClient`, `Client_idCommande`),
  INDEX `fk_Commande_Client_idx` (`Client_idClient` ASC, `Client_idCommande` ASC) VISIBLE,
  CONSTRAINT `fk_Commande_Client`
    FOREIGN KEY (`Client_idClient` , `Client_idCommande`)
    REFERENCES `mydb`.`Client` (`idClient` , `idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Souper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Souper` (
  `Proteines` INT NOT NULL,
  `Legumes` VARCHAR(45) NOT NULL,
  `Glucides` VARCHAR(45) NOT NULL,
  `Sauces` VARCHAR(45) NOT NULL,
  `Commande_Souper` INT NOT NULL,
  `Commande_Client_idClient` INT NOT NULL,
  `Commande_Client_idCommande` INT NOT NULL,
  PRIMARY KEY (`Commande_Souper`, `Commande_Client_idClient`, `Commande_Client_idCommande`),
  CONSTRAINT `fk_Souper_Commande1`
    FOREIGN KEY (`Commande_Souper` , `Commande_Client_idClient` , `Commande_Client_idCommande`)
    REFERENCES `mydb`.`Commande` (`Souper` , `Client_idClient` , `Client_idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dejeuner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dejeuner` (
  `Proteines` INT NOT NULL,
  `Fruits` VARCHAR(45) NOT NULL,
  `Sauces` VARCHAR(45) NOT NULL,
  `Glucides` VARCHAR(45) NOT NULL,
  `Produits laitiers` VARCHAR(45) NOT NULL,
  `Commande_Dejeuner` INT NOT NULL,
  `Commande_Client_idClient` INT NOT NULL,
  `Commande_Client_idCommande` INT NOT NULL,
  `Souper_Commande_Souper` INT NOT NULL,
  `Souper_Commande_Client_idClient` INT NOT NULL,
  `Souper_Commande_Client_idCommande` INT NOT NULL,
  PRIMARY KEY (`Commande_Dejeuner`, `Commande_Client_idClient`, `Commande_Client_idCommande`, `Souper_Commande_Souper`, `Souper_Commande_Client_idClient`, `Souper_Commande_Client_idCommande`),
  INDEX `fk_Dejeuner_Souper1_idx` (`Souper_Commande_Souper` ASC, `Souper_Commande_Client_idClient` ASC, `Souper_Commande_Client_idCommande` ASC) VISIBLE,
  CONSTRAINT `fk_Dejeuner_Commande1`
    FOREIGN KEY (`Commande_Dejeuner` , `Commande_Client_idClient` , `Commande_Client_idCommande`)
    REFERENCES `mydb`.`Commande` (`Dejeuner` , `Client_idClient` , `Client_idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dejeuner_Souper1`
    FOREIGN KEY (`Souper_Commande_Souper` , `Souper_Commande_Client_idClient` , `Souper_Commande_Client_idCommande`)
    REFERENCES `mydb`.`Souper` (`Commande_Souper` , `Commande_Client_idClient` , `Commande_Client_idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarif`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarif` (
  `idTarif` INT NOT NULL,
  `Commande_Dejeuner` INT NOT NULL,
  `Commande_Souper` INT NOT NULL,
  `Commande_Client_idClient` INT NOT NULL,
  `Commande_Client_idCommande` INT NOT NULL,
  PRIMARY KEY (`idTarif`, `Commande_Dejeuner`, `Commande_Souper`, `Commande_Client_idClient`, `Commande_Client_idCommande`),
  INDEX `fk_Tarif_Commande1_idx` (`Commande_Dejeuner` ASC, `Commande_Souper` ASC, `Commande_Client_idClient` ASC, `Commande_Client_idCommande` ASC) VISIBLE,
  CONSTRAINT `fk_Tarif_Commande1`
    FOREIGN KEY (`Commande_Dejeuner` , `Commande_Souper` , `Commande_Client_idClient` , `Commande_Client_idCommande`)
    REFERENCES `mydb`.`Commande` (`Dejeuner` , `Souper` , `Client_idClient` , `Client_idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
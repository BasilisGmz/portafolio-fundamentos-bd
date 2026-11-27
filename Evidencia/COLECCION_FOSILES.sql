-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coleccion_fosiles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coleccion_fosiles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coleccion_fosiles` DEFAULT CHARACTER SET utf8 ;
USE `coleccion_fosiles` ;

-- -----------------------------------------------------
-- Table `coleccion_fosiles`.`EXPEDICIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleccion_fosiles`.`EXPEDICIONES` (
  `id_expedicion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha` DATE NOT NULL,
  `region` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_expedicion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleccion_fosiles`.`YACIMIENTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleccion_fosiles`.`YACIMIENTOS` (
  `id_yacimientos` INT NOT NULL AUTO_INCREMENT,
  `id_expedicion` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `pais` VARCHAR(60) NOT NULL,
  `tipo_suelo` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_yacimientos`),
  INDEX `id_expedicion_idx` (`id_expedicion` ASC) VISIBLE,
  CONSTRAINT `id_expedicion`
    FOREIGN KEY (`id_expedicion`)
    REFERENCES `coleccion_fosiles`.`EXPEDICIONES` (`id_expedicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleccion_fosiles`.`FOSILES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleccion_fosiles`.`FOSILES` (
  `id_fosil` INT NOT NULL AUTO_INCREMENT,
  `id_yacimientos` INT NOT NULL,
  `nombre_comun` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(60) NOT NULL,
  `antiguedad_millones` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id_fosil`),
  INDEX `id_yacimientos_idx` (`id_yacimientos` ASC) VISIBLE,
  CONSTRAINT `id_yacimientos`
    FOREIGN KEY (`id_yacimientos`)
    REFERENCES `coleccion_fosiles`.`YACIMIENTOS` (`id_yacimientos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleccion_fosiles`.`INVESTIGADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleccion_fosiles`.`INVESTIGADORES` (
  `id_investigador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `especialidad` VARCHAR(80) NOT NULL,
  `pais` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_investigador`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

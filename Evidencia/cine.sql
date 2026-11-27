-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CINE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CINE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CINE` DEFAULT CHARACTER SET utf8 ;
USE `CINE` ;

-- -----------------------------------------------------
-- Table `CINE`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CINE`.`peliculas` (
  `id_pelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `genero` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `clasificacion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_pelicula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CINE`.`salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CINE`.`salas` (
  `id_sala` INT NOT NULL AUTO_INCREMENT,
  `nombre` INT NOT NULL,
  `tipo` INT NOT NULL,
  `capacidad` DATE NOT NULL,
  PRIMARY KEY (`id_sala`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CINE`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CINE`.`funciones` (
  `id_funcion` INT NOT NULL AUTO_INCREMENT,
  `id_pelicula` INT NOT NULL,
  `id_sala` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` VARCHAR(45) NULL,
  PRIMARY KEY (`id_funcion`),
  INDEX `fk_funciones_peliculas_idx` (`id_pelicula` ASC) VISIBLE,
  INDEX `fk_funciones_salas_idx` (`id_sala` ASC) VISIBLE,
  CONSTRAINT `fk_funciones_peliculas`
    FOREIGN KEY (`id_pelicula`)
    REFERENCES `CINE`.`peliculas` (`id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funciones_salas`
    FOREIGN KEY (`id_sala`)
    REFERENCES `CINE`.`salas` (`id_sala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CINE`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CINE`.`clientes` (
  `id_cliente` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `correo` VARCHAR(100) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CINE`.`boletos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CINE`.`boletos` (
  `id_boleto` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_funcion` INT NOT NULL,
  `fecha_compra` DATE NOT NULL,
  `asiento` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(8) NOT NULL,
  PRIMARY KEY (`id_boleto`),
  INDEX `fk_boletos_clientes_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_boletos_funciones_idx` (`id_funcion` ASC) VISIBLE,
  CONSTRAINT `fk_boletos_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `CINE`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletos_funciones`
    FOREIGN KEY (`id_funcion`)
    REFERENCES `CINE`.`funciones` (`id_funcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

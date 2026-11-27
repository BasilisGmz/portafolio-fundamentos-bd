-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Agencia_de_viajes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Agencia_de_viajes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Agencia_de_viajes` DEFAULT CHARACTER SET utf8 ;
USE `Agencia_de_viajes` ;

-- -----------------------------------------------------
-- Table `Agencia_de_viajes`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_viajes`.`Clientes` (
  `id_Clientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NULL,
  `Clientescol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agencia_de_viajes`.`Destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_viajes`.`Destino` (
  `id_Destino` INT NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Destino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agencia_de_viajes`.`Viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_viajes`.`Viajes` (
  `id_Viajes` INT NOT NULL AUTO_INCREMENT,
  `id_Destino` INT NULL,
  `fecha_salida` DATE NOT NULL,
  `fecha_regreso` DATE NOT NULL,
  `precio` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`id_Viajes`),
  INDEX `id_Destino_idx` (`id_Destino` ASC) VISIBLE,
  CONSTRAINT `id_Destino`
    FOREIGN KEY (`id_Destino`)
    REFERENCES `Agencia_de_viajes`.`Destino` (`id_Destino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agencia_de_viajes`.`Reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_viajes`.`Reservas` (
  `id_Reservas` INT NOT NULL AUTO_INCREMENT,
  `id_Clientes` INT NULL,
  `id_Viajes` INT NULL,
  `fecha_reserva` DATE NOT NULL,
  `cantidad_personas` INT NOT NULL,
  PRIMARY KEY (`id_Reservas`),
  INDEX `id_Clientes_idx` (`id_Clientes` ASC) VISIBLE,
  INDEX `id_Viajes_idx` (`id_Viajes` ASC) VISIBLE,
  CONSTRAINT `id_Clientes`
    FOREIGN KEY (`id_Clientes`)
    REFERENCES `Agencia_de_viajes`.`Clientes` (`id_Clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Viajes`
    FOREIGN KEY (`id_Viajes`)
    REFERENCES `Agencia_de_viajes`.`Viajes` (`id_Viajes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Agencia_de_viajes`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_viajes`.`Pagos` (
  `id_Pagos` INT NOT NULL AUTO_INCREMENT,
  `id_Reservas` INT NULL,
  `fecha_pago` DATE NOT NULL,
  `monto` DECIMAL(10) NOT NULL,
  `metodo_pago` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Pagos`),
  INDEX `id_Reservas_idx` (`id_Reservas` ASC) VISIBLE,
  CONSTRAINT `id_Reservas`
    FOREIGN KEY (`id_Reservas`)
    REFERENCES `Agencia_de_viajes`.`Reservas` (`id_Reservas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

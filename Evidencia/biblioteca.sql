-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `Biblioteca` ;

-- -----------------------------------------------------
-- Table `Biblioteca`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Autores` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Estudiantes` (
  `idEstudiantes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `carrera` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstudiantes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Libros` (
  `idLibros` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `año_publicacion` YEAR(4) NULL,
  `editorial` VARCHAR(45) NULL,
  `idAutor` INT NOT NULL,
  PRIMARY KEY (`idLibros`),
  INDEX `idAutor_idx` (`idAutor` ASC) VISIBLE,
  CONSTRAINT `idAutor`
    FOREIGN KEY (`idAutor`)
    REFERENCES `Biblioteca`.`Autores` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Prestamos` (
  `idPrestamos` INT NOT NULL AUTO_INCREMENT,
  `idEstudiante` INT NOT NULL,
  `idLibro` INT NOT NULL,
  `fecha_prestamo` DATE NOT NULL,
  `fecha_devolucion` DATE NULL,
  PRIMARY KEY (`idPrestamos`),
  INDEX `idLibros_idx` (`idLibro` ASC) VISIBLE,
  INDEX `idEstudiantes_idx` (`idEstudiante` ASC) VISIBLE,
  CONSTRAINT `idEstudiantes`
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `Biblioteca`.`Estudiantes` (`idEstudiantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLibros`
    FOREIGN KEY (`idLibro`)
    REFERENCES `Biblioteca`.`Libros` (`idLibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

<<<<<<<< HEAD:BBDD/bbddPalasForAll.sql
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `test1` ;

-- -----------------------------------------------------
-- Table `test1`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`cliente` (
  `id_cliente` BIGINT NOT NULL AUTO_INCREMENT,
  `foto` VARCHAR(255) NOT NULL,
  `dni` VARCHAR(9) NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` BIT(1) NULL DEFAULT b'1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `UKcmxo70m08n43599l3h0h07cc6` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`ordenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_recibida` DATETIME NULL DEFAULT NULL,
  `numero` VARCHAR(255) NULL DEFAULT NULL,
  `total` DOUBLE NOT NULL,
  `usuario_id_cliente` BIGINT NULL DEFAULT NULL,
  `cantidad` INT NOT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK80udi2b40age3i30o1ig02yi6` (`usuario_id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK80udi2b40age3i30o1ig02yi6`
    FOREIGN KEY (`usuario_id_cliente`)
    REFERENCES `test1`.`cliente` (`id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`plataforma` (
  `id_plataforma` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `stock` INT NOT NULL,
  `categoria_id_categoria` INT NOT NULL,
  `plataforma_id_plataforma` INT NOT NULL,
  `descatalogado` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_categoria_producto1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  INDEX `fk_producto_plataforma1_idx` (`plataforma_id_plataforma` ASC) VISIBLE,
  CONSTRAINT `fk_producto_categoria_producto1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `test1`.`categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_plataforma1`
    FOREIGN KEY (`plataforma_id_plataforma`)
    REFERENCES `test1`.`plataforma` (`id_plataforma`))
ENGINE = InnoDB
AUTO_INCREMENT = 125
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`detalles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`detalles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` DOUBLE NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `precio` DOUBLE NOT NULL,
  `total` DOUBLE NOT NULL,
  `orden_id` INT NULL DEFAULT NULL,
  `producto_id_producto` INT NULL DEFAULT NULL,
  `foto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKdurdo71oa161lmmal7oeaor74` (`orden_id` ASC) VISIBLE,
  INDEX `FKkn039l20scg16tbm5lqaet4j6` (`producto_id_producto` ASC) VISIBLE,
  CONSTRAINT `FKdurdo71oa161lmmal7oeaor74`
    FOREIGN KEY (`orden_id`)
    REFERENCES `test1`.`ordenes` (`id`),
  CONSTRAINT `FKkn039l20scg16tbm5lqaet4j6`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `test1`.`producto` (`id_producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`rol` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`usuarios_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`usuarios_roles` (
  `id_cliente` BIGINT NOT NULL,
  `rol_id` BIGINT NOT NULL,
  INDEX `FK6yxg1lhuv5nievqea7rvn6afm` (`rol_id` ASC) VISIBLE,
  INDEX `usuarios_roles_ibfk_2` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK6yxg1lhuv5nievqea7rvn6afm`
    FOREIGN KEY (`rol_id`)
    REFERENCES `test1`.`rol` (`id`),
  CONSTRAINT `usuarios_roles_ibfk_2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `test1`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`valoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`valoracion` (
  `id_valoracion` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(255) NULL DEFAULT NULL,
  `puntuacion` INT NOT NULL,
  `producto_id_producto` INT NULL DEFAULT NULL,
  `cliente_id_cliente` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_valoracion`),
  INDEX `FK2jhc4ymo88009kuyon0mjmlkd` (`producto_id_producto` ASC) VISIBLE,
  INDEX `FKq14tgyaq6u8wdm0fos5g82lyx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK2jhc4ymo88009kuyon0mjmlkd`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `test1`.`producto` (`id_producto`),
  CONSTRAINT `FKq14tgyaq6u8wdm0fos5g82lyx`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `test1`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
========
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `test1` ;

-- -----------------------------------------------------
-- Table `test1`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`cliente` (
  `id_cliente` BIGINT NOT NULL AUTO_INCREMENT,
  `foto` VARCHAR(255) NOT NULL,
  `dni` VARCHAR(9) NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` BIT(1) NULL DEFAULT b'1',
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `UKcmxo70m08n43599l3h0h07cc6` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`ordenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_creacion` DATETIME NULL DEFAULT NULL,
  `fecha_recibida` DATETIME NULL DEFAULT NULL,
  `numero` VARCHAR(255) NULL DEFAULT NULL,
  `total` DOUBLE NOT NULL,
  `usuario_id_cliente` BIGINT NULL DEFAULT NULL,
  `cantidad` INT NOT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK80udi2b40age3i30o1ig02yi6` (`usuario_id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK80udi2b40age3i30o1ig02yi6`
    FOREIGN KEY (`usuario_id_cliente`)
    REFERENCES `test1`.`cliente` (`id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`plataforma` (
  `id_plataforma` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `stock` INT NOT NULL,
  `categoria_id_categoria` INT NOT NULL,
  `plataforma_id_plataforma` INT NOT NULL,
  `descatalogado` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_categoria_producto1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  INDEX `fk_producto_plataforma1_idx` (`plataforma_id_plataforma` ASC) VISIBLE,
  CONSTRAINT `fk_producto_categoria_producto1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `test1`.`categoria` (`id_categoria`),
  CONSTRAINT `fk_producto_plataforma1`
    FOREIGN KEY (`plataforma_id_plataforma`)
    REFERENCES `test1`.`plataforma` (`id_plataforma`))
ENGINE = InnoDB
AUTO_INCREMENT = 125
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`detalles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`detalles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` DOUBLE NOT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `precio` DOUBLE NOT NULL,
  `total` DOUBLE NOT NULL,
  `orden_id` INT NULL DEFAULT NULL,
  `producto_id_producto` INT NULL DEFAULT NULL,
  `foto` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKdurdo71oa161lmmal7oeaor74` (`orden_id` ASC) VISIBLE,
  INDEX `FKkn039l20scg16tbm5lqaet4j6` (`producto_id_producto` ASC) VISIBLE,
  CONSTRAINT `FKdurdo71oa161lmmal7oeaor74`
    FOREIGN KEY (`orden_id`)
    REFERENCES `test1`.`ordenes` (`id`),
  CONSTRAINT `FKkn039l20scg16tbm5lqaet4j6`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `test1`.`producto` (`id_producto`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`rol` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`usuarios_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`usuarios_roles` (
  `id_cliente` BIGINT NOT NULL,
  `rol_id` BIGINT NOT NULL,
  INDEX `FK6yxg1lhuv5nievqea7rvn6afm` (`rol_id` ASC) VISIBLE,
  INDEX `usuarios_roles_ibfk_2` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK6yxg1lhuv5nievqea7rvn6afm`
    FOREIGN KEY (`rol_id`)
    REFERENCES `test1`.`rol` (`id`),
  CONSTRAINT `usuarios_roles_ibfk_2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `test1`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `test1`.`valoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`valoracion` (
  `id_valoracion` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(255) NULL DEFAULT NULL,
  `puntuacion` INT NOT NULL,
  `producto_id_producto` INT NULL DEFAULT NULL,
  `cliente_id_cliente` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_valoracion`),
  INDEX `FK2jhc4ymo88009kuyon0mjmlkd` (`producto_id_producto` ASC) VISIBLE,
  INDEX `FKq14tgyaq6u8wdm0fos5g82lyx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK2jhc4ymo88009kuyon0mjmlkd`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `test1`.`producto` (`id_producto`),
  CONSTRAINT `FKq14tgyaq6u8wdm0fos5g82lyx`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `test1`.`cliente` (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
>>>>>>>> dfafcc8a6705f21d4eb0c8a1dee7df049af64632:BBDD/palasforalldataultimate.sql

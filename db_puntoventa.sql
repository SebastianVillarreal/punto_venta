/*
 Navicat Premium Data Transfer

 Source Server         : Servidor local
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : db_puntoventa

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 09/01/2019 21:08:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `costo` decimal(10, 2) NOT NULL,
  `precio` decimal(10, 2) NOT NULL,
  `proveedor` smallint(5) UNSIGNED NOT NULL,
  `linea` smallint(5) UNSIGNED NOT NULL,
  `grupo` smallint(5) UNSIGNED NOT NULL,
  `imagen` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `codigostock` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha_cad` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articulos
-- ----------------------------
INSERT INTO `articulos` VALUES (1, '123456789', 'PRUEBA', 10.00, 21.00, 1, 0, 0, '', '123456789', '2018-10-27');

-- ----------------------------
-- Table structure for bodegas
-- ----------------------------
DROP TABLE IF EXISTS `bodegas`;
CREATE TABLE `bodegas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(5) NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bodegas
-- ----------------------------
INSERT INTO `bodegas` VALUES (1, 1, 'MATRIZ');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domicilio` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ciudad` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'SEBASTIAN', 'LINARES', '8211320580', 'LINARES');

-- ----------------------------
-- Table structure for existencias
-- ----------------------------
DROP TABLE IF EXISTS `existencias`;
CREATE TABLE `existencias`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cantidad` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of existencias
-- ----------------------------
INSERT INTO `existencias` VALUES (1, '123456789', 170.00);

-- ----------------------------
-- Table structure for gastos
-- ----------------------------
DROP TABLE IF EXISTS `gastos`;
CREATE TABLE `gastos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `numero_fact` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `proveedor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `subtotal` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `iva` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `total` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `edo` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `user` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `concepto` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `user_cancela` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kardex
-- ----------------------------
DROP TABLE IF EXISTS `kardex`;
CREATE TABLE `kardex`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `cantidad` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `tipo` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `fecha` date NOT NULL,
  `user` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `costou` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `preciou` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `proveedor` int(10) NOT NULL,
  `descuento_porcentaje` decimal(10, 2) NOT NULL,
  `impuesto_porcentaje` decimal(10, 2) NOT NULL,
  `serie` int(2) NOT NULL,
  `numero` int(10) NOT NULL,
  `fecha_proceso` date NOT NULL,
  `referencia` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `referencia1` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `referencia2` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kardex
-- ----------------------------
INSERT INTO `kardex` VALUES (1, '123456789', 90.00, 'EC', '2018-10-25', 'administrador', 10.00, 0.00, 1, 0.00, 0.00, 0, 1, '2018-10-25', 'AA00795198', '', '');
INSERT INTO `kardex` VALUES (2, '123456789', 9.00, 'STCO', '2018-10-25', 'administrador', 10.00, 21.00, 0, 0.00, 0.00, 1, 1, '2018-10-25', '', '', '');
INSERT INTO `kardex` VALUES (3, '123456789', 1.00, 'STCR', '2018-10-25', 'administrador', 10.00, 21.00, 0, 0.00, 0.00, 1, 2, '2018-10-25', '1', '', '');

-- ----------------------------
-- Table structure for lineas
-- ----------------------------
DROP TABLE IF EXISTS `lineas`;
CREATE TABLE `lineas`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `linea` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `grupo` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `descripcion` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `marca_eliminada` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lineas
-- ----------------------------
INSERT INTO `lineas` VALUES (1, 1, 2, 'LINEA DE PRUEBA', 'NO');

-- ----------------------------
-- Table structure for parametros
-- ----------------------------
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `entrada_x_compra` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `nombre_empresa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domicilio_empresa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `caja1` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `caja2` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `caja3` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `caja4` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `nombre_emp_corto` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parametros
-- ----------------------------
INSERT INTO `parametros` VALUES (1, 1, 'Forrajera Elizondo', 'Linares', 2, 0, 0, 0, 'Forrajera');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `domicilio` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ciudad` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'COCA COLA', '1111111111', 'LINARES', 'LINARES');

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `proveedor` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `num_fact_nota` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `impuesto_porcentaje` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `desc_porcentaje` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `articulo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `costo` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `cantidad` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `tipo` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `descripcion_articulo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `descripcion_prov` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tipos
-- ----------------------------
DROP TABLE IF EXISTS `tipos`;
CREATE TABLE `tipos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  `tipo` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `clave` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(535) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bodega` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipo` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'administrador', 'administrador', 'administrador', '1', 1);
INSERT INTO `usuarios` VALUES (3, 'cajero', 'cajero', 'cajero', '1', 2);
INSERT INTO `usuarios` VALUES (4, 'sistemas', 'sistemas', 'sistemas', '1', 3);

SET FOREIGN_KEY_CHECKS = 1;

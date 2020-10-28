CREATE TABLE vendedor (
  `idvendedor` INTEGER NOT NULL,
  `nombre` TEXT NOT NULL,
  `apellido` TEXT NOT NULL,
  PRIMARY KEY (`idvendedor`));

CREATE TABLE cliente (
  `idcliente` INTEGER NOT NULL,
  `nombre` TEXT NOT NULL,
  `apellido` TEXT NOT NULL,
  `vendedor_idvendedor` INTEGER NOT NULL,
  PRIMARY KEY (`idcliente`, `vendedor_idvendedor`),
  CONSTRAINT `fk_cliente_vendedor1`,
    FOREIGN KEY (`vendedor_idvendedor`)
    REFERENCES `vendedor` (`idvendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE coches (
  `idcoches` INTEGER NOT NULL,
  `matricula` TEXT NOT NULL,
  `año` TEXT NOT NULL,
  `cliente_idcliente` INTEGER NOT NULL,
  `vendedor_idvendedor` INTEGER NOT NULL,
  PRIMARY KEY (`idcoches`, `cliente_idcliente`, `vendedor_idvendedor`),
  CONSTRAINT `fk_coches_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_coches_vendedor1`
    FOREIGN KEY (`vendedor_idvendedor`)
    REFERENCES `vendedor` (`idvendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `vendedor` (`idvendedor`, `nombre`, `apellido`) VALUES (1, 'Abel', 'Abelardo');
INSERT INTO `vendedor` (`idvendedor`, `nombre`, `apellido`) VALUES (2, 'Bob', 'Bobby');
INSERT INTO `vendedor` (`idvendedor`, `nombre`, `apellido`) VALUES (3, 'Carlos', 'Charles');
INSERT INTO `vendedor` (`idvendedor`, `nombre`, `apellido`) VALUES (4, 'Daniel', 'Dani');
INSERT INTO `vendedor` (`idvendedor`, `nombre`, `apellido`) VALUES (5, 'Esteban', 'Estebitan');

INSERT INTO `cliente` (`idcliente`, `nombre`, `apellido`, `vendedor_idvendedor`) VALUES (1, 'Ana', 'Álvarez', 1);
INSERT INTO `cliente` (`idcliente`, `nombre`, `apellido`, `vendedor_idvendedor`) VALUES (2, 'Beatriz', 'Bob', 2);
INSERT INTO `cliente` (`idcliente`, `nombre`, `apellido`, `vendedor_idvendedor`) VALUES (3, 'Claudia', 'Borrachero', 3);
INSERT INTO `cliente` (`idcliente`, `nombre`, `apellido`, `vendedor_idvendedor`) VALUES (5, 'Daniela', 'Dani', 4);
INSERT INTO `cliente` (`idcliente`, `nombre`, `apellido`, `vendedor_idvendedor`) VALUES (5, 'Estefanía', 'Esteban', 5);

INSERT INTO `coches` (`idcoches`, `matricula`, `año`, `cliente_idcliente`, `vendedor_idvendedor`) VALUES (1, '1234ABC', '2015', 1, 1);
INSERT INTO `coches` (`idcoches`, `matricula`, `año`, `cliente_idcliente`, `vendedor_idvendedor`) VALUES (2, '1234DEF', '2016', 2, 2);
INSERT INTO `coches` (`idcoches`, `matricula`, `año`, `cliente_idcliente`, `vendedor_idvendedor`) VALUES (3, '1234GHI', '2017', 3, 3);
INSERT INTO `coches` (`idcoches`, `matricula`, `año`, `cliente_idcliente`, `vendedor_idvendedor`) VALUES (4, '1234JKL', '2018', 4, 4);
INSERT INTO `coches` (`idcoches`, `matricula`, `año`, `cliente_idcliente`, `vendedor_idvendedor`) VALUES (5, '1234MNÑ', '2019', 5, 5);
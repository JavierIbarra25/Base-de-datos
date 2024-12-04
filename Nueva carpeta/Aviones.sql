DROP DATABASE IF EXISTS Aviones;
CREATE DATABASE IF NOT EXISTS Aviones CHARSET utf8mb4 COLLATE utf8mb4_spanish2_ci;

USE Aviones;

CREATE TABLE Tripulacion (
 NIF VARCHAR (12),
 Nombre VARCHAR (25) NOT NULL,
 Apellido VARCHAR (25) NOT NULL,
 Piloto BOOLEAN,
 CoPiloto BOOLEAN,
 JefeDeCabina BOOLEAN,
 Azafato_a BOOLEAN,
 FechaNacimiento DATE,
 HorasVuelo DATETIME,
 CAT1 BOOLEAN,
 CAT2 BOOLEAN,
 CAT3 BOOLEAN,
 Calle VARCHAR (52) NOT NULL,
 Numero NUMERIC (5) NOT NULL,
 CP NUMERIC (5) NOT NULL,

 CONSTRAINT PK_NIF PRIMARY KEY (NIF)
 )
 ENGINE = InnoDB;
 
 CREATE TABLE Telefonos (
 NIF_Usuarios VARCHAR (14) NOT NULL,
 Telefono VARCHAR (14),
 
 CONSTRAINT PK_Telefono PRIMARY KEY (Telefono),
 CONSTRAINT NIF_Usuarios FOREIGN KEY (NIF_Usuarios) 
	REFERENCES Tripulacion (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Tripulantes (
 NIF1 VARCHAR (14) NOT NULL,
 NIF2 VARCHAR (14) NOT NULL,
 Armonia BOOLEAN,
CONSTRAINT PK_Tripulantes PRIMARY KEY (NIF1, NIF2),
 CONSTRAINT NIF1 FOREIGN KEY (NIF1) 
	REFERENCES Tripulacion (NIF)
	ON DELETE CASCADE,
 CONSTRAINT NIF2 FOREIGN KEY (NIF2) 
	REFERENCES Tripulacion (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Modelos (
 Codigo_Modelos VARCHAR (25),
 PrimeraCLase NUMERIC(5) NOT NULl,
 ClaseEconomica NUMERIC(5) NOT NULl,
 Numero NUMERIC(5) NOT NULl,
 Fuel NUMERIC(25) NOT NULl,
 
 CONSTRAINT PK_Codigo_Modelos PRIMARY KEY (Codigo_Modelos),
 CONSTRAINT CH_PrimeraCLase CHECK (PrimeraCLase >= 0),
 CONSTRAINT CH_ClaseEconomica CHECK (ClaseEconomica >= 0)
  )
  ENGINE = InnoDB;
  
CREATE TABLE Aviones (
 CodigoModelos VARCHAR (25) NOT NULL,
 Matricula VARCHAR (25),
 Nombre VARCHAR (14),
 
 CONSTRAINT PK_Matricula PRIMARY KEY (Matricula),
 CONSTRAINT Fk_CodigoModelos FOREIGN KEY (CodigoModelos) 
	REFERENCES Modelos (Codigo_Modelos)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Vuelos (
 Codigo_Vuelos VARCHAR (25),
 MatriculaAviones VARCHAR (25) NOT NULL,
 AeropuertoEntrada VARCHAR (25) NOT NULL,
 AeropuertoSalida  VARCHAR (25) NOT NULL,
 FuelMin  NUMERIC (25) NOT NULL,
 FechaEntrada DATE NOT NULL,
 FechaSalida DATE NOT NULL,
 
 CONSTRAINT PK_Codigo_Vuelos PRIMARY KEY (Codigo_Vuelos),
 CONSTRAINT FK_MatriculaAviones FOREIGN KEY (MatriculaAviones) 
	REFERENCES Aviones (Matricula)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
 
 CREATE TABLE Licencias (
 NIF_Tripulantes VARCHAR (14) NOT NULL,
 Licencia VARCHAR (25),
 Fecha_Inicio DATE,
 Fecha_Caducidad DATE,
 
 CONSTRAINT PK_Fecha_Caducidad PRIMARY KEY (Fecha_Caducidad),
 CONSTRAINT Fk_NIF_Tripulantes FOREIGN KEY (NIF_Tripulantes) 
	REFERENCES Tripulacion (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Asignados (
 NIF_Asignados VARCHAR (14) NOT NULL,
 CodigoVuelos VARCHAR (25) NOT NULL,
 FechaCaducidad DATE NOT NULL,
 
 CONSTRAINT NIF_Asignados FOREIGN KEY (NIF_Asignados) 
	REFERENCES Tripulacion (NIF)
	ON DELETE CASCADE,
 CONSTRAINT CodigoVuelos FOREIGN KEY (CodigoVuelos) 
	REFERENCES Vuelos (Codigo_Vuelos)
	ON DELETE CASCADE,
 CONSTRAINT FechaCaducidad FOREIGN KEY (FechaCaducidad) 
	REFERENCES Licencias (Fecha_Caducidad)
	ON DELETE CASCADE   
  )
  ENGINE = InnoDB;
  
CREATE TABLE APEntrada (
 Codigo_IATA VARCHAR (25),
 Pais VARCHAR (25) NOT NULL,
 GPS VARCHAR (25) NOT NULL,
 FranjaHoraria DATE NOT NULL,
 CAT1 VARCHAR(2),
 CAT2 VARCHAR(2),
 CAT3 VARCHAR(2),

 CONSTRAINT PK1_Codigo_IATA PRIMARY KEY (Codigo_IATA),
 CONSTRAINT CH1_CAT1 CHECK (CAT1 = "Si"),
 CONSTRAINT CH2_CAT2 CHECK (CAT2 = "Si"),
 CONSTRAINT CH3_CAT3 CHECK (CAT3 = "Si")
 )
 ENGINE = InnoDB;
 
CREATE TABLE APSalida (
 Codigo_IATA VARCHAR (25),
 Pais VARCHAR (25) NOT NULL,
 GPS VARCHAR (25) NOT NULL,
 FranjaHoraria DATE NOT NULL,
 CAT1 VARCHAR(2),
 CAT2 VARCHAR(2),
 CAT3 VARCHAR(2),

 CONSTRAINT PK2_Codigo_IATA PRIMARY KEY (Codigo_IATA),
 CONSTRAINT CH4_CAT1 CHECK (CAT1 = "Si"),
 CONSTRAINT CH5_CAT2 CHECK (CAT2 = "Si"),
 CONSTRAINT CH6_CAT3 CHECK (CAT3 = "Si")
 )
 ENGINE = InnoDB;
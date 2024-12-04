DROP DATABASE IF EXISTS APPCITAS;
CREATE DATABASE IF NOT EXISTS APPCITAS CHARSET utf8mb4 COLLATE utf8mb4_spanish2_ci;

USE APPCITAS;

CREATE TABLE Usuarios (
 NIF VARCHAR (14),
 Nombre VARCHAR (25) NOT NULL,
 Apellido VARCHAR (25) NOT NULL,
 Email VARCHAR (25) NOT NULL,
 Contraseña VARCHAR (25) NOT NULL,
 Calle VARCHAR (52) NOT NULL,
 Numero NUMERIC (5) NOT NULL,
 CP NUMERIC (5) NOT NULL,
 Foto BLOB NOT NULL,
 
  CONSTRAINT PK_NIF PRIMARY KEY (NIF)
  )
  ENGINE = InnoDB;
  
CREATE TABLE Telefonos (
 NIF_Usuarios VARCHAR (14),
 Telefono VARCHAR (14),
 
 CONSTRAINT PK_Telefono PRIMARY KEY (Telefono),
 CONSTRAINT NIF_Usuarios FOREIGN KEY (NIF_Usuarios) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE PersonasSeGustan (
 NIF1 VARCHAR (14),
 NIF2 VARCHAR (14),
 Coincide VARCHAR (25) NOT NULL,
 CONSTRAINT PK_PersonasSeGustan PRIMARY KEY (NIF1, NIF2),
 CONSTRAINT FK_NIF1 FOREIGN KEY (NIF1) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE,
 CONSTRAINT FK_NIF2 FOREIGN KEY (NIF2) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Categorias (
 Codigo_Categorias VARCHAR (25),
 Nombre VARCHAR (25),
 
 CONSTRAINT PK_Codigo_Categorias PRIMARY KEY (Codigo_Categorias)
  )
  ENGINE = InnoDB;
  
CREATE TABLE Aficiones (
 CodigoCategorias VARCHAR (25),
 Codigo_Aficiones VARCHAR (25),
 Nombre VARCHAR (25) NOT NULL,
 
 CONSTRAINT PK_Codigo_Aficiones PRIMARY KEY (Codigo_Aficiones),
 CONSTRAINT FK_CodigoCategorias FOREIGN KEY (CodigoCategorias) 
	REFERENCES Categorias (Codigo_Categorias)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Personas_Aficiones (
 NIF_Personas VARCHAR (14),
 CodigoAficiones VARCHAR (25),
 
 CONSTRAINT PK_Personas_Aficiones PRIMARY KEY (NIF_Personas, CodigoAficiones),
 CONSTRAINT FK_NIF_Personas FOREIGN KEY (NIF_Personas) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE,
 CONSTRAINT FK_CodigoAficiones FOREIGN KEY (CodigoAficiones) 
	REFERENCES Aficiones (Codigo_Aficiones)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Ubicaciones(
 Codigo_Ubicaciones VARCHAR (25),
 Calle VARCHAR (52) NOT NULL,
 Numero NUMERIC (5) NOT NULL,
 CP NUMERIC (5) NOT NULL,
 Descripcion VARCHAR (52) NOT NULL,
 
 CONSTRAINT PK_Codigo_Ubicaciones PRIMARY KEY (Codigo_Ubicaciones)
  )
  ENGINE = InnoDB;
  
CREATE TABLE Citas(
 Codigo_Citas VARCHAR (25),
 NIF1 VARCHAR (14),
 NIF2 VARCHAR (14),
 Fecha DATE NOT NULL,
 CodigoUbicaciones VARCHAR (25),
 
 CONSTRAINT PK_Codigo_Citas PRIMARY KEY (Codigo_Citas),
 CONSTRAINT FK_CodigoUbicaciones FOREIGN KEY (CodigoUbicaciones) 
	REFERENCES Ubicaciones (Codigo_Ubicaciones)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Valoraciones(
 CodigoCitas VARCHAR (25),
 NIF_Usuarios2 VARCHAR (14),
 Valoraciones VARCHAR (14),
 SeGustan BOOLEAN,
 
 CONSTRAINT PK_Valoraciones PRIMARY KEY (CodigoCitas, NIF_Usuarios2),
 CONSTRAINT FK_CodigoCitas FOREIGN KEY (CodigoCitas) 
	REFERENCES Citas (Codigo_Citas)
	ON DELETE CASCADE,
 CONSTRAINT FK_NIF_Usuarios2 FOREIGN KEY (NIF_Usuarios2) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
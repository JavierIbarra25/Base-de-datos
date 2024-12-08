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
 CONSTRAINT FK_NIF_Usuarios FOREIGN KEY (NIF_Usuarios) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE PersonasSeGustan (
 NIFUsuarios VARCHAR (14),
 NIFUsuarios2 VARCHAR (14),
 
 CONSTRAINT FK_NIFUsuarios FOREIGN KEY (NIFUsuarios) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE,
 CONSTRAINT FK_NIFUsuarios2 FOREIGN KEY (NIFUsuarios2) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Categorias (
 Codigo_Categorias VARCHAR (25),
 Nombre VARCHAR (25) NOT NULL,
 
 CONSTRAINT PK_Codigo_Categorias PRIMARY KEY (Codigo_Categorias)
  )
  ENGINE = InnoDB;
  
CREATE TABLE Aficiones (
 Codigo_Aficiones VARCHAR (25),
 Nombre VARCHAR (25) NOT NULL,
 
 CONSTRAINT PK_Codigo_Aficiones PRIMARY KEY (Codigo_Aficiones)
  )
  ENGINE = InnoDB;
  
CREATE TABLE AficionesCategorias (
 CodigoCategorias VARCHAR (25),
 CodigoAficiones VARCHAR (25),
 
 CONSTRAINT FK_CodigoAficiones FOREIGN KEY (CodigoAficiones) 
	REFERENCES Aficiones (Codigo_Aficiones)
	ON DELETE CASCADE,
 CONSTRAINT FK_CodigoCategorias FOREIGN KEY (CodigoCategorias) 
	REFERENCES Categorias (Codigo_Categorias)
	ON DELETE CASCADE
  )	
  ENGINE = InnoDB;
  
CREATE TABLE Usuarios_Aficiones (
 NIF_UsuariosAficiones VARCHAR (14),
 CodigoAficiones2 VARCHAR (25),
 
 CONSTRAINT FK_NIF_UsuariosAficiones FOREIGN KEY (NIF_UsuariosAficiones) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE,
 CONSTRAINT FK_CodigoAficiones2 FOREIGN KEY (CodigoAficiones2) 
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
  
CREATE TABLE Citas (
 Codigo_Citas VARCHAR (25),
 Fecha DATE NOT NULL,
 
 CONSTRAINT PK_Codigo_Citas PRIMARY KEY (Codigo_Citas)
  )
  ENGINE = InnoDB;
  
CREATE TABLE CitasUsuarios(
 Codigo_CitasUsuarios VARCHAR (25),
 NIF_Usuario1 VARCHAR (14),
 NIF_Usuario2 VARCHAR (14),
 CodigoUbicaciones VARCHAR (25),
 
 CONSTRAINT FK_CodigoUbicaciones FOREIGN KEY (CodigoUbicaciones) 
	REFERENCES Ubicaciones (Codigo_Ubicaciones)
	ON DELETE CASCADE,
CONSTRAINT FK_Codigo_CitasUsuarios FOREIGN KEY (Codigo_CitasUsuarios) 
	REFERENCES Citas (Codigo_Citas)
	ON DELETE CASCADE,
CONSTRAINT FK_NIF_Usuario1 FOREIGN KEY (NIF_Usuario1) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE,
 CONSTRAINT FK_NIF_Usuario2 FOREIGN KEY (NIF_Usuario2) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
CREATE TABLE Usuarios_Cita1(
 Codigo_CitasUsuarios1 VARCHAR (25),
 NIF_Usuarios1 VARCHAR (14),
 Aceptan BOOLEAN NOT NULL,
 Valoraciones BOOLEAN NOT NULL,
 
 CONSTRAINT FK_Codigo_CitasUsuarios1 FOREIGN KEY (Codigo_CitasUsuarios1) 
	REFERENCES Citas (Codigo_Citas)
	ON DELETE CASCADE,
 CONSTRAINT FK_NIF_Usuarios1 FOREIGN KEY (NIF_Usuarios1) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB;
  
 CREATE TABLE Usuarios_Cita2(
 Codigo_CitasUsuarios2 VARCHAR (25),
 NIF_Usuarios2 VARCHAR (14),
 Aceptan BOOLEAN NOT NULL,
 Valoraciones BOOLEAN NOT NULL,
 
 CONSTRAINT FK_Codigo_CitasUsuarios2 FOREIGN KEY (Codigo_CitasUsuarios2) 
	REFERENCES Citas (Codigo_Citas)
	ON DELETE CASCADE,
 CONSTRAINT FK_NIF_Usuarios2 FOREIGN KEY (NIF_Usuarios2) 
	REFERENCES Usuarios (NIF)
	ON DELETE CASCADE
  )
  ENGINE = InnoDB; 
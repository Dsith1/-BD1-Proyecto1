Create TABLE Maestro(
	NOMBRE_ELECCION varchar2(25),
	AÑO_ELECCION  varchar2(4),
	PAIS varchar2(15),
	REGION varchar2(10),
	DEPTO varchar2(25),
	MUNICIPIO varchar2(32),
	PARTIDO  varchar2(5),
	NOMBRE_PARTIDO  varchar2(35),
	SEXO1  varchar2(10),
	RAZA1  varchar2(10),
	ANALFABETOS  int,
	ALFABETOS  int,
	SEXO2  varchar2(10),
	RAZA2  varchar2(10),
	PRIMARIA  int,
	NIVEL_MEDIO int,
	UNIVERSITARIOS int
);


Create Table Pais(
	ID_Pais int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Nombre varchar2(15)
);

Create table Zona(
	ID_Zona int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Pais int,
	foreign key (Pais) references Pais(ID_Pais)
);

Create table region(
	ID_Region int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Nombre varchar2(15),
	Pais int,
	foreign key (Pais) references Pais(ID_Pais)
);

Create table Departamento(
	ID_Departamento int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Nombre varchar2(35),
	Region int,
	foreign key (region) references region(ID_Region)
)

Create table MUNICIPIO(
	ID_MUNICIPIO int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Nombre varchar2(35),
	Departamento int
	foreign key (Departamento) references Departamento(ID_Departamento)
)

Create Table Partido(
	ID_Partido int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	SIGLAS varchar2(5),
	NOMBRE_PARTIDO  varchar2(35),
);

Create Table Etnia(
  ID_Etnia int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
  NOmbre varchar2(10)
);
	
Create table MUNICIPIO(
	ID_MUNICIPIO int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Nombre varchar2(35),
	Departamento int,
	foreign key (Departamento) references Departamento(ID_Departamento)
);

Create Table Partido(
	ID_Partido int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	SIGLAS varchar2(5),
	NOMBRE_PARTIDO  varchar2(35)
);  
  
Create table Detalle_Etnia(
	ID_Zona int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Votos int,
	Año int,
	primary key(ID_Zona,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Zona) references Zona(ID_Zona),
	foreign key (Etnia) references Etnia(ID_Etnia)
);

Create table Detalle_Alfabetismo(
	ID_Zona int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	ALFABETOS int,
	ANALFABETOS int,
	Año int,
	primary key(ID_Zona,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Zona) references Zona(ID_Zona)
);

Create table Detalle_Escolaridad(
	ID_Zona int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Primaria int,
	NIVEL_MEDIO int,
	UNIVERSITARIOS int,
	Año int,
	primary key(ID_Zona,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Zona) references Zona(ID_Zona)
);

Create table Detalle_Region_Etnia(
	ID_Region int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Votos int,
	Año int,
	primary key(ID_Region,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Region) references Region(ID_Region),
	foreign key (Etnia) references Etnia(ID_Etnia)
);

Create table Detalle_Alfabetismo_Region(
	ID_Region int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	ALFABETOS int,
	ANALFABETOS int,
	Año int,
	primary key(ID_Region,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Region) references Region(ID_Region)
);

Create table Detalle_Escolaridad_Region(
	ID_Region int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Primaria int,
	NIVEL_MEDIO int,
	UNIVERSITARIOS int,
	Año int,
	primary key(ID_Region,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Region) references Region(ID_Region)
);

Create table Detalle_Departamento_Etnia(
	ID_Departamento int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Votos int,
	Año int,
	primary key(ID_Departamento,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Departamento) references Departamento(ID_Departamento),
	foreign key (Etnia) references Etnia(ID_Etnia)
);

Create table Detalle_Alfabetismo_Departamento(
	ID_Departamento int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	ALFABETOS int,
	ANALFABETOS int,
	Año int,
	primary key(ID_Departamento,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Departamento) references Departamento(ID_Departamento)
);

Create table Detalle_Escolaridad_Departamento(
	ID_Departamento int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Primaria int,
	NIVEL_MEDIO int,
	UNIVERSITARIOS int,
	Año int,
	primary key(ID_Departamento,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_Departamento) references Departamento(ID_Departamento)
);

Create table Detalle_MUNICIPIO_Etnia(
	ID_MUNICIPIO int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Votos int,
	Año int,
	primary key(ID_MUNICIPIO,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_MUNICIPIO) references MUNICIPIO(ID_MUNICIPIO),
	foreign key (Etnia) references Etnia(ID_Etnia)
);

Create table Detalle_Alfabetismo_MUNICIPIO(
	ID_MUNICIPIO int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	ALFABETOS int,
	ANALFABETOS int,
	Año int,
	primary key(ID_MUNICIPIO,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_MUNICIPIO) references MUNICIPIO(ID_MUNICIPIO)
);

Create table Detalle_Escolaridad_MUNICIPIO(
	ID_MUNICIPIO int,
	ID_Partido int,
	Etnia int,
	Sexo varchar2(10),
	Primaria int,
	NIVEL_MEDIO int,
	UNIVERSITARIOS int,
	Año int,
	primary key(ID_MUNICIPIO,ID_Partido),
	foreign key (ID_Partido) references Partido(ID_Partido),
	foreign key (ID_MUNICIPIO) references MUNICIPIO(ID_MUNICIPIO)
);


Create Table Tipo_Eleccion(
	ID_Tipo int GENERATED as IDENTITY(START with 1 INCREMENT by 1) primary key,
	Nombre varchar(30)
)

Create table Usuario(
	Usuario varchar2(20) Primary key,
	Contra varchar2(20)
);

Insert into Usuario(Usuario,Contra)
values('admin','admin');


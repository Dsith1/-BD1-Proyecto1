--Llenado Pais--
Insert into Pais(Nombre)
Select distinct Pais from Maestro;

--Llenado Etnias--
Insert into Etnia(Nombre)
Select distinct Raza1 from Maestro;

--Llenado Tipo Eleccion--
Insert into tipo_eleccion(Nombre)
Select distinct nombre_eleccion from Maestro;

--Llenado Partido--
Insert into Partido(Siglas,NOMBRE_PARTIDO)
Select Distinct Partido,NOMBRE_PARTIDO from Maestro;


--LLenado Region--
Insert into Region(Nombre,Pais)
Select A.region,B.ID_Pais
from
(Select Distinct Region,Pais from Maestro)A,
(Select Id_Pais,Nombre from Pais)B
Where B.Nombre=A.Pais;

--Llenado ZOna
Insert Into Zona(pais)
Select distinct ID_Pais from Pais;


--LLenado Departamento--
Insert Into Departamento(Nombre,region)
Select C.Depto,D.Id_region
from
(Select B.Id_Pais as Pais,A.Region,A.Depto
from
(Select Distinct Pais,region,Depto from Maestro)A,
(Select Id_Pais,Nombre from Pais)B
Where B.Nombre=A.Pais)C,
(Select Id_region,Nombre,Pais From Region)D
Where C.Pais=D.Pais and D.Nombre=C.Region;

--LLenado Municipio--
Insert into Municipio(Nombre,departamento)
Select A.Municipio,B.Id_Departamento
from
(Select distinct Depto,Municipio from Maestro)A,
(Select Id_Departamento,Nombre from Departamento)B
Where B.Nombre=A.Depto;

--Detalle Escolaridad Municipio
Insert into detalle_escolaridad_municipio(id_municipio,id_partido,Etnia,Sexo,Primaria,Nivel_Medio,UNIVERSITARIOS,Año)
Select F.ID_Municipio,E.Partido,E.Etnia,E.Sexo1,E.primaria,E.Nivel_Medio,E.UNIVERSITARIOS,E.AÑO_ELECCION 
from
(Select C.Municipio,C.Partido,D.ID_Etnia as Etnia,C.Sexo1,C.primaria,C.Nivel_Medio,C.UNIVERSITARIOS,C.AÑO_ELECCION 
from
(Select A.Municipio,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.primaria,A.Nivel_Medio,A.UNIVERSITARIOS,A.AÑO_ELECCION 
from
(Select Municipio,Partido,Sexo1,Raza1,primaria,Nivel_Medio,UNIVERSITARIOS,AÑO_ELECCION 
from Maestro)A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.siglas)C,
(Select ID_Etnia,Nombre From Etnia)D
Where C.RAza1=D.Nombre)E,
(Select ID_Municipio,Nombre from Municipio)F
Where F.NOmbre=E.Municipio;

--Detalle Alfabetismo Municipio
Insert into detalle_alfabetismo_municipio(id_municipio,id_partido,Etnia,Sexo,Alfabetos,Analfabetos,Año)
Select F.ID_Municipio,E.Partido,E.Etnia,E.Sexo1,E.Alfabetos,E.Analfabetos,E.AÑO_ELECCION 
from
(Select C.Municipio,C.Partido,D.ID_Etnia as Etnia,C.Sexo1,C.Alfabetos,C.Analfabetos,C.AÑO_ELECCION 
from
(Select A.Municipio,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.Alfabetos,A.Analfabetos,A.AÑO_ELECCION 
from
(Select Municipio,Partido,Sexo1,Raza1,Alfabetos,Analfabetos,AÑO_ELECCION 
from Maestro)A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.siglas)C,
(Select ID_Etnia,Nombre From Etnia)D
Where C.RAza1=D.Nombre)E,
(Select ID_Municipio,Nombre from Municipio)F
Where F.NOmbre=E.Municipio;

--Detalle Etnia municipio
Insert into detalle_municipio_etnia(id_municipio,id_partido,Etnia,Sexo,Votos,Año)
Select F.ID_Municipio,E.ID_Partido,E.Etnia,E.Sexo1,E.Votos,E.AÑO_ELECCION
from
(Select C.Municipio,D.ID_Partido,C.Etnia,C.Sexo1,C.Votos,C.AÑO_ELECCION
from
(Select A.Municipio,A.Partido,B.ID_Etnia as Etnia,A.Sexo1,A.Votos,A.AÑO_ELECCION
from
(Select Municipio,Partido,Raza1,Sexo1,(ANALFABETOS+ALFABETOS+PRIMARIA+NIVEL_MEDIO+UNIVERSITARIOS)As Votos,AÑO_ELECCION
from Maestro)A,
(Select ID_Etnia,Nombre from Etnia)B
Where A.Raza1=B.Nombre)C,
(Select ID_Partido,Siglas from Partido)D
Where C.Partido=D.Siglas)E,
(Select ID_Municipio,Nombre from Municipio)F
Where F.NOmbre=E.Municipio;

--Detalle Escolaridad Departamento
Insert into detalle_escolaridad_depto(ID_Departamento,id_partido,Etnia,Sexo,Primaria,Nivel_Medio,UNIVERSITARIOS,Año)
Select F.ID_Departamento,E.Partido,E.Etnia,E.Sexo1,E.primaria,E.Nivel_Medio,E.UNIVERSITARIOS,E.AÑO_ELECCION 
from
(Select C.Depto,C.Partido,D.ID_Etnia as Etnia,C.Sexo1,C.primaria,C.Nivel_Medio,C.UNIVERSITARIOS,C.AÑO_ELECCION 
from
(Select A.Depto,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.primaria,A.Nivel_Medio,A.UNIVERSITARIOS,A.AÑO_ELECCION 
from
(Select Depto,Partido,Sexo1,Raza1,Sum(PRIMARIA)as PRIMARIA,Sum(NIVEL_MEDIO) as NIVEL_MEDIO,Sum(UNIVERSITARIOS) as UNIVERSITARIOS,AÑO_ELECCION 
from Maestro Group by(Depto,Partido,Sexo1,Raza1,AÑO_ELECCION))A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.siglas)C,
(Select ID_Etnia,Nombre From Etnia)D
Where C.RAza1=D.Nombre)E,
(Select ID_Departamento,Nombre from Departamento)F
Where F.NOmbre=E.Depto;

--Detalle Alfabetismo Departamento
Insert into detalle_alfabetismo_depto(ID_Departamento,id_partido,Etnia,Sexo,Alfabetos,Analfabetos,Año)
Select F.ID_Departamento,E.Partido,E.Etnia,E.Sexo1,E.Alfabetos,E.Analfabetos,E.AÑO_ELECCION 
from
(Select C.Depto,C.Partido,D.ID_Etnia as Etnia,C.Sexo1,C.Alfabetos,C.Analfabetos,C.AÑO_ELECCION 
from
(Select A.Depto,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.Alfabetos,A.Analfabetos,A.AÑO_ELECCION 
from
(Select Depto,Partido,Sexo1,Raza1,Sum(Alfabetos)as Alfabetos,Sum(Analfabetos) as Analfabetos,AÑO_ELECCION 
from Maestro Group by(Depto,Partido,Sexo1,Raza1,AÑO_ELECCION))A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.siglas)C,
(Select ID_Etnia,Nombre From Etnia)D
Where C.RAza1=D.Nombre)E,
(Select ID_Departamento,Nombre from Departamento)F
Where F.NOmbre=E.Depto;

--Detalle Etnia Depto
Insert into detalle_Depto_etnia(ID_Departamento,id_partido,Etnia,Sexo,Votos,Año)
Select F.ID_Departamento,E.ID_Partido,E.Etnia,E.Sexo1,E.Votos,E.AÑO_ELECCION
from
(Select C.Depto,D.ID_Partido,C.Etnia,C.Sexo1,C.Votos,C.AÑO_ELECCION
from
(Select A.Depto,A.Partido,B.ID_Etnia as Etnia,A.Sexo1,A.Votos,A.AÑO_ELECCION
from
(Select Depto,Partido,Raza1,Sexo1,SUM(ANALFABETOS+ALFABETOS+PRIMARIA+NIVEL_MEDIO+UNIVERSITARIOS)As Votos,AÑO_ELECCION
from Maestro Group by(Depto,Partido,Sexo1,Raza1,AÑO_ELECCION))A,
(Select ID_Etnia,Nombre from Etnia)B
Where A.Raza1=B.Nombre)C,
(Select ID_Partido,Siglas from Partido)D
Where C.Partido=D.Siglas)E,
(Select ID_Departamento,Nombre from Departamento)F
Where F.NOmbre=E.Depto;

--Detalle Escolaridad Region
Insert into detalle_escolaridad_region(id_region,id_partido,Etnia,Sexo,PRIMARIA,NIVEL_MEDIO,UNIVERSITARIOS,Año)
Select H.Id_Region,G.Partido,G.Etnia,G.Sexo1,G.PRIMARIA,G.NIVEL_MEDIO,G.UNIVERSITARIOS,G.AÑO_ELECCION
from
(Select F.ID_Pais as Pais,E.Region,E.Partido,E.Etnia,E.Sexo1,E.PRIMARIA,E.NIVEL_MEDIO,E.UNIVERSITARIOS,E.AÑO_ELECCION
from
(Select C.Pais,C.Region,D.ID_Partido as Partido,C.Etnia,C.Sexo1,C.PRIMARIA,C.NIVEL_MEDIO,C.UNIVERSITARIOS,C.AÑO_ELECCION
from
(Select A.Pais,A.Region,A.Partido,B.ID_Etnia as Etnia,A.Sexo1,A.PRIMARIA,A.NIVEL_MEDIO,A.UNIVERSITARIOS,A.AÑO_ELECCION
From
(Select Pais,Region,Partido,Raza1,Sexo1,Sum(PRIMARIA)as PRIMARIA,Sum(NIVEL_MEDIO) as NIVEL_MEDIO,Sum(UNIVERSITARIOS) as UNIVERSITARIOS,AÑO_ELECCION
from maestro Group by(Pais,Region,Partido,Raza1,Sexo1,AÑO_ELECCION))A,
(Select ID_Etnia,Nombre from Etnia)B
Where A.Raza1=B.Nombre)C,
(Select ID_Partido,Siglas from Partido)D
Where C.Partido=D.Siglas)E,
(Select ID_Pais,Nombre from Pais)F
Where F.Nombre=E.Pais)G,
(Select Id_Region,Nombre,Pais from region)H
Where H.Nombre=G.region and H.Pais=G.Pais;

--Detalle ANALFABETOS Region
Insert into detalle_alfabetismo_region(id_region,id_partido,Etnia,Sexo,ANALFABETOS,ALFABETOS,Año)
Select H.Id_Region,G.Partido,G.Etnia,G.Sexo1,G.ANALFABETOS,G.ALFABETOS,G.AÑO_ELECCION
from
(Select F.ID_Pais as Pais,E.Region,E.Partido,E.Etnia,E.Sexo1,E.ANALFABETOS,E.ALFABETOS,E.AÑO_ELECCION
from
(Select C.Pais,C.Region,D.ID_Partido as Partido,C.Etnia,C.Sexo1,C.ANALFABETOS,C.ALFABETOS,C.AÑO_ELECCION
from
(Select A.Pais,A.Region,A.Partido,B.ID_Etnia as Etnia,A.Sexo1,A.ANALFABETOS,A.ALFABETOS,A.AÑO_ELECCION
From
(Select Pais,Region,Partido,Raza1,Sexo1,Sum(ANALFABETOS)as ANALFABETOS,Sum(ALFABETOS) as ALFABETOS,AÑO_ELECCION
from maestro Group by(Pais,Region,Partido,Raza1,Sexo1,AÑO_ELECCION))A,
(Select ID_Etnia,Nombre from Etnia)B
Where A.Raza1=B.Nombre)C,
(Select ID_Partido,Siglas from Partido)D
Where C.Partido=D.Siglas)E,
(Select ID_Pais,Nombre from Pais)F
Where F.Nombre=E.Pais)G,
(Select Id_Region,Nombre,Pais from region)H
Where H.Nombre=G.region and H.Pais=G.Pais;

--Detalle Etnia Region
Insert into detalle_region_etnia(id_region,id_partido,Etnia,Sexo,Votos,Año)
Select H.Id_Region,G.Partido,G.Etnia,G.Sexo1,G.Votos,G.AÑO_ELECCION
from
(Select F.ID_Pais as Pais,E.Region,E.Partido,E.Etnia,E.Sexo1,E.Votos,E.AÑO_ELECCION
from
(Select C.Pais,C.Region,D.ID_Partido as Partido,C.Etnia,C.Sexo1,C.Votos,C.AÑO_ELECCION
from
(Select A.Pais,A.Region,A.Partido,B.ID_Etnia as Etnia,A.Sexo1,A.Votos,A.AÑO_ELECCION
From
(Select Pais,Region,Partido,Raza1,Sexo1,Sum(ANALFABETOS+ALFABETOS+PRIMARIA+NIVEL_MEDIO+UNIVERSITARIOS)as Votos ,AÑO_ELECCION
from maestro Group by(Pais,Region,Partido,Raza1,Sexo1,AÑO_ELECCION))A,
(Select ID_Etnia,Nombre from Etnia)B
Where A.Raza1=B.Nombre)C,
(Select ID_Partido,Siglas from Partido)D
Where C.Partido=D.Siglas)E,
(Select ID_Pais,Nombre from Pais)F
Where F.Nombre=E.Pais)G,
(Select Id_Region,Nombre,Pais from region)H
Where H.Nombre=G.region and H.Pais=G.Pais;

--Detalle Alfabetismo
Insert into detalle_alfabetismo(id_zona,id_partido,Etnia,Sexo,Alfabetos,Analfabetos,Año)
Select H.ID_Zona,G.Partido,G.Etnia,G.Sexo1,G.Alfabetos,G.Analfabetos,G.AÑO_ELECCION
from
(Select F.ID_Pais as pais,E.Partido,E.Etnia,E.Sexo1,E.Alfabetos,E.Analfabetos,E.AÑO_ELECCION
from
(Select C.pais,C.Partido,D.Id_Etnia as Etnia,C.Sexo1,C.Alfabetos,C.Analfabetos,C.AÑO_ELECCION
from
(Select A.pais,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.Alfabetos,A.Analfabetos,A.AÑO_ELECCION
from
(Select pais,Partido,Raza1,Sexo1,Sum(Alfabetos) as Alfabetos,SUM(Analfabetos) as Analfabetos,AÑO_ELECCION
from Maestro Group by(pais,Partido,Raza1,Sexo1,AÑO_ELECCION))A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.Siglas)C,
(Select Id_Etnia,Nombre from Etnia)D
Where D.Nombre=C.Raza1)E,
(Select ID_Pais,Nombre from Pais)F
Where E.Pais=F.Nombre)G,
(Select ID_Zona,Pais from Zona)H
Where H.Pais=G.pais;

--Detalle escolaridad
Insert into detalle_escolaridad(id_zona,id_partido,Etnia,Sexo,PRIMARIA,NIVEL_MEDIO,UNIVERSITARIOS,Año)
Select H.ID_Zona,G.Partido,G.Etnia,G.Sexo1,G.PRIMARIA,G.NIVEL_MEDIO,G.UNIVERSITARIOS,G.AÑO_ELECCION
from
(Select F.ID_Pais as pais,E.Partido,E.Etnia,E.Sexo1,E.PRIMARIA,E.NIVEL_MEDIO,E.UNIVERSITARIOS,E.AÑO_ELECCION
from
(Select C.pais,C.Partido,D.Id_Etnia as Etnia,C.Sexo1,C.PRIMARIA,C.NIVEL_MEDIO,C.UNIVERSITARIOS,C.AÑO_ELECCION
from
(Select A.pais,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.PRIMARIA,A.NIVEL_MEDIO,A.UNIVERSITARIOS,A.AÑO_ELECCION
from
(Select pais,Partido,Raza1,Sexo1,Sum(PRIMARIA) as PRIMARIA,SUM(NIVEL_MEDIO) as NIVEL_MEDIO,SUM(UNIVERSITARIOS) as UNIVERSITARIOS,AÑO_ELECCION
from Maestro Group by(pais,Partido,Raza1,Sexo1,AÑO_ELECCION))A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.Siglas)C,
(Select Id_Etnia,Nombre from Etnia)D
Where D.Nombre=C.Raza1)E,
(Select ID_Pais,Nombre from Pais)F
Where E.Pais=F.Nombre)G,
(Select ID_Zona,Pais from Zona)H
Where H.Pais=G.pais;

--Detalle Etnia
Insert into detalle_etnia(id_zona,id_partido,Etnia,Sexo,Votos,Año)
Select H.ID_Zona,G.Partido,G.Etnia,G.Sexo1,G.Votos,G.AÑO_ELECCION
from
(Select F.ID_Pais as pais,E.Partido,E.Etnia,E.Sexo1,E.Votos,E.AÑO_ELECCION
from
(Select C.pais,C.Partido,D.Id_Etnia as Etnia,C.Sexo1,C.Votos,C.AÑO_ELECCION
from
(Select A.pais,B.Id_Partido as Partido,A.Raza1,A.Sexo1,A.Votos,A.AÑO_ELECCION
from
(Select pais,Partido,Raza1,Sexo1,Sum(ANALFABETOS+ALFABETOS+PRIMARIA+NIVEL_MEDIO+UNIVERSITARIOS) as Votos,AÑO_ELECCION
from Maestro Group by(pais,Partido,Raza1,Sexo1,AÑO_ELECCION))A,
(Select Id_Partido,Siglas From Partido)B
Where A.Partido=B.Siglas)C,
(Select Id_Etnia,Nombre from Etnia)D
Where D.Nombre=C.Raza1)E,
(Select ID_Pais,Nombre from Pais)F
Where E.Pais=F.Nombre)G,
(Select ID_Zona,Pais from Zona)H
Where H.Pais=G.pais;

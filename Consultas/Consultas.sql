--Consulta 1
Select J.Año,K.Nombre,J.Partido,J.Porcentaje
from
(Select H.Año,I.Pais,H.Partido,H.Porcentaje
from
(Select F.Año,F.Id_Zona,G.Nombre_Partido as Partido,F.Porcentaje
from
(Select E.Id_Zona,E.ID_Partido,E.Año,E.Porcentaje
from
(Select C.Id_Zona,C.Año,Max(C.Porcentaje) As Maximo
from
(Select A.Id_Zona,A.ID_Partido,A.Año,Round(((A.Votos*100)/B.Total),2) AS Porcentaje
from
(Select Id_Zona,ID_Partido,Año,Sum(Votos) As Votos
from Detalle_Etnia Group by(Id_Zona,ID_Partido,Año))A,
(Select Id_Zona,Año,Sum(Votos) As Total
from Detalle_Etnia Group by(Id_Zona,Año))B
Where A.Id_Zona=B.Id_Zona and A.Año=B.Año)C
Group By(C.Id_Zona,C.Año))D,
(Select A.Id_Zona,A.ID_Partido,A.Año,Round(((A.Votos*100)/B.Total),2) AS Porcentaje
from
(Select Id_Zona,ID_Partido,Año,Sum(Votos) As Votos
from Detalle_Etnia Group by(Id_Zona,ID_Partido,Año))A,
(Select Id_Zona,Año,Sum(Votos) As Total
from Detalle_Etnia Group by(Id_Zona,Año))B
Where A.Id_Zona=B.Id_Zona and A.Año=B.Año)E
Where E.Porcentaje=D.Maximo)F,
(Select Id_Partido,Nombre_Partido from Partido)G
Where F.Id_Partido=G.Id_Partido)H,
(Select ID_Zona,Pais from Zona)I
Where H.Id_Zona=I.Id_Zona)J,
(Select Id_Pais,Nombre from Pais)K
Where J.Pais=k.ID_Pais;


--Consulta 2
Select A.Alfabetas,Round(((A.Alfabetas*100)/B.Total),2) as Porcentaje
from
(Select SUM(alfabetos)As Alfabetas from detalle_alfabetismo
Where Sexo='mujeres' and Etnia='2')A,
(Select SUM(Votos)AS Total from detalle_etnia)B;

--Consulta 3
Select J.Nombre as Pais,I."Depto",I.Porcentaje
from
(Select G.ID_Zona,G.Pais,G."Depto",Round(((G.Votos*100)/H.Total),2) as Porcentaje
from
(Select F.ID_Zona,F.pais,E."Depto",E.Votos
from
(Select D.Pais,C."Depto",C.Votos
from
(Select B.region,B.Nombre as "Depto",A.Votos
from
(Select Id_Departamento,Sexo,Sum( Votos) As Votos
from detalle_depto_etnia Where Sexo='mujeres'
Group by(Id_Departamento,Sexo))A,
(Select ID_Departamento,Nombre,region from Departamento)B
Where A.ID_Departamento=B.ID_Departamento)C,
(Select Id_Region,Pais from Region)D
Where C.Region=D.Id_Region)E,
(Select ID_Zona,Pais from Zona)F
Where E.Pais=F.Pais)G,
(Select ID_Zona,Sum(Votos) as Total from Detalle_etnia 
Where Sexo='mujeres' Group by(Id_Zona))H
Where G.ID_Zona=H.ID_Zona)I,
(Select Id_Pais,Nombre from Pais)J
Where I.Pais=J.Id_Pais

--Consulta 4
Select G.Nombre As "Pais Mas Analfabetas" from
(Select E.Pais from
(Select C.Id_Zona from
(Select A.Id_Zona,A.Analfabetos,((Analfabetos*100)/B.Votos) as Porcentaje from
(Select Id_Zona,SUM(Analfabetos)as Analfabetos from detalle_alfabetismo Group By(id_zona))A,
(Select ID_Zona,Sum(Votos)as Votos from detalle_etnia Group By(ID_Zona))B
Where A.ID_Zona=B.ID_Zona
ORder by Porcentaje Desc)C
Where rownum=1)D,
(Select ID_Zona,Pais from Zona)E
Where D.Id_Zona=E.ID_Zona)F,
(Select ID_Pais,Nombre from Pais)G
Where F.Pais=G.ID_Pais;

--Consulta 5
Select M.Nombre as Pais,L.Nombre_Partido,L.Maximo as "Maximo Alcaldias"
from
(Select K.Pais,J.Nombre_Partido,J.Maximo
from
(Select H.ID_Zona,I.Nombre_Partido,H.Maximo
from
(Select  F.ID_Zona,G.ID_Partido,F.Maximo
from
(Select E.ID_Zona,Max(D.Alcaldias) AS Maximo
from
(Select C.ID_Partido, Count(C.ID_Partido) As Alcaldias
from
(Select A.ID_Municipio,B.ID_Partido
from
(Select ID_Municipio,Max(Votos) as Votos
from
(Select ID_Municipio,ID_Partido,SUm(Votos) As Votos
from detalle_municipio_etnia Group By(ID_Municipio,ID_Partido))
Group by(ID_Municipio))A,
(Select ID_Municipio,ID_Partido,SUm(Votos) As Votos
from detalle_municipio_etnia Group By(ID_Municipio,ID_Partido))B
Where A.Votos=B.Votos And A.ID_Municipio=B.ID_Municipio)C
Group By(C.ID_Partido))D,
(Select distinct ID_Zona,ID_Partido from Detalle_etnia)E
Where D.ID_Partido=E.ID_Partido
Group by(E.ID_Zona))F,
(Select C.ID_Partido, Count(C.ID_Partido) As Alcaldias
from
(Select A.ID_Municipio,B.ID_Partido
from
(Select ID_Municipio,Max(Votos) as Votos
from
(Select ID_Municipio,ID_Partido,SUm(Votos) As Votos
from detalle_municipio_etnia Group By(ID_Municipio,ID_Partido))
Group by(ID_Municipio))A,
(Select ID_Municipio,ID_Partido,SUm(Votos) As Votos
from detalle_municipio_etnia Group By(ID_Municipio,ID_Partido))B
Where A.Votos=B.Votos And A.ID_Municipio=B.ID_Municipio)C
Group By(C.ID_Partido))G
Where F.Maximo=G.Alcaldias)H,
(Select ID_Partido,Nombre_Partido from Partido)I
Where H.ID_Partido=I.ID_Partido)J,
(Select ID_Zona,Pais from Zona)K
Where J.ID_Zona=k.ID_Zona)L,
(Select Id_Pais,Nombre from Pais)M
Where L.Pais=M.Id_Pais;

--Consulta 6
Select G.NOmbre as Pais,F.Nombre as "Region mas Indigenas"
from
(Select E.Pais,E.Nombre
from
(Select B.Id_region,B.MAximo
from
(Select A.Id_region,Max(A.Total) as MAximo
from
(Select Id_region,Etnia,Sum(Votos)as Total from detalle_region_etnia 
Group by(Id_region,Etnia)
Order by Id_region , Etnia)A
Group by (A.Id_region))B,
(Select Id_region,Etnia,Sum(Votos)as Total from detalle_region_etnia 
Where Etnia=2 Group by(Id_region,Etnia))C
Where C.Total=B.MAximo)D,
(Select Id_region,Nombre,Pais from Region)E
Where D.Id_region=E.Id_region)F,
(Select ID_Pais,Nombre from Pais)G
Where F.Pais=G.ID_Pais;

--Consulta 7
Select D.ID_Departamento,D.HOmbres,D.Mujeres
from
(Select C.ID_Departamento,B.HOmbres,C.Mujeres
from
(Select A.ID_Departamento,Round(((A.Votos*100)/B.Votos),2) as Hombres
from
(Select ID_Departamento,Sexo,Sum(Universitarios) as Votos
from detalle_escolaridad_depto Group by (ID_Departamento,Sexo))A,
(Select ID_Departamento,Sum(Universitarios) as Votos
from detalle_escolaridad_depto Group by (ID_Departamento))B
Where A.ID_Departamento=B.ID_Departamento and A.Sexo='hombres')B,
(Select A.ID_Departamento,Round(((A.Votos*100)/B.Votos),2) as Mujeres
from
(Select ID_Departamento,Sexo,Sum(Universitarios) as Votos
from detalle_escolaridad_depto Group by (ID_Departamento,Sexo))A,
(Select ID_Departamento,Sum(Universitarios) as Votos
from detalle_escolaridad_depto Group by (ID_Departamento))B
Where A.ID_Departamento=B.ID_Departamento and A.Sexo='mujeres')C
WHere B.ID_Departamento=C.ID_Departamento)D
Where D.Mujeres>D.Hombres;

--Consulta 8
Select B.Nombre,A.Votos
from
(Select Id_Departamento,Sum(votos)as Votos from detalle_depto_etnia
Where Id_Departamento in
(Select Id_Departamento from Departamento
Where region in
(Select ID_region from Region
Where Pais in
(Select Id_Pais from Pais
Where Nombre='GUATEMALA')))
Group by (Id_Departamento))A,
(Select Id_Departamento,Nombre from Departamento)B
Where A.Id_Departamento=B.Id_Departamento
And A.Votos>(Select C.Votos As "VG"
from
(Select B.Nombre,A.Votos
from
(Select Id_Departamento,Sum(votos)as Votos from detalle_depto_etnia
Where Id_Departamento in
(Select Id_Departamento from Departamento
Where region in
(Select ID_region from Region
Where Pais in
(Select Id_Pais from Pais
Where Nombre='GUATEMALA')))
Group by (Id_Departamento))A,
(Select Id_Departamento,Nombre from Departamento)B
Where A.Id_Departamento=B.Id_Departamento)C
Where C.Nombre='Guatemala');

--consulta 9
Select I.Nombre as Pais,H.Region,H.Promedio As "Promedio Departamento"
from
(Select G.Pais,G.Nombre as Region,F.Promedio
from
(Select D.Region,Round((E.Total/D.Departamentos),0) as Promedio
from
(Select C.Region,Count(C.Region) as Departamentos
from
(Select B.Region,A.ID_Departamento,A.Votos
from
(Select Id_Departamento,SUM(Votos) as Votos
From detalle_depto_etnia Group by(id_departamento))A,
(Select ID_Departamento,Region from Departamento)B
Where B.ID_Departamento=A.ID_Departamento)C
Group by(C.Region))D,
(Select C.Region,SUM(C.Votos) as Total
from
(Select B.Region,A.ID_Departamento,A.Votos
from
(Select Id_Departamento,SUM(Votos) as Votos
From detalle_depto_etnia Group by(id_departamento))A,
(Select ID_Departamento,Region from Departamento)B
Where B.ID_Departamento=A.ID_Departamento)C
Group by(C.Region))E
Where D.Region=E.Region)F,
(Select ID_region,Pais,NOmbre from Region)G
Where F.region=G.ID_region)H,
(Select ID_Pais,Nombre from Pais)I
Where H.Pais=I.ID_Pais;

--Consulta 10
Select D.Inicial as "Inicial Municipio",Sum(D.votos)as Total
from
(Select substr(C.Municipio,1,1) As Inicial,C.Votos
from
(Select B.Nombre as Municipio,A.Votos
from
(Select ID_Municipio,SUM(Votos) As Votos
from detalle_municipio_etnia Group by(id_municipio))A,
(Select ID_Municipio,Nombre from Municipio)B
Where A.ID_Municipio=B.ID_Municipio)C)D
Group by(D.Inicial);

--Consulta 12
Select D.Nombre,C.Primaria,C.Nivel_Medio,C.Universitarios
from
(Select B.Pais,A.Primaria,A.Nivel_Medio,A.Universitarios
from
(Select ID_Zona,Sum(Primaria)As Primaria,SUM(Nivel_Medio)as Nivel_Medio,Sum(Universitarios) as Universitarios
from Detalle_Escolaridad Group by(ID_Zona))A,
(Select Id_Zona,Pais from Zona)B
Where B.ID_Zona=A.ID_Zona)C,
(Select Id_Pais,Nombre from Pais)D
Where D.Id_Pais=C.Pais;

--Consulta 13
Select H.Nombre as Pais,G.Etnia,G.Porcentaje
from
(Select F.Pais,E.Etnia,E.Porcentaje
from
(Select C.Id_Zona,D.Nombre as Etnia,C.Porcentaje
from
(Select A.Id_Zona,A.Etnia,Round(((A.Votos*100)/B.Total),2) as Porcentaje
from
(Select Id_Zona,Etnia,SUM(Votos) as Votos from detalle_etnia
Group by(Id_Zona,Etnia))A,
(Select Id_Zona,SUM(Votos) as Total from detalle_etnia
Group by(Id_Zona))B
Where A.Id_Zona=B.Id_Zona)C,
(Select ID_Etnia,Nombre from Etnia)D
Where D.ID_Etnia=C.Etnia)E,
(Select ID_Zona,Pais From Zona)F
Where E.ID_Zona=F.ID_Zona)G,
(Select ID_Pais,Nombre from Pais)H
Where H.ID_Pais=G.Pais;

--Consulta 14
Select D.Nombre as Pais from
(Select B.Pais,A.Diferencia
from
(Select ID_Zona,Diferencia
from
(Select B.ID_Zona,(B.Maximo-C.Minimo) as Diferencia
from
(Select A.ID_Zona,Max(A.Votos) as Maximo
from
(Select ID_Zona,Id_Partido,SUM(Votos) as Votos
from Detalle_Etnia Group by (ID_Zona,Id_Partido))A
Group by (A.ID_Zona))B,
(Select A.ID_Zona,Min(A.Votos) as Minimo
from
(Select ID_Zona,Id_Partido,SUM(Votos) as Votos
from Detalle_Etnia Group by (ID_Zona,Id_Partido))A
Group by (A.ID_Zona))C
Where B.ID_Zona=C.ID_Zona
Order by Diferencia)
Where rownum=1)A,
(Select ID_Zona,Pais from Zona)B
Where A.ID_Zona=B.ID_Zona)C,
(Select ID_Pais,NOmbre from Pais)D
Where D.ID_Pais=C.Pais;


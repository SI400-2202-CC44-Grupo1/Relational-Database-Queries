/*1. Retorna la cantidad de reseñas de un hotel*/

CREATE PROCEDURE ReseñasPorHotel @NombreHotel varchar(50)
AS
BEGIN
    SELECT Hotel.Nombre, COUNT(Resena.ID) AS 'Numero de Reseñas'
    FROM Hotel
    INNER JOIN Resena ON Hotel.ID = Resena.Hotel_ID
    WHERE Hotel.Nombre = @NombreHotel
    GROUP BY Hotel.Nombre
    ORDER BY COUNT(Resena.ID) DESC
END

/*2. Retorta el número de habitaciones de un hotel*/

/*3. Retorna el comprobante de la reserva*/

/*informacion*/

insert into Pais (ID, Nombre) values (1,'Peru')

insert into Ciudad (ID, Nombre, Pais_ID) values (1,'Lima',1)

insert into Hotel (ID, Nombre, Direccion, Telefono, Ciudad_ID) values (1,'Hotel Don Bolivar','Av. La Paz','984721179',1)

insert into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(1,74744203,'Walter','Delgado','wdelgado@gmail.com',18,'Masculino','996944981','walter123',1)
insert into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(2,45856257,'Luisa','Andrade','Landrade@gmail.com',19,'Masculino','985784125','Andrade123',1)
insert into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(3,12546357,'Andres','Peñaloza','Apeña@gmail.com',20,'Masculino','986578425','Andrade123',1)
insert into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(4,85796458,'Miguel','Escudero','Mescudero@gmail.com',21,'Masculino','963582741','Andrade123',1)
insert into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(5,89658724,'Lucas','Silva','Lsilva@gmail.com',48,'Masculino','985746321','Andrade123',1)

insert into Resena(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (1,'Excelente atención',5,1,1)
insert into Resena(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (2,'Buena locacion',5,1,2)
insert into Resena(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (3,'El buffet fue bueno pero...',4,1,3)
insert into Resena(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (4,'Los trabajadores son muy amables',4,1,4)
insert into Resena(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (5,'Hubo un problema con mi reserva...',3,1,5)


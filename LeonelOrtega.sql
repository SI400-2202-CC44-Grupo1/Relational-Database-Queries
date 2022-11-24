--01 Obtener el numero de usuario que son clientes
create function f_usuarios_que_son_clientes() returns int
    begin
        declare @quantity int
        select @quantity= count(U.ID)
        from Usuario U
            join Cliente C on U.ID = C.Usuario_ID
        where U.ID=C.Usuario_ID
        return @quantity
    end

print dbo.f_usuarios_que_son_clientes()

--Listar los nombres de los usuarios que hicieron una reserva en una determinada fecha

create function f_usuarios_reserva_pr_fecha(@fecha date)
returns table
    return
    select distinct U.Apellido+','+ U.Nombre as FullName
    from Usuario U
        join Cliente C on U.ID = C.Usuario_ID
        join Reserva R2 on C.ID = R2.Cliente_ID
    where Reserva_date=@fecha
select*from dbo.f_usuarios_reserva_pr_fecha('2022-11-10')


--Funcion que retorne la puntuacion promedio de un hotel segun reseña

create function f_puntuacion_promedio_hotel_por_reseña(@NombreHotel varchar(50)) returns int
    begin
        declare @Quantity int
        select @Quantity = avg(Puntuacion)
        from Reseña
        join Hotel H on Reseña.Hotel_ID = H.ID
        where Nombre=@NombreHotel
        return @Quantity
    end
print dbo.f_puntuacion_promedio_hotel_por_reseña('Hotel Once')
--Datos para las pruebas


--Datos 

insert into Pais (ID, Nombre) values (1,'Peru')
insert into Pais (ID, Nombre) values (2,'Chile')
insert into Pais (ID, Nombre) values (3,'Colombia')
insert into Pais (ID, Nombre) values (4,'Australia')
insert into Pais (ID, Nombre) values (5,'Argentina')

insert into Ciudad (ID, Nombre, Pais_ID) values (1,'Lima',1)
insert into Ciudad (ID, Nombre, Pais_ID) values (2,'Ayacucho',1)
insert into Ciudad (ID, Nombre, Pais_ID) values (3,'Tarapoto',1)
insert into Ciudad (ID, Nombre, Pais_ID) values (4,'Arequipa',1)
insert into Ciudad (ID, Nombre, Pais_ID) values (5,'Chiclayo',1)

INSERT into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(1,74744203,'Leonel','Delgado','wdelgado@gmail.com',18,'Masculino','996944981','walter123',1)
INSERT into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(2,45856257,'Maria','Andrade','Landrade@gmail.com',19,'Masculino','985784125','Andrade123',2)
INSERT into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(3,12546357,'Andres','Peñaloza','Apeña@gmail.com',20,'Masculino','986578425','Andrade123',5)
INSERT into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(4,85796458,'Samantha','Escudero','Mescudero@gmail.com',21,'Masculino','963582741','Andrade123',4)
INSERT into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(5,89658724,'Lucas','Silva','Lsilva@gmail.com',48,'Masculino','985746321','Andrade123',3)
INSERT into Usuario(ID, DNI, Nombre, Apellido, Email, Edad, Genero, Telefono, Password, Ciudad_ID) values(6,96857458,'Patricio','Enciso','Menciso@gmail.com',38,'Masculino','985764521','Andrade123',1)

insert into Cliente (ID, DNI, Nombre, Usuario_ID) values (1,'74744203','Walter',1)
insert into Cliente (ID, DNI, Nombre, Usuario_ID) values (2,'45856257','Luisa', 2)
insert into Cliente (ID, DNI, Nombre, Usuario_ID) values (3,'12546357','Andres',3)
insert into Cliente (ID, DNI, Nombre, Usuario_ID) values (4,'85796458','Miguel',4)
insert into Cliente (ID, DNI, Nombre, Usuario_ID) values (5,'89658724','Lucas',5)

insert into Hotel (ID, Nombre, Direccion, Telefono, Ciudad_ID) values (1,'Hotel Pachacutec','Avenida Carlitos','999999999',1)
insert into Hotel (ID, Nombre, Direccion, Telefono, Ciudad_ID) values (2,'Hotel Once','Avenida Doble','999999999',2)
insert into Hotel (ID, Nombre, Direccion, Telefono, Ciudad_ID) values (3,'Hotel CherryUp','Avenida Minatozaki','999999999',3)
insert into Hotel (ID, Nombre, Direccion, Telefono, Ciudad_ID) values (4,'Hotel The Feels','Avenida Los cristos','999999999',4)
insert into Hotel (ID, Nombre, Direccion, Telefono, Ciudad_ID) values (5,'Hotel Hirai Momo','Avenida Andropecuante','999999999',5)

Insert into Reseña(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (1,'Me parece uno de los mejores.....',5,1,1)
Insert into Reseña(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (2,'Mi estadia fue placentera.....',5,2,1)
Insert into Reseña(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (3,'Una de las mejores experiencias.....',5,3,2)
Insert into Reseña(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (4,'Me agradó el amibnete.....',5,2,2)
Insert into Reseña(ID, Comentario, Puntuacion, Hotel_ID, Usuario_ID) values (5,'Fue una hermosa experiencia.....',5,1,1)

insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, Estado, Hotel_ID) VALUES (1,'Personal',1,1,1,60.00,1,'Reservado',1)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, Estado, Hotel_ID) VALUES (2,'Personal',1,1,1,80.00,1,'Reservado',2)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, Estado, Hotel_ID) VALUES (3,'Personal',1,1,1,50.00,1,'Reservado',3)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, Estado, Hotel_ID) VALUES (4,'Personal',1,1,1,70.00,1,'Reservado',4)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, Estado, Hotel_ID) VALUES (5,'Personal',1,1,1,100.00,1,'Reservado',5)

insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (1,'2022-11-10','2022-11-15','2022-11-20',60.00,1,2,1)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (2,'2022-11-10','2022-11-15','2022-11-20',80.00,2,2,2)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (3,'2022-11-10','2022-11-15','2022-11-20',50.00,3,2,3)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (4,'2022-11-10','2022-11-15','2022-11-20',70.00,4,2,4)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (5,'2022-11-10','2022-11-15','2022-11-20',100.00,5,2,5)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (6,'2022-11-10','2022-11-15','2022-11-20',100.00,5,2,5)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo, Habitacion_ID, Estado, Cliente_ID) VALUES (7,'2023-11-10','2023-11-15','2023-11-20',100.00,5,2,1)
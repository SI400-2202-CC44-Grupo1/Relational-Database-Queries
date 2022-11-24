-- QUERIES

-- Querie #1 -> Obtener la cantidad de servicios de cada id hotel.
select count(Hotel_ID), Hotel_ID
from Servicios
group by Hotel_ID;

-- Querie #2 -> Funcion que retorne el metodo de pago usado segun el id del comprobante.
create function f_metodo_de_pago_por_comprobante_id(@id int) returns varchar(50)
    begin declare @metodo varchar(50)
    select @metodo = TipoM from Metodo_Pago join Reserva on Metodo_Pago.ID = Reserva.Cliente_ID
join Comprobante on Reserva.ID = Comprobante.Reserva_ID
where Comprobante.ID = @id
    return @metodo
    end;

print dbo.f_metodo_de_pago_por_comprobante_id(1);

-- Querie #3 -> Obtener el estado de la habitacion segun el id de la reserva.
create function f_estado_habitacion_por_reserva_id(@id int) returns varchar(50)
    begin declare @estado varchar(50)
    select @estado = EstadoM from Habitacion join Reserva on Habitacion.Hotel_ID=Reserva.Habitacion_ID
    where Reserva.ID = @id
    return @estado
    end;

print dbo.f_estado_habitacion_por_reserva_id(1);

--Datos insertados para ejecutar el Querie #1
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (1,'Entrenamiento',40.00,1)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (1,'Trabajo',40.00,1)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (1,'Gimnasio',40.00,1)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (2,'Entrenamiento',60.00,2)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (2,'Trabajo',50.00,2)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (2,'Gimnasio',80.00,2)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (2,'Piscina',90.00,2)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (3,'Entrenamiento',70.00,3)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (3,'Evento',95.00,3)
insert into Servicios (ID, Tipo, Precio, Hotel_ID) values (4,'Gimnasio',40.00,4)
select * from Servicios

--Datos insertados para ejecutar el Querie #2
insert into Comprobante (ID, Monto, Fecha,Estado, Reserva_ID,Tipo) values (1,50.00,'2022-11-10','Disponible',1,'Boleta')
insert into Comprobante (ID, Monto, Fecha,Estado, Reserva_ID,Tipo) values (2,70.00,'2022-11-12','Ocupado',1,'Factura')
insert into Comprobante (ID, Monto, Fecha,Estado, Reserva_ID,Tipo) values (3,90.00,'2022-11-14','Reservado',1,'Boleta')
insert into Comprobante (ID, Monto, Fecha,Estado, Reserva_ID,Tipo) values (4,110.00,'2022-11-16','Pagado',1,'Factura')
insert into Comprobante (ID, Monto, Fecha,Estado, Reserva_ID,Tipo) values (5,130.00,'2022-11-18','Reservado',1,'Boleta')
select * from Comprobante

insert into Metodo_Pago (ID, Reserva_ID,TipoM) values (1,1,'Efectivo')
insert into Metodo_Pago (ID, Reserva_ID,TipoM) values (2,2,'Tarjeta_Debito')
insert into Metodo_Pago (ID, Reserva_ID,TipoM) values (3,3,'Tarjeta_Credito')
insert into Metodo_Pago (ID, Reserva_ID,TipoM) values (4,4,'Tarjeta_Debito')
insert into Metodo_Pago (ID, Reserva_ID,TipoM) values (5,5,'Efectivo')
select * from Metodo_Pago

--Datos insertados para ejecutar el Querie #3
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, EstadoM, Hotel_ID) values (1,'Matrimonial',1,true,true,100.00,2,'Disponible',1)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, EstadoM, Hotel_ID) values (2,'Suite',1,true,true,120.00,2,'Ocupado',2)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, EstadoM, Hotel_ID) values (3,'Standard',1,true,true,50.00,2,'Reservado',3)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, EstadoM, Hotel_ID) values (4,'Triple',3,true,true,140.00,2,'Disponible',4)
insert into Habitacion (ID, Tipo, nCamas, TV, Wifi, Costo, Capacidad, EstadoM, Hotel_ID) values (5,'Suite',1,true,true,110.00,2,'Ocupado',5)
select * from Habitacion

insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo,Pedido_Especial , Habitacion_ID, Estado, Cliente_ID) values (1,'2022-12-20','2022-12-15','2022-12-25',60.00,'Almuerzo',1,'Pendiente',1)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo,Pedido_Especial , Habitacion_ID, Estado, Cliente_ID) values (2,'2022-12-20','2022-12-16','2022-12-26',80.00,'Jacuzzi',2,'Anulado',2)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo,Pedido_Especial , Habitacion_ID, Estado, Cliente_ID) values (3,'2022-12-20','2022-12-17','2022-12-27',50.00,'Aire acondicionado',3,'Pagado',3)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo,Pedido_Especial , Habitacion_ID, Estado, Cliente_ID) values (4,'2022-12-20','2022-12-18','2022-12-28',70.00,'Whisky',4,'Pagado',4)
insert into Reserva (ID, Reserva_date, Llegada_date, Salida_date, Costo,Pedido_Especial , Habitacion_ID, Estado, Cliente_ID) values (5,'2022-12-20','2022-12-19','2022-12-29',100.00,'Vista a la calle',5,'Pagado',5)
select * from Reserva


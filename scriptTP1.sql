
use negocioWebRopa;

SELECT * 
  FROM information_schema.ROUTINES
 WHERE ROUTINE_TYPE = 'PROCEDURE' and ROUTINE_SCHEMA = 'negocioWebRopa';

drop procedure if exists SP_Articulos_Insert_Min;
drop procedure if exists SP_Articulos_Insert_Full;
drop procedure if exists SP_Articulos_Delete;
drop procedure if exists SP_Articulos_Update;
drop procedure if exists SP_Articulos_All;
drop procedure if exists SP_Articulos_Reponer;
drop procedure if exists SP_Facturas_Insert;
drop procedure if exists SP_Facturas_Delete;
drop procedure if exists SP_Facturas_Update;
drop procedure if exists SP_Facturas_All;
drop procedure if exists SP_Facturas_AgregarDetalle;
drop procedure if exists SP_Detalles_Delete;
drop procedure if exists SP_Detalles_All;







DELIMITER //

create procedure SP_Articulos_Insert_Min (in Pdescripcion varchar(20), Ptipo varchar(20))
	begin
		insert into articulos (descripcion,tipo) values (Pdescripcion ,Ptipo);
	end
//

DELIMITER ;

CALL SP_Articulos_Insert_Min("pantalonprueba", "ROPA"); 

SELECT * from articulos ;




delimiter //
create procedure SP_Articulos_Insert_Full (in Pdescripcion varchar(20), Ptipo varchar(20), Pcolor varchar(20),
Ptalle varchar(20),Pstock int, Pstockmin int, Pstockmax int, Pcosto int, Pprecio double, Ptemporada varchar(20) )
begin
	insert into articulos (descripcion,tipo, color, talle_num, stock,stockMin, stockMax,costo, precio, temporada) 
	values (Pdescripcion ,Ptipo, Pcolor, Ptalle,Pstock, Pstockmin, Pstockmax, Pcosto, Pprecio, Ptemporada);
end
// 
delimiter ;

call SP_Articulos_Insert_Full ("pruebafull","ROPA","rojo","L",200,20,300,120,150,"VERANO");


SELECT * from articulos ;





delimiter //
create procedure SP_Articulos_Delete (in Pid int)
begin
	delete from articulos where id=Pid;
end
// 
delimiter ;

 

SELECT * from articulos ;

call SP_Articulos_Delete (10);




SELECT * from articulos;


delimiter //
create procedure SP_Articulos_Update (in Pid int, Pprecio double)
begin
	update articulos set precio = Pprecio where id=Pid;
end
// 
delimiter ;


call SP_Articulos_Update (12,1300);







delimiter //
create procedure SP_Articulos_All ()
begin
	select * from articulos;
end
// 
delimiter ;


call SP_Articulos_All(); 






select * from articulos;

delimiter //
create procedure SP_Articulos_Reponer (in Pid int, Pstock int)
begin
	update articulos set stock = stock + Pstock where id=Pid;
end
// 
delimiter ;

call SP_Articulos_Reponer(1, 10);






delimiter //
create procedure SP_Facturas_Insert (in Pletra varchar(20),Pnumero int, Pfecha date,Pmediopago varchar(20),Pidcliente int  )
begin
	insert into facturas (letra,numero,fecha,medioDePago,idCliente) values
	(Pletra,Pnumero, Pfecha, Pmediopago, Pidcliente);
end
// 
delimiter ;

delete from facturas where letra ="A" and numero = 10;
select * from facturas;
CALL SP_Facturas_Insert ("A",10,curdate(),"EFECTIVO",2);







delimiter //
CREATE procedure SP_Facturas_Delete(in Pid int)
begin
	delete from facturas where id = Pid;
end
//
delimiter ;

select * from facturas;


call SP_Facturas_Delete (4);




delimiter //
create procedure SP_Facturas_Update(in Pid int, Pmediodepago varchar(20))
begin
	update facturas set medioDePago = Pmediodepago where id = Pid;
end
//
delimiter ;

call SP_Facturas_Update (4,"TARJETA");

SELECT  * from facturas;
DELETE from facturas where letra="A" and numero = 6;
call SP_Facturas_Insert ("A",6,curdate(),"EFECTIVO",1);




DELIMITER //
create procedure SP_Facturas_All()
begin
	select * from facturas;
end
//
delimiter ;



call SP_Facturas_All();




delimiter //
create procedure SP_Detalles_All()
begin
	SELECT * from detalles;
end
//
delimiter ;

call SP_Detalles_All();








delimiter //
create procedure SP_Detalles_Delete(in Pid int)
begin
	delete from detalles where id = Pid;
end
//
delimiter ;

SELECT * from detalles;

call SP_Detalles_Delete (1);





delimiter //
create procedure SP_Facturas_AgregarDetalle(in PidArticulo int, PidFactura int, Pprecio int, Pcantidad int)
begin
	INSERT into detalles (idArticulo,idFactura,precio,cantidad) values (PidArticulo,PidFactura, Pprecio, Pcantidad);
end
//
delimiter ;


SELECT * from detalles;
delete from detalles where idArticulo = 2 and idFactura = 1;

call SP_Facturas_AgregarDetalle (2,1,100,2);



use negocioWebRopa;

drop trigger if exists TR_Articulos_Insert;

delimiter //
create trigger TR_Articulos_Insert
	after insert on articulos
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro)
        values ('articulos','insert',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;



drop trigger if exists TR_Articulos_Delete;

delimiter //
create trigger TR_Articulos_Delete
	after delete on articulos
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro) 
        values ('articulos','delete',curdate(),curtime(),current_user(),OLD.id);
    end;
// delimiter ;



drop trigger if exists TR_Articulos_Update;

delimiter //
create trigger TR_Articulos_Update
	after update on articulos
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro)
        values ('articulos','update',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;

drop trigger if exists TR_Facturas_Insert;

delimiter //
create trigger TR_Facturas_Insert
	after insert on facturas
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro)
        values ('facturas','insert',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;


    
    drop trigger if exists TR_Facturas_Update;

delimiter //
create trigger TR_Facturas_Update
	after update on facturas
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro)
        values ('facturas','update',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;

drop trigger if exists TR_Facturas_Delete;

delimiter //
create trigger TR_Facturas_Delete
	after delete on facturas
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro) 
        values ('facturas','delete',curdate(),curtime(),current_user(),OLD.id);
    end;
// delimiter ;


drop trigger if exists TR_Detalles_Insert;

delimiter //
create trigger TR_Detalles_Insert
	after insert on detalles
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro)
        values ('detalles','insert',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;



drop trigger if exists TR_Detalles_Update;

delimiter //
create trigger TR_Detalles_Update
	after update on detalles
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro)
        values ('detalles','update',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;

drop trigger if exists TR_Detalles_Delete;

delimiter //
create trigger TR_Detalles_Delete
	after delete on detalles
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro) 
        values ('detalles','delete',curdate(),curtime(),current_user(),OLD.id);
    end;
// delimiter ;


select * from control;
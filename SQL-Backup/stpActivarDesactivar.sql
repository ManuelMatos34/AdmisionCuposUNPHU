

create PROCEDURE STPactivardesactivar(@varID int)
AS
begin

declare @varEstatus varchar(10);
set @varEstatus = (Select Estatus from PosiblesCupos where Id = @varID);

if (@varEstatus) ='A'
begin
	UPDATE PosiblesCupos SET Estatus = 'I' where Id = @varID;
	declare @var varchar(12);
	set @var =(select max(Id) from Estudiantes_Secciones where Id_PosiblesCupos = @varid);
	UPDATE Estudiantes_Secciones SET Estatus = 'I' Where  Id = @var;
END

ELSE
BEGIN
    UPDATE PosiblesCupos SET Estatus = 'A' where Id = @varID;
	declare @var1 varchar(12);
	set @var1 =(select max(Id) from Estudiantes_Secciones where Id_PosiblesCupos = @varid);
	UPDATE Estudiantes_Secciones SET Estatus = 'A' Where  Id = @var1;
END

select * from Estudiantes_Secciones;
select * from PosiblesCupos;
select * from EstudianteNuevosArchivos

end




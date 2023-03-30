
alter PROCEDURE STPActivoInactivo(@varID int, @VarEmail varchar(30))
AS
begin

declare @varEstatus varchar(10);
set @varEstatus = (SELECT Estatus from EstudianteNuevosArchivos where id = @varID);

if (@varEstatus) ='A'
begin
	UPDATE EstudianteNuevosArchivos SET Estatus = 'I' Where Id = @varID;
	UPDATE EstudiantesNuevos SET Estatus = 'I' Where  Email = @VarEmail;
END
ELSE
BEGIN
	UPDATE EstudianteNuevosArchivos SET Estatus = 'A' Where Id = @varID;
	UPDATE EstudiantesNuevos SET Estatus = 'A' Where  Email = @VarEmail;
END

select * from EstudianteNuevosArchivos;
select * from EstudiantesNuevos;

end
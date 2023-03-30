alter PROCEDURE STPUnirse(@matricula varchar(15), @materia int, @ERROR varchar(100) OUT)
AS
begin

declare @Id int = (SELECT Id From Usuarios WHERE Matricula = @matricula);

IF (SELECT MAX(Id_PosiblesCupos) From Estudiantes_Secciones WHERE Id_Estudiante = @Id and Id_PosiblesCupos = @materia) is null
BEGIN
INSERT INTO Estudiantes_Secciones (Id_Estudiante, Id_PosiblesCupos)
	select a.Id_Estudiante , b.Id_PosiblesCupos from
		(select [Id] as Id_Estudiante from [dbo].[Usuarios] where [Matricula]= @matricula) as A
			cross join
		(select [Id] as Id_PosiblesCupos from [dbo].[PosiblesCupos] where [Id] = @materia ) as b

    declare @varCantidadsesion int = (SELECT COUNT(Id_Estudiante) FROM Estudiantes_Secciones WHERE Id_PosiblesCupos = @materia);
	UPDATE PosiblesCupos SET Cantidad = @varCantidadsesion Where Id = @materia;

	set @ERROR = 'C';
END

ELSE
BEGIN

    set @ERROR = 'E'

end
end






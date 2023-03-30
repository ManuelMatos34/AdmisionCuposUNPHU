

alter PROCEDURE STPUnirProfe(@Profesor varchar(15), @IdAsignatura varchar(50))
AS
begin

declare @varIDprofesor int =(SELECT Id FROM Profesores where Nombre = @Profesor);

UPDATE Estudiantes_Secciones SET Id_Profesor= @varIDprofesor WHERE Id_PosiblesCupos=@IdAsignatura;

END;

-- STPUnirProfe 'Pavlusha', 1066

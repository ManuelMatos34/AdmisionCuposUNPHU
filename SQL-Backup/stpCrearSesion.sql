--STPcrearsesion 'LABORATORIO DE ELECTRONICA I','Sabado 8:00AM', 'ma19-2323'
--declare @varAsignatura varchar(50) = 'CIRCUITOS LOGICOS';
--declare @varHorario varchar(255) = 'lunes y miercoles';
--declare @matricula varchar(15)

alter PROCEDURE STPcrearsesion(@varAsignatura varchar(50), @varHorario varchar(255), @matricula varchar(15),@ERROR varchar(100) OUT)
AS
begin

declare @varCodigo varchar(15);
set @varCodigo = (SELECT MAX(Codigo) from PosiblesCupos where Asignatura = @varAsignatura);

IF (@varCodigo) is null
BEGIN
    declare @varCod_asinatura varchar(15) = (SELECT Codigo from Asignaturas where Asignatura = @varAsignatura);
	declare @varC_asinatura varchar(15) = '-01';
	declare @Cod_asig_Final varchar(15) = (@varCod_asinatura+''+@varC_asinatura);

	declare @varCreditos varchar(2) = (Select Creditos from Asignaturas where asignatura = @varAsignatura);
	Insert into PosiblesCupos (Codigo, Asignatura, Horario, Estatus, Creditos, Cantidad) Values (@Cod_asig_Final, @varAsignatura, @varHorario, 'A', @varCreditos, 0);

	INSERT INTO Estudiantes_Secciones (Id_Estudiante, Id_PosiblesCupos, Id_Profesor)
	select a.Id_Estudiante , b.Id_PosiblesCupos, 3 As Id_Profesor from
		(select [Id] as Id_Estudiante from [dbo].[Usuarios] where [Matricula]= @matricula) as A
			cross join
		(select [Id] as Id_PosiblesCupos from [dbo].[PosiblesCupos] where Codigo = @Cod_asig_Final ) as b

    declare @varidSesion int = (select Id from PosiblesCupos where Codigo = @Cod_asig_Final);
    declare @varCantidadsesion int = (SELECT COUNT(Id_Estudiante) FROM Estudiantes_Secciones WHERE Id_PosiblesCupos = @varidSesion);
	UPDATE PosiblesCupos SET Cantidad = @varCantidadsesion Where Codigo = @Cod_asig_Final;
	INSERT INTO Estudiantes_Secciones(Estatus) VALUES('A');

	set @ERROR = @Cod_asig_Final;


END
ELSE
BEGIN
	declare @varSesion varchar(15) = (SELECT RIGHT((@varCodigo), 1)+1);
	declare @varExtraccion varchar(15) = (SELECT SUBSTRING(@varCodigo, 1, 9));
	declare @varExtraccionFinal varchar(15) = (@varExtraccion+''+@varSesion);

	declare @varCreditos2 varchar(2) = (Select Creditos from Asignaturas where asignatura = @varAsignatura);
    Insert into PosiblesCupos (Codigo, Asignatura, Horario, Estatus, Creditos, Cantidad) Values (@varExtraccionFinal, @varAsignatura, @varHorario, 'A', @varCreditos2, 0);

	INSERT INTO Estudiantes_Secciones (Id_Estudiante, Id_PosiblesCupos, Id_Profesor)
	select a.Id_Estudiante , b.Id_PosiblesCupos, 3 As Id_Profesor from
		(select [Id] as Id_Estudiante from [dbo].[Usuarios] where [Matricula]= @matricula) as A
			cross join
		(select [Id] as Id_PosiblesCupos from [dbo].[PosiblesCupos] where Codigo = @varExtraccionFinal ) as b

    declare @v_idSesion int = (select Id from PosiblesCupos where Codigo = @varExtraccionFinal);

    declare @v_Cantidadsesion int = (SELECT COUNT(Id_Estudiante) FROM Estudiantes_Secciones WHERE Id_PosiblesCupos = @v_idSesion);
	UPDATE PosiblesCupos SET Cantidad = @v_Cantidadsesion Where Codigo = @varExtraccionFinal;
	INSERT INTO Estudiantes_Secciones(Estatus) VALUES('A');

	set @ERROR = @varExtraccionFinal; 
END

select * from PosiblesCupos;
select * from Estudiantes_Secciones;

END

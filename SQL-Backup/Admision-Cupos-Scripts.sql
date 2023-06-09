USE [Admision-Cupos]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaturas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](15) NULL,
	[Asignatura] [varchar](50) NULL,
	[Id_Pensum] [int] NULL,
	[Creditos] [varchar](2) NULL,
	[HorasTeoricas] [varchar](2) NULL,
	[HorasPracticas] [varchar](2) NULL,
 CONSTRAINT [PK_Asignaturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstudianteNuevosArchivos]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstudianteNuevosArchivos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Archivo] [varbinary](max) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[EmailEstudiante] [varchar](50) NOT NULL,
	[Estatus] [varchar](1) NULL,
 CONSTRAINT [PK_EstudiantesNuevos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes_Secciones]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes_Secciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Estudiante] [int] NULL,
	[Id_PosiblesCupos] [int] NULL,
	[Estatus] [varchar](1) NULL,
	[Mensaje] [varchar](150) NULL,
	[Id_Profesor] [int] NULL,
 CONSTRAINT [PK_Estudiantes_Secciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstudiantesNuevos]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstudiantesNuevos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Estatus] [varchar](1) NULL,
 CONSTRAINT [PK_EstudiantesNuevos_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pensums]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pensums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Pensum] [varchar](50) NULL,
	[Estatus] [varchar](1) NULL,
 CONSTRAINT [PK_Pensums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosiblesCupos]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosiblesCupos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](10) NULL,
	[Asignatura] [varchar](50) NULL,
	[Horario] [varchar](255) NULL,
	[Estatus] [varchar](1) NULL,
	[Creditos] [varchar](2) NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK_PosiblesCupos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Asignatura] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Profesores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Matricula] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Estatus] [varchar](1) NULL,
	[Tipo] [varchar](15) NULL,
	[Email] [varchar](30) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Asignaturas_Pensums] FOREIGN KEY([Id_Pensum])
REFERENCES [dbo].[Pensums] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asignaturas] CHECK CONSTRAINT [FK_Asignaturas_Pensums]
GO
ALTER TABLE [dbo].[Estudiantes_Secciones]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Secciones_PosiblesCupos] FOREIGN KEY([Id_PosiblesCupos])
REFERENCES [dbo].[PosiblesCupos] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Estudiantes_Secciones] CHECK CONSTRAINT [FK_Estudiantes_Secciones_PosiblesCupos]
GO
ALTER TABLE [dbo].[Estudiantes_Secciones]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Secciones_Profesores] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesores] ([Id])
GO
ALTER TABLE [dbo].[Estudiantes_Secciones] CHECK CONSTRAINT [FK_Estudiantes_Secciones_Profesores]
GO
ALTER TABLE [dbo].[Estudiantes_Secciones]  WITH CHECK ADD  CONSTRAINT [FK_Estudiantes_Secciones_Usuarios] FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[Usuarios] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Estudiantes_Secciones] CHECK CONSTRAINT [FK_Estudiantes_Secciones_Usuarios]
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD  CONSTRAINT [FK_Profesores_Asignaturas] FOREIGN KEY([Asignatura])
REFERENCES [dbo].[Asignaturas] ([Id])
GO
ALTER TABLE [dbo].[Profesores] CHECK CONSTRAINT [FK_Profesores_Asignaturas]
GO
/****** Object:  StoredProcedure [dbo].[STPactivardesactivar]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[STPactivardesactivar](@varID int)
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

end
GO
/****** Object:  StoredProcedure [dbo].[STPActivoInactivo]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[STPActivoInactivo](@varID int, @VarEmail varchar(30))
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
GO
/****** Object:  StoredProcedure [dbo].[STPcrearsesion]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STPcrearsesion](@varAsignatura varchar(50), @varHorario varchar(255), @matricula varchar(15),@ERROR varchar(100) OUT)
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
GO
/****** Object:  StoredProcedure [dbo].[STPprueba]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STPprueba]
AS
begin

INSERT INTO Estudiantes_Secciones (Id_Estudiante, Id_PosiblesCupos)
	select a.Id_Estudiante , b.Id_PosiblesCupos from
		(select [Id] as Id_Estudiante from [dbo].[Usuarios] where [Matricula]='po12-8765') as A
			cross join
		(select [Id] as Id_PosiblesCupos from [dbo].[PosiblesCupos] where [Codigo] = 'INF-451-01' ) as b

end
GO
/****** Object:  StoredProcedure [dbo].[STPUnirProfe]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STPUnirProfe](@Profesor varchar(15), @IdAsignatura varchar(50))
AS
begin

declare @varIDprofesor int =(SELECT Id FROM Profesores where Nombre = @Profesor);

UPDATE Estudiantes_Secciones SET Id_Profesor= @varIDprofesor WHERE Id_PosiblesCupos=@IdAsignatura;

--INSERT INTO Estudiantes_Secciones (Id_Profesor) 
--select a.Id from Profesores a, Estudiantes_Secciones b, PosiblesCupos c
--Where a.Id = b.Id_Profesor
--and b.Id_PosiblesCupos = @IdAsignatura
--and a.Id = @varIDprofesor;
END;
GO
/****** Object:  StoredProcedure [dbo].[STPUnirse]    Script Date: 3/19/2023 10:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[STPUnirse](@matricula varchar(15), @materia int, @ERROR varchar(100) OUT)
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
GO

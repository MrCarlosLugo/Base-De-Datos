USE [Escuela]
GO
/****** Object:  StoredProcedure [dbo].[ProcMateriasLsti]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[ProcMateriasLsti]
GO
/****** Object:  StoredProcedure [dbo].[ProcMateriasLcc]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[ProcMateriasLcc]
GO
/****** Object:  StoredProcedure [dbo].[ProcDomicilioDocente]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[ProcDomicilioDocente]
GO
/****** Object:  StoredProcedure [dbo].[ProcDomicilioAlumno]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[ProcDomicilioAlumno]
GO
/****** Object:  StoredProcedure [dbo].[ListaDeAlumnos]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[ListaDeAlumnos]
GO
/****** Object:  StoredProcedure [dbo].[InfoMaterias]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[InfoMaterias]
GO
/****** Object:  StoredProcedure [dbo].[InfoMateriaproc]    Script Date: 29/10/2018 2:38:22 ******/
DROP PROCEDURE IF EXISTS [dbo].[InfoMateriaproc]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Municipio]') AND type in (N'U'))
ALTER TABLE [dbo].[Municipio] DROP CONSTRAINT IF EXISTS [FK_Municipio_Estado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]') AND type in (N'U'))
ALTER TABLE [dbo].[MateriaCarrera] DROP CONSTRAINT IF EXISTS [FK_MateriaCarrera_Materia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]') AND type in (N'U'))
ALTER TABLE [dbo].[MateriaCarrera] DROP CONSTRAINT IF EXISTS [FK_MateriaCarrera_Carrera]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Maestro]') AND type in (N'U'))
ALTER TABLE [dbo].[Maestro] DROP CONSTRAINT IF EXISTS [FK_Maestro_Direccion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listado]') AND type in (N'U'))
ALTER TABLE [dbo].[Listado] DROP CONSTRAINT IF EXISTS [FK_Listado_Clase]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listado]') AND type in (N'U'))
ALTER TABLE [dbo].[Listado] DROP CONSTRAINT IF EXISTS [FK_Listado_Alumno]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]') AND type in (N'U'))
ALTER TABLE [dbo].[HorarioDeClase] DROP CONSTRAINT IF EXISTS [FK_HorarioDeClase_Periodos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]') AND type in (N'U'))
ALTER TABLE [dbo].[HorarioDeClase] DROP CONSTRAINT IF EXISTS [FK_HorarioDeClase_Horario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]') AND type in (N'U'))
ALTER TABLE [dbo].[HorarioDeClase] DROP CONSTRAINT IF EXISTS [FK_HorarioDeClase_Clase]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT IF EXISTS [FK_Direccion_Colonia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Colonia]') AND type in (N'U'))
ALTER TABLE [dbo].[Colonia] DROP CONSTRAINT IF EXISTS [FK_Colonia_Municipio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clase]') AND type in (N'U'))
ALTER TABLE [dbo].[Clase] DROP CONSTRAINT IF EXISTS [FK_Clase_Salon]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clase]') AND type in (N'U'))
ALTER TABLE [dbo].[Clase] DROP CONSTRAINT IF EXISTS [FK_Clase_Periodos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clase]') AND type in (N'U'))
ALTER TABLE [dbo].[Clase] DROP CONSTRAINT IF EXISTS [FK_Clase_MateriaCarrera]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clase]') AND type in (N'U'))
ALTER TABLE [dbo].[Clase] DROP CONSTRAINT IF EXISTS [FK_Clase_Maestro]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumno]') AND type in (N'U'))
ALTER TABLE [dbo].[Alumno] DROP CONSTRAINT IF EXISTS [FK_Alumno_Direccion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumno]') AND type in (N'U'))
ALTER TABLE [dbo].[Alumno] DROP CONSTRAINT IF EXISTS [FK_Alumno_Carrera]
GO
/****** Object:  View [dbo].[ViewMateriasLcc]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[ViewMateriasLcc]
GO
/****** Object:  View [dbo].[ViewMateriasLsti]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[ViewMateriasLsti]
GO
/****** Object:  View [dbo].[InfoMateriasview]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[InfoMateriasview]
GO
/****** Object:  View [dbo].[ListaDeAlumnosView]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[ListaDeAlumnosView]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Horario]
GO
/****** Object:  Table [dbo].[HorarioDeClase]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[HorarioDeClase]
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Salon]
GO
/****** Object:  Table [dbo].[Clase]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Clase]
GO
/****** Object:  Table [dbo].[Listado]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Listado]
GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Periodos]
GO
/****** Object:  View [dbo].[MateriasLsti]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[MateriasLsti]
GO
/****** Object:  View [dbo].[InfoMateria]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[InfoMateria]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Materia]
GO
/****** Object:  Table [dbo].[MateriaCarrera]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[MateriaCarrera]
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Carrera]
GO
/****** Object:  View [dbo].[DomicilioDocente]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[DomicilioDocente]
GO
/****** Object:  View [dbo].[Domicilio]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[Domicilio]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Municipio]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Estado]
GO
/****** Object:  View [dbo].[DomicilioColonia]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[DomicilioColonia]
GO
/****** Object:  Table [dbo].[Colonia]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Colonia]
GO
/****** Object:  View [dbo].[DomicilioMaestro]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[DomicilioMaestro]
GO
/****** Object:  Table [dbo].[Maestro]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Maestro]
GO
/****** Object:  View [dbo].[DomicilioAlumno]    Script Date: 29/10/2018 2:38:22 ******/
DROP VIEW IF EXISTS [dbo].[DomicilioAlumno]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Direccion]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 29/10/2018 2:38:22 ******/
DROP TABLE IF EXISTS [dbo].[Alumno]
GO
USE [master]
GO
/****** Object:  Database [Escuela]    Script Date: 29/10/2018 2:38:22 ******/
DROP DATABASE IF EXISTS [Escuela]
GO
/****** Object:  Database [Escuela]    Script Date: 29/10/2018 2:38:22 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Escuela')
BEGIN
CREATE DATABASE [Escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Escuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Escuela.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Escuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Escuela_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [Escuela] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Escuela] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Escuela] SET RECOVERY FULL 
GO
ALTER DATABASE [Escuela] SET  MULTI_USER 
GO
ALTER DATABASE [Escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Escuela] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Escuela] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Escuela', N'ON'
GO
ALTER DATABASE [Escuela] SET QUERY_STORE = OFF
GO
USE [Escuela]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Escuela]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumno]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alumno](
	[Matricula] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoP] [varchar](50) NULL,
	[ApellidoM] [varchar](50) NULL,
	[FechaDeIngreso] [date] NULL,
	[IdDireccion] [int] NULL,
	[IdCarrera] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] NOT NULL,
	[Calle] [varchar](50) NULL,
	[Numero] [int] NULL,
	[IdColonia] [int] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[DomicilioAlumno]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioAlumno]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[DomicilioAlumno] as
Select CONCAT (Nombre,'' '', ApellidoP, '' '', ApellidoM) as Nombre ,
CONCAT(calle,'' #'',Numero) as domicilio from Alumno, Direccion
where alumno.iddireccion = direccion.iddireccion' 
GO
/****** Object:  Table [dbo].[Maestro]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Maestro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Maestro](
	[NoEmpleado] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoP] [varchar](50) NULL,
	[ApellidoM] [varchar](50) NULL,
	[IdDireccion] [int] NULL,
 CONSTRAINT [PK_Maestro] PRIMARY KEY CLUSTERED 
(
	[NoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[DomicilioMaestro]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioMaestro]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[DomicilioMaestro] as
Select CONCAT (Nombre,'' '', ApellidoP, '' '', ApellidoM) as Nombre ,
CONCAT(calle,'' #'',Numero) as domicilio from Maestro, Direccion
where Maestro.iddireccion = direccion.iddireccion
' 
GO
/****** Object:  Table [dbo].[Colonia]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Colonia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Colonia](
	[IdColonia] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdMunicipio] [int] NULL,
 CONSTRAINT [PK_Colonia] PRIMARY KEY CLUSTERED 
(
	[IdColonia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[DomicilioColonia]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioColonia]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[DomicilioColonia] as
Select CONCAT (Calle,'' '', Numero) as Direccion,
Colonia.Nombre as Colonia from Direccion, Colonia
where Colonia.IdColonia = Direccion.IdColonia' 
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Municipio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Municipio](
	[IdMunicipio] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdEstado] [int] NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[Domicilio]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Domicilio]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Domicilio] as
Select Alumno.Matricula,
Colonia.Nombre as Colonia,
CONCAT (Calle,'' '', Numero) as Direccion,
Municipio.Nombre as Municipio,
Estado.Nombre 
from Direccion, Colonia,Municipio, Estado, Alumno
where Direccion.IdColonia = Colonia.IdColonia and
Municipio.IdMunicipio = Colonia.IdMunicipio and
Estado.IdEstado = Municipio.IdEstado and
 Alumno.IdDireccion = Direccion.IdDireccion
' 
GO
/****** Object:  View [dbo].[DomicilioDocente]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DomicilioDocente]'))
EXEC dbo.sp_executesql @statement = N'
create view [dbo].[DomicilioDocente] as
Select Maestro.NoEmpleado,
Colonia.Nombre as Colonia,
CONCAT (Calle,'' '', Numero) as Direccion,
Municipio.Nombre as Municipio,
Estado.Nombre 
from Direccion, Colonia,Municipio, Estado, Maestro
where Direccion.IdColonia = Colonia.IdColonia and
Municipio.IdMunicipio = Colonia.IdMunicipio and
Estado.IdEstado = Municipio.IdEstado and
 Maestro.IdDireccion = Direccion.IdDireccion
' 
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carrera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] NOT NULL,
	[NoPlan] [varchar](50) NULL,
	[Duracion] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MateriaCarrera]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MateriaCarrera](
	[IdMateriaCarrera] [int] NOT NULL,
	[IdCarrera] [int] NULL,
	[IdMateria] [int] NULL,
	[Semestre] [int] NULL,
 CONSTRAINT [PK_MateriaCarrera] PRIMARY KEY CLUSTERED 
(
	[IdMateriaCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Materia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Materia](
	[IdMateria] [int] NOT NULL,
	[Clave] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[InfoMateria]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoMateria]'))
EXEC dbo.sp_executesql @statement = N'Create view [dbo].[InfoMateria] as 
select Materia.Nombre as Materia,Carrera.Nombre as Carrera, NoPlan as Plann from MateriaCarrera, Carrera,Materia
where materiaCarrera.IdCarrera = Carrera.IdCarrera and Materia.IdMateria = MateriaCarrera.IdMateria
' 
GO
/****** Object:  View [dbo].[MateriasLsti]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MateriasLsti]'))
EXEC dbo.sp_executesql @statement = N'create View [dbo].[MateriasLsti] As
Select Materia.Nombre as Materia, Carrera.Nombre as Carrera
FROM (	(MateriaCarrera INNER JOIN Carrera ON Carrera.IdCarrera = MateriaCarrera.IdCarrera)
INNER JOIN Materia ON Materia.IdMateria = MateriaCarrera.IdMateria
)
where Carrera.IdCarrera =1; 
' 
GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Periodos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Periodos](
	[IdPeriodo] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Inicio] [varchar](50) NULL,
	[Final] [varchar](50) NULL,
 CONSTRAINT [PK_Periodos] PRIMARY KEY CLUSTERED 
(
	[IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Listado]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Listado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Listado](
	[IdListado] [int] NOT NULL,
	[Matricula] [int] NULL,
	[IdClase] [int] NULL,
 CONSTRAINT [PK_Listado_1] PRIMARY KEY CLUSTERED 
(
	[IdListado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Clase]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clase](
	[IdClase] [int] NOT NULL,
	[IdPeriodo] [int] NULL,
	[NoEmpleado] [int] NULL,
	[IdMateriaCarrera] [int] NULL,
	[IdSalon] [int] NULL,
 CONSTRAINT [PK_Clase] PRIMARY KEY CLUSTERED 
(
	[IdClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Salon]    Script Date: 29/10/2018 2:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Salon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Salon](
	[IdSalon] [int] NOT NULL,
	[Numero] [int] NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[IdSalon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HorarioDeClase]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HorarioDeClase](
	[IdHorarioDeClase] [int] NOT NULL,
	[IdHorario] [int] NULL,
	[IdPeriodo] [int] NULL,
	[IdClase] [int] NULL,
 CONSTRAINT [PK_HorarioDeClase] PRIMARY KEY CLUSTERED 
(
	[IdHorarioDeClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Horario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Horario](
	[IdHorario] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[HoraInicio] [char](10) NULL,
	[HoraFinal] [char](10) NULL,
	[Turno] [char](10) NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[IdHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[ListaDeAlumnosView]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ListaDeAlumnosView]'))
EXEC dbo.sp_executesql @statement = N'Create view [dbo].[ListaDeAlumnosView] as
Select Alumno.Matricula,Carrera.Nombre as Carrera,Materia.Nombre as Materia, Horario.HoraInicio,Salon.Numero from Listado,Alumno,Carrera,Horario,Clase,HorarioDeClase, Materia,Maestro,Periodos,Salon,MateriaCarrera
where Horario.IdHorario = HorarioDeClase.IdHorario and
Maestro.NoEmpleado = clase.NoEmpleado and 
Horario.IdHorario = HorarioDeClase.IdHorario and 
HorarioDeClase.IdPeriodo = Periodos.IdPeriodo and
Clase.IdClase = HorarioDeClase.IdClase and
Materia.IdMateria = MateriaCarrera.idMateria and 
Salon.IdSalon = Clase.IdSalon and
Clase.IdClase = Listado.IdClase and
carrera.IdCarrera = MateriaCarrera.IdCarrera and
Clase.IdMateriaCarrera = MateriaCarrera.IdMateriaCarrera and 
Listado.Matricula=Alumno.Matricula;
' 
GO
/****** Object:  View [dbo].[InfoMateriasview]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[InfoMateriasview]'))
EXEC dbo.sp_executesql @statement = N'Create view [dbo].[InfoMateriasview] AS
select Maestro.Nombre +'' ''+ ApellidoP + '' ''+  ApellidoM as Maestro, Materia.Nombre as Materia,Salon.Numero as salon,Horario.Nombre as Horario, Inicio +'' - '' + Final as Periodo
from Maestro,Materia,Salon,Horario,Periodos,Clase, HorarioDeClase, Carrera,MateriaCarrera 
where 
Maestro.NoEmpleado = clase.NoEmpleado and 
Horario.IdHorario = HorarioDeClase.IdHorario and 
HorarioDeClase.IdPeriodo = Periodos.IdPeriodo and
Clase.IdClase = HorarioDeClase.IdClase and
Materia.IdMateria = MateriaCarrera.idMateria and 
Salon.IdSalon = Clase.IdSalon and
carrera.IdCarrera = MateriaCarrera.IdCarrera and
Clase.IdMateriaCarrera = MateriaCarrera.IdMateriaCarrera;
; 
' 
GO
/****** Object:  View [dbo].[ViewMateriasLsti]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewMateriasLsti]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[ViewMateriasLsti] as
select NoPlan as PlanDeEstudio, Materia.Nombre as Materia, Carrera.Nombre as carrera, MateriaCarrera.Semestre  from MateriaCarrera, Materia, Carrera
where MateriaCarrera.IdMateria = Materia.IdMateria and Carrera.IdCarrera = MateriaCarrera.IdCarrera and Carrera.IdCarrera = 1
' 
GO
/****** Object:  View [dbo].[ViewMateriasLcc]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ViewMateriasLcc]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[ViewMateriasLcc] as
select NoPlan as PlanDeEstudio, Materia.Nombre as Materia, Carrera.Nombre as carrera, MateriaCarrera.Semestre  from MateriaCarrera, Materia, Carrera
where MateriaCarrera.IdMateria = Materia.IdMateria and Carrera.IdCarrera = MateriaCarrera.IdCarrera and Carrera.IdCarrera = 2
' 
GO
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (1111121, N'ALICIA', N'Quebas', N'Gardea', CAST(N'2017-08-06' AS Date), 1, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (1122112, N'MAR�A FERNANDA', N'Quenca', N'Garduno', CAST(N'2017-08-06' AS Date), 5, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (1189999, N'GERARDO', N'ViLLARREAL', N'Gillen', CAST(N'2017-08-06' AS Date), 5, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (1235777, N'ALBERTO', N'Quezada', N'Garia', CAST(N'2017-08-06' AS Date), 5, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (1443254, N'TERESA', N'Quebara', N'Garcia', CAST(N'2017-08-06' AS Date), 6, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (2222222, N'Rosa', N'Revilla', N'Garibay', CAST(N'2017-08-06' AS Date), 6, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (2245555, N'ARMANDO', N'Reveles', N'Garibaldo', CAST(N'2017-08-06' AS Date), 6, 1)
INSERT [dbo].[Alumno] ([Matricula], [Nombre], [ApellidoP], [ApellidoM], [FechaDeIngreso], [IdDireccion], [IdCarrera]) VALUES (8999779, N'MANUEL', N'Ruelas', N'Puga', CAST(N'2017-08-06' AS Date), 10, 2)
INSERT [dbo].[Carrera] ([IdCarrera], [NoPlan], [Duracion], [Nombre]) VALUES (1, N'401', N'8', N'LSTI')
INSERT [dbo].[Carrera] ([IdCarrera], [NoPlan], [Duracion], [Nombre]) VALUES (2, N'401', N'8', N'LCC')
INSERT [dbo].[Clase] ([IdClase], [IdPeriodo], [NoEmpleado], [IdMateriaCarrera], [IdSalon]) VALUES (1, 2, 55555, 5, 4)
INSERT [dbo].[Clase] ([IdClase], [IdPeriodo], [NoEmpleado], [IdMateriaCarrera], [IdSalon]) VALUES (2, 2, 11111, 1, 5)
INSERT [dbo].[Clase] ([IdClase], [IdPeriodo], [NoEmpleado], [IdMateriaCarrera], [IdSalon]) VALUES (3, 2, 11111, 8, 6)
INSERT [dbo].[Clase] ([IdClase], [IdPeriodo], [NoEmpleado], [IdMateriaCarrera], [IdSalon]) VALUES (4, 2, 44444, 11, 8)
INSERT [dbo].[Clase] ([IdClase], [IdPeriodo], [NoEmpleado], [IdMateriaCarrera], [IdSalon]) VALUES (5, 2, 55555, 12, 8)
INSERT [dbo].[Clase] ([IdClase], [IdPeriodo], [NoEmpleado], [IdMateriaCarrera], [IdSalon]) VALUES (6, 2, 33333, 13, 9)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (9, N'Zozaya', 4)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (10, N'Balcones de san Miguel', 4)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (11, N'San Ignacio', 1)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (12, N'Pedregal de Linda Vista', 4)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (13, N'Avante', 4)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (14, N'Villa de San Miguel', 4)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (15, N'San Rafael', 4)
INSERT [dbo].[Colonia] ([IdColonia], [Nombre], [IdMunicipio]) VALUES (16, N'Mision del Valle', 4)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (1, N'San Carlos', 600, 11)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (11, N'Jade', 323, 12)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (12, N'Avante', 943, 13)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (13, N'Ojo de Agua', 212, 14)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (14, N'Del Parque', 212, 15)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (15, N'Vigo', 212, 16)
INSERT [dbo].[Direccion] ([IdDireccion], [Calle], [Numero], [IdColonia]) VALUES (16, N'Las Sendas', 212, 15)
INSERT [dbo].[Estado] ([IdEstado], [Nombre]) VALUES (1, N'Nuevo Leon')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (1, N'M1', N'7:00      ', N'8:00      ', N'Matutino  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (2, N'M2', N'8:00      ', N'9:00      ', N'Matutino  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (3, N'M3', N'9:00      ', N'10:00     ', N'Matutino  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (4, N'M4', N'10:00     ', N'11:00     ', N'Matutino  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (5, N'M5', N'11:00     ', N'12:00     ', N'Matutino  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (6, N'M6', N'12:00     ', N'13:00     ', N'Matutino  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (7, N'V1', N'13:00     ', N'14:00     ', N'Vespertino')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (8, N'V2', N'14:00     ', N'15:00     ', N'Vespertino')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (9, N'V3', N'15:00     ', N'16:00     ', N'Vespertino')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (10, N'V4', N'16:00     ', N'17:00     ', N'Vespertino')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (11, N'V5', N'17:00     ', N'18:00     ', N'Vespertino')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (12, N'N1', N'18:00     ', N'19:00     ', N'Nocturno  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (13, N'N2', N'19:00     ', N'20:00     ', N'Nocturno  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (14, N'N3', N'20:00     ', N'21:00     ', N'Nocturno  ')
INSERT [dbo].[Horario] ([IdHorario], [Nombre], [HoraInicio], [HoraFinal], [Turno]) VALUES (15, N'N4', N'21:00     ', N'22:00     ', N'Nocturno  ')
INSERT [dbo].[HorarioDeClase] ([IdHorarioDeClase], [IdHorario], [IdPeriodo], [IdClase]) VALUES (1, 2, 2, 1)
INSERT [dbo].[HorarioDeClase] ([IdHorarioDeClase], [IdHorario], [IdPeriodo], [IdClase]) VALUES (2, 3, 2, 2)
INSERT [dbo].[HorarioDeClase] ([IdHorarioDeClase], [IdHorario], [IdPeriodo], [IdClase]) VALUES (3, 5, 2, 3)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (1, 1111121, 1)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (2, 1122112, 1)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (3, 1189999, 1)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (4, 1233212, 1)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (5, 1233212, 1)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (6, 1235777, 1)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (7, 6665557, 2)
INSERT [dbo].[Listado] ([IdListado], [Matricula], [IdClase]) VALUES (8, 3356777, 2)
INSERT [dbo].[Maestro] ([NoEmpleado], [Nombre], [ApellidoP], [ApellidoM], [IdDireccion]) VALUES (11111, N'Armando', N'Lucio', N'Paz', 2)
INSERT [dbo].[Maestro] ([NoEmpleado], [Nombre], [ApellidoP], [ApellidoM], [IdDireccion]) VALUES (33333, N'Ariel', N'Galvan', N'Cruz', 3)
INSERT [dbo].[Maestro] ([NoEmpleado], [Nombre], [ApellidoP], [ApellidoM], [IdDireccion]) VALUES (44444, N'Ana', N'Garcia', N'Guerrero', 4)
INSERT [dbo].[Maestro] ([NoEmpleado], [Nombre], [ApellidoP], [ApellidoM], [IdDireccion]) VALUES (55555, N'Luis', N'Jimenez', N'Perez', 4)
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (1, 7, N'Base de Datos')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (2, 128, N'Circuitos Digitales')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (3, 141, N'Sistemas Operativos')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (4, 132, N'Deerecho Informatico')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (5, 132, N'Laboratorio de Base de Datos')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (6, 342, N'Telecomunicaciones')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (7, 354, N'Laboratorio de Telecomunicaciones')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (8, 201, N'Ingenieria Social')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (9, 103, N'Algebra')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (10, 204, N'Normatividad y Regulaciones')
INSERT [dbo].[Materia] ([IdMateria], [Clave], [Nombre]) VALUES (11, 250, N'Evidencias Digitales')
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (1, 1, 1, 3)
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (2, 2, 1, 5)
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (3, 1, 2, 2)
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (4, 2, 2, 4)
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (12, 1, 8, 1)
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (13, 1, 10, 1)
INSERT [dbo].[MateriaCarrera] ([IdMateriaCarrera], [IdCarrera], [IdMateria], [Semestre]) VALUES (14, 1, 11, 2)
INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (1, N'Apodaca', 1)
INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (2, N'Escobedo', 1)
INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (3, N'Monterrey', 1)
INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (4, N'Guadalupe', 1)
INSERT [dbo].[Municipio] ([IdMunicipio], [Nombre], [IdEstado]) VALUES (5, N'Juarez', 1)
INSERT [dbo].[Periodos] ([IdPeriodo], [Nombre], [Inicio], [Final]) VALUES (1, N'2018.1', N'Enero 2018', N'Junio 2018')
INSERT [dbo].[Periodos] ([IdPeriodo], [Nombre], [Inicio], [Final]) VALUES (2, N'2018.2', N'Agosto 2018', N'Diciembre 2018')
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (1, 100)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (2, 101)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (3, 102)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (4, 103)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (5, 104)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (6, 105)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (7, 106)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (8, 107)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (9, 108)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (10, 109)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (11, 110)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (12, 111)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (13, 112)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (14, 113)
INSERT [dbo].[Salon] ([IdSalon], [Numero]) VALUES (15, 114)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alumno_Carrera]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alumno]'))
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alumno_Carrera]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alumno]'))
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Carrera]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alumno_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alumno]'))
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Direccion] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Alumno_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Alumno]'))
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Direccion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_Maestro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_Maestro] FOREIGN KEY([NoEmpleado])
REFERENCES [dbo].[Maestro] ([NoEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_Maestro]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_Maestro]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_MateriaCarrera]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_MateriaCarrera] FOREIGN KEY([IdMateriaCarrera])
REFERENCES [dbo].[MateriaCarrera] ([IdMateriaCarrera])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_MateriaCarrera]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_MateriaCarrera]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_Periodos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_Periodos] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[Periodos] ([IdPeriodo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_Periodos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_Periodos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_Salon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_Salon] FOREIGN KEY([IdSalon])
REFERENCES [dbo].[Salon] ([IdSalon])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Clase_Salon]') AND parent_object_id = OBJECT_ID(N'[dbo].[Clase]'))
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_Salon]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Colonia_Municipio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Colonia]'))
ALTER TABLE [dbo].[Colonia]  WITH CHECK ADD  CONSTRAINT [FK_Colonia_Municipio] FOREIGN KEY([IdMunicipio])
REFERENCES [dbo].[Municipio] ([IdMunicipio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Colonia_Municipio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Colonia]'))
ALTER TABLE [dbo].[Colonia] CHECK CONSTRAINT [FK_Colonia_Municipio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Colonia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Colonia] FOREIGN KEY([IdColonia])
REFERENCES [dbo].[Colonia] ([IdColonia])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Direccion_Colonia]') AND parent_object_id = OBJECT_ID(N'[dbo].[Direccion]'))
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Colonia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioDeClase_Clase]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]'))
ALTER TABLE [dbo].[HorarioDeClase]  WITH CHECK ADD  CONSTRAINT [FK_HorarioDeClase_Clase] FOREIGN KEY([IdClase])
REFERENCES [dbo].[Clase] ([IdClase])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioDeClase_Clase]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]'))
ALTER TABLE [dbo].[HorarioDeClase] CHECK CONSTRAINT [FK_HorarioDeClase_Clase]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioDeClase_Horario]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]'))
ALTER TABLE [dbo].[HorarioDeClase]  WITH CHECK ADD  CONSTRAINT [FK_HorarioDeClase_Horario] FOREIGN KEY([IdHorario])
REFERENCES [dbo].[Horario] ([IdHorario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioDeClase_Horario]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]'))
ALTER TABLE [dbo].[HorarioDeClase] CHECK CONSTRAINT [FK_HorarioDeClase_Horario]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioDeClase_Periodos]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]'))
ALTER TABLE [dbo].[HorarioDeClase]  WITH CHECK ADD  CONSTRAINT [FK_HorarioDeClase_Periodos] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[Periodos] ([IdPeriodo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioDeClase_Periodos]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioDeClase]'))
ALTER TABLE [dbo].[HorarioDeClase] CHECK CONSTRAINT [FK_HorarioDeClase_Periodos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Listado_Alumno]') AND parent_object_id = OBJECT_ID(N'[dbo].[Listado]'))
ALTER TABLE [dbo].[Listado]  WITH CHECK ADD  CONSTRAINT [FK_Listado_Alumno] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Alumno] ([Matricula])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Listado_Alumno]') AND parent_object_id = OBJECT_ID(N'[dbo].[Listado]'))
ALTER TABLE [dbo].[Listado] CHECK CONSTRAINT [FK_Listado_Alumno]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Listado_Clase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Listado]'))
ALTER TABLE [dbo].[Listado]  WITH CHECK ADD  CONSTRAINT [FK_Listado_Clase] FOREIGN KEY([IdClase])
REFERENCES [dbo].[Clase] ([IdClase])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Listado_Clase]') AND parent_object_id = OBJECT_ID(N'[dbo].[Listado]'))
ALTER TABLE [dbo].[Listado] CHECK CONSTRAINT [FK_Listado_Clase]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Maestro_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Maestro]'))
ALTER TABLE [dbo].[Maestro]  WITH CHECK ADD  CONSTRAINT [FK_Maestro_Direccion] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Maestro_Direccion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Maestro]'))
ALTER TABLE [dbo].[Maestro] CHECK CONSTRAINT [FK_Maestro_Direccion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MateriaCarrera_Carrera]') AND parent_object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]'))
ALTER TABLE [dbo].[MateriaCarrera]  WITH CHECK ADD  CONSTRAINT [FK_MateriaCarrera_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MateriaCarrera_Carrera]') AND parent_object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]'))
ALTER TABLE [dbo].[MateriaCarrera] CHECK CONSTRAINT [FK_MateriaCarrera_Carrera]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MateriaCarrera_Materia]') AND parent_object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]'))
ALTER TABLE [dbo].[MateriaCarrera]  WITH CHECK ADD  CONSTRAINT [FK_MateriaCarrera_Materia] FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([IdMateria])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MateriaCarrera_Materia]') AND parent_object_id = OBJECT_ID(N'[dbo].[MateriaCarrera]'))
ALTER TABLE [dbo].[MateriaCarrera] CHECK CONSTRAINT [FK_MateriaCarrera_Materia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Municipio_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Municipio]'))
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Municipio_Estado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Municipio]'))
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Estado]
GO
/****** Object:  StoredProcedure [dbo].[InfoMateriaproc]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InfoMateriaproc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InfoMateriaproc] AS' 
END
GO
ALTER proc [dbo].[InfoMateriaproc] as
select Materia.Nombre as Materia,Carrera.Nombre as Carrera, NoPlan as Plann from MateriaCarrera, Carrera,Materia
where materiaCarrera.IdCarrera = Carrera.IdCarrera and Materia.IdMateria = MateriaCarrera.IdMateria
GO
/****** Object:  StoredProcedure [dbo].[InfoMaterias]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InfoMaterias]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InfoMaterias] AS' 
END
GO
ALTER Procedure [dbo].[InfoMaterias] AS
select Maestro.Nombre +' '+ ApellidoP + ' '+  ApellidoM as Maestro, Materia.Nombre as Materia,Salon.Numero as salon,Horario.Nombre as Horario, Inicio +' - ' + Final as Periodo
from Maestro,Materia,Salon,Horario,Periodos,Clase, HorarioDeClase, Carrera,MateriaCarrera 
where 
Maestro.NoEmpleado = clase.NoEmpleado and 
Horario.IdHorario = HorarioDeClase.IdHorario and 
HorarioDeClase.IdPeriodo = Periodos.IdPeriodo and
Clase.IdClase = HorarioDeClase.IdClase and
Materia.IdMateria = MateriaCarrera.idMateria and 
Salon.IdSalon = Clase.IdSalon and
carrera.IdCarrera = MateriaCarrera.IdCarrera and
Clase.IdMateriaCarrera = MateriaCarrera.IdMateriaCarrera;
; 
GO
/****** Object:  StoredProcedure [dbo].[ListaDeAlumnos]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListaDeAlumnos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ListaDeAlumnos] AS' 
END
GO

ALTER proc [dbo].[ListaDeAlumnos] as
Select Alumno.Matricula,Carrera.Nombre as Carrera,Materia.Nombre as Materia, Horario.HoraInicio,Salon.Numero from Listado,Alumno,Carrera,Horario,Clase,HorarioDeClase, Materia,Maestro,Periodos,Salon,MateriaCarrera
where Horario.IdHorario = HorarioDeClase.IdHorario and
Maestro.NoEmpleado = clase.NoEmpleado and 
Horario.IdHorario = HorarioDeClase.IdHorario and 
HorarioDeClase.IdPeriodo = Periodos.IdPeriodo and
Clase.IdClase = HorarioDeClase.IdClase and
Materia.IdMateria = MateriaCarrera.idMateria and 
Salon.IdSalon = Clase.IdSalon and
Clase.IdClase = Listado.IdClase and
carrera.IdCarrera = MateriaCarrera.IdCarrera and
Clase.IdMateriaCarrera = MateriaCarrera.IdMateriaCarrera and 
Listado.Matricula=Alumno.Matricula;
GO
/****** Object:  StoredProcedure [dbo].[ProcDomicilioAlumno]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcDomicilioAlumno]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProcDomicilioAlumno] AS' 
END
GO
ALTER PROCEDURE [dbo].[ProcDomicilioAlumno] as
Select Alumno.Matricula,
Colonia.Nombre as Colonia,
CONCAT (Calle,' ', Numero) as Direccion,
Municipio.Nombre as Municipio,
Estado.Nombre 
from Direccion, Colonia,Municipio, Estado, Alumno
where Direccion.IdColonia = Colonia.IdColonia and
Municipio.IdMunicipio = Colonia.IdMunicipio and
Estado.IdEstado = Municipio.IdEstado and
Alumno.IdDireccion = Direccion.IdDireccion
GO
/****** Object:  StoredProcedure [dbo].[ProcDomicilioDocente]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcDomicilioDocente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProcDomicilioDocente] AS' 
END
GO
ALTER proc [dbo].[ProcDomicilioDocente] as
Select Maestro.NoEmpleado,
Colonia.Nombre as Colonia,
CONCAT (Calle,' ', Numero) as Direccion,
Municipio.Nombre as Municipio,
Estado.Nombre 
from Direccion, Colonia,Municipio, Estado, Maestro
where Direccion.IdColonia = Colonia.IdColonia and
Municipio.IdMunicipio = Colonia.IdMunicipio and
Estado.IdEstado = Municipio.IdEstado and
Maestro.IdDireccion = Direccion.IdDireccion
GO
/****** Object:  StoredProcedure [dbo].[ProcMateriasLcc]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcMateriasLcc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProcMateriasLcc] AS' 
END
GO
ALTER proc [dbo].[ProcMateriasLcc] as
select NoPlan as PlanDeEstudio, Materia.Nombre as Materia, Carrera.Nombre as carrera, MateriaCarrera.Semestre  from MateriaCarrera, Materia, Carrera
where MateriaCarrera.IdMateria = Materia.IdMateria and Carrera.IdCarrera = MateriaCarrera.IdCarrera and Carrera.IdCarrera = 2
GO
/****** Object:  StoredProcedure [dbo].[ProcMateriasLsti]    Script Date: 29/10/2018 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcMateriasLsti]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProcMateriasLsti] AS' 
END
GO
ALTER proc [dbo].[ProcMateriasLsti] as
select NoPlan as PlanDeEstudio, Materia.Nombre as Materia, Carrera.Nombre as carrera, MateriaCarrera.Semestre  from MateriaCarrera, Materia, Carrera
where MateriaCarrera.IdMateria = Materia.IdMateria and Carrera.IdCarrera = MateriaCarrera.IdCarrera and Carrera.IdCarrera = 1
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO               
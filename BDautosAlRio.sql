USE [master]
GO
/****** Object:  Database [BDautosAlRio]    Script Date: 7/11/2023 11:34:24 ******/
CREATE DATABASE [BDautosAlRio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDautosAlRio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDautosAlRio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDautosAlRio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDautosAlRio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDautosAlRio] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDautosAlRio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDautosAlRio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDautosAlRio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDautosAlRio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDautosAlRio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDautosAlRio] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDautosAlRio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDautosAlRio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDautosAlRio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDautosAlRio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDautosAlRio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDautosAlRio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDautosAlRio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDautosAlRio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDautosAlRio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDautosAlRio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDautosAlRio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDautosAlRio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDautosAlRio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDautosAlRio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDautosAlRio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDautosAlRio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDautosAlRio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDautosAlRio] SET RECOVERY FULL 
GO
ALTER DATABASE [BDautosAlRio] SET  MULTI_USER 
GO
ALTER DATABASE [BDautosAlRio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDautosAlRio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDautosAlRio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDautosAlRio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDautosAlRio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDautosAlRio', N'ON'
GO
ALTER DATABASE [BDautosAlRio] SET QUERY_STORE = OFF
GO
USE [BDautosAlRio]
GO
/****** Object:  User [alumno]    Script Date: 7/11/2023 11:34:24 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Auto]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto](
	[IdAuto] [int] IDENTITY(1,1) NOT NULL,
	[Año] [int] NOT NULL,
	[Kilometraje] [int] NOT NULL,
	[Matricula] [varchar](50) NOT NULL,
	[Disponible] [bit] NOT NULL,
	[Asientos] [int] NOT NULL,
	[Motor] [varchar](50) NOT NULL,
	[AireAcondicionado] [bit] NOT NULL,
	[ABS] [bit] NOT NULL,
	[Airbag] [bit] NOT NULL,
	[IdColor] [int] NOT NULL,
	[IdTransmision] [int] NOT NULL,
	[IdDireccion] [int] NOT NULL,
	[IdMarca] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[IdModelo] [int] NOT NULL,
 CONSTRAINT [PK_Autos] PRIMARY KEY CLUSTERED 
(
	[IdAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[IdColor] [int] IDENTITY(1,1) NOT NULL,
	[NombreColor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colores] PRIMARY KEY CLUSTERED 
(
	[IdColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreDireccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[NombreMarca] [varchar](50) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[SitioWeb] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[IdModelo] [int] IDENTITY(1,1) NOT NULL,
	[NombreModelo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Modelos] PRIMARY KEY CLUSTERED 
(
	[IdModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transmision]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transmision](
	[IdTransmision] [int] IDENTITY(1,1) NOT NULL,
	[NombreTransmision] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transmision] PRIMARY KEY CLUSTERED 
(
	[IdTransmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/11/2023 11:34:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Admin] [bit] NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Auto]  WITH CHECK ADD  CONSTRAINT [FK_Autos_Colores] FOREIGN KEY([IdColor])
REFERENCES [dbo].[Color] ([IdColor])
GO
ALTER TABLE [dbo].[Auto] CHECK CONSTRAINT [FK_Autos_Colores]
GO
ALTER TABLE [dbo].[Auto]  WITH CHECK ADD  CONSTRAINT [FK_Autos_Direccion] FOREIGN KEY([IdDireccion])
REFERENCES [dbo].[Direccion] ([IdDireccion])
GO
ALTER TABLE [dbo].[Auto] CHECK CONSTRAINT [FK_Autos_Direccion]
GO
ALTER TABLE [dbo].[Auto]  WITH CHECK ADD  CONSTRAINT [FK_Autos_Marcas] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Auto] CHECK CONSTRAINT [FK_Autos_Marcas]
GO
ALTER TABLE [dbo].[Auto]  WITH CHECK ADD  CONSTRAINT [FK_Autos_Modelos] FOREIGN KEY([IdModelo])
REFERENCES [dbo].[Modelo] ([IdModelo])
GO
ALTER TABLE [dbo].[Auto] CHECK CONSTRAINT [FK_Autos_Modelos]
GO
ALTER TABLE [dbo].[Auto]  WITH CHECK ADD  CONSTRAINT [FK_Autos_Transmision] FOREIGN KEY([IdTransmision])
REFERENCES [dbo].[Transmision] ([IdTransmision])
GO
ALTER TABLE [dbo].[Auto] CHECK CONSTRAINT [FK_Autos_Transmision]
GO
ALTER TABLE [dbo].[Auto]  WITH CHECK ADD  CONSTRAINT [FK_Autos_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Auto] CHECK CONSTRAINT [FK_Autos_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [BDautosAlRio] SET  READ_WRITE 
GO

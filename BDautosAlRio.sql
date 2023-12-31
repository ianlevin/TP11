USE [master]
GO
/****** Object:  Database [BDautosAlRio]    Script Date: 28/11/2023 11:06:50 ******/
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
ALTER DATABASE [BDautosAlRio] SET RECOVERY SIMPLE 
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
/****** Object:  User [alumno]    Script Date: 28/11/2023 11:06:50 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Auto]    Script Date: 28/11/2023 11:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auto](
	[IdAuto] [int] IDENTITY(1,1) NOT NULL,
	[Ano] [int] NOT NULL,
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
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Autos] PRIMARY KEY CLUSTERED 
(
	[IdAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 28/11/2023 11:06:50 ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 28/11/2023 11:06:50 ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 28/11/2023 11:06:50 ******/
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
/****** Object:  Table [dbo].[Modelo]    Script Date: 28/11/2023 11:06:50 ******/
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
/****** Object:  Table [dbo].[Transmision]    Script Date: 28/11/2023 11:06:50 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/11/2023 11:06:50 ******/
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
SET IDENTITY_INSERT [dbo].[Auto] ON 

INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (3, 2022, 23000, N'AD957FG', 1, 5, N'2.0T', 1, 1, 1, 1, 1, 2, 8, 1, N'bora.png', 99, 900000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (5, 2018, 58000, N'ZUA769', 1, 5, N'2.0T', 1, 1, 1, 2, 1, 2, 14, 1, N'A5.jfif', 89, 3137283)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (6, 2023, 0, N'CA453CD', 1, 5, N'1.5T', 1, 1, 1, 3, 1, 2, 2, 1, N'bronco.png', 9, 12312312)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (8, 2023, 0, N'DA264BH', 1, 4, N'3.0T', 1, 1, 1, 2, 1, 1, 2, 1, N'mustang.png', 17, 12312312)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (9, 2016, 124000, N'JPA389', 1, 5, N'1.2T', 1, 0, 0, 4, 2, 2, 1, 1, N'cruze-rs.png', 1, 12231223)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (16, 2023, 12000, N'OAO333', 1, 4, N'1.8T', 1, 1, 1, 1, 1, 2, 7, 1, N'amarok.png', 50, 36000900)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (17, 2023, 0, N'LNK001', 1, 4, N'6.7', 1, 1, 1, 4, 1, 2, 6, 1, N'gladiator.png', 31, 15000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (18, 2023, 100, N'LNK002', 1, 4, N'2.0', 1, 1, 1, 3, 1, 2, 6, 1, N'commander.png', 32, 6000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (19, 2023, 0, N'LNK003', 1, 4, N'1.6', 1, 1, 1, 2, 1, 1, 1, 1, N'tracker.jfif', 2, 800000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (20, 2023, 50, N'LNK004', 1, 4, N'1.8', 1, 1, 1, 6, 1, 2, 8, 1, N'vento.png', 48, 10000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (21, 2023, 0, N'LNK005', 1, 4, N'2.0', 1, 1, 1, 1, 1, 1, 4, 1, N'pulse.png', 19, 10000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (22, 2023, 30, N'LNK006', 1, 2, N'1.8', 1, 1, 1, 2, 1, 1, 9, 1, N'serie8.png', 58, 8000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (23, 2023, 50, N'LNK007', 1, 4, N'6.7', 1, 1, 1, 1, 1, 2, 6, 1, N'grand-cherokee.png', 33, 15000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (24, 2023, 0, N'LNK008', 1, 4, N'2.0', 0, 1, 1, 3, 2, 1, 7, 1, N'hilux.png', 36, 800000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (25, 2023, 24, N'LNK009', 1, 4, N'1.6', 1, 1, 1, 6, 1, 2, 5, 1, N'logan.png', 22, 4000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (26, 2023, 0, N'LNK010', 1, 4, N'6.7', 1, 1, 1, 2, 1, 2, 2, 1, N'raptor.png', 13, 6000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (27, 2023, 40, N'LNK011', 1, 2, N'2.0', 1, 1, 1, 4, 1, 1, 1, 1, N'camaro.jfif', 5, 8000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (28, 2023, 24, N'LNK012', 1, 2, N'2.0', 1, 1, 1, 3, 1, 1, 8, 1, N'saveiro.png', 51, 10000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (29, 2023, 50, N'LNK013', 1, 4, N'6.7', 1, 1, 1, 4, 1, 1, 1, 1, N'montana.jfif', 7, 6000000)
INSERT [dbo].[Auto] ([IdAuto], [Ano], [Kilometraje], [Matricula], [Disponible], [Asientos], [Motor], [AireAcondicionado], [ABS], [Airbag], [IdColor], [IdTransmision], [IdDireccion], [IdMarca], [IdUsuario], [Imagen], [IdModelo], [Precio]) VALUES (30, 2023, 30, N'LNK014', 1, 4, N'1.8', 1, 0, 1, 2, 1, 2, 5, 1, N'sandero-rs.png', 24, 8000000)
SET IDENTITY_INSERT [dbo].[Auto] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (1, N'Negro')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (2, N'Azul')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (3, N'Blanco')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (4, N'Rojo')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (5, N'Amarillo')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (6, N'Gris')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (7, N'Verde')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (8, N'Violeta')
INSERT [dbo].[Color] ([IdColor], [NombreColor]) VALUES (9, N'Rosa')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([IdDireccion], [NombreDireccion]) VALUES (1, N'Hidraulica')
INSERT [dbo].[Direccion] ([IdDireccion], [NombreDireccion]) VALUES (2, N'Electrica')
SET IDENTITY_INSERT [dbo].[Direccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (1, N'Chevrolete', N'USA', N'Av.', N'Chevrolete.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (2, N'Ford', N'USA', N'Av.', N'Ford.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (4, N'Fiat', N'Italia', N'Av.', N'Fiat.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (5, N'Renault', N'Alemania', N'Av.', N'Renault.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (6, N'Jeep', N'USA', N'Av.', N'Jeep.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (7, N'Toyota', N'Japon', N'Av.', N'Toyota.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (8, N'VolksWagen', N'Alemania', N'Av.', N'Volkswagen.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (9, N'BMW', N'Alemania', N'Av.', N'bmw.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (10, N'Mercedez-Benz', N'Alemania', N'Av.', N'Mercedesbenz.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (11, N'Nissan', N'Japon', N'Av.', N'Nissan.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (12, N'Porsche', N'Alemania', N'Av.', N'porsche.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (13, N'Ferrari', N'Italia', N'Av.', N'ferrari.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (14, N'Audi', N'Alemania', N'Av.', N'audi.com')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Modelo] ON 

INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (1, N'Cruze RS')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (2, N'Tracker')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (3, N'Onix LTZ')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (4, N'Equinox LTZ')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (5, N'Camaro')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (6, N'S10')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (7, N'Montana LTZ')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (8, N'Territory')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (9, N'Bronco Sport')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (10, N'Kuga Hibrida')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (11, N'Maverick')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (12, N'Ranger')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (13, N'Ranger Raptor')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (14, N'F-150')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (15, N'F-150 Raptor')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (16, N'Transit MiniBus')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (17, N'Mustang gt')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (18, N'Cronos')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (19, N'Pulse')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (20, N'Strada')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (21, N'Toro')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (22, N'Logan')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (23, N'Kangoo')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (24, N'Sandero Rs')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (25, N'Stepway')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (26, N'Duster')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (27, N'Koleos')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (28, N'Renegade')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (29, N'Compass')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (30, N'Wrangler')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (31, N'Gladiator')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (32, N'Commander')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (33, N'Grand Cherokee')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (34, N'Etios')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (35, N'Yaris')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (36, N'Hilux')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (37, N'Corolla Cross')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (38, N'SW4')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (39, N'GR86')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (40, N'Corolla Sport')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (41, N'Yaris GR')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (42, N'Rav 4')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (43, N'Polo')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (44, N'Virtus')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (45, N'Nivus')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (46, N'T-Cross')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (47, N'Taos')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (48, N'Vento')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (49, N'Tiguan')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (50, N'Amarok')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (51, N'Saveiro')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (52, N'X6')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (53, N'X5')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (54, N'X4')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (55, N'X3')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (56, N'X2')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (57, N'X1')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (58, N'Serie 8 Coupe ')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (59, N'Serie 7 Sedan')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (60, N'Serie 4 Coupe')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (61, N'M240i')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (62, N'Z4')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (63, N'A250')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (64, N'GLE 350')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (65, N'C300 AMG')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (66, N'Stelvio')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (67, N'Giulia')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (68, N'Frontier')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (69, N'Kicks')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (70, N'Sentra')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (71, N'718')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (72, N'911')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (73, N'Taycan')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (74, N'Panamera ')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (75, N'Macan')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (76, N'Cayenne')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (77, N'Roma')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (78, N'812 Competizione')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (79, N'F40')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (80, N'LaFerrari')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (81, N'Enzo Ferrari')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (82, N'F8 Tributo')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (83, N'488 Pista')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (84, N'Huracan')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (85, N'Urus')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (86, N'A1')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (87, N'A3')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (88, N'A4')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (89, N'A5')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (90, N'A6')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (91, N'A7')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (92, N'Q2')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (93, N'Q3')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (94, N'Q5')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (95, N'Q7')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (96, N'Q8')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (97, N'RS6')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (98, N'R8')
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo]) VALUES (99, N'Bora')
GO
SET IDENTITY_INSERT [dbo].[Modelo] OFF
GO
SET IDENTITY_INSERT [dbo].[Transmision] ON 

INSERT [dbo].[Transmision] ([IdTransmision], [NombreTransmision]) VALUES (1, N'Automatica')
INSERT [dbo].[Transmision] ([IdTransmision], [NombreTransmision]) VALUES (2, N'Manual')
SET IDENTITY_INSERT [dbo].[Transmision] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [FechaNacimiento], [NombreUsuario], [Email], [Telefono], [Direccion], [Admin], [Contrasena]) VALUES (1, CAST(N'2000-11-14T00:00:00.000' AS DateTime), N'ChuluscaOP', N'czernuszkatomas@gmail.com', N'1163767268', N'Av. Diaz Velez', 1, N'toto123')
INSERT [dbo].[Usuario] ([IdUsuario], [FechaNacimiento], [NombreUsuario], [Email], [Telefono], [Direccion], [Admin], [Contrasena]) VALUES (2, CAST(N'2000-11-14T00:00:00.000' AS DateTime), N'tomi', N't@gmail.com', N'11111111', N'av', 0, N'toto123')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerAutos]    Script Date: 28/11/2023 11:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerAutos]
AS
BEGIN
	SELECT * FROM Auto;
END
GO
USE [master]
GO
ALTER DATABASE [BDautosAlRio] SET  READ_WRITE 
GO

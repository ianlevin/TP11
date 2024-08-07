USE [master]
GO
/****** Object:  Database [BDautosAlRio]    Script Date: 19/4/2024 10:11:18 ******/
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
/****** Object:  User [alumno]    Script Date: 19/4/2024 10:11:18 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Auto]    Script Date: 19/4/2024 10:11:18 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 19/4/2024 10:11:18 ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 19/4/2024 10:11:18 ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 19/4/2024 10:11:18 ******/
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
/****** Object:  Table [dbo].[Modelo]    Script Date: 19/4/2024 10:11:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelo](
	[IdModelo] [int] IDENTITY(1,1) NOT NULL,
	[NombreModelo] [varchar](50) NOT NULL,
	[IdMarca] [int] NULL,
 CONSTRAINT [PK_Modelos] PRIMARY KEY CLUSTERED 
(
	[IdModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transmision]    Script Date: 19/4/2024 10:11:18 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/4/2024 10:11:18 ******/
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
	[Contrasena] [varchar](256) NOT NULL,
	[Foto] [varchar](512) NULL,
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
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (15, N'Alfa Romeo', N'Italia', N'Av.', N'alfaromeo.com')
INSERT [dbo].[Marca] ([IdMarca], [NombreMarca], [Pais], [Direccion], [SitioWeb]) VALUES (16, N'Lamborghini', N'Italia', N'Av.', N'lamborghini.com')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Modelo] ON 

INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (1, N'Cruze RS', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (2, N'Tracker', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (3, N'Onix LTZ', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (4, N'Equinox LTZ', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (5, N'Camaro', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (6, N'S10', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (7, N'Montana LTZ', 1)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (8, N'Territory', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (9, N'Bronco Sport', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (10, N'Kuga Hibrida', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (11, N'Maverick', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (12, N'Ranger', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (13, N'Ranger Raptor', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (14, N'F-150', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (15, N'F-150 Raptor', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (16, N'Transit MiniBus', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (17, N'Mustang gt', 2)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (18, N'Cronos', 4)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (19, N'Pulse', 4)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (20, N'Strada', 4)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (21, N'Toro', 4)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (22, N'Logan', 5)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (23, N'Kangoo', 5)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (24, N'Sandero Rs', 5)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (25, N'Stepway', 5)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (26, N'Duster', 5)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (27, N'Koleos', 5)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (28, N'Renegade', 6)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (29, N'Compass', 6)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (30, N'Wrangler', 6)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (31, N'Gladiator', 6)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (32, N'Commander', 6)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (33, N'Grand Cherokee', 6)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (34, N'Etios', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (35, N'Yaris', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (36, N'Hilux', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (37, N'Corolla Cross', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (38, N'SW4', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (39, N'GR86', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (40, N'Corolla Sport', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (41, N'Yaris GR', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (42, N'Rav 4', 7)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (43, N'Polo', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (44, N'Virtus', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (45, N'Nivus', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (46, N'T-Cross', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (47, N'Taos', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (48, N'Vento', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (49, N'Tiguan', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (50, N'Amarok', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (51, N'Saveiro', 8)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (52, N'X6', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (53, N'X5', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (54, N'X4', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (55, N'X3', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (56, N'X2', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (57, N'X1', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (58, N'Serie 8 Coupe ', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (59, N'Serie 7 Sedan', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (60, N'Serie 4 Coupe', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (61, N'M240i', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (62, N'Z4', 9)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (63, N'A250', 10)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (64, N'GLE 350', 10)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (65, N'C300 AMG', 10)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (66, N'Stelvio', 15)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (67, N'Giulia', 15)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (68, N'Frontier', 11)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (69, N'Kicks', 11)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (70, N'Sentra', 11)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (71, N'718', 12)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (72, N'911', 12)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (73, N'Taycan', 12)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (74, N'Panamera ', 12)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (75, N'Macan', 12)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (76, N'Cayenne', 12)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (77, N'Roma', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (78, N'812 Competizione', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (79, N'F40', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (80, N'LaFerrari', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (81, N'Enzo Ferrari', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (82, N'F8 Tributo', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (83, N'488 Pista', 13)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (84, N'Huracan', 16)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (85, N'Urus', 16)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (86, N'A1', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (87, N'A3', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (88, N'A4', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (89, N'A5', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (90, N'A6', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (91, N'A7', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (92, N'Q2', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (93, N'Q3', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (94, N'Q5', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (95, N'Q7', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (96, N'Q8', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (97, N'RS6', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (98, N'R8', 14)
INSERT [dbo].[Modelo] ([IdModelo], [NombreModelo], [IdMarca]) VALUES (99, N'Bora', 8)
GO
SET IDENTITY_INSERT [dbo].[Modelo] OFF
GO
SET IDENTITY_INSERT [dbo].[Transmision] ON 

INSERT [dbo].[Transmision] ([IdTransmision], [NombreTransmision]) VALUES (1, N'Automatica')
INSERT [dbo].[Transmision] ([IdTransmision], [NombreTransmision]) VALUES (2, N'Manual')
SET IDENTITY_INSERT [dbo].[Transmision] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [FechaNacimiento], [NombreUsuario], [Email], [Telefono], [Direccion], [Admin], [Contrasena], [Foto]) VALUES (1, CAST(N'2000-11-14T00:00:00.000' AS DateTime), N'ChuluscaOP', N'czernuszkatomas@gmail.com', N'1163767268', N'Av. Diaz Velez', 1, N'toto123', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [FechaNacimiento], [NombreUsuario], [Email], [Telefono], [Direccion], [Admin], [Contrasena], [Foto]) VALUES (2, CAST(N'2000-11-14T00:00:00.000' AS DateTime), N'tomi', N't@gmail.com', N'11111111', N'av', 0, N'toto123', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [FechaNacimiento], [NombreUsuario], [Email], [Telefono], [Direccion], [Admin], [Contrasena], [Foto]) VALUES (3, NULL, N'toto', N'm@m', N'11', NULL, 0, N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
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
ALTER TABLE [dbo].[Modelo]  WITH CHECK ADD  CONSTRAINT [FK_Modelo_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Modelo] CHECK CONSTRAINT [FK_Modelo_Marca]
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerAutos]    Script Date: 19/4/2024 10:11:18 ******/
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

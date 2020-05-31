use master
go
drop database CATALOGO_DB
go

create database CATALOGO_DB
go
use CATALOGO_DB
go
USE [CATALOGO_DB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MARCAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [CATALOGO_DB]
GO

/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 08/09/2019 10:32:14 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CATEGORIAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [CATALOGO_DB]
GO

/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 08/09/2019 10:32:24 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ARTICULOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](150) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[ImagenUrl] [varchar](1000) NULL,
	[Precio] [money] NULL,
	[Eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into MARCAS values ('Samsung'), ('Apple'), ('Sony'), ('Huawei'), ('Motorola'), ('Google')
insert into CATEGORIAS values ('Celulares'),('Televisores'), ('Media'), ('Audio'), ('Gaming'), ('Electrodomesticos')
insert into ARTICULOS values ('S01', 'Galaxy S10', 'Smartphone Samsung S10 ', 1, 1, 'https://images.samsung.com/is/image/samsung/co-galaxy-s10-sm-g970-sm-g970fzyjcoo-frontcanaryyellow-thumb-149016542', 69.999,0),
('M03', 'Moto G Play 7ma Gen', 'Smartphone Motorola G-Play Septima Generacion', 5, 1, 'https://www.motorola.cl/arquivos/moto-g7-play-img-product.png?v=636862863804700000', 15699,0),
('S99', 'Play 4', 'Consola Sony Playstation 4. Incluye Dualshock 4 (1 Un.)', 3, 3, 'https://www.euronics.cz/image/product/800x800/532620.jpg', 35000,0),
('S56', 'Bravia 55', 'Smart TV Sony Bravia 55"', 3, 2, 'https://intercompras.com/product_thumb_keepratio_2.php?img=images/product/SONY_KDL-55W950A.jpg&w=650&h=450', 49500,0),
('A23', 'Apple TV', 'Receptor Digital Multimedia para iOS', 2, 3, 'https://cnnespanol2.files.wordpress.com/2015/12/gadgets-mc3a1s-populares-apple-tv-2015-18.jpg?quality=100&strip=info&w=460&h=260&crop=1', 7850,0),
('C02', 'Chromecast', 'Receptor Digital Multimedia para Android', 6, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRDVFCHV_h5M6U50CANEtwZ3a0mMfx7BEgYE730ovfQ0MqwSdIiY-T8m-j2b8UsaInlz3dsvUUm&usqp=CAc',5499,0)


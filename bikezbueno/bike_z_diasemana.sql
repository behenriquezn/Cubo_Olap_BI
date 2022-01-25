USE [Bike_Z]
GO
/****** Object:  Table [dbo].[DIM_ALMACEN]    Script Date: 03-12-2021 16:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ALMACEN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Almacen_id] [int] NOT NULL,
	[Almacen] [nchar](50) NOT NULL,
	[Territorio] [nchar](50) NOT NULL,
	[Grupo] [nchar](50) NOT NULL,
	[Pais] [nchar](50) NOT NULL,
 CONSTRAINT [PK_DIM_ALMACEN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_CLIENTE]    Script Date: 03-12-2021 16:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CLIENTE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_id] [int] NOT NULL,
	[Nombre_Apellido] [nvarchar](200) NULL,
 CONSTRAINT [PK_DIM_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_EMPLEADO]    Script Date: 03-12-2021 16:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_EMPLEADO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Empleado_id] [int] NOT NULL,
	[Cargo] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[EstadoCivil] [nchar](1) NOT NULL,
	[Genero] [nchar](1) NOT NULL,
	[FechaContratacion] [date] NOT NULL,
	[HorasVacaciones] [smallint] NOT NULL,
 CONSTRAINT [PK_DIM_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_PRODUCTO]    Script Date: 03-12-2021 16:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_PRODUCTO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Producto_id] [int] NOT NULL,
	[Producto] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[Categoria] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_TIEMPO]    Script Date: 03-12-2021 16:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_TIEMPO](
	[Tiempo_id] [int] IDENTITY(1,1) NOT NULL,
	[Anio] [int] NOT NULL,
	[Fecha_completa] [date] NOT NULL,
	[MesID] [int] NOT NULL,
	[Mes] [char](45) NOT NULL,
	[SemestreID] [int] NOT NULL,
	[TrimestreID] [int] NOT NULL,
	[DiaID] [int] NOT NULL,
	[Dia] [char](45) NOT NULL,
	[Trimestre] [char](45) NOT NULL,
	[Quincena] [char](45) NOT NULL,
	[QuincenaID] [nchar](10) NOT NULL,
	[Semestre] [char](45) NOT NULL,
	[Diasemana] [int] NOT NULL,
 CONSTRAINT [PK_DIM_TIEMPO] PRIMARY KEY CLUSTERED 
(
	[Tiempo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HECHO_VENTA]    Script Date: 03-12-2021 16:01:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HECHO_VENTA](
	[Cantidad] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Ingresos] [int] NOT NULL,
	[Id_tiempo] [int] NOT NULL,
	[Id_empleado] [int] NOT NULL,
	[Id_almacen] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_VENTA] PRIMARY KEY CLUSTERED 
(
	[Id_tiempo] ASC,
	[Id_empleado] ASC,
	[Id_almacen] ASC,
	[Id_producto] ASC,
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HECHO_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_HECHO_VENTA_DIM_ALMACEN] FOREIGN KEY([Id_almacen])
REFERENCES [dbo].[DIM_ALMACEN] ([id])
GO
ALTER TABLE [dbo].[HECHO_VENTA] CHECK CONSTRAINT [FK_HECHO_VENTA_DIM_ALMACEN]
GO
ALTER TABLE [dbo].[HECHO_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DIM_CLIENTE] FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[DIM_CLIENTE] ([id])
GO
ALTER TABLE [dbo].[HECHO_VENTA] CHECK CONSTRAINT [FK_VENTA_DIM_CLIENTE]
GO
ALTER TABLE [dbo].[HECHO_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DIM_EMPLEADOS] FOREIGN KEY([Id_empleado])
REFERENCES [dbo].[DIM_EMPLEADO] ([id])
GO
ALTER TABLE [dbo].[HECHO_VENTA] CHECK CONSTRAINT [FK_VENTA_DIM_EMPLEADOS]
GO
ALTER TABLE [dbo].[HECHO_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DIM_PRODUCTOS] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[DIM_PRODUCTO] ([id])
GO
ALTER TABLE [dbo].[HECHO_VENTA] CHECK CONSTRAINT [FK_VENTA_DIM_PRODUCTOS]
GO
ALTER TABLE [dbo].[HECHO_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DIM_TIEMPO] FOREIGN KEY([Id_tiempo])
REFERENCES [dbo].[DIM_TIEMPO] ([Tiempo_id])
GO
ALTER TABLE [dbo].[HECHO_VENTA] CHECK CONSTRAINT [FK_VENTA_DIM_TIEMPO]
GO

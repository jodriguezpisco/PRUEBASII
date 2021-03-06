USE [master]
GO
/****** Object:  Database [BDPRUEBASII]    Script Date: 31/12/2018 13:09:39 ******/
CREATE DATABASE [BDPRUEBASII]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDPRUEBASII', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BDPRUEBASII.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDPRUEBASII_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BDPRUEBASII_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDPRUEBASII] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDPRUEBASII].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDPRUEBASII] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BDPRUEBASII] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDPRUEBASII] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDPRUEBASII] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDPRUEBASII] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDPRUEBASII] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET RECOVERY FULL 
GO
ALTER DATABASE [BDPRUEBASII] SET  MULTI_USER 
GO
ALTER DATABASE [BDPRUEBASII] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDPRUEBASII] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDPRUEBASII] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDPRUEBASII] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BDPRUEBASII]
GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_CLIENTES]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGUE DE LOS CLIENTES  ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_CLIENTES]
AS
		BEGIN
			SELECT cli_id AS id,
			cli_nombre AS nombre,
			tdo_descripcion AS tipo_doc,
			cli_identificacion AS identificacion,
			cli_telefono AS telefono,
			cli_direccion AS direccion
			FROM adm_clientes
			INNER JOIN sys_tipos_documentos ON cli_tipo_doc = tdo_id
		END
GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_COMPANIAS]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGUE DE LAS COMPAÑIAS   ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_COMPANIAS]
AS
		BEGIN
			SELECT com_id AS id,
			com_nombre AS nombre,
			com_nit + '-' + com_dig_ver AS nit,
			com_telefono1 AS telefono1,
			com_telefono2 AS telefono2,
			com_direccion AS direccion,
			CONVERT(VARCHAR(15),CASE WHEN com_estado = 1 THEN 'Activa' ELSE 'INACTIVA' END) AS estado
			 FROM adm_companias
		END
GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_PRODUCTOS]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGUE DE LOS CLIENTES  ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_PRODUCTOS]
AS
		BEGIN
			SELECT pro_id AS id,
			pro_nombre AS nombre,
			pro_descripcion AS descripcion,
			pro_valor AS valor
			FROM adm_productos
		END
GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_TDOCS]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGAR TIPOS DE DOCUMENTOS COMBO ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_TDOCS]
AS
BEGIN 
	SELECT tdo_id AS id, tdo_descripcion AS descripcion  FROM sys_tipos_documentos
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_VENTAS_TOTAL_CLI]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGAR    ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_VENTAS_TOTAL_CLI]
AS
	BEGIN
		SELECT clp.clp_id AS id, 
		cli.cli_id AS idcli, 
		cli.cli_nombre AS nombre, 
		pro.pro_id AS idpro, 
		pro.pro_nombre AS descproducto
		FROM tra_cliente_producto clp
		INNER JOIN adm_clientes cli ON cli.cli_id = clp.clp_id_compania
		INNER JOIN adm_productos pro ON pro.pro_id = clp.clp_id_producto
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_VENTAS_TOTAL_COM]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGAR    ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_VENTAS_TOTAL_COM]
AS
	BEGIN
		SELECT cop.cop_id AS id, 
		com.com_id AS idcom, 
		com.com_nombre AS descCompania, 
		pro.pro_id AS idpro, 
		pro.pro_nombre AS descproducto
		FROM tra_compania_producto cop
		INNER JOIN adm_companias com ON com.com_id = cop.cop_id_compania
		INNER JOIN adm_productos pro ON pro.pro_id = cop.cop_id_producto
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_VENTAS_X_CLI]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGAR VENTAS X CLIENTE   ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_VENTAS_X_CLI]
@id Int
AS
	BEGIN
		SELECT clp.clp_id AS id, 
		pro.pro_id AS idpro, 
		pro.pro_nombre AS descproducto,
		pro.pro_descripcion AS descripcion,
		pro.pro_valor AS valor
		FROM tra_cliente_producto clp
		INNER JOIN adm_clientes cli ON cli.cli_id = clp.clp_id_compania
		INNER JOIN adm_productos pro ON pro.pro_id = clp.clp_id_producto
		WHERE cli.cli_id = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_CARGAR_VENTAS_X_COMPANIA]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 31-12-2018   --------------------------------------------------------*/
/*OBJETIVO: CARGAR VTAS X COMPÁÑIA   ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_CARGAR_VENTAS_X_COMPANIA]
@id Int
AS
	BEGIN
		SELECT cop.cop_id AS id,  
		pro.pro_id AS idpro, 
		pro.pro_nombre AS descproducto,
		pro.pro_descripcion AS descripcion,
		pro.pro_valor AS valor
		FROM tra_compania_producto cop
		INNER JOIN adm_companias com ON com.com_id = cop.cop_id_compania
		INNER JOIN adm_productos pro ON pro.pro_id = cop.cop_id_producto
		WHERE com.com_id = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TRANSAC_CLIENTES]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: TRANSACCIONES DE LOS CLIENTES    ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_TRANSAC_CLIENTES]
@Operacion Int,
@id Int,
@nombre varchar(50),
@tipo_doc Int,
@identificacion Varchar(50),
@telefono varchar(50),
@direccion varchar(50)
AS
BEGIN 
	IF @Operacion = 1
		BEGIN
			IF @id = 0 OR NOT EXISTS(SELECT cli_id FROM adm_clientes WHERE cli_id = @id)
				BEGIN
					INSERT INTO adm_clientes
					(cli_nombre,
					cli_tipo_doc,
					cli_identificacion,
					cli_telefono,
					cli_direccion,
					cli_fecha_creacion)
					VALUES
					(@nombre,
					@tipo_doc,
					@identificacion,
					@telefono,
					@direccion,
					GETDATE())
				END
			ELSE
				BEGIN
					UPDATE adm_clientes
					SET 
					cli_nombre = @nombre,
					cli_tipo_doc = @tipo_doc,
					cli_identificacion = @identificacion,
					cli_telefono = @telefono,
					cli_direccion = @direccion
					WHERE cli_id = @id
				END
		END

	ELSE IF @Operacion = 2
		BEGIN
			SELECT cli_id AS id,
			cli_nombre AS nombre,
			tdo_id AS idtdoc,
			tdo_descripcion AS tdocumento,
			cli_identificacion AS identi,
			cli_telefono AS telefono,
			cli_direccion AS direccion
			FROM adm_clientes
			INNER JOIN sys_tipos_documentos ON cli_tipo_doc = tdo_id
			WHERE cli_id = @id
		END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_TRANSAC_COMPANIAS]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: TRANSACCIONES DE LAS COMPAÑIAS   ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[SP_TRANSAC_COMPANIAS]
@Operacion Int,
@id Int,
@nombre varchar(250),
@nit varchar(10),
@dig_ver varchar(2),
@telefono1 varchar(10),
@telefono2 varchar(10),
@direccion varchar(50)
AS

BEGIN
	IF @Operacion = 1
		BEGIN
			IF @id = 0 OR NOT EXISTS(SELECT com_id FROM adm_companias WHERE com_id = @id)
				BEGIN
					INSERT INTO adm_companias
					(com_nombre,
					com_nit,
					com_dig_ver,
					com_telefono1,
					com_telefono2,
					com_direccion,
					com_estado,
					com_fecha_creacion)
					VALUES
					(@nombre,
					@nit,
					@dig_ver,
					@telefono1,
					@telefono2,
					@direccion,
					1,
					GETDATE())
				END
			ELSE
				BEGIN
					UPDATE adm_companias
					SET com_nombre = @nombre,
					com_nit = @nit,
					com_dig_ver = @dig_ver,
					com_telefono1 = @telefono1,
					com_telefono2 = @telefono2,
					com_direccion = @direccion
					WHERE com_id = @id
				END
			
		END

	ELSE IF @Operacion = 2
		BEGIN
			SELECT com_id AS id,
			com_nombre AS nombre,
			com_nit AS nit,
			com_dig_ver AS dve,
			com_telefono1 AS telefono1,
			com_telefono2 AS telefono2,
			com_direccion AS direccion,
			com_estado AS estado
			FROM adm_companias
			WHERE com_id = @id
		END

END


GO
/****** Object:  StoredProcedure [dbo].[SP_TRANSAC_PRODUCTOS]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: TRANSACCIONES DE LOS PRODUCTOS    ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_TRANSAC_PRODUCTOS]
@Operacion Int,
@id Int,
@nombre Varchar(150),
@descripcion Varchar(500),
@valor varchar(20)
AS
BEGIN
	IF @Operacion = 1
		BEGIN
			IF @id = 0 OR NOT EXISTS(SELECT pro_id FROM adm_productos WHERE pro_id = @id)
				BEGIN
					INSERT INTO adm_productos
					(pro_nombre,
					pro_descripcion,
					pro_valor,
					pro_estado,
					pro_fecha_creacion)
					VALUES
					(@nombre,
					@descripcion,
					@valor,
					1,
					GETDATE())
				END
			ELSE
				BEGIN
					UPDATE adm_productos
					SET pro_nombre = @nombre,
					pro_descripcion = @descripcion,
					pro_valor = @valor
					WHERE pro_id = @id
				END
		END
	ELSE IF @Operacion = 2
		BEGIN
			SELECT pro_id AS id,
			pro_nombre AS nombre,
			pro_descripcion AS descripcion,
			pro_valor AS valor
			FROM adm_productos
			WHERE pro_id = @id
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TRANSAC_VENTAS_CLIENTES]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 31-12-2018   --------------------------------------------------------*/
/*OBJETIVO: TRANSACCIONES DE LAS VENTAS X CLIENTES   ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_TRANSAC_VENTAS_CLIENTES]
@Operacion Int,
@id Int,
@id_compania Int,
@id_producto Int

AS

BEGIN
	IF @Operacion = 1
		BEGIN
			IF @id = 0 OR NOT EXISTS(SELECT clp_id FROM tra_cliente_producto WHERE clp_id = @id)
				BEGIN
					INSERT INTO tra_cliente_producto
					(clp_id_compania,
					clp_id_producto,
					clp_fecha_gestion)
					VALUES
					(@id_compania,
					@id_producto,
					GETDATE())
				END
			ELSE
				BEGIN
					UPDATE tra_cliente_producto
					SET
					clp_id_compania = @id_compania,
					clp_id_producto = @id_producto
					WHERE clp_id = @id
				END
		END
	ELSE IF @Operacion = 2
		BEGIN
			SELECT clp.clp_id AS id, 
			cli.cli_id AS idcli, 
			cli.cli_nombre AS nombre, 
			pro.pro_id AS idpro, 
			pro.pro_nombre AS descproducto
			FROM tra_cliente_producto clp
			INNER JOIN adm_clientes cli ON cli.cli_id = clp.clp_id_compania
			INNER JOIN adm_productos pro ON pro.pro_id = clp.clp_id_producto
			WHERE clp_id = @id
		END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_TRANSAC_VENTAS_COMPANIAS]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 30-12-2018   --------------------------------------------------------*/
/*OBJETIVO: TRANSACCIONES DE LAS VENTAS    ---------------------------------*/
/*EXEC:    ----------------------------*/
/*----------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[SP_TRANSAC_VENTAS_COMPANIAS]
@Operacion Int,
@id Int,
@id_compania Int,
@id_producto Int

AS

BEGIN
	IF @Operacion = 1
		BEGIN
			IF @id = 0 OR NOT EXISTS(SELECT cop_id FROM tra_compania_producto WHERE cop_id = @id)
				BEGIN
					INSERT INTO tra_compania_producto
					(cop_id_compania,
					cop_id_producto,
					cop_fecha_gestion)
					VALUES
					(@id_compania,
					@id_producto,
					GETDATE())
				END
			ELSE
				BEGIN
					UPDATE tra_compania_producto
					SET
					cop_id_compania = @id_compania,
					cop_id_producto = @id_producto
					WHERE cop_id = @id
				END
		END
	ELSE IF @Operacion = 2
		BEGIN
			SELECT cop.cop_id AS id, 
			com.com_id AS idcom, 
			com.com_nombre AS descCompania, 
			pro.pro_id AS idpro, 
			pro.pro_nombre AS descproducto
			FROM tra_compania_producto cop
			INNER JOIN adm_companias com ON com.com_id = cop.cop_id_compania
			INNER JOIN adm_productos pro ON pro.pro_id = cop.cop_id_producto
			WHERE cop_id = @id
		END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_USUARIO]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----------------------------------------------------------------------------*/
/*AUTOR: JUAN RODRIGUEZ   ----------------------------------------------------*/
/*FECHA: 29-12-2018   --------------------------------------------------------*/
/*OBJETIVO: VALIDAR EL USUARIO QUE SE LOGUEA   -------------------------------*/
/*EXEC: SP_VALIDAR_USUARIO 'admin','Fidji1987*'   ----------------------------*/
/*----------------------------------------------------------------------------*/


CREATE PROCEDURE [dbo].[SP_VALIDAR_USUARIO]

@usuario varchar(50),
@clave varchar(50)
AS
BEGIN
	SELECT usu_id AS id, usu_usuario AS usuario, usu_clave AS clave, usu_nombre nombre FROM adm_usuarios
	WHERE usu_usuario=@usuario AND usu_clave=@clave AND usu_estado=1
END






GO
/****** Object:  Table [dbo].[adm_clientes]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adm_clientes](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_nombre] [varchar](50) NOT NULL,
	[cli_tipo_doc] [int] NOT NULL,
	[cli_identificacion] [varchar](20) NOT NULL,
	[cli_telefono] [varchar](20) NOT NULL,
	[cli_direccion] [varchar](50) NOT NULL,
	[cli_fecha_creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_adm_clientes] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adm_companias]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adm_companias](
	[com_id] [int] IDENTITY(1,1) NOT NULL,
	[com_nombre] [varchar](250) NOT NULL,
	[com_nit] [varchar](10) NOT NULL,
	[com_dig_ver] [varchar](2) NOT NULL,
	[com_telefono1] [varchar](10) NOT NULL,
	[com_telefono2] [varchar](10) NULL,
	[com_direccion] [varchar](50) NOT NULL,
	[com_estado] [int] NOT NULL,
	[com_fecha_creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_adm_companias] PRIMARY KEY CLUSTERED 
(
	[com_id] ASC,
	[com_nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adm_productos]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adm_productos](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_nombre] [varchar](150) NOT NULL,
	[pro_descripcion] [varchar](500) NOT NULL,
	[pro_valor] [varchar](20) NOT NULL,
	[pro_estado] [int] NOT NULL,
	[pro_fecha_creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_adm_productos] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adm_usuarios]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adm_usuarios](
	[usu_id] [int] IDENTITY(1,1) NOT NULL,
	[usu_usuario] [varchar](50) NOT NULL,
	[usu_clave] [varchar](50) NOT NULL,
	[usu_nombre] [varchar](150) NOT NULL,
	[usu_identificacion] [varchar](15) NOT NULL,
	[usu_estado] [int] NOT NULL,
	[usu_fecha_creacion] [datetime] NOT NULL,
 CONSTRAINT [PK_adm_usuarios] PRIMARY KEY CLUSTERED 
(
	[usu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_tipos_documentos]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_tipos_documentos](
	[tdo_id] [int] IDENTITY(1,1) NOT NULL,
	[tdo_descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sys_tipos_documentos] PRIMARY KEY CLUSTERED 
(
	[tdo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tra_cliente_producto]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tra_cliente_producto](
	[clp_id] [int] IDENTITY(1,1) NOT NULL,
	[clp_id_compania] [int] NOT NULL,
	[clp_id_producto] [int] NOT NULL,
	[clp_fecha_gestion] [datetime] NOT NULL,
 CONSTRAINT [PK_tra_cliente_producto] PRIMARY KEY CLUSTERED 
(
	[clp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tra_compania_producto]    Script Date: 31/12/2018 13:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tra_compania_producto](
	[cop_id] [int] IDENTITY(1,1) NOT NULL,
	[cop_id_compania] [int] NOT NULL,
	[cop_id_producto] [int] NOT NULL,
	[cop_fecha_gestion] [datetime] NOT NULL,
 CONSTRAINT [PK_tra_compania_producto] PRIMARY KEY CLUSTERED 
(
	[cop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[adm_clientes] ON 

GO
INSERT [dbo].[adm_clientes] ([cli_id], [cli_nombre], [cli_tipo_doc], [cli_identificacion], [cli_telefono], [cli_direccion], [cli_fecha_creacion]) VALUES (1, N'CLIENTE DE PRUEBA 1', 1, N'1019017852', N'3005663123', N'DG 6 B 0-31', CAST(N'2018-12-31 13:00:26.280' AS DateTime))
GO
INSERT [dbo].[adm_clientes] ([cli_id], [cli_nombre], [cli_tipo_doc], [cli_identificacion], [cli_telefono], [cli_direccion], [cli_fecha_creacion]) VALUES (2, N'CLIENTE DE PRUEBA 2', 4, N'ES-2367845', N'+573005668941', N'TV 56 56-78 ESTE', CAST(N'2018-12-31 13:01:13.043' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[adm_clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[adm_companias] ON 

GO
INSERT [dbo].[adm_companias] ([com_id], [com_nombre], [com_nit], [com_dig_ver], [com_telefono1], [com_telefono2], [com_direccion], [com_estado], [com_fecha_creacion]) VALUES (1, N'EMPRESA DE PRUEBA 1', N'900800700', N'1', N'2336985', N'', N'CLL 100 69-89', 1, CAST(N'2018-12-31 12:59:07.643' AS DateTime))
GO
INSERT [dbo].[adm_companias] ([com_id], [com_nombre], [com_nit], [com_dig_ver], [com_telefono1], [com_telefono2], [com_direccion], [com_estado], [com_fecha_creacion]) VALUES (2, N'EMPRESA DE PRUEBA 2', N'900600500', N'2', N'2337412', N'1235678', N'CLL 80 89-41', 1, CAST(N'2018-12-31 12:59:47.690' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[adm_companias] OFF
GO
SET IDENTITY_INSERT [dbo].[adm_productos] ON 

GO
INSERT [dbo].[adm_productos] ([pro_id], [pro_nombre], [pro_descripcion], [pro_valor], [pro_estado], [pro_fecha_creacion]) VALUES (1, N'PRODUCTO DE PRUEBA 1', N'PRODUCTO DE PRUEBA  1 PARA LA PRESENTACION DE LA PRUEBA SII', N'1500000', 1, CAST(N'2018-12-31 13:04:15.860' AS DateTime))
GO
INSERT [dbo].[adm_productos] ([pro_id], [pro_nombre], [pro_descripcion], [pro_valor], [pro_estado], [pro_fecha_creacion]) VALUES (2, N'PRODUCTO DE PRUEBA 2', N'PRODUCTO DE PRUEBA 2 PARA LA PRESENTACION DE LA PRUEBA SII 2', N'2652000', 1, CAST(N'2018-12-31 13:04:25.713' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[adm_productos] OFF
GO
SET IDENTITY_INSERT [dbo].[adm_usuarios] ON 

GO
INSERT [dbo].[adm_usuarios] ([usu_id], [usu_usuario], [usu_clave], [usu_nombre], [usu_identificacion], [usu_estado], [usu_fecha_creacion]) VALUES (1, N'admin', N'Fidji1987*', N'Juan Rodriguez', N'1019017553', 1, CAST(N'2018-12-29 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[adm_usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[sys_tipos_documentos] ON 

GO
INSERT [dbo].[sys_tipos_documentos] ([tdo_id], [tdo_descripcion]) VALUES (1, N'Cedula Ciudadania')
GO
INSERT [dbo].[sys_tipos_documentos] ([tdo_id], [tdo_descripcion]) VALUES (2, N'Registro Civil')
GO
INSERT [dbo].[sys_tipos_documentos] ([tdo_id], [tdo_descripcion]) VALUES (3, N'Tarjeta de Identidad')
GO
INSERT [dbo].[sys_tipos_documentos] ([tdo_id], [tdo_descripcion]) VALUES (4, N'Pasaporte')
GO
INSERT [dbo].[sys_tipos_documentos] ([tdo_id], [tdo_descripcion]) VALUES (5, N'Visa')
GO
SET IDENTITY_INSERT [dbo].[sys_tipos_documentos] OFF
GO
SET IDENTITY_INSERT [dbo].[tra_cliente_producto] ON 

GO
INSERT [dbo].[tra_cliente_producto] ([clp_id], [clp_id_compania], [clp_id_producto], [clp_fecha_gestion]) VALUES (1, 1, 2, CAST(N'2018-12-31 13:05:10.320' AS DateTime))
GO
INSERT [dbo].[tra_cliente_producto] ([clp_id], [clp_id_compania], [clp_id_producto], [clp_fecha_gestion]) VALUES (2, 2, 1, CAST(N'2018-12-31 13:05:20.607' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tra_cliente_producto] OFF
GO
SET IDENTITY_INSERT [dbo].[tra_compania_producto] ON 

GO
INSERT [dbo].[tra_compania_producto] ([cop_id], [cop_id_compania], [cop_id_producto], [cop_fecha_gestion]) VALUES (1, 1, 2, CAST(N'2018-12-31 13:04:40.837' AS DateTime))
GO
INSERT [dbo].[tra_compania_producto] ([cop_id], [cop_id_compania], [cop_id_producto], [cop_fecha_gestion]) VALUES (2, 2, 1, CAST(N'2018-12-31 13:04:48.950' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tra_compania_producto] OFF
GO
USE [master]
GO
ALTER DATABASE [BDPRUEBASII] SET  READ_WRITE 
GO

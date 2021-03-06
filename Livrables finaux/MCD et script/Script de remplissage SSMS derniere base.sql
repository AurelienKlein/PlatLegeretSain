USE [master]
GO
/****** Object:  Database [ProjetPLS]    Script Date: 09/12/2018 13:01:22 ******/
CREATE DATABASE [ProjetPLS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjetPLS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProjetPLS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjetPLS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProjetPLS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProjetPLS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjetPLS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjetPLS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjetPLS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjetPLS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjetPLS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjetPLS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjetPLS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjetPLS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjetPLS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjetPLS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjetPLS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjetPLS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjetPLS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjetPLS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjetPLS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjetPLS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjetPLS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjetPLS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjetPLS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjetPLS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjetPLS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjetPLS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjetPLS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjetPLS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjetPLS] SET  MULTI_USER 
GO
ALTER DATABASE [ProjetPLS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjetPLS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjetPLS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjetPLS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjetPLS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjetPLS] SET QUERY_STORE = OFF
GO
USE [ProjetPLS]
GO
/****** Object:  Table [dbo].[Chambre_Froide]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chambre_Froide](
	[ID_Frigo] [int] IDENTITY(1,1) NOT NULL,
	[Date_Ajout_Frigo] [date] NULL,
	[Quantite_Frigo] [int] NULL,
	[ID_Ingredient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Frigo] ASC,
	[ID_Ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID_Client] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Client] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commande](
	[ID_Recette] [int] NOT NULL,
	[ID_Client] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Recette] ASC,
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Composer]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Composer](
	[Quantite_Ingredient_Recette] [int] NULL,
	[ID_Recette] [int] NOT NULL,
	[ID_Ingredient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Recette] ASC,
	[ID_Ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concerner]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concerner](
	[ID_Client] [int] NOT NULL,
	[ID_Table] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC,
	[ID_Table] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Congelateur]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Congelateur](
	[ID_Congelateur] [int] IDENTITY(1,1) NOT NULL,
	[Date_Ajout_Congelateur] [date] NULL,
	[Quantite_Congelateur] [int] NULL,
	[ID_Ingredient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Congelateur] ASC,
	[ID_Ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emplacement]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emplacement](
	[ID_Table] [int] IDENTITY(1,1) NOT NULL,
	[Nb_chaise] [int] NULL,
	[Rang] [int] NULL,
	[Etat] [bit] NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
	[Orientation] [bit] NULL,
	[carre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Table] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[ID_Ingredient] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Ingredient] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outils]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outils](
	[ID_Outils] [int] IDENTITY(1,1) NOT NULL,
	[Type_Outils] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Outils] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recette]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recette](
	[Titre_Recette] [varchar](255) NULL,
	[ID_Recette] [int] IDENTITY(1,1) NOT NULL,
	[Categorie] [varchar](255) NULL,
	[Tps_Prep] [int] NULL,
	[Portion] [int] NULL,
	[Nb_Personnes] [int] NULL,
	[Tps_Repos] [int] NULL,
	[Tps_Cuisson] [int] NULL,
	[Accompagnement] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Recette] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserve]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserve](
	[ID_Reserve] [int] IDENTITY(1,1) NOT NULL,
	[Date_Ajout_Reserve] [date] NULL,
	[Quantite_Reserve] [int] NULL,
	[ID_Ingredient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reserve] ASC,
	[ID_Ingredient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock_Outils]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Outils](
	[ID_Stock] [int] IDENTITY(1,1) NOT NULL,
	[Quantite_Propre] [int] NULL,
	[Quantite_Lavage] [int] NULL,
	[Quantite_Sale] [int] NULL,
	[Quantite_Utilise] [int] NULL,
	[ID_Outils] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilise]    Script Date: 09/12/2018 13:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilise](
	[Quantite_Outils_Recette] [int] NULL,
	[ID_Recette] [int] NOT NULL,
	[ID_Outils] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Recette] ASC,
	[ID_Outils] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chambre_Froide] ON 

INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (1, CAST(N'2018-12-06' AS Date), 100, 2)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (2, CAST(N'2018-12-06' AS Date), 100, 9)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (3, CAST(N'2018-12-06' AS Date), 100, 10)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (4, CAST(N'2018-12-06' AS Date), 100, 20)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (5, CAST(N'2018-12-06' AS Date), 100, 21)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (6, CAST(N'2018-12-06' AS Date), 100, 22)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (7, CAST(N'2018-12-06' AS Date), 100, 25)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (8, CAST(N'2018-12-06' AS Date), 100, 28)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (9, CAST(N'2018-12-06' AS Date), 100, 29)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (10, CAST(N'2018-12-06' AS Date), 100, 31)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (11, CAST(N'2018-12-06' AS Date), 100, 33)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (12, CAST(N'2018-12-06' AS Date), 100, 34)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (13, CAST(N'2018-12-06' AS Date), 100, 35)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (14, CAST(N'2018-12-06' AS Date), 100, 36)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (15, CAST(N'2018-12-06' AS Date), 100, 39)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (16, CAST(N'2018-12-06' AS Date), 100, 40)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (17, CAST(N'2018-12-06' AS Date), 100, 42)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (18, CAST(N'2018-12-06' AS Date), 100, 43)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (19, CAST(N'2018-12-06' AS Date), 100, 44)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (21, CAST(N'2018-12-06' AS Date), 100, 52)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (22, CAST(N'2018-12-06' AS Date), 100, 53)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (23, CAST(N'2018-12-06' AS Date), 100, 56)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (24, CAST(N'2018-12-06' AS Date), 100, 59)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (26, CAST(N'2018-12-06' AS Date), 100, 61)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (27, CAST(N'2018-12-06' AS Date), 100, 62)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (28, CAST(N'2018-12-06' AS Date), 100, 63)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (31, CAST(N'2018-12-06' AS Date), 100, 66)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (32, CAST(N'2018-12-06' AS Date), 100, 71)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (33, CAST(N'2018-12-06' AS Date), 100, 77)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (34, CAST(N'2018-12-06' AS Date), 100, 79)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (35, CAST(N'2018-12-06' AS Date), 100, 84)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (36, CAST(N'2018-12-06' AS Date), 100, 85)
INSERT [dbo].[Chambre_Froide] ([ID_Frigo], [Date_Ajout_Frigo], [Quantite_Frigo], [ID_Ingredient]) VALUES (37, CAST(N'2018-12-06' AS Date), 100, 30)
SET IDENTITY_INSERT [dbo].[Chambre_Froide] OFF
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 1, 9)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 1, 13)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 1, 15)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 1, 22)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 1, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 1, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 1, 50)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 1, 51)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 1, 54)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 1, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 1, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 2, 22)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 2, 31)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 2, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 2, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 2, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 1)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 18)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 38)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (6, 3, 52)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 54)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 3, 58)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 60)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 61)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 65)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 3, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 4, 1)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (10, 4, 10)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 4, 16)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 4, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 4, 32)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 4, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 4, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 4, 74)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 4, 77)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 4, 78)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 5, 4)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 5, 7)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 5, 11)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 5, 22)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 5, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 5, 73)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 5, 78)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 5, 84)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 17)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 32)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 47)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 57)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 71)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 6, 74)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 7, 2)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 7, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 7, 34)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 7, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 7, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 7, 67)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 8, 10)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 8, 29)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 8, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 8, 63)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 8, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 8, 72)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 9, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 9, 34)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (5, 9, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 9, 67)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 2)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 11)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 10, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 31)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 34)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 50)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 10, 70)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 22)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 28)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 34)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 11, 36)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 43)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 11, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 50)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 11, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 12, 34)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (12, 12, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 12, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 12, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 12, 79)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 12, 80)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 13, 22)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 13, 32)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 13, 41)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 13, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 13, 53)
GO
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 13, 74)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (7, 14, 1)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 8)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 14, 25)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 32)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 33)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 51)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 14, 54)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 55)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 14, 71)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 73)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 14, 81)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 14, 82)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 15, 7)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 15, 8)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 15, 11)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 15, 19)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 15, 23)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 15, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 15, 53)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 15, 55)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 15, 78)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 2)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 16)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 25)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 32)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 16, 40)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 16, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 51)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 59)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 16, 83)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 17, 1)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 4)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 10)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 16)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 17, 20)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 17, 24)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 17, 25)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 27)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 30)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 33)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 51)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 17, 71)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 17, 75)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (24, 18, 3)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 18, 5)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 18, 6)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 18, 39)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 18, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 18, 68)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 18, 69)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 19, 2)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 19, 15)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 19, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 19, 37)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 19, 41)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 19, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 19, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 19, 67)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 20, 15)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 20, 17)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 20, 22)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 20, 42)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 20, 56)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 20, 64)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 20, 66)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 21, 21)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 21, 34)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (6, 21, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 21, 67)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 21, 68)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 21, 69)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 22, 2)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (5, 22, 28)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (8, 22, 33)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 22, 42)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (8, 22, 47)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 22, 58)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 22, 85)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 23, 16)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 23, 24)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 23, 42)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (10, 23, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 23, 45)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 23, 52)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (6, 23, 58)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 23, 76)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (4, 23, 77)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 24, 2)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 24, 26)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (3, 24, 44)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (2, 24, 67)
INSERT [dbo].[Composer] ([Quantite_Ingredient_Recette], [ID_Recette], [ID_Ingredient]) VALUES (1, 24, 69)
GO
SET IDENTITY_INSERT [dbo].[Congelateur] ON 

INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (1, CAST(N'2018-12-06' AS Date), 100, 18)
INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (2, CAST(N'2018-12-06' AS Date), 100, 60)
INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (3, CAST(N'2018-12-06' AS Date), 100, 64)
INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (4, CAST(N'2018-12-06' AS Date), 100, 65)
INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (5, CAST(N'2018-12-06' AS Date), 100, 70)
INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (6, CAST(N'2018-12-06' AS Date), 100, 23)
INSERT [dbo].[Congelateur] ([ID_Congelateur], [Date_Ajout_Congelateur], [Quantite_Congelateur], [ID_Ingredient]) VALUES (7, CAST(N'2018-12-06' AS Date), 100, 38)
SET IDENTITY_INSERT [dbo].[Congelateur] OFF
SET IDENTITY_INSERT [dbo].[Emplacement] ON 

INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (1, 8, 1, 1, 388, 120, 0, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (2, 2, 1, 1, 484, 74, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (3, 10, 1, 1, 664, 72, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (4, 2, 1, 1, 846, 72, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (5, 6, 1, 1, 978, 100, 0, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (6, 6, 1, 1, 526, 188, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (7, 2, 1, 1, 634, 188, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (8, 8, 1, 1, 778, 188, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (9, 4, 1, 1, 390, 310, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (10, 4, 2, 1, 390, 410, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (11, 2, 2, 1, 488, 360, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (12, 6, 2, 1, 606, 360, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (13, 4, 2, 1, 744, 360, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (14, 2, 2, 1, 838, 360, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (15, 4, 2, 1, 978, 282, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (16, 4, 2, 1, 978, 412, 1, 1)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (17, 4, 1, 1, 382, 600, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (18, 4, 1, 1, 382, 700, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (19, 2, 1, 1, 480, 650, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (20, 6, 1, 1, 598, 650, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (21, 4, 1, 1, 738, 650, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (22, 2, 1, 1, 830, 650, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (23, 4, 1, 1, 970, 600, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (24, 4, 1, 1, 970, 700, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (25, 8, 2, 1, 380, 884, 0, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (26, 6, 2, 1, 518, 822, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (27, 2, 2, 1, 628, 822, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (28, 8, 2, 1, 770, 822, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (29, 8, 2, 1, 962, 890, 0, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (30, 2, 2, 1, 480, 936, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (31, 10, 2, 1, 658, 936, 1, 2)
INSERT [dbo].[Emplacement] ([ID_Table], [Nb_chaise], [Rang], [Etat], [X], [Y], [Orientation], [carre]) VALUES (32, 2, 2, 1, 840, 936, 1, 2)
SET IDENTITY_INSERT [dbo].[Emplacement] OFF
SET IDENTITY_INSERT [dbo].[Ingredient] ON 

INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (1, N'ail')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (2, N'beurre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (3, N'biscuit')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (4, N'bouquet garnit')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (5, N'cacao amer')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (6, N'cafe noir')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (7, N'carotte')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (8, N'celeri')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (9, N'chair de crabe')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (10, N'chair a saucisse')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (11, N'champignons de paris')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (12, N'champignons chinois')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (13, N'chapelure')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (14, N'ciboulette')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (15, N'citron')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (16, N'concentre de tomates')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (17, N'concombre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (18, N'congre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (19, N'coriandre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (20, N'couenne de porc')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (21, N'creme epaisse')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (22, N'creme fraiche')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (23, N'crevette')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (24, N'echalotte')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (25, N'escargot')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (26, N'farine')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (27, N'fenouil')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (28, N'fromage rape')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (29, N'gorge de porc')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (30, N'graisse d''oie')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (31, N'gruyere')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (32, N'huile d''olive')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (33, N'jambon')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (34, N'lait')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (35, N'langue d''oiseau')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (36, N'lardons')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (37, N'levure')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (38, N'lotte')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (39, N'mascarpone')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (40, N'merguez')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (41, N'miel')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (42, N'moutarde')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (43, N'muscade')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (44, N'oeuf')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (45, N'oignon')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (46, N'oignon vert')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (47, N'pain rassi')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (48, N'pate a pain')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (49, N'pate brisee')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (50, N'pate feuilletee')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (51, N'persil')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (52, N'petit crabe')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (53, N'pilon de poulet')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (54, N'piment')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (55, N'poireau')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (56, N'poivre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (57, N'poivron')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (58, N'pomme de terre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (59, N'raz el amout')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (60, N'rouget grondin')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (61, N'saindoux')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (62, N'salade')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (63, N'sanglier')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (64, N'saumon')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (65, N'seiche')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (66, N'sel')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (67, N'sucre en poudre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (68, N'sucre roux')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (69, N'sucre vanille')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (70, N'thon')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (71, N'tomate')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (72, N'ventreche')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (73, N'vin blanc sec')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (74, N'vinaigre')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (75, N'vinaigre blanc')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (76, N'vinaigrette')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (77, N'boeuf')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (78, N'bouillon')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (79, N'poitrine de porc')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (80, N'foie')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (81, N'feuille de lauriet')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (82, N'amande')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (83, N'colorant')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (84, N'veau')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (85, N'biere')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (86, N'chocolat')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (87, N'rhum')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (88, N'pomme')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (89, N'brioche')
INSERT [dbo].[Ingredient] ([ID_Ingredient], [Nom_Ingredient]) VALUES (90, N'calvados')
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
SET IDENTITY_INSERT [dbo].[Outils] ON 

INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (3, N'feux de cuisson')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (4, N'casseroles')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (5, N'poeles')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (6, N'four')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (7, N'cuilleres en bois')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (8, N'mixeur')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (9, N'bols a salade')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (10, N'autocuiseur')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (11, N'presse agrumes')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (12, N'tamis')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (13, N'entonnoir')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (14, N'couteaux de cuisine')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (15, N'frigo')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (16, N'lave-vaisselle')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (17, N'machine a laver')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (18, N'evier')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (19, N'ramequin')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (33, N'cocotte')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (34, N'bol')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (35, N'faitout')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (36, N'gauffrier')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (37, N'crepiere')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (38, N'moule a tarte')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (39, N'fourchette de cuisine')
INSERT [dbo].[Outils] ([ID_Outils], [Type_Outils]) VALUES (40, N'rouleau')
SET IDENTITY_INSERT [dbo].[Outils] OFF
SET IDENTITY_INSERT [dbo].[Recette] ON 

INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'feuillete de crabe', 1, N'entree', 10, 0, 4, 0, 20, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'oeuf cocotte', 2, N'entree', 10, 0, 4, 0, 5, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'bouillinade de poisson', 3, N'plat', 10, 0, 4, 0, 20, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'boles de picoulats', 4, N'plat', 10, 0, 25, 0, 120, N'pomme de terre')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'blanquette de veau', 5, N'plat', 10, 0, 5, 0, 120, N'riz')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'gaspatcho', 6, N'entree', 0, 0, 1, 0, 0, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'gauffres', 7, N'dessert', 20, 0, 1, 0, 120, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'pate de sanglier', 8, N'entree', 20, 0, 1, 120, 120, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'crepes', 9, N'dessert', 10, 0, 1, 60, 0, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'tarte au thoon', 10, N'entree', 10, 0, 6, 0, 20, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'quiche loraine', 11, N'entree', 15, 0, 6, 0, 35, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'pate de porc', 12, N'entree', 60, 0, 1, 0, 180, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'blanc de poulet a la creme et au miel', 13, N'plat', 5, 0, 2, 0, 10, N'riz')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'escragots a la catalane', 14, N'plat', 90, 0, 4, 0, 60, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'soupe chinoise', 15, N'entree', 15, 0, 4, 0, 30, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'chorba', 16, N'plat', 15, 0, 4, 0, 70, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'cagouilles a la charantaise', 17, N'entree', 30, 0, 4, 0, 210, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'tiramisu', 18, N'dessert', 10, 0, 4, 60, 0, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'madeleine au mie', 19, N'dessert', 15, 0, 1, 0, 5, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'tagliatelle de concombre au saumon fumee', 20, N'entree', 20, 0, 4, 0, 0, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'creme brulee', 21, N'dessert', 10, 0, 1, 120, 0, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'welsch', 22, N'plat', 35, 0, 10, 0, 20, N'frite')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'steack tartare', 23, N'plat', 20, 0, 1, 0, 0, N'frite')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'moelleux au chocolat', 24, N'dessert', 20, 0, 1, 0, 10, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'galette frangipane', 25, N'dessert', 20, 0, 6, 0, 35, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'crumble aux pommes', 26, N'dessert', 25, 0, 8, 120, 25, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'pomme au four', 27, N'dessert', 10, 0, 6, 0, 15, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'tarte flamande', 28, N'dessert', 20, 0, 6, 0, 30, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'flammenkuche', 29, N'plat', 10, 0, 6, 0, 8, N'rien')
INSERT [dbo].[Recette] ([Titre_Recette], [ID_Recette], [Categorie], [Tps_Prep], [Portion], [Nb_Personnes], [Tps_Repos], [Tps_Cuisson], [Accompagnement]) VALUES (N'quiche aux poireaux', 30, N'plat', 15, 0, 8, 0, 30, N'rien')
SET IDENTITY_INSERT [dbo].[Recette] OFF
SET IDENTITY_INSERT [dbo].[Reserve] ON 

INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (1, CAST(N'2018-12-06' AS Date), 100, 1)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (4, CAST(N'2018-12-06' AS Date), 100, 3)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (5, CAST(N'2018-12-06' AS Date), 100, 4)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (6, CAST(N'2018-12-06' AS Date), 100, 5)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (7, CAST(N'2018-12-06' AS Date), 100, 6)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (8, CAST(N'2018-12-06' AS Date), 100, 7)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (9, CAST(N'2018-12-06' AS Date), 100, 8)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (10, CAST(N'2018-12-06' AS Date), 100, 11)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (11, CAST(N'2018-12-06' AS Date), 100, 12)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (12, CAST(N'2018-12-06' AS Date), 100, 13)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (13, CAST(N'2018-12-06' AS Date), 100, 14)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (14, CAST(N'2018-12-06' AS Date), 100, 15)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (15, CAST(N'2018-12-06' AS Date), 100, 16)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (16, CAST(N'2018-12-06' AS Date), 100, 17)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (17, CAST(N'2018-12-06' AS Date), 100, 19)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (18, CAST(N'2018-12-06' AS Date), 100, 24)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (19, CAST(N'2018-12-06' AS Date), 100, 26)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (20, CAST(N'2018-12-06' AS Date), 100, 27)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (21, CAST(N'2018-12-06' AS Date), 100, 32)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (22, CAST(N'2018-12-06' AS Date), 100, 37)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (23, CAST(N'2018-12-06' AS Date), 100, 41)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (24, CAST(N'2018-12-06' AS Date), 100, 45)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (25, CAST(N'2018-12-06' AS Date), 100, 46)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (26, CAST(N'2018-12-06' AS Date), 100, 47)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (27, CAST(N'2018-12-06' AS Date), 100, 48)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (28, CAST(N'2018-12-06' AS Date), 100, 49)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (29, CAST(N'2018-12-06' AS Date), 100, 50)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (30, CAST(N'2018-12-06' AS Date), 100, 51)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (31, CAST(N'2018-12-06' AS Date), 100, 54)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (32, CAST(N'2018-12-06' AS Date), 100, 55)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (33, CAST(N'2018-12-06' AS Date), 100, 57)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (34, CAST(N'2018-12-06' AS Date), 100, 58)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (35, CAST(N'2018-12-06' AS Date), 100, 67)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (36, CAST(N'2018-12-06' AS Date), 100, 68)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (37, CAST(N'2018-12-06' AS Date), 100, 69)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (38, CAST(N'2018-12-06' AS Date), 100, 72)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (39, CAST(N'2018-12-06' AS Date), 100, 73)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (40, CAST(N'2018-12-06' AS Date), 100, 74)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (41, CAST(N'2018-12-06' AS Date), 100, 75)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (42, CAST(N'2018-12-06' AS Date), 100, 76)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (43, CAST(N'2018-12-06' AS Date), 100, 78)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (44, CAST(N'2018-12-06' AS Date), 100, 80)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (45, CAST(N'2018-12-06' AS Date), 100, 82)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (46, CAST(N'2018-12-06' AS Date), 100, 83)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (47, CAST(N'2018-12-06' AS Date), 100, 86)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (48, CAST(N'2018-12-06' AS Date), 100, 87)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (49, CAST(N'2018-12-06' AS Date), 100, 88)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (50, CAST(N'2018-12-06' AS Date), 100, 89)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (51, CAST(N'2018-12-06' AS Date), 100, 90)
INSERT [dbo].[Reserve] ([ID_Reserve], [Date_Ajout_Reserve], [Quantite_Reserve], [ID_Ingredient]) VALUES (52, CAST(N'2018-12-06' AS Date), 100, 81)
SET IDENTITY_INSERT [dbo].[Reserve] OFF
SET IDENTITY_INSERT [dbo].[Stock_Outils] ON 

INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (1, 5, 0, 0, 0, 3)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (2, 10, 0, 0, 0, 4)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (3, 10, 0, 0, 0, 5)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (4, 1, 0, 0, 0, 6)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (5, 10, 0, 0, 0, 7)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (6, 1, 0, 0, 0, 8)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (7, 5, 0, 0, 0, 9)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (8, 2, 0, 0, 0, 10)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (9, 1, 0, 0, 0, 11)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (10, 1, 0, 0, 0, 12)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (11, 1, 0, 0, 0, 13)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (12, 5, 0, 0, 0, 14)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (13, 1, 0, 0, 0, 15)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (14, 1, 0, 0, 0, 16)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (15, 1, 0, 0, 0, 17)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (16, 1, 0, 0, 0, 18)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (17, 10, 0, 0, 0, 19)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (18, 3, 0, 0, 0, 33)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (19, 10, 0, 0, 0, 34)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (20, 5, 0, 0, 0, 35)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (21, 1, 0, 0, 0, 36)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (22, 1, 0, 0, 0, 37)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (23, 5, 0, 0, 0, 38)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (24, 10, 0, 0, 0, 39)
INSERT [dbo].[Stock_Outils] ([ID_Stock], [Quantite_Propre], [Quantite_Lavage], [Quantite_Sale], [Quantite_Utilise], [ID_Outils]) VALUES (25, 3, 0, 0, 0, 40)
SET IDENTITY_INSERT [dbo].[Stock_Outils] OFF
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 1, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 1, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 2, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 2, 19)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 3, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 3, 33)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 4, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 4, 8)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 4, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 4, 35)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (2, 5, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 5, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 5, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 5, 33)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 5, 34)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 6, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 6, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 6, 15)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 7, 36)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 8, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 8, 19)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 8, 35)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 9, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 9, 37)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 10, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 10, 7)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 10, 19)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 7)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 38)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 11, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 12, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 12, 4)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 12, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 12, 19)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 12, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 13, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 13, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 13, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 13, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (2, 14, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 14, 7)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 14, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (2, 14, 33)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 15, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 15, 33)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 16, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 16, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 16, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 16, 34)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 16, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (2, 17, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 17, 4)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 17, 7)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 17, 33)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 18, 15)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 18, 34)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 18, 38)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 18, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 19, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 19, 38)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 19, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 20, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 20, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 20, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 21, 4)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 21, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 21, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (4, 21, 19)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 21, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 22, 3)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 22, 5)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 22, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 22, 7)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 22, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 22, 19)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 23, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 23, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 23, 15)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 23, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (2, 24, 4)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 24, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 24, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 24, 38)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 25, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 25, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 25, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 25, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 26, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 26, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 26, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 26, 39)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 27, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 27, 14)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 28, 6)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 28, 9)
INSERT [dbo].[Utilise] ([Quantite_Outils_Recette], [ID_Recette], [ID_Outils]) VALUES (1, 28, 14)
GO
ALTER TABLE [dbo].[Chambre_Froide]  WITH CHECK ADD  CONSTRAINT [FK_Chambre_Froide_ID_Ingredient] FOREIGN KEY([ID_Ingredient])
REFERENCES [dbo].[Ingredient] ([ID_Ingredient])
GO
ALTER TABLE [dbo].[Chambre_Froide] CHECK CONSTRAINT [FK_Chambre_Froide_ID_Ingredient]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_ID_Client] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Client] ([ID_Client])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_ID_Client]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_ID_Recette] FOREIGN KEY([ID_Recette])
REFERENCES [dbo].[Recette] ([ID_Recette])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_ID_Recette]
GO
ALTER TABLE [dbo].[Composer]  WITH CHECK ADD  CONSTRAINT [FK_Composer_ID_Ingredient] FOREIGN KEY([ID_Ingredient])
REFERENCES [dbo].[Ingredient] ([ID_Ingredient])
GO
ALTER TABLE [dbo].[Composer] CHECK CONSTRAINT [FK_Composer_ID_Ingredient]
GO
ALTER TABLE [dbo].[Composer]  WITH CHECK ADD  CONSTRAINT [FK_Composer_ID_Recette] FOREIGN KEY([ID_Recette])
REFERENCES [dbo].[Recette] ([ID_Recette])
GO
ALTER TABLE [dbo].[Composer] CHECK CONSTRAINT [FK_Composer_ID_Recette]
GO
ALTER TABLE [dbo].[Concerner]  WITH CHECK ADD  CONSTRAINT [FK_Concerner_ID_Client] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Client] ([ID_Client])
GO
ALTER TABLE [dbo].[Concerner] CHECK CONSTRAINT [FK_Concerner_ID_Client]
GO
ALTER TABLE [dbo].[Concerner]  WITH CHECK ADD  CONSTRAINT [FK_Concerner_ID_Table] FOREIGN KEY([ID_Table])
REFERENCES [dbo].[Emplacement] ([ID_Table])
GO
ALTER TABLE [dbo].[Concerner] CHECK CONSTRAINT [FK_Concerner_ID_Table]
GO
ALTER TABLE [dbo].[Congelateur]  WITH CHECK ADD  CONSTRAINT [FK_Congelateur_ID_Ingredient] FOREIGN KEY([ID_Ingredient])
REFERENCES [dbo].[Ingredient] ([ID_Ingredient])
GO
ALTER TABLE [dbo].[Congelateur] CHECK CONSTRAINT [FK_Congelateur_ID_Ingredient]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_ID_Ingredient] FOREIGN KEY([ID_Ingredient])
REFERENCES [dbo].[Ingredient] ([ID_Ingredient])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_ID_Ingredient]
GO
ALTER TABLE [dbo].[Stock_Outils]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Outils_ID_Outils] FOREIGN KEY([ID_Outils])
REFERENCES [dbo].[Outils] ([ID_Outils])
GO
ALTER TABLE [dbo].[Stock_Outils] CHECK CONSTRAINT [FK_Stock_Outils_ID_Outils]
GO
ALTER TABLE [dbo].[Utilise]  WITH CHECK ADD  CONSTRAINT [FK_Utilise_ID_Outils] FOREIGN KEY([ID_Outils])
REFERENCES [dbo].[Outils] ([ID_Outils])
GO
ALTER TABLE [dbo].[Utilise] CHECK CONSTRAINT [FK_Utilise_ID_Outils]
GO
ALTER TABLE [dbo].[Utilise]  WITH CHECK ADD  CONSTRAINT [FK_Utilise_ID_Recette] FOREIGN KEY([ID_Recette])
REFERENCES [dbo].[Recette] ([ID_Recette])
GO
ALTER TABLE [dbo].[Utilise] CHECK CONSTRAINT [FK_Utilise_ID_Recette]
GO
USE [master]
GO
ALTER DATABASE [ProjetPLS] SET  READ_WRITE 
GO

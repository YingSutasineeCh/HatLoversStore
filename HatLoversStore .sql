IF DB_ID('HatLoversStore') IS NOT NULL
	DROP DATABASE HatLoversStore
	
CREATE DATABASE HatLoversStore
GO

USE [HatLoversStore]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [varchar](10) NOT NULL,
	[ShortName] [varchar](15) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]     Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Email] [varchar](25) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [varchar](9) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceData]     Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceData](
	[SalesTax] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoices]     Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceNumber] [int] IDENTITY(1000,1) NOT NULL,
	[CustEmail] [varchar](25) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Subtotal] [money] NOT NULL,
	[ShipMethod] [varchar](50) NOT NULL,
	[Shipping] [money] NOT NULL,
	[SalesTax] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[CreditCardType] [varchar](10) NOT NULL,
	[CardNumber] [varchar](20) NOT NULL,
	[ExpirationMonth] [smallint] NOT NULL,
	[ExpirationYear] [smallint] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LineItems]     Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItems](
	[InvoiceNumber] [int] NOT NULL,
	[ProductID] [char](5) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Extension]  AS ([UnitPrice]*[Quantity]) PERSISTED,
 CONSTRAINT [PK_LineItems] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]     Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [char](5) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Material] [varchar](50) NOT NULL,
	[LongDescription] [varchar](2000) NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
	[ImageFile] [varchar](30) NULL,
	[UnitPrice] [money] NOT NULL,
	[OnHand] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[States]     Script Date: 4/28/2015 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateCode] [char](2) NOT NULL,
	[StateName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [Description]) VALUES (N'BK', N'Bucket Hat', N'Versatile and comfortable, our bucket hats are made of materials that help wick away rain, while the downward sloping brims guide water away from the eyes and face.')
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [Description]) VALUES (N'BT', N'Bretton', N'Brettons are a delightful type of sun hat with flirty flipped-up brims.')
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [Description]) VALUES (N'SC', N'Sport Caps', N'The baseball cap is the ultimate style for comfort and casual settings.')
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [Description]) VALUES (N'VS', N'Visor', N'Visors are the perfect headwear for having fun in the sun.')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'A8@webemaxmjKd.com', N'Molunguri', N'A', N'1108 Johanna Bay Drive', N'Birmingham', N'AL', N'35216', N'(705) 555-5237')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'AAntosca@netYduo.com', N'Antosca', N'Andrew', N'485 Duane Terrace', N'Ann Arbor', N'MI', N'48108    ', N'(804) 555-6924')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Abdul70@matminvV.edu', N'Antony', N'Abdul', N'1109 Powderhorn Drive', N'Fayetteville', N'NC', N'28314    ', N'(409) 555-8093 ext 5')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ajith@xgMaster.edu', N'Johnson', N'Ajith', N'2200 Old Germantown Road', N'Mcgregor', N'CA', N'55555    ', N'(600) 555-4927')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Alan@NsiYYGE.net', N'Rose', N'Alan', N'P.O. Box 8553', N'St. Petersburg', N'FL', N'33704    ', N'(608) 555-6361')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Albert@masterxmlrad.com', N'Browning', N'Albert', N'1  E. Telecom Parkway', N'Duluth', N'GA', N'30097    ', N'(303) 555-0436')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ALitterson@mastermaster.c', N'Litterson', N'Anthony', N'901 S. National Ave.', N'Phila.', N'PA', N'19105    ', N'(401) 555-3158')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Andra91@webtechdotca.edu', N'Lee', N'Andra', N'8831 Park Central Drive', N'Beacon', N'NY', N'12508    ', N'(600) 555-6834')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Andrea c.@sWGrUDweb.com', N'Latheef', N'Andrea c.', N'17 Potter Road', N'Jacksonville', N'FL', N'32256    ', N'(805) 555-6847')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'AnSantos@QKdxdPocare.com', N'Santos', N'Anita', N'1640 Barrington Lane', N'Barrington', N'IL', N'60448    ', N'(406) 555-5539')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Anthony0@orTcradeSLiV.edu', N'Gujja', N'Anthony', N'4747 Mclane Parkway', N'Irving', N'TX', N'75038    ', N'(909) 555-2640')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ASmith@linuxeAe.com', N'Smith', N'Arthur', N'P.O. Box 190886', N'Laurelton', N'NY', N'11413    ', N'(708) 555-6436')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Bala@EQlminXaiXEl.gov', N'Warner', N'Bala', N'Po Box 335', N'West Hartford', N'CT', N'06119    ', N'(707) 555-8720')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Barbara0@matartscare.com', N'White', N'Barbara', N'3400 Richmond Parkway #3423', N'Bristol', N'CT', N'06010    ', N'(502) 555-6947')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BHenry@webnetduo.com', N'Henry', N'Benjamin', N'9203 Ivanhoe Road', N'Phoenix', N'AZ', N'85016    ', N'(601) 555-9203')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Bill@techcaresHUD.gov', N'Gallaspy', N'Bill', N'2794 Blarefield Driev', N'New York', N'NY', N'10041    ', N'(401) 555-2587')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BJackson@xmlwildwild.com', N'Jackson', N'Bill', N'25-3 Latham Villiage Lane', N'Parma', N'OH', N'44134    ', N'(502) 555-6546')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BJerome@dotmin.com', N'Jerome', N'Beverly', N'3206 Greenhollow Dr', N'Metuchen', N'NJ', N'08840    ', N'(807) 555-0036')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Brent00@assoccompmas.com', N'Wainscott', N'Brent', N'1129 Treeside Ln', N'Mahwah', N'NJ', N'07430    ', N'(805) 555-7085')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BrThelagathoti@matzN.gov', N'Thelagathoti', N'Brad', N'2010 Glass Rd. Ne Apt 210', N'Dallas', N'TX', N'75211    ', N'(902) 555-1742')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BSchlusselberg@radZUradmi', N'Schlusselberg', N'Brandon', N'303 South Second St.', N'Collinsville', N'IL', N'62234', N'(902) 555-3532')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Cary@webxmlmaster.edu', N'Rocca', N'Cary', N'8619 W. Summerdale  1', N'Oakland', N'CA', N'94612    ', N'(905) 555-2438')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CaWheeler@matcareweb.edu', N'Wheeler', N'Caroline', N'185 Whiting Lane', N'Madison', N'WI', N'53704    ', N'(808) 555-6245')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ChLoyal@VVassocLm.com', N'Loyal', N'Chang', N'R.R. 1  Box 132', N'Jacksonville', N'FL', N'32207', N'(501) 555-3840')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Chris53@kgsiwebartsd.edu', N'Mccann', N'Chris', N'Po Box 9041', N'Omaha', N'NE', N'68127    ', N'(702) 555-5148')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Christopher05@minwildobZF', N'Lumpkin', N'Christopher', N'100 Church Street', N'Columbus', N'GA', N'31901    ', N'(405) 555-8066')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CKohli@ZQartsdot.com', N'Kohli', N'Carl', N'51 Mercedes Way', N'Hollister', N'CA', N'95023    ', N'(504) 555-9215')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CMavraedis@dTwildKhCkli.e', N'Mavraedis', N'Charles', N'1-205 Lamoine Village', N'Cypress', N'TX', N'77429    ', N'(209) 555-9717 ext 5')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CMyl@HqKHxNUW.net', N'Myl', N'Carolyn', N'4343 Warm Springs Rd Apt 1019', N'Butler', N'PA', N'16002    ', N'(300) 555-4411')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Craig4@fzassocLIjN.net', N'Reinarz', N'Craig', N'1339 Contra Costa Drive', N'Bernville', N'PA', N'19506    ', N'(502) 555-3000')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Dan@CMQkartscare.edu', N'Collier', N'Dan', N'7212 Dalewood Dr.', N'Duluth', N'GA', N'30097    ', N'(408) 555-4943')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Darald@DDiHYzrmaste.net', N'Curless', N'Darald', N'P.O. Box 866642', N'West Hills', N'CA', N'91304    ', N'(709) 555-9657')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'DArmalie@ShwildOHrad.com', N'Armalie', N'Dennis', N'50 East 21St Street', N'Salinas', N'CA', N'93907    ', N'(902) 555-7164')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'DBoan@wildfassocbi.edu', N'Boan', N'Dinesh', N'11582 Rusk Cove', N'Charlotte', N'NC', N'28270    ', N'(701) 555-0686')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Dhananjay01@caremat.com', N'Garcia', N'Dhananjay', N'9211 Garland', N'Columbus', N'OH', N'43216    ', N'(904) 555-0812')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Dianna33@dotausGassoc.com', N'Palanukumarasamy', N'Dianna', N'1521 W Wolfram', N'Columbia', N'SC', N'29223    ', N'(406) 555-4328')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Don@artstechfec.com', N'Sui', N'Don', N'6607 Brodis Lane  335', N'Parsippany', N'NJ', N'07054    ', N'(805) 555-9628')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Donald@XGyassocmaxm.com', N'Dardac', N'Donald', N'4232 Judah', N'Irving', N'TX', N'75038    ', N'(507) 555-8313')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Doug85@fsanHVtweb.gov', N'Drake', N'Doug', N'846 President St', N'Linden', N'NJ', N'07036    ', N'(704) 555-2277')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'EGreen@prognet.com', N'Green', N'Eduardo', N'1240 E. Diehl Road', N'Columbia', N'SC', N'29209    ', N'(204) 555-7233 ex 20')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ellis@FfNQnetmaste.net', N'Binner', N'Ellis', N'6855 Woodland Ave', N'New Milford', N'CT', N'06776    ', N'(508) 555-7817')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ErIvy@fZlwild.com', N'Ivy', N'Erika', N'10433 Sunnybrook Circle', N'Baltimore', N'MD', N'21207    ', N'(805) 555-3152')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ESun@Ucare.com', N'Sun', N'Edgar', N'39 Howell Place', N'Parsippany', N'NJ', N'07054    ', N'(307) 555-2106')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'FgHidalgo@webprog.net', N'Hidalgo', N'Fgsdg', N'405 Fayette Pike', N'Austin', N'TX', N'78704    ', N'(207) 555-3177')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Frank@mastermaxmax.edu', N'Wieneke', N'Frank', N'2111 Bancroft Way', N'Birmingham', N'AL', N'35226    ', N'(700) 555-6831')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'GeStein@faOJdDbionet.com', N'Stein', N'George', N'95 Carleton St', N'New Milford', N'NJ', N'07646    ', N'(401) 555-6036')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Giridhar@webWgEIxml.com', N'Hodgkins', N'Giridhar', N'814 East Ivy Street', N'Nyc', N'NY', N'11032', N'(401) 555-6932')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'GKrani@JJcare.edu', N'Krani', N'George', N'2014 S 102Nd Street, 210 C', N'Maynard', N'MA', N'01754    ', N'(401) 555-0935')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Greg3@duowildmin.edu', N'Donahoe', N'Greg', N'P. O. Box 2600', N'St. Paul', N'MN', N'55101    ', N'(506) 555-5713')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Greiner3@bymmatweb.com', N'Briggs', N'Greiner', N'10011 Strathfield Ln', N'Vestavia', N'AL', N'35216    ', N'(706) 555-7498')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Harper1@rVtechcaredo.com', N'Kerr', N'Harper', N'Po Box 2337', N'St Albans', N'VT', N'05478    ', N'(909) 555-3686')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Heriberto0@WvEcEyminart.c', N'Larson', N'Heriberto', N'7623 Matera St #103', N'Alpine', N'AL', N'35014    ', N'(307) 555-7927')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'HNuckols@czrccuhduo.net', N'Nuckols', N'Heather', N'150 Hayes St', N'Elgin', N'IL', N'60120    ', N'(601) 555-9605')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'IlBommana@radassoc.net', N'Bommana', N'Ilya', N'1310 Brook St #2A', N'San Rafael', N'CA', N'94903    ', N'(801) 555-4078')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jamie55@bamomaxmaxbi.com', N'Shepherd', N'Jamie', N'1341 East Thacker Street', N'Highlands Ranch', N'CO', N'80126    ', N'(404) 555-3802')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JaTorr@minmasterGqa.gov', N'Torr', N'James', N'465 Buckland Hills Dr. Apt 311', N'Dublin', N'NY', N'90210    ', N'(602) 555-0991')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jayagangadhara@Rprminnetp', N'Corbett', N'Jayagangadhara', N'13050 Dahlia Circle,  122', N'Sherwood', N'AK', N'72120    ', N'(606) 555-3619')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jeff5@radJ.net', N'Travis', N'Jeff', N'3111 Monument Drive', N'Milwaukee', N'WI', N'53218    ', N'(703) 555-9233')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jerry l.@progwildbioY.com', N'Arutla', N'Jerry l.', N'209 Ne 6Th', N'Ontario', N'CA', N'91762    ', N'(807) 555-3151')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JiKieffer@duonethcN.edu', N'Kieffer', N'Jing peng', N'1492 Highland Lakes Trail', N'Ringgold', N'GA', N'30736    ', N'(604) 555-7102')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JLee@jKCmaxbamo.net', N'Lee', N'Jeff', N'32 Gatehouse Lane', N'Roseville', N'CA', N'95829    ', N'(407) 555-3271')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JoDaniels@linuxwildxml.ne', N'Daniels', N'John', N'1417 Deer Spring Court', N'Fairfax', N'VA', N'22031    ', N'(306) 555-5945')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JoDiop@netcaremaste.edu', N'Diop', N'John', N'6318 Towncrest Court', N'South Pasadena', N'CA', N'91030    ', N'(708) 555-3166')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'John@netEw.edu', N'Blake', N'John', N'388 Sicamore', N'Fresno', N'CA', N'93704    ', N'(500) 555-2394')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'John@YOlinux.gov', N'Rampel', N'John', N'123-12 Gcp', N'Waco', N'TX', N'76710    ', N'(503) 555-0869')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'John81@mastermatweb.edu', N'Shanmugasundaram', N'John', N'6890 Deer Court', N'Glen Ellyn', N'IL', N'60137    ', N'(704) 555-5193')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Joseph4@jIHaprog.com', N'Nolan', N'Joseph', N'13 N San Marcos Rd', N'Camillus', N'NY', N'13031    ', N'(506) 555-2298')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Joseph70@netTcnMo.com', N'Boswell', N'Joseph', N'3131 E. Holcombe Blvd', N'Shelton', N'CT', N'06484    ', N'(601) 555-9365')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Karen0@techZwJzmast.net', N'Hamilton', N'Karen', N'18 Marvin Dr., Apt#B-5', N'Cincinnati', N'OH', N'45263    ', N'(506) 555-4499')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ken15@EhHartso.net', N'Herrera', N'Ken', N'8231 Princeton Sq Blvd', N'Bridgeton', N'MO', N'63044', N'(600) 555-9024')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Kevin67@netmaxxmlpro.com', N'Hoffman', N'Kevin', N'5375 Mariners Cove Drive', N'Everett', N'MA', N'02149    ', N'(406) 555-2630')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'KHowell@bioO.gov', N'Howell', N'Kim', N'4010 Bob Wallace Ave Apt 3', N'Renton', N'WA', N'98056    ', N'(406) 555-6343')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'KMatte@assoclinuxzT.edu', N'Matte', N'Kris', N'1225 Nw Cooke Ave', N'Austin', N'TX', N'78148    ', N'(802) 555-7814')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Kristina49@matbioxmlwil.e', N'Larsen', N'Kristina', N'3325 S Douglas Av', N'San Francisco', N'CA', N'94122    ', N'(600) 555-1876')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'KVang@webVQpV.gov', N'Vang', N'Karl', N'327 Franklin Street', N'Edina', N'MN', N'55435    ', N'(409) 555-2172')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Larry37@qDGYtech.com', N'Dennis', N'Larry', N'900 Mickley Rd', N'Lafayette', N'LA', N'70506    ', N'(604) 555-4731')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Lawrence@FTkstcomplin.gov', N'Smith', N'Lawrence', N'2883 Sicamore Street', N'Fresno', N'CA', N'93711    ', N'(203) 555-6642')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'LeErpenbach@yDjxmlqfBxmi.', N'Erpenbach', N'Lee', N'901 Mission Street', N'Grants Pass', N'OR', N'97526    ', N'(800) 555-1628')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Liuy6@linuxduon.com', N'Slabicki', N'Liuy', N'1979 Marcus Ave', N'Westwood', N'NJ', N'07675    ', N'(308) 555-2900')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Lucy66@compwebKvLca.gov', N'Trasente', N'Lucy', N'51783 Se 7Th Street', N'Westerville', N'OH', N'43081    ', N'(602) 555-8853')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'M1@Atbioy.net', N'Roush', N'M', N'5111 Ambergate Ln', N'Chapin', N'SC', N'29036    ', N'(407) 555-8665')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Marie@careminprogA.com', N'Toocee', N'Marie', N'4500 Baymeadows Rd', N'Concord', N'CA', N'94519    ', N'(704) 555-8322')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mark@artsartscomp.net', N'Bassett', N'Mark', N'12750 Fair Lakes Circle', N'Farmington', N'CT', N'06032    ', N'(403) 555-7371 x3196')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mark@caredot.com', N'Czarnik', N'Mark', N'480 Valley Rd., A15', N'Mankato', N'MN', N'56001    ', N'(902) 555-1017')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Max28@dottechnet.gov', N'Schuh', N'Max', N'730 Opening Hill Rd', N'Lauderhill', N'FL', N'33313    ', N'(400) 555-6807')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'MCadle@progwildtech.edu', N'Cadle', N'Michael', N'572 Brook Street', N'Van Wert', N'OH', N'45891    ', N'(606) 555-5024 ext 8')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Michael@zmasterftRW.com', N'Condron', N'Michael', N'866 Butternut Dr.', N'Salinas', N'CA', N'93901    ', N'(903) 555-1090')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mike@assocbamo.gov', N'Akkiraju', N'Mike', N'3811 N. Bell', N'Hazlet', N'NJ', N'07730    ', N'(908) 555-1452 x02')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'MMontenegro@Ebamo.edu', N'Montenegro', N'M.e', N'722 N. Broadway', N'Oakland', N'CA', N'94612    ', N'(901) 555-6080 x03')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mohamed@maxmatmaster.com', N'Mogesa', N'Mohamed', N'9939, Fredericksburg Rd, Apt', N'Overland Park', N'KS', N'66212    ', N'(802) 555-1606-26')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Myron6@assocDCxU.gov', N'Jachimski', N'Myron', N'8000 Utopia', N'Glendale', N'AZ', N'85302    ', N'(808) 555-5676')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'N7@fassoc.net', N'Jii', N'N', N'1678 Plateau Dr', N'Dracut', N'MA', N'01826    ', N'(800) 555-1643')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Nelson9@crrdotHO.net', N'Jeffcoat', N'Nelson', N'5244 West 139Th Street', N'Portland', N'TX', N'78374    ', N'(408) 555-6768')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'NuLawrence@webrad.net', N'Lawrence', N'Nunzio', N'87 Cannon Ridge Drive', N'Woodside', N'NY', N'11377    ', N'(501) 555-6103')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'NYciano@aiaGvOfmax.gov', N'Yciano', N'Nicolette', N'1295 State Street', N'Gettysburg', N'PA', N'17325    ', N'(402) 555-2462')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Patrick04@mdBwSxmlmast.ne', N'Patthana', N'Patrick', N'124 Austin Building', N'Peoria', N'IL', N'61614    ', N'(407) 555-3635')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'PBivans@CcFradjWcomp.com', N'Bivans', N'Paul', N'17B Pauline Street', N'Columbus', N'GA', N'31909    ', N'(701) 555-5826')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'PHarris@VFcQMyFGICTL.net', N'Harris', N'Peter', N'3001 S. Congress', N'Indianapolis', N'IN', N'46237    ', N'(302) 555-0992')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Phil1@maxxmlcK.com', N'Brown', N'Phil', N'860 Summerville Rd', N'Sioux Falls', N'SD', N'57103    ', N'(403) 555-4916')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'R4@radmatC.net', N'Berry', N'R', N'513 Little Ave.', N'Paw Paw', N'MI', N'49079    ', N'(902) 555-8749')
GO
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Radhakrishna9@matcomp.net', N'King', N'Radhakrishna', N'901 S. Central Expressway', N'Charleston', N'SC', N'29407    ', N'(308) 555-3501')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Rajeev6@TLmduo.edu', N'Barrios', N'Rajeev', N'471 Regan Ln', N'Northborough', N'MA', N'01532    ', N'(902) 555-1329')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ranji@radbamomaste.gov', N'Gross', N'Ranji', N'26 Mist Hill Drive', N'Madison', N'SD', N'57042    ', N'(309) 555-0767')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ray@minpLXbyOmas.com', N'Ibach', N'Ray', N'43155 Wayne Stevens Rd', N'Pompton Plains', N'NJ', N'07444    ', N'(207) 555-1469')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Rhonda85@masterminduo.net', N'Chavan', N'Rhonda', N'518 Commanche Tr.', N'Greensboro', N'NC', N'27410    ', N'(503) 555-3011')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Richard9@assocxml.com', N'Bommareddy', N'Richard', N'4415 Canoga Ave', N'New York', N'NY', N'10016', N'(407) 555-1239')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RoBenedicto@Qbio.com', N'Benedicto', N'Robert', N'4140 Alpha Road', N'Columbia', N'SC', N'29223    ', N'(508) 555-5720')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Robert04@webgMaVsraRx.com', N'Hassan', N'Robert', N'1221 Idaho St', N'Altoona', N'PA', N'16602    ', N'(902) 555-1411-7025')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Rodney43@JpEizuGm.edu', N'Baines', N'Rodney', N'502 N. Jefferson St', N'Itasca', N'IL', N'60143    ', N'(205) 555-8967 x396')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RoGuzman@progweX.edu', N'Guzman', N'Robert', N'194 Crofton Drive', N'Evans', N'GA', N'30809    ', N'(608) 555-1877')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RoMorgan@IMMQrRn.net', N'Morgan', N'Robert', N'48289 Fremont Blvd', N'Carrollton', N'TX', N'75006    ', N'(907) 555-0670')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RTallada@cHKDassoca.gov', N'Tallada', N'Raghu', N'128 Greenbriar Dr', N'Madison Heights', N'MI', N'48976    ', N'(803) 555-2789')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RWolfe@xmlwebmatp.edu', N'Wolfe', N'Randy', N'3799 Route 46 East', N'Columbus', N'GA', N'31904    ', N'(301) 555-2159')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Sam91@OSZqIKrNxmlE.gov', N'Carroll', N'Sam', N'9379 N Street', N'Long Beach', N'CA', N'90806    ', N'(407) 555-2086')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'SaWheatley@techcompprog.g', N'Wheatley', N'Sathyanarayana', N'2226 Spring Dusk Lane', N'Bloomingdale', N'NJ', N'07403    ', N'(805) 555-6416')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Scott85@ByDcV.net', N'Johnson', N'Scott', N'14 Horseshoe Lane', N'Carver', N'MA', N'02330    ', N'(201) 555-6527')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Shane4@biobamo.gov', N'Lowery', N'Shane', N'1127 Herbert J.', N'Philadelphia', N'PA', N'19153    ', N'(600) 555-8753')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'SHughes@ALlinuxduo.com', N'Hughes', N'Steve', N'21555 Oxnard Street', N'Fenton', N'MO', N'63026    ', N'(307) 555-6911 x7788')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Siddharth@progiF.gov', N'Mcdonnell', N'Siddharth', N'2616 Beeman', N'New Market', N'MD', N'21774    ', N'(504) 555-4218')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'SkAlexander@SnAVhPCD.com', N'Alexander', N'Skip', N'15 Gettysburg Square  187', N'West Hartford', N'CT', N'06107    ', N'(803) 555-5817')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Srikanth@XyRbduocare.gov', N'Brown', N'Srikanth', N'1155 Warburton Ave', N'Richmond', N'CA', N'94806    ', N'(309) 555-4108')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'StBeemer@weblinuxRxvU.gov', N'Beemer', N'Steve', N'1234 Main St', N'Watertown', N'CT', N'06795    ', N'(908) 555-8926')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Stuart1@minnet.com', N'Liao', N'Stuart', N'4070 Fisher Road', N'Charlotte', N'NC', N'28215    ', N'(708) 555-3218')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Sumanta33@matMFYbioGOE.ne', N'Robersone', N'Sumanta', N'206 Mc Lain Rd.', N'Atlanta', N'GA', N'30313    ', N'(904) 555-2979 x0024')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'TeLin@Oxrad.net', N'Lin', N'Terri', N'280 Briarcliff Rd', N'Springfield', N'IL', N'62702    ', N'(203) 555-5954')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Teresa1@matprog.gov', N'Murray', N'Teresa', N'1200 Corporate Systems Center', N'St. Louis', N'MO', N'63103    ', N'(903) 555-9363')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Timothy4@assocbio.com', N'Sellers', N'Timothy', N'13700 Sutton Park Dr N -- #322', N'Dallas', N'TX', N'75287    ', N'(207) 555-8274')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ToBrown@linuxbioxmll.gov', N'Brown', N'Toni', N'6050 Crawfordville Rd', N'Houston', N'TX', N'77042    ', N'(309) 555-8960')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Tom6@duocarexmlxm.gov', N'Hull', N'Tom', N'301 W. Bay St.', N'Natick', N'MA', N'01760    ', N'(400) 555-3243')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Uma92@iFUJDDScfA.gov', N'Ahmed', N'Uma', N'110 Jay Dr.', N'Polk City', N'IA', N'50226    ', N'(808) 555-3272')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'VClegg@biolNE.com', N'Clegg', N'Viola', N'3635 Vista', N'Mansfield', N'MO', N'65704    ', N'(407) 555-9690')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Vito5@webEcomp.com', N'Broadhurst', N'Vito', N'300 30Th Ave. N. Apt. 4C', N'Fennimore', N'WI', N'53809    ', N'(305) 555-7255')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Walter00@webY.net', N'Cheboli', N'Walter', N'4260 Nw 32 Street', N'Mankato', N'MN', N'56002    ', N'(504) 555-3285 ext 7')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Waylon@nofmax.gov', N'Johnson', N'Waylon', N'440 Richmond Park East', N'Hamden', N'CT', N'06517', N'(605) 555-2477')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'William@linuxeBwebli.com', N'Krishnamurthy', N'William', N'1110 Ne 12Th St', N'Cranbury', N'NJ', N'08512    ', N'(403) 555-5756 ext 4')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Yolanda@ycminbamo.gov', N'Cullity', N'Yolanda', N'312 S. Combs', N'Norwood', N'MA', N'02062    ', N'(209) 555-9506')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Zheng@bamonetmaste.net', N'Tonner', N'Zheng', N'57 N Plaza Blvd', N'Atlanta', N'GA', N'30339', N'(305) 555-6619')
INSERT [dbo].[InvoiceData] ([SalesTax]) VALUES (0.0600)
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1000, N'Albert@masterxmlrad.com', CAST(0x0000A1B200000000 AS DateTime), 44.5000, N'UPS', 4.0000, 2.6700, 52.1700, N'VISA', N'1111-2222-3333-4444', 7, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1001, N'CMavraedis@dTwildKhCkli.e', CAST(0x0000A1B200000000 AS DateTime), 42.7200, N'UPS', 4.0000, 2.5632, 49.2832, N'VISA', N'1111-2222-3333-4444', 1, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1002, N'Christopher05@minwildobZF', CAST(0x0000A1B200000000 AS DateTime), 283.5000, N'UPS', 0.0000, 17.0100, 300.5100, N'VISA', N'1111-2222-3333-4444', 12, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1003, N'Greiner3@bymmatweb.com', CAST(0x0000A1B200000000 AS DateTime), 98.0000, N'UPS', 6.0000, 5.8800, 109.8800, N'VISA', N'1111-2222-3333-4444', 7, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1004, N'ErIvy@fZlwild.com', CAST(0x0000A1B200000000 AS DateTime), 243.3800, N'UPS', 0.0000, 14.6298, 258.4598, N'VISA', N'1111-2222-3333-4444', 4, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1005, N'Uma92@iFUJDDScfA.gov', CAST(0x0000A1B200000000 AS DateTime), 247.5000, N'UPS', 0.0000, 14.8500, 262.3500, N'VISA', N'1111-2222-3333-4444', 8, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1006, N'A8@webemaxmjKd.com', CAST(0x0000A1B200000000 AS DateTime), 98.0000, N'UPS', 6.0000, 5.8800, 109.8800, N'VISA', N'1111-2222-3333-4444', 1, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1007, N'Abdul70@matminvV.edu', CAST(0x0000A1B200000000 AS DateTime), 25.0000, N'UPS', 4.0000, 1.5000, 30.5000, N'VISA', N'1111-2222-3333-4444', 10, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1008, N'William@linuxeBwebli.com', CAST(0x0000A1B200000000 AS DateTime), 34.0000, N'UPS', 4.0000, 2.0400, 40.0400, N'VISA', N'1111-2222-3333-4444', 12, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1009, N'Shane4@biobamo.gov', CAST(0x0000A1B200000000 AS DateTime), 63.7000, N'UPS', 6.0000, 1.5000, 73.5220, N'VISA', N'1111-2222-3333-4444', 2, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1010, N'Brent00@assoccompmas.com', CAST(0x0000A1B200000000 AS DateTime), 29.9800, N'UPS', 4.0000, 1.7988, 35.7788, N'VISA', N'1111-2222-3333-4444', 4, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1011, N'Srikanth@XyRbduocare.gov', CAST(0x0000A1B200000000 AS DateTime), 107.7400, N'UPS', 0.0000, 6.4644, 114.2044 , N'VISA', N'1111-2222-3333-4444', 1, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1012, N'DBoan@wildfassocbi.edu', CAST(0x0000A1B200000000 AS DateTime), 44.5000, N'UPS', 4.0000, 2.6700, 51.1700, N'VISA', N'1111-2222-3333-4444', 2, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1013, N'Teresa1@matprog.gov', CAST(0x0000A1B200000000 AS DateTime), 220.0000, N'UPS', 0.0000, 13.2000, 233.2000, N'VISA', N'1111-2222-3333-4444', 11, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1014, N'Robert04@webgMaVsraRx.com', CAST(0x0000A1B200000000 AS DateTime), 50.9600, N'UPS', 6.0000, 3.0576, 60.0176, N'VISA', N'1111-2222-3333-4444', 5, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1015, N'KMatte@assoclinuxzT.edu', CAST(0x0000A1B200000000 AS DateTime), 95.0000, N'UPS', 6.0000, 5.7000, 106.7000, N'VISA', N'1111-2222-3333-4444', 1, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1016, N'Dianna33@dotausGassoc.com', CAST(0x0000A1B300000000 AS DateTime), 14.9900, N'UPS', 4.0000, 0.8994, 19.8894, N'VISA', N'1111-2222-3333-4444', 8, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1017, N'John@YOlinux.gov', CAST(0x0000A1B300000000 AS DateTime), 14.9900, N'UPS', 4.0000, 0.8994, 19.8894, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1018, N'StBeemer@weblinuxRxvU.gov', CAST(0x0000A1B300000000 AS DateTime), 57.2400, N'UPS', 6.0000, 3.4344, 66.6744, N'VISA', N'1111-2222-3333-4444', 10, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1019, N'Patrick04@mdBwSxmlmast.ne', CAST(0x0000A1B300000000 AS DateTime), 220.0000, N'UPS', 0.0000, 13.2000, 233.2000, N'VISA', N'1111-2222-3333-4444', 1, 2016)
SET IDENTITY_INSERT [dbo].[Invoices] OFF
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1000, N'BK001', 44.5000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1001, N'SC001', 14.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1001, N'SC004', 12.7400, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1002, N'SC003', 63.5000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1002, N'BK002', 220.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1003, N'VS004', 98.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1004, N'SC003', 63.5000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1004, N'SC001', 14.9900, 12)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1005, N'BT002', 34.0000, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1005, N'BT004', 99.5000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1005, N'VS001', 75.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1006, N'VS004', 98.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1007, N'VS003', 25.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1008, N'BT002', 34.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1009, N'SC004', 12.7400, 5)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1010, N'SC001', 14.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1011, N'BK003', 95.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1011, N'SC001', 12.7400, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1012, N'BK001', 44.500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1013, N'BK002', 220.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1014, N'SC001', 12.7400, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1015, N'BK003', 95.0000, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1016, N'SC001', 14.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1017, N'SC001', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1018, N'SC001', 12.7400, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1018, N'BK001', 44.500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1019, N'BK002', 220.0000, 1)

INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BK001', N'Nautical Bucket Hat', N'Ivory', N'100% Cotton', N'This marine-themed summer bucket hat is made from a cotton canvas with a light cotton inner lining. The crown features a braided rope hatband with a brass buckle closure, leather tab details, and a brass Karen Kane logo tab.', N'BK', N'bk1.jpg', 44.5000, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BK002', N'Villa 6 Bucket Hat', N'Nougat', N'100% Raffia Crochet', N'Details include a rolled raffia braid string and a metal raffia seed pin. The Villla 6 is rollable and packable, so it is perfect to take along on vacation.', N'BK', N'bk2.jpg', 220.0000, 80)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BK003', N'Skyler Bucket Hat', N'Cranberry', N'100% Wool', N'This wool felt bucket hat has a eye-catching 4" flat crown, a 2" floppy brim, and a grosgrain ribbon hatband that is tied in a charming bow.', N'BK', N'bk3.jpg', 95.0000, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BK004', N'Arlene Bucket Hat', N'Tiger', N'100% Nylon', N'This fuzzy fall and winter bucket hat has a bow decoration, a comfortable sweatband, and a polished gun metal Betmar pin.', N'BK', N'bk4.jpg', 45.0000, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BT001', N'Betmar Maribel Sun Hat', N'Natural/Black', N'95% Paper Straw, 5% Polyester', N'The Betmar Maribel Sun Hat features a sophisticated mix of braid, crochet and ribbon with an upturn brim.', N'BT', N'bt1.jpg', 64.5000, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BT002', N'Classic Sunshade Hat', N'Bright coral', N'Cotton-Polyester Blend', N'Designed for fashion, comfort, and convenience, Betmer Beach collection is perfect for fun in the sun and lounging oceanside.', N'BT', N'bt2.jpg', 34.0000, 950)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BT003', N'Newport Standard Bretton', N'Natural/Tamarillo', N'100% Raffia', N'This commitment to organic style is encapsulated vividly by the naturally-beautiful Newport Standard Brim Medium, a classic raffia braided sun hat that can be worn turned up or down.', N'BT', N'bt3.jpg', 190.0000, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'BT004', N'Heritage Collection Gibson Girl', N'Ivory/Navy', N'100% Wool', N' The Bollman Gibson Girl illustrates this style with its high squared crown, wide brim, soft navy felt and showy lace hatband tied off in a bow with a matching cream color binding. This hat comes in a special edition Bollman Heritage Hat Box.', N'BT', N'bt4.jpg', 99.5000, 150)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'SC001', N'Lions Bones Cap', N'Blue', N'Wool Blend', N'This cap has multiple features that will show support for your favorite team.', N'SC', N'sc1.jpg', 14.9900, 600)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'SC002', N'Digi Marble Supre', N'Black', N'100% Cotton', N'This lightweight cotton spring and summer style has a 5-panel crown with a functioning zipper pocket.', N'SC', N'sc2.jpg', 40.5000, 400)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'SC003', N'Polo Stripe Spacecap', N'Beige', N'55% Polyester, 45% Acrylic', N'The spacecap is a modern and sleek Kangol cap shape that creates an ergonomic fit.', N'SC', N'sc3.jpg', 63.5000, 150)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'SC004', N'Browns Shadow Cap', N'Brown', N'Wool Blend', N'This is a true head-turner! The unique embroidery on the front gives the illusion of your team logo with a shadow.', N'SC', N'sc4.jpg', 12.7400, 180)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'VS001', N'Christine Visor', N'Charcoal Wheat/Black Stripe', N'100% Raffia', N'For a casual approach to standard summer chic and a mind toward facial protection, the UPF-rated Christine is a nontraditional visor that may just catch on with its unique matching of rustic braided raffia with the slide-on visor style choice.', N'VS', N'vs1.jpg', 75.0000, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'VS002', N'Sakatia Visor', N'Natural', N'100% Raffia', N'Take it to the beach or place it in your tennis/golf bag, this visor can be rolled and packed away for easy traveling.', N'VS', N'vs2.jpg', 120.0000, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'VS003', N'Sun and Salt Wash Canvas Visor', N'Navy', N'100% Cotton', N'The Sperry Top-Sider Sun and Salt Wash Canvas Visor has a color stripe poly webbing on each side of the cap and an offset embroidered Sperry boat logo on the front portion.', N'VS', N'vs3.jpg', 25.0000, 300)
INSERT [dbo].[Products] ([ProductID], [Name], [Color] , [Material], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'VS004', N'Badu Visor', N'Oak', N'100% Cotton', N'Block the sun in style with the Kaminski XY Badu Visor! Luxurious Viaggio cotton elevates this sporty visor for all your summer fashion needs.', N'VS', N'vs4.jpg', 98.0000, 500)

INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AK', N'Alaska')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AL', N'Alabama')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AR', N'Arkansas')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AZ', N'Arizona')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'CA', N'California')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'CO', N'Colorado')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'CT', N'Connecticut')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'DC', N'District of Columbia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'DE', N'Delaware')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'FL', N'Florida')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'GA', N'Georgia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'HI', N'Hawaii')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'IA', N'Iowa')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'ID', N'Idaho')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'IL', N'Illinois')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'IN', N'Indiana')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'KS', N'Kansas')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'KY', N'Kentucky')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'LA', N'Lousiana')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MA', N'Massachusetts')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MD', N'Maryland')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'ME', N'Maine')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MI', N'Michigan')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MN', N'Minnesota')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MO', N'Missouri')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MS', N'Mississippi')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MT', N'Montana')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NC', N'North Carolina')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'ND', N'North Dakota')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NE', N'Nebraska')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NH', N'New Hampshire')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NJ', N'New Jersey')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NM', N'New Mexico')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NV', N'Nevada')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NY', N'New York')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'OH', N'Ohio')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'OK', N'Oklahoma')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'OR', N'Oregon')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'PA', N'Pennsylvania')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'RI', N'Rhode Island')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'SC', N'South Carolina')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'SD', N'South Dakota')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'TN', N'Tennessee')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'TX', N'Texas')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'UT', N'Utah')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'VA', N'Virginia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'VI', N'Virgin Islands')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'VT', N'Vermont')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WA', N'Washington')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WI', N'Wisconsin')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WV', N'West Virginia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WY', N'Wyoming')
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_States] FOREIGN KEY([State])
REFERENCES [dbo].[States] ([StateCode])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_States]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Customers] FOREIGN KEY([CustEmail])
REFERENCES [dbo].[Customers] ([Email])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Customers]
GO
ALTER TABLE [dbo].[LineItems]  WITH NOCHECK ADD  CONSTRAINT [FK_LineItems_Invoices] FOREIGN KEY([InvoiceNumber])
REFERENCES [dbo].[Invoices] ([InvoiceNumber])
GO
ALTER TABLE [dbo].[LineItems] CHECK CONSTRAINT [FK_LineItems_Invoices]
GO
ALTER TABLE [dbo].[LineItems]  WITH NOCHECK ADD  CONSTRAINT [FK_LineItems_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LineItems] CHECK CONSTRAINT [FK_LineItems_Products]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO

CREATE USER [WD_Report] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
CREATE USER [Watchdog1\Watchdog] FOR LOGIN [Watchdog1\Watchdog] WITH DEFAULT_SCHEMA=[dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.sp_InsteonRequestStateChange
	@Device_ID nchar(30),
	@Device_Request_State int
AS
BEGIN
    UPDATE       Insteon_Control
	SET          Device_Request_State = @Device_Request_State
	WHERE        (Device_ID = @Device_ID)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brine_Tank_History](
	[Brine_Tank_Level] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Event_Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Brine_Tank_History] PRIMARY KEY CLUSTERED 
(
	[Event_Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Current_State](
	[Row_ID] [int] NOT NULL,
	[Last_Update] [datetime] NOT NULL,
	[Garage_Door] [int] NOT NULL,
	[Garage_Window_South] [int] NOT NULL,
	[Garage_Window_North] [int] NOT NULL,
	[Garage_Outside_Door] [int] NOT NULL,
	[Garage_Outside_Door_Lock] [int] NOT NULL,
	[Garage_Inside_Door] [int] NOT NULL,
	[Garage_Inside_Door_Lock] [int] NOT NULL,
	[Kitchen_Window] [int] NOT NULL,
	[Back_Door] [int] NOT NULL,
	[Back_Door_Lock] [int] NOT NULL,
	[Great_Room_Window_South] [int] NOT NULL,
	[Great_Room_Window_North] [int] NOT NULL,
	[Play_Room_Window_South] [int] NOT NULL,
	[Play_Room_window_North] [int] NOT NULL,
	[Famiy_Room_Window_South] [int] NOT NULL,
	[Family_Room_Window_Front_South] [int] NOT NULL,
	[Family_Room_Window_Front_Middle] [int] NOT NULL,
	[Family_Room_Window_Front_North] [int] NOT NULL,
	[Front_Door] [int] NOT NULL,
	[Front_Door_Lock] [int] NOT NULL,
	[Dining_Room_Window_South] [int] NOT NULL,
	[Dining_Room_Window_North] [int] NOT NULL,
	[Master_Bath_Window] [int] NOT NULL,
	[Master_Bedroom_Window_South] [int] NOT NULL,
	[Master_Bedroom_Window_Back_South] [int] NOT NULL,
	[Master_Bedroom_Window_Back_North] [int] NOT NULL,
	[Sydney_Bedroom_Window] [int] NOT NULL,
	[Ethan_Bedroom_Window] [int] NOT NULL,
	[Spare_Bedroom_Window_North] [int] NOT NULL,
	[Spare_Bedroom_Window_South] [int] NOT NULL,
	[Mailbox] [int] NOT NULL,
	[Basement_Door] [int] NOT NULL,
	[Basement_Door_Lock] [int] NOT NULL,
	[Basement_Window_South] [int] NOT NULL,
	[Basement_Window_North] [int] NOT NULL,
	[Basement_Storage_Door] [int] NOT NULL,
	[Server_Room_Motion] [int] NOT NULL,
	[Upstairs_Hallway_Motion] [int] NOT NULL,
	[Great_Room_Motion] [int] NOT NULL,
	[Basement_Motion] [int] NOT NULL,
	[Exterior_Motion] [int] NOT NULL,
	[Doorbell] [int] NOT NULL,
	[Telephone] [int] NOT NULL,
	[Car_West] [int] NOT NULL,
	[Car_East] [int] NOT NULL,
	[House_Occupied] [int] NOT NULL,
	[Brine_Tank] [int] NOT NULL,
	[Lizard_Habitat_Temp] [int] NOT NULL,
	[Internet_Link] [int] NOT NULL,
	[Lizard_Fed] [int] NOT NULL,
	[Stair_Lights] [int] NOT NULL,
	[Geofence_Reached] [int] NOT NULL,
 CONSTRAINT [PK_Event_Current_State] PRIMARY KEY CLUSTERED 
(
	[Last_Update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Daily_Aggregate](
	[Summary_date] [datetime] NOT NULL,
	[Doorbells] [int] NOT NULL,
	[Phone_call] [int] NOT NULL,
	[Door_open_warning] [int] NOT NULL,
	[Brine_tank_warning] [int] NOT NULL,
	[Lizard_not_fed_warning] [int] NOT NULL,
	[Lizard_temp_warning] [int] NOT NULL,
	[Severe_weather_warning] [int] NOT NULL,
	[House_high_temp_warning] [int] NOT NULL,
	[House_low_temp_warning] [int] NOT NULL,
	[Server_room_high_temp_warning] [int] NOT NULL,
	[Internet_reconnected] [int] NOT NULL,
	[Text_messages_sent] [int] NOT NULL,
	[Stair_lights_on] [datetime] NOT NULL,
	[Stair_lights_off] [datetime] NOT NULL,
	[Mail_delivered] [datetime] NOT NULL,
	[Mail_retrieved] [datetime] NOT NULL,
	[House_occupied] [decimal](5, 2) NOT NULL,
	[House_unoccupied] [decimal](5, 2) NOT NULL,
	[SARAH_interactions] [int] NOT NULL,
	[Irrigation_status] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Irrigation_start] [datetime] NOT NULL,
	[Irrigation_stop] [datetime] NOT NULL,
	[Power_used] [nchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Power_cost] [nchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Lizard_Fed] [datetime] NOT NULL,
	[Gallons_Used] [int] NOT NULL,
	[Leak_Detected] [int] NOT NULL,
	[Errors] [int] NOT NULL,
 CONSTRAINT [PK_Event_Daily_Aggregate2] PRIMARY KEY CLUSTERED 
(
	[Summary_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_History](
	[Event_ID] [nchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Event_Timestamp] [datetime] NOT NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Lookup](
	[Event_ID] [nchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Event_Description] [nchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Event_Lookup] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insteon_Control](
	[Row_ID] [int] NOT NULL,
	[Device_Name] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Device_ID] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Device_Current_State] [int] NOT NULL,
	[Device_Request_State] [int] NULL,
 CONSTRAINT [PK_Insteon_Control] PRIMARY KEY CLUSTERED 
(
	[Row_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Irrigation_History](
	[Event_ID] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Event_Timestamp] [datetime] NOT NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Irrigation_Lookup](
	[Event_ID] [nchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Event_Description] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Irrigation_Lookup] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Current_State](
	[Last_Update] [datetime] NOT NULL,
	[Master_Bedroom] [int] NOT NULL,
	[Ethan_Bedroom] [int] NOT NULL,
	[Sydney_Bedroom] [int] NOT NULL,
	[Play_Room] [int] NOT NULL,
	[Kitchen] [int] NOT NULL,
	[Living_Room] [int] NOT NULL,
	[Garage] [int] NOT NULL,
	[Basement_Office] [int] NOT NULL,
	[Great_Room] [int] NOT NULL,
 CONSTRAINT [PK_Temp_Current_State] PRIMARY KEY CLUSTERED 
(
	[Last_Update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Daily_Aggregate](
	[Last_Updated] [datetime] NOT NULL,
	[Avg_Inside] [int] NOT NULL,
	[Avg_Outside] [int] NOT NULL,
	[Min_Inside] [int] NOT NULL,
	[Min_Outside] [int] NOT NULL,
	[Max_Inside] [int] NOT NULL,
	[Max_Outside] [int] NOT NULL,
 CONSTRAINT [PK_Temp_Daily_Aggregate] PRIMARY KEY CLUSTERED 
(
	[Last_Updated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_History](
	[Last_Updated] [datetime] NOT NULL,
	[Master_Bedroom] [int] NOT NULL,
	[Ethan_Bedroom] [int] NOT NULL,
	[Sydney_Bedroom] [int] NOT NULL,
	[Play_Room] [int] NOT NULL,
	[Kitchen] [int] NOT NULL,
	[Living_Room] [int] NOT NULL,
	[Garage] [int] NOT NULL,
	[Basement_Office] [int] NOT NULL,
	[Great_Room] [int] NOT NULL,
 CONSTRAINT [PK_Temp_History] PRIMARY KEY CLUSTERED 
(
	[Last_Updated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vent_History](
	[Vent_ID] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Vent_State] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Event_Timestamp] [datetime] NOT NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vent_ID_Lookup](
	[Vent_ID] [nchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ID_Description] [nchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vent_State_Lookup](
	[Vent_State] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[State_Description] [nchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor_Message](
	[Last_Update] [datetime] NOT NULL,
	[Occupant_Name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Visitor_Name] [varbinary](max) NULL,
	[Visitor_Message] [varbinary](max) NULL,
	[Message_Playback] [int] NOT NULL,
	[Last_Playback] [datetime] NULL,
 CONSTRAINT [PK_Visitor_Message] PRIMARY KEY CLUSTERED 
(
	[Last_Update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Water_Usage_History](
	[Event_Timestamp] [datetime] NOT NULL,
	[Gallons_Used] [int] NOT NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[X10_Control](
	[Light1_on] [int] NOT NULL,
	[Light1_off] [int] NOT NULL,
	[Light2_on] [int] NOT NULL,
	[Light2_off] [int] NOT NULL,
	[Light3_on] [int] NOT NULL,
	[Light3_off] [int] NOT NULL,
	[Light4_on] [int] NOT NULL,
	[Light4_off] [int] NOT NULL,
	[Temp_Up_1] [int] NOT NULL,
	[Temp_Down_1] [int] NOT NULL,
	[Temp_Up_3] [int] NOT NULL,
	[Temp_Down_3] [int] NOT NULL,
	[Zone1_on] [int] NOT NULL,
	[Zone1_off] [int] NOT NULL,
	[Zone2_on] [int] NOT NULL,
	[Zone2_off] [int] NOT NULL,
	[Zone3_on] [int] NOT NULL,
	[Zone3_off] [int] NOT NULL,
	[Zone4_on] [int] NOT NULL,
	[Zone4_off] [int] NOT NULL,
	[Doorbell] [int] NOT NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE TRIGGER [dbo].[Event_Archive]
ON [dbo].[Event_Current_State]
AFTER UPDATE
AS
DECLARE @event_id nchar(4)
DECLARE @cmd nvarchar(50)

--IF((substring(COLUMNS_UPDATED(),1,1) & 252 ) <> 0 or (substring(COLUMNS_UPDATED(),2,1) & 255) <> 0 OR (SUBSTRING(COLUMNS_UPDATED(),3,1) & 255) <> 0 OR (SUBSTRING(COLUMNS_UPDATED(),4,1) & 255) <> 0 OR (SUBSTRING(COLUMNS_UPDATED(),5,1) & 255) <> 0 OR (SUBSTRING(COLUMNS_UPDATED(),6,1) & 255) <> 0) 
--BEGIN 

SET @event_id = ''

--------------------
-- BASEMENT
-------------------- 

--------------------
-- Basement_Door      
--------------------       
   DECLARE @newBD int = (SELECT Basement_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBD int = (SELECT Basement_Door from Event_Current_State where Row_ID = 2)

   IF @newBD <> @oldBD
   BEGIN
      if (@newBD = 1)
         set @Event_ID = '1002'
      else
         set @Event_ID = '1001'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END
   
--------------------
-- Basement_Door_Lock      
--------------------       
   DECLARE @newBDL int = (SELECT Basement_Door_Lock from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBDL int = (SELECT Basement_Door_Lock from Event_Current_State where Row_ID = 2)

   IF @newBDL <> @oldBDL
   BEGIN
      if (@newBDL = 1)
         set @Event_ID = '1004'
      else
         set @Event_ID = '1003'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END
   
--------------------
-- Basement_Window_South      
--------------------       
   DECLARE @newBWS int = (SELECT Basement_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBWS int = (SELECT Basement_Window_South from Event_Current_State where Row_ID = 2)

   IF @newBWS <> @oldBWs
   BEGIN
      if (@newBWS = 1)
         set @Event_ID = '1006'
      else
         set @Event_ID = '1005'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END
   
--------------------
-- Basement_Window_North      
--------------------       
   DECLARE @newBWN int = (SELECT Basement_Window_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBWN int = (SELECT Basement_Window_North from Event_Current_State where Row_ID = 2)

   IF @newBWN <> @oldBWN
   BEGIN
         if (@newBWN = 1)
            set @Event_ID = '1008'
         else
            set @Event_ID = '1007'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   

--------------------
-- Basement_Storage_Door
--------------------       
   DECLARE @newBSD int = (SELECT Basement_Storage_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBSD int = (SELECT Basement_Storage_Door from Event_Current_State where Row_ID = 2)

   IF @newBSD <> @oldBSD
   BEGIN
         if (@newBSD = 1)
            set @Event_ID = '1010'
         else
            set @Event_ID = '1009'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END 
   
--------------------
-- MAIN FLOOR
-------------------- 

--------------------
-- Garage Door      
--------------------       
   DECLARE @newGD int = (SELECT Garage_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGD int  = (SELECT Garage_Door from Event_Current_State where Row_ID = 2)

   IF @newGD <> @oldGD
   BEGIN
      if (@newGD = 1)
         set @Event_ID = '2002'
      else
         set @Event_ID = '2001'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END
   
--------------------
-- Garage_Window_South      
--------------------       
   DECLARE @newGWS int = (SELECT Garage_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGWS int = (SELECT Garage_Window_South from Event_Current_State where Row_ID = 2)

   IF @newGWS <> @oldGWS
   BEGIN
      if (@newGWS = 1)
         set @Event_ID = '2004'
      else
         set @Event_ID = '2003'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END

--------------------
-- Garage_Window_North      
--------------------       
   DECLARE @newGWN int = (SELECT Garage_Window_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGWN int = (SELECT Garage_Window_North from Event_Current_State where Row_ID = 2)

   IF @newGWN <> @oldGWN
   BEGIN
      if (@newGWN = 1)
         set @Event_ID = '2006'
      else
         set @Event_ID = '2005'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END

--------------------
-- Garage_Outside_Door      
--------------------       
   DECLARE @newGOD int = (SELECT Garage_Outside_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGOD int = (SELECT Garage_Outside_Door from Event_Current_State where Row_ID = 2)

   IF @newGOD <> @oldGOD
   BEGIN
      if (@newGOD = 1)
         set @Event_ID = '2008'
      else
         set @Event_ID = '2007'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END

--------------------
-- Garage_Outside_Door_Lock     
--------------------       
   DECLARE @newGODL int = (SELECT Garage_Outside_Door_Lock from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGODL int = (SELECT Garage_Outside_Door_Lock from Event_Current_State where Row_ID = 2)

   IF @newGODL <> @oldGODL
   BEGIN
      if (@newGODL = 1)
         set @Event_ID = '2010'
      else
         set @Event_ID = '2009'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END

--------------------
-- Garage_Inside_Door      
--------------------       
   DECLARE @newGID int = (SELECT Garage_Inside_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGID int = (SELECT Garage_Inside_Door from Event_Current_State where Row_ID = 2)

   IF @newGID <> @oldGID
   BEGIN
      if (@newGID = 1)
         set @Event_ID = '2012'
      else
         set @Event_ID = '2011'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END
   
--------------------
-- Garage_Inside_Door_Lock      
--------------------       
   DECLARE @newGIDL int = (SELECT Garage_Inside_Door_Lock from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGIDL int = (SELECT Garage_Inside_Door_Lock from Event_Current_State where Row_ID = 2)

   IF @newGIDL <> @oldGIDL
   BEGIN
      if (@newGIDL = 1)
         set @Event_ID = '2014'
      else
         set @Event_ID = '2013'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Kitchen_Window      
--------------------       
   DECLARE @newKW int = (SELECT Kitchen_Window from Event_Current_State where Row_ID = 1) 
   DECLARE @oldKW int = (SELECT Kitchen_Window from Event_Current_State where Row_ID = 2)

   IF @newKW <> @oldKW
   BEGIN
      if (@newKW = 1)
         set @Event_ID = '2016'
      else
         set @Event_ID = '2015'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END      
   
--------------------
-- Back_Door      
--------------------       
   DECLARE @newBKD int = (SELECT Back_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBKD int = (SELECT Back_Door from Event_Current_State where Row_ID = 2)

   IF @newBKD <> @oldBKD
   BEGIN
      if (@newBKD = 1)
         set @Event_ID = '2018'
      else
         set @Event_ID = '2017'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   

--------------------
-- Back_Door_Lock      
--------------------       
   DECLARE @newBKDL int = (SELECT Back_Door_Lock from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBKDL int = (SELECT Back_Door_Lock from Event_Current_State where Row_ID = 2)

   IF @newBKDL <> @oldBKDL
   BEGIN
      if (@newBKDL = 1)
         set @Event_ID = '2020'
      else
         set @Event_ID = '2019'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END 

--------------------
-- Great_Room_Window_North      
--------------------       
   DECLARE @newGRWN int = (SELECT Great_Room_Window_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGRWN int = (SELECT Great_Room_Window_North from Event_Current_State where Row_ID = 2)

   IF @newGRWN <> @oldGRWN
   BEGIN
      if (@newGRWN = 1)
         set @Event_ID = '2022'
      else
         set @Event_ID = '2021'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Great_Room_Window_South      
--------------------       
   DECLARE @newGRWS int = (SELECT Great_Room_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldGRWS int = (SELECT Great_Room_Window_South from Event_Current_State where Row_ID = 2)

   IF @newGRWS <> @oldGRWS
   BEGIN
      if (@newGRWS = 1)
         set @Event_ID = '2024'
      else
         set @Event_ID = '2023'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END     
   
--------------------
-- Play_Room_window_North      
--------------------       
   DECLARE @newPRWN int = (SELECT Play_Room_window_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldPRWN int = (SELECT Play_Room_window_North from Event_Current_State where Row_ID = 2)

   IF @newPRWN <> @oldPRWN
   BEGIN
      if (@newPRWN = 1)
         set @Event_ID = '2026'
      else
         set @Event_ID = '2025'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Play_Room_Window_South      
--------------------       
   DECLARE @newPRWS int = (SELECT Play_Room_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldPRWS int = (SELECT Play_Room_Window_South from Event_Current_State where Row_ID = 2)

   IF @newPRWS <> @oldPRWS
   BEGIN
      if (@newPRWS = 1)
         set @Event_ID = '2028'
      else
         set @Event_ID = '2027'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END  
   
--------------------
-- Famiy_Room_Window_South   
--------------------       
   DECLARE @newFRWS int = (SELECT Famiy_Room_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldFRWS INT = (SELECT Famiy_Room_Window_South from Event_Current_State where Row_ID = 2)

   IF @newFRWS <> @oldFRWS
   BEGIN
      if (@newFRWS = 1)
         set @Event_ID = '2030'
      else
         set @Event_ID = '2029'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END  
   
--------------------
-- Family_Room_Window_Front_South      
--------------------       
   DECLARE @newFRWFS int = (SELECT Family_Room_Window_Front_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldFRWFS int = (SELECT Family_Room_Window_Front_South from Event_Current_State where Row_ID = 2)

   IF @newFRWFS <> @oldFRWFS
   BEGIN
      if (@newFRWFS = 1)
         set @Event_ID = '2032'
      else
         set @Event_ID = '2031'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END    
   
--------------------
-- Family_Room_Window_Front_Middle      
--------------------       
   DECLARE @newFRWFM int = (SELECT Family_Room_Window_Front_Middle from Event_Current_State where Row_ID = 1) 
   DECLARE @oldFRWFM int = (SELECT Family_Room_Window_Front_Middle from Event_Current_State where Row_ID = 2)

   IF @newFRWFM <> @oldFRWFM
   BEGIN
      if (@newFRWFM = 1)
         set @Event_ID = '2034'
      else
         set @Event_ID = '2033'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END    
   
--------------------
-- Family_Room_Window_Front_North      
--------------------       
   DECLARE @newFRWFN int = (SELECT Family_Room_Window_Front_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldFRWFN int = (SELECT Family_Room_Window_Front_North from Event_Current_State where Row_ID = 2)

   IF @newFRWFN <> @oldFRWFN
   BEGIN
      if (@newFRWFN = 1)
         set @Event_ID = '2036'
      else
         set @Event_ID = '2035'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END    
   
--------------------
-- Front_Door      
--------------------       
   DECLARE @newFD int = (SELECT Front_Door from Event_Current_State where Row_ID = 1) 
   DECLARE @oldFD int = (SELECT Front_Door from Event_Current_State where Row_ID = 2)

   IF @newFD <> @oldFD
   BEGIN
      if (@newFD = 1)
         set @Event_ID = '2038'
      else
         set @Event_ID = '2037'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END     
   
--------------------
-- Front_Door_Lock      
--------------------       
   DECLARE @newFDL int = (SELECT Front_Door_Lock from Event_Current_State where Row_ID = 1) 
   DECLARE @oldFDL int = (SELECT Front_Door_Lock from Event_Current_State where Row_ID = 2)

   IF @newFDL <> @oldFDL
   BEGIN
      if (@newFDL = 1)
         set @Event_ID = '2040'
      else
         set @Event_ID = '2039'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END 
   
--------------------
-- Dining_Room_Window_South      
--------------------       
   DECLARE @newDRWS int = (SELECT Dining_Room_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldDRWS int = (SELECT Dining_Room_Window_South from Event_Current_State where Row_ID = 2)

   IF @newDRWS <> @oldDRWS
   BEGIN
      if (@newDRWS = 1)
         set @Event_ID = '2042'
      else
         set @Event_ID = '2041'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Dining_Room_Window_North      
--------------------       
   DECLARE @newDRWN int = (SELECT Dining_Room_Window_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldDRWN int = (SELECT Dining_Room_Window_North from Event_Current_State where Row_ID = 2)

   IF @newDRWN <> @oldDRWN
   BEGIN
      if (@newDRWN = 1)
         set @Event_ID = '2044'
      else
         set @Event_ID = '2043'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- TOP FLOOR
--------------------       

--------------------
-- Master_Bath_Window      
--------------------       
   DECLARE @newMBW int = (SELECT Master_Bath_Window from Event_Current_State where Row_ID = 1) 
   DECLARE @oldMBW int = (SELECT Master_Bath_Window from Event_Current_State where Row_ID = 2)

   IF @newMBW <> @oldMBW
   BEGIN
      if (@newMBW = 1)
         set @Event_ID = '3002'
      else
         set @Event_ID = '3001'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END     
   
--------------------
-- Master_Bedroom_Window_South      
--------------------       
   DECLARE @newMBWS int = (SELECT Master_Bedroom_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldMBWS int = (SELECT Master_Bedroom_Window_South from Event_Current_State where Row_ID = 2)

   IF @newMBWS <> @oldMBWS
   BEGIN
      if (@newMBWS = 1)
         set @Event_ID = '3004'
      else
         set @Event_ID = '3003'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END    
   
--------------------
-- Master_Bedroom_Window_Back_South      
--------------------       
   DECLARE @newMBWBS int = (SELECT Master_Bedroom_Window_Back_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldMBWBS int = (SELECT Master_Bedroom_Window_Back_South from Event_Current_State where Row_ID = 2)

   IF @newMBWBS <> @oldMBWBS
   BEGIN
      if (@newMBWBS = 1)
         set @Event_ID = '3006'
      else
         set @Event_ID = '3005'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Master_Bedroom_Window_Back_North      
--------------------       
   DECLARE @newMBWBN int = (SELECT Master_Bedroom_Window_Back_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldMBWBN int = (SELECT Master_Bedroom_Window_Back_North from Event_Current_State where Row_ID = 2)

   IF @newMBWBN <> @oldMBWBN
   BEGIN
      if (@newMBWBN = 1)
         set @Event_ID = '3008'
      else
         set @Event_ID = '3007'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Sydney_Bedroom_Window      
--------------------       
   DECLARE @newSBW int = (SELECT Sydney_Bedroom_Window from Event_Current_State where Row_ID = 1) 
   DECLARE @oldSBW int = (SELECT Sydney_Bedroom_Window from Event_Current_State where Row_ID = 2)

   IF @newSBW <> @oldSBW
   BEGIN
      if (@newSBW = 1)
         set @Event_ID = '3010'
      else
         set @Event_ID = '3009'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END


--------------------
-- Ethan_Bedroom_Window      
--------------------       
   DECLARE @newEBW int = (SELECT Ethan_Bedroom_Window from Event_Current_State where Row_ID = 1) 
   DECLARE @oldEBW int = (SELECT Ethan_Bedroom_Window from Event_Current_State where Row_ID = 2)

   IF @newEBW <> @oldEBW
   BEGIN
      if (@newEBW = 1)
         set @Event_ID = '3012'
      else
         set @Event_ID = '3011'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END
   
--------------------
-- Spare_Bedroom_Window_North      
--------------------       
   DECLARE @newSBWN int = (SELECT Spare_Bedroom_Window_North from Event_Current_State where Row_ID = 1) 
   DECLARE @oldSBWN int = (SELECT Spare_Bedroom_Window_North from Event_Current_State where Row_ID = 2)

   IF @newSBWN <> @oldSBWN
   BEGIN
      if (@newSBWN = 1)
         set @Event_ID = '3014'
      else
         set @Event_ID = '3013'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   
   
--------------------
-- Spare_Bedroom_Window_South      
--------------------       
   DECLARE @newSBWS int = (SELECT Spare_Bedroom_Window_South from Event_Current_State where Row_ID = 1) 
   DECLARE @oldSBWS int = (SELECT Spare_Bedroom_Window_South from Event_Current_State where Row_ID = 2)

   IF @newSBWS <> @oldSBWS
   BEGIN
      if (@newSBWS = 1)
         set @Event_ID = '3016'
      else
         set @Event_ID = '3015'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END   

--------------------
-- OTHER
--------------------       

--------------------
-- Server_Room_Motion      
--------------------       
   DECLARE @newSRM int = (SELECT Server_Room_Motion from Event_Current_State where Row_ID = 1) 

   if (@newSRM = 0)
      BEGIN
      set @Event_ID = '6001'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END   
   
--------------------
-- Upstairs_Hallway_Motion      
--------------------       
   DECLARE @newUHM int = (SELECT Upstairs_Hallway_Motion from Event_Current_State where Row_ID = 1) 

   if (@newUHM = 0)
      BEGIN
      set @Event_ID = '6002'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END    
   
--------------------
-- Great_Room_Motion      
--------------------       
   DECLARE @newGRM int = (SELECT Great_Room_Motion from Event_Current_State where Row_ID = 1) 

   if (@newGRM = 0)
      BEGIN
      set @Event_ID = '6003'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END
      
--------------------
-- Basement_Motion      
--------------------       
   DECLARE @newBM int = (SELECT Basement_Motion from Event_Current_State where Row_ID = 1) 

   if (@newBM = 0)
      BEGIN
      set @Event_ID = '6004'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END
      
--------------------
-- Exterior_Motion      
--------------------       
   DECLARE @newEXM int = (SELECT Exterior_Motion from Event_Current_State where Row_ID = 1) 

   if (@newEXM = 1)
      BEGIN
      set @Event_ID = '6005'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END

--------------------
-- Doorbell      
--------------------       
   DECLARE @newD int = (SELECT Doorbell from Event_Current_State where Row_ID = 1) 

   if (@newD = 1)
      BEGIN
      set @Event_ID = '5003'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END

--------------------
-- Telephone      
--------------------       
   DECLARE @newT int = (SELECT Telephone from Event_Current_State where Row_ID = 1) 

   if (@newT = 1)
      BEGIN
      set @Event_ID = '5004'
	  
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      END
   
--------------------
-- Mailbox      
--------------------       
   DECLARE @newM int = (SELECT Mailbox from Event_Current_State where Row_ID = 1) 
   DECLARE @oldM int = (SELECT Mailbox from Event_Current_State where Row_ID = 2)

   IF @newM <> @oldM
   BEGIN
      if ((@newM = 2) AND (@oldM = 1))
         set @Event_ID = '5002'  --Retrieved
      else if ((@newM = 1) AND (@oldM = 0))
         set @Event_ID = '5001'  --Delivered
      else 
         set @Event_ID = '5000'  --Reset

      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END

-------------------
-- Car_West (Dads Car)      
--------------------       
   DECLARE @newCW int = (SELECT Car_West from Event_Current_State where Row_ID = 1) 
   DECLARE @oldCW int = (SELECT Car_West from Event_Current_State where Row_ID = 2)

   IF @newCW <> @oldCW
   BEGIN
      if (@newCW = 1)
         set @Event_ID = '5007'
      else
         set @Event_ID = '5008'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END  
   
--------------------
-- Car_East (Moms Car)      
--------------------       
   DECLARE @newCE int = (SELECT Car_East from Event_Current_State where Row_ID = 1) 
   DECLARE @oldCE int = (SELECT Car_East from Event_Current_State where Row_ID = 2)

   IF @newCE <> @oldCE
   BEGIN
      if (@newCE = 1)
         set @Event_ID = '5005'
      else
         set @Event_ID = '5006'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END  

--------------------
-- House Occupied      
--------------------       
   DECLARE @newHO int = (SELECT House_Occupied from Event_Current_State where Row_ID = 1) 
   --DECLARE @oldHO int = (SELECT House_Occupied from Event_Current_State where Row_ID = 2)

   --IF @newHO <> @oldHO
   --BEGIN
   --   if (@newHO = 1)
   --      set @Event_ID = '5023'
   
   --   INSERT INTO [Watchdog].[dbo].[Event_History]
   --        ([Event_ID]
   --        ,[Event_Timestamp])
   --   VALUES
   --        (@Event_ID
   --        ,CURRENT_TIMESTAMP)
   --END  
   
--------------------
-- Brine Tank     
--------------------       
   DECLARE @newBT int = (SELECT Brine_Tank from Event_Current_State where Row_ID = 1) 
   DECLARE @oldBT int = (SELECT Brine_Tank from Event_Current_State where Row_ID = 2) 

   IF (@newBT <= 10 and @newBT <> @oldBT)
   BEGIN
      set @Event_ID = '5025'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END 
   
--------------------
-- Internet Connection Status
--------------------       
   DECLARE @newICS int = (SELECT Internet_Link from Event_Current_State where Row_ID = 1) 
   DECLARE @oldICS int = (SELECT Internet_Link from Event_Current_State where Row_ID = 2)

   IF @newICS <> @oldICS
   BEGIN
      if (@newICS = 1)
         set @Event_ID = '5030'
      else
         set @Event_ID = '5031'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END  
   
--------------------
-- Stair Light Status
--------------------       
   DECLARE @newSL int = (SELECT Stair_Lights from Event_Current_State where Row_ID = 1) 
   DECLARE @oldSL int = (SELECT Stair_Lights from Event_Current_State where Row_ID = 2)

   IF @newSL <> @oldSL
   BEGIN
      if (@newSL = 1)
         set @Event_ID = '5048'
      else
         set @Event_ID = '5049'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
   END 
   
-- Make Sound
   IF (@Event_ID <> '') 
   BEGIN
		
		SET @cmd = 'C:\Progra~1\WatchDog\WDPlay_Sound.exe ' + @Event_ID
		EXEC master..xp_cmdshell @cmd,NO_OUTPUT

-- Update Old row with New values
UPDATE [Watchdog].[dbo].[Event_Current_State]
   SET [Last_Update] = CURRENT_TIMESTAMP
      ,[Garage_Door] = @newGD
      ,[Garage_Window_South] = @newGWS
      ,[Garage_Window_North] = @newGWN
      ,[Garage_Outside_Door] = @newGOD
      ,[Garage_Outside_Door_Lock] = @newGODL
      ,[Garage_Inside_Door] = @newGID
      ,[Garage_Inside_Door_Lock] = @newGIDL
      ,[Kitchen_Window] = @newKW
      ,[Back_Door] = @newBKD
      ,[Back_Door_Lock] = @newBKDL
      ,[Great_Room_Window_South] = @newGRWS
      ,[Great_Room_Window_North] = @newGRWN
      ,[Play_Room_Window_South] = @newPRWS
      ,[Play_Room_window_North] = @newPRWN
      ,[Famiy_Room_Window_South] = @newFRWS
      ,[Family_Room_Window_Front_South] = @newFRWFS
      ,[Family_Room_Window_Front_Middle] = @newFRWFM
      ,[Family_Room_Window_Front_North] = @newFRWFN
      ,[Front_Door] = @newFD
      ,[Front_Door_Lock] = @newFDL
      ,[Dining_Room_Window_South] = @newDRWS
      ,[Dining_Room_Window_North] = @newDRWN
      ,[Master_Bath_Window] = @newMBW
      ,[Master_Bedroom_Window_South] = @newMBWS
      ,[Master_Bedroom_Window_Back_South] = @newMBWBS
      ,[Master_Bedroom_Window_Back_North] = @newMBWBN
      ,[Sydney_Bedroom_Window] = @newSBW
      ,[Ethan_Bedroom_Window] = @newEBW
      ,[Spare_Bedroom_Window_North] = @newSBWN
      ,[Spare_Bedroom_Window_South] = @newSBWS
      ,[Mailbox] = @newM
      ,[Car_West] = @newCW
      ,[Car_East] = @newCE
      ,[Basement_Door] = @newBD
      ,[Basement_Door_Lock] = @newBDL
      ,[Basement_Window_South] = @newBWS
      ,[Basement_Window_North] = @newBWN
      ,[Basement_Storage_Door] = @newBSD
      ,[House_Occupied] = @newHO
      ,[Brine_Tank] = @newBT
      ,[Internet_Link] = @newICS
      ,[Stair_Lights] = @newSL
 WHERE Row_ID = 2	
		
 --  END
   
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Event_History_Purge]
ON [dbo].[Event_History]
AFTER INSERT
AS
DELETE FROM [Watchdog].[dbo].[Event_History]
      WHERE MONTH(Event_Timestamp) <= (MONTH(CURRENT_TIMESTAMP) - 2) OR
            YEAR(Event_Timestamp) <= (YEAR(CURRENT_TIMESTAMP) -1)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[Irrigation_History_Purge]
ON [dbo].[Irrigation_History]
AFTER INSERT
AS
DELETE FROM [Watchdog].[dbo].[Irrigation_History]
      WHERE MONTH(Event_Timestamp) <= (MONTH(CURRENT_TIMESTAMP) - 2) OR
            YEAR(Event_Timestamp) <= (YEAR(CURRENT_TIMESTAMP) -1)


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[Temp_Alert]
ON [dbo].[Temp_Current_State]
AFTER UPDATE
AS
    /* special logic since Living Room temp is updated twice per hour while the rest is hourly */
	DECLARE @THLastUpdated as DATETIME = 
		(SELECT TOP 1 Last_Updated FROM [Watchdog].[dbo].[Temp_History] ORDER BY Last_Updated DESC)
	DECLARE @TCSLastUpdated as DATETIME =
		(SELECT Last_Update FROM [Watchdog].[dbo].[Temp_Current_State] )
		
	IF @THLastUpdated <> @TCSLastUpdated
	BEGIN
		DECLARE @event_id nchar(4)
		DECLARE @cmd nvarchar(50)

		SET @event_id = ''

		--------------------
		-- BASEMENT
		-------------------- 
		   DECLARE @tempB int = (SELECT Basement_Office from Temp_Current_State) 

		   IF @tempB > 90
		   BEGIN
			  SET @event_id = '5022'
			  INSERT INTO [Watchdog].[dbo].[Event_History]
				   ([Event_ID]
				   ,[Event_Timestamp])
			  VALUES
				   (@event_id
				   ,CURRENT_TIMESTAMP)
		   END
		   
		--------------------
		-- MAIN LEVEL      
		--------------------       

		   DECLARE @tempK int = (SELECT Kitchen from Temp_Current_State) 
		   DECLARE @tempPR int = (SELECT Play_Room from Temp_Current_State)
		   DECLARE @tempLR int = (SELECT Living_Room from Temp_Current_State)
		   DECLARE @tempGR int = (SELECT Great_Room from Temp_Current_State)

		   IF (@tempK > 85) or (@tempPR > 85) or (@tempLR > 85) or (@tempGR > 85)
		   BEGIN
			  SET @event_id = '5020'
			  INSERT INTO [Watchdog].[dbo].[Event_History]
				   ([Event_ID]
				   ,[Event_Timestamp])
			  VALUES
				   (@event_id
				   ,CURRENT_TIMESTAMP)
		   END
		   
		   IF (@tempK < 65) or (@tempPR < 65) or (@tempLR < 65) or (@tempGR < 65)
		   BEGIN
			  SET @event_id = '5021'
			  INSERT INTO [Watchdog].[dbo].[Event_History]
				   ([Event_ID]
				   ,[Event_Timestamp])
			  VALUES
				   (@event_id
				   ,CURRENT_TIMESTAMP)
		   END
		   
		--------------------
		-- UPSTAIRS
		--------------------       

		   DECLARE @tempMBR int = (SELECT Master_Bedroom from Temp_Current_State) 
		   DECLARE @tempSR int = (SELECT Sydney_Bedroom from Temp_Current_State)
		   DECLARE @tempER int = (SELECT Ethan_Bedroom from Temp_Current_State)

		   IF (@tempMBR > 85) or (@tempSR > 85) or (@tempER > 85)
		   BEGIN
			  SET @event_id = '5018'
			  INSERT INTO [Watchdog].[dbo].[Event_History]
				   ([Event_ID]
				   ,[Event_Timestamp])
			  VALUES
				   (@event_id
				   ,CURRENT_TIMESTAMP)
		   END
		   
		   IF (@tempMBR < 65) or (@tempSR < 65) or (@tempER < 65)
		   BEGIN
			  SET @event_id = '5019'
			  INSERT INTO [Watchdog].[dbo].[Event_History]
				   ([Event_ID]
				   ,[Event_Timestamp])
			  VALUES
				   (@event_id
				   ,CURRENT_TIMESTAMP)
		   END

		-- Make Sound
		   IF (@Event_ID <> '') and (DatePart(hh, GetDate()) < 23) and (DatePart(hh, GetDate()) > 6)
		   BEGIN
				
				SET @cmd = 'C:\Progra~1\Watchdog\WDPlay_Sound ' + @Event_ID
				EXEC master..xp_cmdshell @cmd,NO_OUTPUT

		   END
		END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[Temp_Archive]
ON [dbo].[Temp_Current_State]
AFTER UPDATE
AS 
BEGIN
	DECLARE @THLastUpdated as DATETIME = 
		(SELECT TOP 1 Last_Updated FROM [Watchdog].[dbo].[Temp_History] ORDER BY Last_Updated DESC)
	DECLARE @TCSLastUpdated as DATETIME =
		(SELECT Last_Update FROM [Watchdog].[dbo].[Temp_Current_State] )
		
	IF @THLastUpdated <> @TCSLastUpdated
	BEGIN
		INSERT INTO [Watchdog].[dbo].[Temp_History]
				   ([Last_Updated]
				   ,[Master_Bedroom]
				   ,[Ethan_Bedroom]
				   ,[Sydney_Bedroom]
				   ,[Play_Room]
				   ,[Kitchen]
				   ,[Living_Room]
				   ,[Garage]
				   ,[Basement_Office]
				   ,[Great_Room])
		SELECT [Last_Update]
			  ,[Master_Bedroom]
			  ,[Ethan_Bedroom]
			  ,[Sydney_Bedroom]
			  ,[Play_Room]
			  ,[Kitchen]
			  ,[Living_Room]
			  ,[Garage]
			  ,[Basement_Office]
			  ,[Great_Room]
		FROM [Watchdog].[dbo].[Temp_Current_State]

		DELETE FROM [Watchdog].[dbo].[Temp_History]
			  WHERE [Last_Updated] < DATEADD(day, -1, CURRENT_TIMESTAMP)
	END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Brine_Tank_History_Archive2] 
   ON  [dbo].[Temp_History]
   AFTER INSERT
AS 
BEGIN

	IF DATEPART(HOUR, CURRENT_TIMESTAMP) = 0 
	BEGIN
	    DECLARE @Current_Brine_Tank_Level INT;
		SET @Current_Brine_Tank_Level = (SELECT Brine_Tank FROM Event_Current_State WHERE Row_ID = 1);

		INSERT INTO dbo.Brine_Tank_History
		   (Brine_Tank_Level, Event_Timestamp)
		VALUES (@Current_Brine_Tank_Level, CURRENT_TIMESTAMP);
		   
	END

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[Temp_Daily_Aggregate_Archive2] 
   ON  [dbo].[Temp_History]
   AFTER INSERT
AS 
BEGIN

	IF DATEPART(HOUR, CURRENT_TIMESTAMP) = 0
	BEGIN

		-- Averages
		DECLARE @Avg_Master_Bedroom INT;
		SET @Avg_Master_Bedroom = (SELECT TOP (24) AVG(Master_Bedroom) FROM Temp_History);

		DECLARE @Avg_Ethan_Bedroom INT;
		SET @Avg_Ethan_Bedroom = (SELECT TOP (24) AVG(Ethan_Bedroom) FROM Temp_History);

		DECLARE @Avg_Sydney_Bedroom INT;
		SET @Avg_Sydney_Bedroom = (SELECT TOP (24) AVG(Sydney_Bedroom) FROM Temp_History);

		DECLARE @Avg_Play_Room INT;
		SET @Avg_Play_Room = (SELECT TOP (24) AVG(Play_Room) FROM Temp_History);

		DECLARE @Avg_Living_Room INT;
		SET @Avg_Living_Room = (SELECT TOP (24) AVG(Living_Room) FROM Temp_History);

		DECLARE @Avg_Kitchen INT;
		SET @Avg_Kitchen = (SELECT TOP (24) AVG(Kitchen) FROM Temp_History);
		
		DECLARE @Avg_Great_Room INT;
		SET @Avg_Great_Room = (SELECT TOP (24) AVG(Great_Room) FROM Temp_History);
		
		DECLARE @Avg_Inside INT
		SET @Avg_Inside = ((@Avg_Master_Bedroom + @Avg_Ethan_Bedroom + @Avg_Sydney_Bedroom + @Avg_Kitchen + @Avg_Living_Room + @Avg_Play_Room + @Avg_Great_Room)/7);

		DECLARE @Avg_Outside INT;
		SET @Avg_Outside = (SELECT TOP (24) AVG(Garage) FROM Temp_History);
		


		--Minimums
		DECLARE @Min_Master_Bedroom INT;
		SET @Min_Master_Bedroom = (SELECT TOP (24) MIN(Master_Bedroom) FROM Temp_History);

		DECLARE @Min_Ethan_Bedroom INT;
		SET @Min_Ethan_Bedroom = (SELECT TOP (24) MIN(Ethan_Bedroom) FROM Temp_History);

		DECLARE @Min_Sydney_Bedroom INT;
		SET @Min_Sydney_Bedroom = (SELECT TOP (24) MIN(Sydney_Bedroom) FROM Temp_History);

		DECLARE @Min_Play_Room INT;
		SET @Min_Play_Room = (SELECT TOP (24) MIN(Play_Room) FROM Temp_History);

		DECLARE @Min_Living_Room INT;
		SET @Min_Living_Room = (SELECT TOP (24) MIN(Living_Room) FROM Temp_History);

		DECLARE @Min_Kitchen INT;
		SET @Min_Kitchen = (SELECT TOP (24) MIN(Kitchen) FROM Temp_History);
				
		DECLARE @Min_Great_Room INT;
		SET @Min_Great_Room = (SELECT TOP (24) MIN(Great_Room) FROM Temp_History);

		DECLARE @Min_Inside INT;
		SET @Min_Inside = 100;
		if @Min_Inside > @Min_Master_Bedroom  SET @Min_Inside = @Min_Master_Bedroom;
		if @Min_Inside > @Min_Ethan_Bedroom   SET @Min_Inside = @Min_Ethan_Bedroom;
		if @Min_Inside > @Min_Sydney_Bedroom  SET @Min_Inside = @Min_Sydney_Bedroom;
		if @Min_Inside > @Min_Kitchen         SET @Min_Inside = @Min_Kitchen;
		if @Min_Inside > @Min_Play_Room       SET @Min_Inside = @Min_Play_Room;
		if @Min_Inside > @Min_Living_Room     SET @Min_Inside = @Min_Living_Room;
		if @Min_Inside > @Min_Great_Room      SET @Min_Inside = @Min_Great_Room;

		DECLARE @Min_Outside INT;
		SET @Min_Outside = (SELECT TOP (24) MIN(Garage) FROM Temp_History);


		--Maximums
		DECLARE @Max_Master_Bedroom INT;
		SET @Max_Master_Bedroom = (SELECT TOP (24) MAX(Master_Bedroom) FROM Temp_History);

		DECLARE @Max_Ethan_Bedroom INT;
		SET @Max_Ethan_Bedroom = (SELECT TOP (24) MAX(Ethan_Bedroom) FROM Temp_History);

		DECLARE @Max_Sydney_Bedroom INT;
		SET @Max_Sydney_Bedroom = (SELECT TOP (24) MAX(Sydney_Bedroom) FROM Temp_History);

		DECLARE @Max_Play_Room INT;
		SET @Max_Play_Room = (SELECT TOP (24) MAX(Play_Room) FROM Temp_History);

		DECLARE @Max_Living_Room INT;
		SET @Max_Living_Room = (SELECT TOP (24) MAX(Living_Room) FROM Temp_History);

		DECLARE @Max_Kitchen INT;
		SET @Max_Kitchen = (SELECT TOP (24) MAX(Kitchen) FROM Temp_History);
						
		DECLARE @Max_Great_Room INT;
		SET @Max_Great_Room = (SELECT TOP (24) MAX(Great_Room) FROM Temp_History);

		DECLARE @Max_Inside INT;
		SET @Max_Inside = 0;
		if @Max_Inside < @Max_Master_Bedroom  SET @Max_Inside = @Max_Master_Bedroom;
		if @Max_Inside < @Max_Ethan_Bedroom   SET @Max_Inside = @Max_Ethan_Bedroom;
		if @Max_Inside < @Max_Sydney_Bedroom  SET @Max_Inside = @Max_Sydney_Bedroom;
		if @Max_Inside < @Max_Kitchen         SET @Max_Inside = @Max_Kitchen;
		if @Max_Inside < @Max_Play_Room       SET @Max_Inside = @Max_Play_Room;
		if @Max_Inside < @Max_Living_Room     SET @Max_Inside = @Max_Living_Room;
		if @Max_Inside < @Max_Great_Room      SET @Max_Inside = @Max_Great_Room;

		DECLARE @Max_Outside INT;
		SET @Max_Outside = (SELECT TOP (24) MAX(Garage) FROM Temp_History);
		
		INSERT INTO dbo.Temp_Daily_Aggregate
			   (Last_Updated, Avg_Inside, Avg_Outside, Min_Inside, Min_Outside, Max_Inside, Max_Outside)
		VALUES (CURRENT_TIMESTAMP, @Avg_Inside, @Avg_Outside, @Min_Inside, @Min_Outside, @Max_Inside, @Max_Outside);
		
	END

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Vent_History_Purge]
ON [dbo].[Vent_History]
AFTER INSERT
AS
DELETE FROM [Watchdog].[dbo].[Vent_History]
      WHERE MONTH(Event_Timestamp) <= (MONTH(CURRENT_TIMESTAMP) - 2) OR
            YEAR(Event_Timestamp) <= (YEAR(CURRENT_TIMESTAMP) -1)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[Water_Usage_History_Purge]
ON [dbo].[Water_Usage_History]
AFTER INSERT
AS
DELETE FROM [Watchdog].[dbo].[Water_Usage_History]
      WHERE MONTH(Event_Timestamp) <= (MONTH(CURRENT_TIMESTAMP) - 2) OR
            YEAR(Event_Timestamp) <= (YEAR(CURRENT_TIMESTAMP) -1)


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[X10_Update] 
   ON  [dbo].[X10_Control]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
DECLARE @event_id nchar(4)
DECLARE @cmd nvarchar(40)
DECLARE @i integer

SET @event_id = ''

--------------------
-- Light 1 ON     
--------------------       
   DECLARE @L1On int = (SELECT Light1_on from X10_Control) 

   IF @L1On >= 1
   BEGIN
      SET @event_id = '5010'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe G01 GON'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
   
--------------------
-- Light 1 OFF
--------------------       
   DECLARE @L1Off int = (SELECT Light1_off from X10_Control) 

   IF @L1Off >= 1
   BEGIN
      SET @event_id = '5011'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe G01 GOF'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
--------------------
-- Light 2 ON     
--------------------       
   DECLARE @L2On int = (SELECT Light2_on from X10_Control) 

   IF @L2On >= 1
   BEGIN
      SET @event_id = '5010'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe G02 GON'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
   
--------------------
-- Light 2 OFF
--------------------       
   DECLARE @L2Off int = (SELECT Light2_off from X10_Control) 

   IF @L2Off >= 1
   BEGIN
      SET @event_id = '5011'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe G02 GOF'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
--------------------
-- Light 3 ON (Front Door Coach Light)
--------------------       
   DECLARE @L3On int = (SELECT Light3_on from X10_Control) 

   IF @L3On >= 1
   BEGIN
      SET @event_id = '5042'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe A01 AON'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
   
--------------------
-- Light 3 OFF (Front Door Coach Light)
--------------------       
   DECLARE @L3Off int = (SELECT Light3_off from X10_Control) 

   IF @L3Off >= 1
   BEGIN
      SET @event_id = '5043'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe A01 AOF'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
--------------------
-- Light 4 ON (Garage Door Coach Light)
--------------------       
   DECLARE @L4On int = (SELECT Light4_on from X10_Control) 

   IF @L4On >= 1
   BEGIN
      SET @event_id = '5044'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
      
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe B01 BON'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
   
--------------------
-- Light 4 OFF (Garage Door Coach Light)
--------------------       
   DECLARE @L4Off int = (SELECT Light4_off from X10_Control) 

   IF @L4Off >= 1
   BEGIN
      SET @event_id = '5045'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe B01 BOF'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
--------------------
-- Temp Up 1    
--------------------       
   DECLARE @TempUp1 int = (SELECT Temp_Up_1 from X10_Control) 

   IF @TempUp1 >= 1
   BEGIN
      SET @event_id = '5026'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
      SET @i = 0
      WHILE @i < @TempUp1
           BEGIN
   	       SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe F01 FBR'
		   EXEC master..xp_cmdshell @cmd,NO_OUTPUT
		   SET @i = @i + 1
		   WAITFOR DELAY '00:00:01'
	       END

   END
   
--------------------
-- Temp Down 1  
--------------------       
   DECLARE @TempDown1 int = (SELECT Temp_Down_1 from X10_Control) 

   IF @TempDown1 >= 1
   BEGIN
      SET @event_id = '5027'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
      SET @i = 0
      WHILE @i < @TempDown1
           BEGIN
   	       SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe F01 FDI'
		   EXEC master..xp_cmdshell @cmd,NO_OUTPUT
		   SET @i = @i + 1
		   WAITFOR DELAY '00:00:01'
	       END

   END
   
   --------------------
-- Temp Up 3
--------------------       
   DECLARE @TempUp3 int = (SELECT Temp_Up_3 from X10_Control) 

   IF @TempUp3 >= 1
   BEGIN
      SET @event_id = '5026'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
      SET @i = 0
      WHILE @i < 3
           BEGIN
   	       SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe F01 FBR'
		   EXEC master..xp_cmdshell @cmd,NO_OUTPUT
		   SET @i = @i + 1
		   WAITFOR DELAY '00:00:01'
	       END

   END
   
--------------------
-- Temp Down 3 
--------------------       
   DECLARE @TempDown3 int = (SELECT Temp_Down_3 from X10_Control) 

   IF @TempDown3 >= 1
   BEGIN
      SET @event_id = '5027'
   
      INSERT INTO [Watchdog].[dbo].[Event_History]
           ([Event_ID]
           ,[Event_Timestamp])
      VALUES
           (@Event_ID
           ,CURRENT_TIMESTAMP)
           
      SET @i = 0
      WHILE @i < 3
           BEGIN
   	       SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe F01 FDI'
		   EXEC master..xp_cmdshell @cmd,NO_OUTPUT
		   SET @i = @i + 1
		   WAITFOR DELAY '00:00:01'
	       END

   END
   
--------------------
-- Doorbell
--------------------       
   DECLARE @Doorbell int = (SELECT Doorbell from X10_Control) 

   IF @Doorbell = 1
   BEGIN         
      SET @event_id = '5003'
      --Do not write event since it has already been written by Watchdog
   	  SET @cmd = 'C:\Progra~1\WatchDog\WDX10.exe G05 GON'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
	  WAITFOR DELAY '00:00:01'
	  EXEC master..xp_cmdshell @cmd,NO_OUTPUT
   END
   
--------------------
-- Reset Table
--------------------  

   IF (@Event_ID <> '') 
   BEGIN
		
		UPDATE [Watchdog].[dbo].[X10_Control]
		SET  [Light1_on] = 0
			,[Light1_off] = 0
			,[Light2_on] = 0
			,[Light2_off] = 0
			,[Light3_on] = 0
			,[Light3_off] = 0
			,[Light4_on] = 0
			,[Light4_off] = 0
			,[Temp_up_1] = 0
			,[Temp_down_1] = 0
			,[Temp_up_3] = 0
			,[Temp_down_3] = 0
			,[Zone1_on] = 0
			,[Zone1_off] = 0
			,[Zone2_on] = 0
			,[Zone2_off] = 0
			,[Zone3_on] = 0
			,[Zone3_off] = 0
			,[Zone4_on] = 0
			,[Zone4_off] = 0
			,[Doorbell] = 0
	
   END

END

GO

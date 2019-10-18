-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE updateAgroFuelLevelAlarm 
AS
BEGIN

SET NOCOUNT ON;

declare @last_id int

select @last_id = max(id_alarm) from agro_fuel_level_alarm
if @last_id is null set @last_id = 0

declare @id_alarm int
declare @datadatetime datetime
declare @id_pos int
declare @id_tank int
declare @difference numeric(15,2)
declare @currentMass numeric(15,2)
declare @lastMass numeric(15,2)
declare @lastDateTime datetime

select top 1 
@id_alarm = ID, @datadatetime = DATADATETIME, @id_pos = POS_ID, @id_tank = TANKID, 
@difference = DIFF, @currentMass = CURRENT_MASS, @lastMass = MASS_LAST_ZAPR, @lastDateTime = DATE_LAST_ZAPR
from [TOPAZ]...[AGRO_FUEL_LEVEL_ALARM] where ID > @last_id order by ID

--while @@ROWCOUNT > 0
--begin
	--select @id_alarm
	/*print convert(nvarchar, @id_alarm)
	print convert(nvarchar, @datadatetime)
	print convert(nvarchar, @id_pos)
	print convert(nvarchar, @id_tank)
	print convert(nvarchar, @difference)
	print convert(nvarchar, @currentMass)
	print convert(nvarchar, @lastMass)
	print convert(nvarchar, @lastDateTime)*/
	insert into agro_fuel_level_alarm(id_alarm, datadatetime, diff, id_tank, id_pos, current_mass, last_mass, lastdatetime) 
	values(@id_alarm, @datadatetime, @difference, @id_tank, @id_pos, @currentMass, @lastMass, @lastDateTime)

	/*select top 1 
	@id_alarm = ID, @datadatetime = DATADATETIME, 
	@id_pos = POS_ID, @id_tank = TANKID, 
	@difference = DIFF, @currentMass = CURRENT_MASS, @lastMass = MASS_LAST_ZAPR, @lastDateTime = DATE_LAST_ZAPR
	from [TOPAZ]...[AGRO_FUEL_LEVEL_ALARM] where ID > @last_id and ID > @id_alarm order by ID*/
--end
END
GO

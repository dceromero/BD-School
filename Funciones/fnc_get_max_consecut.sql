
USE [medalla_Web]
GO
/****** Objeto: UserDefinedFunction [dbo].[Fnc_Defano] Fecha de script: 20/08/2026 8:33:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function fnc_get_max_consecut() returns int

as

begin

declare @outParam as int

select @outParam = isnull(max(id),0)+1 from B3Indicadores


return @outParam

end

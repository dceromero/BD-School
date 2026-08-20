
USE [medalla_Web]
GO
/****** Objeto: UserDefinedFunction [dbo].[Fnc_Defano] Fecha de script: 20/08/2026 8:33:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function fnc_get_Parameter(@param as nvarchar(30)) returns nvarchar

as

begin

declare @outParam as varchar(max)

select @outParam = Valorparametro from w0parametros where parametro=@param


return @outParam

end




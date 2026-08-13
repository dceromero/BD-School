USE [medalla_Fnew]
GO

/****** Object:  UserDefinedFunction [dbo].[Fnc_NroLogros]    Script Date: 11/01/2026 7:11:08 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[Fnc_NroLogros] 
(
@ano as int,
@grado as varchar(10),
@codAsignatura as varchar(10)
)

returns int
as
begin

Declare @nroLogros as int

select @nroLogros= Nro_Logros  from  s1controlusr
 where ano=@ano and Grado=@grado and  codAsignatura=@CodAsignatura


return isnull(@nroLogros,1)

end
GO


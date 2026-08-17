 

Create Function [dbo].[Fnc_Activo] (@idMatricula as int)
Returns char(1)

as
Begin
 
 Declare @estado as char(1)
 
 select @estado=Estado from B1Matriculas where IdMatricula=@idMatricula

 return isnull(@estado,'0')

End
GO



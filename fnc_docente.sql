
create Function [dbo].[Fnc_Docente]
(
@ano as int,
@grado as varchar(10),
@grupo as varchar(10),
@codAsignatura as varchar(10)

)

returns varchar(50)
as
begin

Declare @docente as varchar(50)

select @docente= NombreComp   from  qs1controlusr
 where ano=@ano and Grado=@grado and  codAsignatura=@CodAsignatura and Grupo=@grupo


return isnull(upper(@docente),'')

end
GO


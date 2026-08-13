
Create Function [dbo].[Fnc_AsignaturasAbr] (@CodAsignatura as Varchar(10))
Returns Varchar(80)

as

Begin

Declare @Asignatura as Varchar(80)

select @Asignatura=NombreAbrev from B0asignaturas 
where CodAsignatura=@CodAsignatura 

return isnull(@Asignatura,'')


End


GO

 
Create Function [dbo].[Fnc_AlumnoMtr] (@idMatricula as int)
Returns Varchar(80)

as

Begin

Declare @Alumno as Varchar(80)

select @Alumno=Apellidos + ' ' + rtrim(Nombres)  from QB0Matriculas
where  IdMatricula=@idMatricula
return isnull(@Alumno,'')


End
GO


create Function [dbo].[Fnc_AsignaturasSec] (@CodAsignatura as Varchar(10))
Returns int

as

Begin

Declare @i as int

select @i=Secuencia from B0asignaturas 
where CodAsignatura=@CodAsignatura 

return isnull(@i,1)


End
GO







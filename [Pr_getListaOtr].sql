create procedure [dbo].[Pr_getListaOtr]
(
  @codPlanilla as varchar(30),
  @usuario as varchar(30),
  @termId as varchar(30)

)
as begin

--consulta si existe la planilla o la crea
--termid es el nombre del computador
--usuario es el docente
--Codplanilla = Ano + periodo + grado + grupo + codasignatura

declare @ano  as varchar(4) 
declare @periodo as varchar(1)
declare @grado as varchar(2)
declare @grupo as varchar(1)
declare @codasignatura as varchar(3)

set @ano= left (@codPlanilla,4)
set @periodo=SUBSTRING(@codPlanilla,5,1)
set @grado=SUBSTRING(@codPlanilla,6,2)
set @grupo=SUBSTRING(@codPlanilla,8,1)
set @codasignatura=SUBSTRING(@codPlanilla,9,3)




if not exists( select idplanilla from b1planillas where codplanilla=rtrim(@codPlanilla))
begin

 insert into b1planillas (Codplanilla,Ano,Grado,Grupo,Periodo,CodAsignatura,Activo,FecRegistro, TermId, Usuario)
 values (@Codplanilla,@ano,@grado,@grupo,@periodo,@codasignatura,1,getdate(),@termId,@usuario)

end 


select b.ano, b.idplanilla, b.idmatricula, e.Apellidos, e.Nombres, b.Ausencias,
b.Nicfes, 
b.NotaRP,b.NotaRF,b.NotaNiv,b.NotaEU --estas 4 casillas dejarlas no editables por el momento
from b1seguimientosotr b
inner join b1matriculas m on b.Idmatricula=m.IdMatricula
inner join B0Estudiantes e 
on m.codestudiante=e.CodEstudiante
where b.IdPlanilla=dbo.Fnc_IdPlanilla(@codPlanilla)
order by e.Apellidos,e.Nombres

/*
select dbo.Fnc_IdPlanilla(@codPlanilla) idPlanilla, Ano, CodLogro, TextoLg, Periodo, CantNotas, pc1, pc2, pc3, pc4, 
       grado, CodAsignatura, Consecut, Id
	   from b3indicadores
	   where ano=@ano  and periodo=@periodo and grado=@grado and CodAsignatura=@codasignatura
	   */

	   --exec [Pr_getListaOtr] '2026110A011','jose','equipo1'
end
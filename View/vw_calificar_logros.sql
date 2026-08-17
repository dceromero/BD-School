alter view vw_calificar_logros as
SELECT     snt.ano, snt.Idmatricula, snt.CodLogro, est.Apellidos, est.Nombres, snt.N1, snt.N2, snt.N3, snt.N4, snt.IdPlanilla
FROM        B1SeguimientosNt snt
inner join B1Matriculas mat on mat.IdMatricula = snt.Idmatricula
inner join B0Estudiantes est on est.CodEstudiante = mat.CodEstudiante
where snt.Ano = dbo.fnc_get_Parameter('Default_ano')


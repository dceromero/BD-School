select * from B1Planillas where CodPlanilla ='2026204A201'
select * from QB1Planillas where CodPlanilla ='2026204A201'

select * from B1SeguimientosNt where IdPlanilla=7

select * from QB1SeguimientosNt where Idmatricula ='10' and IdPlanilla='7'

select * from vw_userLogin where NombreUsr like '%bgom%'

select * from S1ControlUsr where NombreUsr like '%bgom%'

	update S1ControlUsr set FechaVigencia='2026-02-15 02:00:00.000' where NombreUsr like '%bgom%'
	update B1SeguimientosNt set n1 ='10', n2 ='0', n3='0', n4='0' where idmatricula = 10 and idPlanilla = 8 and CodLogro = '2010415'
	select * from vw_calificar_logros where   CodLogro ='0111011'
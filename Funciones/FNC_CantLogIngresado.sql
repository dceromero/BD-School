create function FNC_CantLogIngresado(@grado as varchar(5), @codAsig as varchar(5))
returns int
as begin
	return (select count(*) from B3Indicadores
	where ano=YEAR(GETDATE()) and grado =@grado and CodAsignatura =@codAsig and Periodo in(
					select Valorparametro from w0parametros where parametro='Default_Periodo'))
end 


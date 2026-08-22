
ALTER view [dbo].[vw_vencimientos] as
select distinct cu.nombreUsr, cu.Grado codGrado, g.DescGrado DescGrado, cu.CodAsignatura codAsignatura, a.Asignatura,
CONVERT(VARCHAR(10),cu.FechaVigencia, 23) fechaVigencia,  dbo.Fnc_DefPeriodo() periodo, dbo.Fnc_NroLogros(year(GETDATE()),cu.Grado,cu.CodAsignatura) cantLogros, 
(dbo.Fnc_NroLogros(year(GETDATE()),cu.Grado,cu.CodAsignatura)  - dbo.FNC_CantLogIngresado(cu.grado, cu.CodAsignatura)) cantNotasIng
from S1ControlUsr cu
inner join B0Grados g on g.Grado = cu.Grado
inner join B0Asignaturas a on a.CodAsignatura = cu.CodAsignatura
GO


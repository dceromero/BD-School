create view vw_grupos as
select valor idGrupo, CONCAT(Dato,' - ',Descripcion) grupo from B0Datos
where Dato='Grupos'
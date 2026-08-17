USE [medalla_Web]
GO

ALTER VIEW [dbo].[vm_menu]
AS
SELECT     dbo.B0PermisosOp.GrupoUsr, dbo.B0PermisosOp.opcion, dbo.S0Opciones.Descripcion, dbo.B0PermisosOp.Permiso, dbo.S0Opciones.Tabla, 
                      dbo.S0Opciones.Sqlstmt, dbo.S0Opciones.Nodopadre, trim(dbo.S0Opciones.tipoOp) tipoOp, dbo.S0Opciones.Secuencia, dbo.S0Opciones.Visible, 
                      dbo.S0Opciones.SecuenciaOp, dbo.Fnc_TipoOp(dbo.S0Opciones.tipoOp) AS Tipo, dbo.Fnc_MenuPadre(dbo.S0Opciones.Nodopadre) 
                      AS MenuPadre,  dbo.S0Opciones.urlOption,dbo.S0Opciones.iconOption
FROM         dbo.B0PermisosOp INNER JOIN
                      dbo.S0Opciones ON dbo.B0PermisosOp.opcion = dbo.S0Opciones.Opcion
WHERE     (dbo.S0Opciones.Visible = 1) AND (dbo.B0PermisosOp.GrupoUsr<>'55')

GO

update S0Opciones set urlOption =' ', iconOption ='pi pi-folder'
where tipoOp ='_M'
go 

update S0Opciones set urlOption ='notas', iconOption ='pi pi-address-book'
where opcion ='Bsegno'

go 

update S0Opciones set urlOption ='logros', iconOption ='pi pi-server'
where opcion ='Blo'

go

update S0Opciones set urlOption =' ', iconOption ='pi pi-list-check'
where opcion in('PIARDO','BINFO5')



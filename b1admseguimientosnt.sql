 
GO

CREATE TABLE [dbo].[B1AdmObservadorNt](
	[IdRegob] [int] IDENTITY(1,1) NOT NULL,
	[IdPlanilla] [int] NOT NULL,
	[IdMatricula] [int] NOT NULL,
	[tipoObs] [varchar](15) NOT NULL,
	[Reporte] [bit] NOT NULL,
	[Observacion] [varchar](256) NULL,
	[FechaControl] [datetime] NULL,
	[Cumplido] [bit] NULL,
	[ComentarioAd] [varchar](50) NULL,
	[Estado] [varchar](10) NULL,
	[FecRegistro] [datetime] NULL,
	[TermId] [varchar](30) NULL,
	[Usuario] [varchar](30) NULL,
	[Numsemana] [int] NULL,
	[FechaControlF] [datetime] NULL,
	[codlogro] [varchar](10) NULL,
	[itemObs] [int] NULL,
	[valoracion] [varchar](15) NULL,
 CONSTRAINT [PK_B1ObservadorNt] PRIMARY KEY CLUSTERED 
(
	[IdRegob] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[B1AdmObservadorNt] ADD  CONSTRAINT [DF_B1AdmObservadorNt_Reporte]  DEFAULT ((1)) FOR [Reporte]
GO

ALTER TABLE [dbo].[B1AdmObservadorNt] ADD  DEFAULT ((0)) FOR [itemObs]
GO

ALTER TABLE [dbo].[B1AdmObservadorNt] ADD  DEFAULT ('No_Apica') FOR [valoracion]
GO


create VIEW [dbo].[Qb1AdmObservadorNt]
AS
SELECT        P.Ano, P.Grado, P.Grupo, P.Periodo, P.Docente, P.codAsignatura,P.Asignatura, O.IdRegob, O.IdPlanilla, O.IdMatricula, dbo.Fnc_AlumnoMtr(O.IdMatricula) AS Alumno, O.tipoObs, O.Reporte, O.Observacion, dateadd(hh,3,O.FechaControl)  FechaControl, O.Cumplido, O.Numsemana, dateadd(hh,3,O.FechaControlF) FechaControlF, O.codLogro,O.ComentarioAd, O.Estado, O.FecRegistro, O.TermId, O.Usuario,dbo.Fnc_AsignaturasAbr(P.CodAsignatura) 
AsignaturaAbr,
dbo.[Fnc_AsignaturasSec](P.CodAsignatura) secuencia

FROM            B1AdmObservadorNt  O INNER JOIN
                         dbo.QB1Planillas  P ON O.IdPlanilla = P.IdPlanilla
						 where o.tipoObs in ('Observador','Control', 'Seguimiento')
GO


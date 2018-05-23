using Gestor.DAO.DB;
using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Reportes;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Reportes
{
    public class ReportesDAO
    {
        public List<ConsultaComparativoDTO> ConsultaComparativo(string numero, string inicio, string fin, string tipo)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", numero);
            parametros.Add("@FechaIni", inicio);
            parametros.Add("@FechaFin", fin);
            parametros.Add("@Tipo", fin);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaComparativo",
                Parametros = parametros
            });

            var consulta = (from q in resultados
                            select new ConsultaComparativoDTO()
                            {
                                solicitud = new SolicitudDTO()
                                {
                                    SolicitudId = (int)q["SolicitudId"],
                                    SolicitudNumero = (int)q["SolicitudNumero"],
                                    SolicitudFechaInicio = (string)q["SolicitudFechaInicio"],
                                    SolicitudFechaFin = (string)q["SolicitudFechaFin"],
                                    SolicitudObservacion = (string)q["SolicitudObservacion"]
                                },
                                estado = new EstadoSolicitudDTO()
                                {
                                    EstadoId = (int)q["EstadoId"],
                                    EstadoDescripcion = (string)q["EstadoDescripcion"]
                                },
                                tipo = new TipoSolicitudDTO()
                                {
                                    TipoId = (int)q["TipoId"],
                                    TipoDescripcion = (string)q["TipoDescripcion"]
                                }
                            }).ToList();
            return consulta;
        }

        public List<ReporteComparativoDTO> reporteValor( int solicitud) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ReporteComparativo",
                Parametros = parametros
            });
            var result = (from q in resultados
                          select new ReporteComparativoDTO()
                          {
                              CotizacionNumero = (int)q["CotizacionNumero"],
                              Total = (string)q["Total"]
                          }).ToList();
            return result;
        }

        public IList<Dictionary<string, object>> consultaPrincipal(int solicitud)
        {

            ConexionDTO obj = new ConexionDTO();
            obj.procedimiento = "ReporteComparativo";
            obj.Parametros.Add("@Solicitud", solicitud);
            var resul = new DBConexion().ConsultarSPDR(obj);

            return resul;

        }

    }
}

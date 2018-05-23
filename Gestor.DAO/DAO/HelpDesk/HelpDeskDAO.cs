using Gestor.DAO.DB;
using Gestor.DTO.DTO.HelpDesk;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.HelpDesk
{
    public class HelpDeskDAO
    {
        public ConsecutivoHDDTO NuevoConsecutivo()
        {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "NewConsecutivoHD"
            });

            var NuevoConsecutivo = (from q in resultados
                                    select new ConsecutivoHDDTO()
                                    {
                                        NewCaso = (int)q["NewCaso"]
                                    }
                                    ).FirstOrDefault();

            return NuevoConsecutivo;
        }

        public EncabezaoHDDTO EncabezadoHD(int usuario)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Usuario", usuario);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "EncabezadoHD",
                Parametros = parametros
            });

            var encabezado = (from q in resultados
                              select new EncabezaoHDDTO()
                              {
                                  NombreCompleto = (string)q["NombreCompleto"],
                                  FechaCaso = (string)q["FechaCaso"]
                              }).FirstOrDefault();

            return encabezado;
        }

        public int CrearIncidente(int caso, int usuario, string mensaje ) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Caso",caso);
            parametros.Add("@Usuario",usuario);
            parametros.Add("@Mensaje",mensaje);
            //parametros.Add("@Fecha",fecha);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CrearIncidentes",
                Parametros = parametros
            });

            return (int)resultados[0]["CasoNum"];
        }



        public List<InformeIncidentes> InformeCasos() {
            
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "InformeIncidentes"
            });

             var listaCasos = (from q in resultados
                               select new InformeIncidentes()
                               {
                                   helpDesk = new HelpDeskDTO() {
                                       CasoId = (int)q["CasoId"],
                                       CasoNum = (int)q["CasoNum"],
                                       CasoUsu = (int)q["CasoUsu"],
                                       CasoMesanje = (string)q["CasoMesanje"],
                                       CasoEstado = (int)q["CasoEstado"],
                                       CasoFecha = (string)q["CasoFecha"],
                                       CasoUsuAsig = (int)q["CasoUsuAsig"]
                                   },
                                   usuario = new UsuariosDTO() {
                                       UsuarioCorreo = (string)q["UsuarioCorreo"]
                                   },
                                   Nombre = (string)q["Nombre"],
                                   EstadoNombre = (string)q["EstadoNombre"]
                               }).ToList();
            return listaCasos;
        }

        public ConsultaCaso ConsultaCaso(int id)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Id", id);
            
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaCaso",
                Parametros = parametros
            });

            var caso = (from q in resultados
                              select new ConsultaCaso()
                              {
                                  helpDesk = new HelpDeskDTO()
                                  {
                                      CasoId = (int)q["CasoId"],
                                      CasoNum = (int)q["CasoNum"],
                                      CasoUsu = (int)q["CasoUsu"],
                                      CasoMesanje = (string)q["CasoMesanje"],
                                      CasoEstado = (int)q["CasoEstado"],
                                      CasoFecha = (string)q["CasoFecha"],
                                      CasoUsuAsig = (int)q["CasoUsuAsig"]
                                  },
                                  usuario = new UsuariosDTO()
                                  {
                                      UsuarioCorreo = (string)q["UsuarioCorreo"]
                                  },
                                  Nombre = (string)q["Nombre"],
                                  EstadoNombre = (string)q["EstadoNombre"],
                                  Responsable = (string)q["Responsable"]
                              }).FirstOrDefault();
            return caso;
        }
        public List<UsuariosDTO> ListaTecnicos() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListaTecnicos"
            });

            var tecnicos = (from q in resultados
                            select new UsuariosDTO()
                            {
                                UsuarioId = (int)q["UsuarioId"],
                                UsuarioNombre = (string)q["UsuarioNombre"],
                                UsuarioApellido = (string)q["UsuarioApellido"]
                            }).ToList();
            return tecnicos;
        }

        public void AsignaCaso( int caso, int usuario) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Caso", caso);
            parametros.Add("@Usuario", usuario);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "AsignarCaso",
                Parametros = parametros
            });
        }

        public List<InformeIncidentesUsuario> InformeCasosUsuario(int usuario)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Usuario", usuario);
               
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "InformeIncidentesUsuario",
                Parametros = parametros
            });

            var listaCasos = (from q in resultados
                              select new InformeIncidentesUsuario()
                              {
                                  helpDesk = new HelpDeskDTO()
                                  {
                                      CasoId = (int)q["CasoId"],
                                      CasoNum = (int)q["CasoNum"],
                                      CasoUsu = (int)q["CasoUsu"],
                                      CasoMesanje = (string)q["CasoMesanje"],
                                      CasoEstado = (int)q["CasoEstado"],
                                      CasoFecha = (string)q["CasoFecha"],
                                      CasoUsuAsig = (int)q["CasoUsuAsig"]
                                  },
                                  usuario = new UsuariosDTO()
                                  {
                                      UsuarioCorreo = (string)q["UsuarioCorreo"]
                                  },
                                  Nombre = (string)q["Nombre"],
                                  EstadoNombre = (string)q["EstadoNombre"],
                                  Responsable = (string)q["Responsable"]
                              }).ToList();
            return listaCasos;
        }

        public void ResponderIncidente(int caso, string respuesta) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Caso", caso);
            parametros.Add("@Respuesta", respuesta);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ResponderIncidente",
                Parametros = parametros
            });
        }

        public List<InformeValorizacionDTO> informeValorizacion() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaIncidentes"
            });

            var mostrar = (from q in resultados
                           select new InformeValorizacionDTO() {
                               helpDesk = new HelpDeskDTO() {
                                   CasoId = (int)q["CasoId"],
                                   CasoNum = (int)q["CasoNum"],
                                   CasoUsu = (int)q["CasoUsu"],
                                   CasoMesanje = (string)q["CasoMesanje"],
                                   CasoEstado = (int)q["CasoEstado"],
                                   CasoFecha = (string)q["CasoFecha"],
                                   CasoUsuAsig = (int)q["CasoUsuAsig"],
                                   CasoRespuesta = (string)q["CasoRespuesta"],
                                   CasoRespuestaFecha = (string)q["CasoRespuestaFecha"]
                               },
                               EstadoNombre = (string)q["EstadoNombre"],
                               Reportado = (string)q["Reportado"],
                               Contestado = (string)q["Contestado"],
                               CasoCalificacion = (string)q["CasoCalificacion"]
                           }).ToList();
            return mostrar;
        }

        public void valorar(int caso, int valor)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Caso", caso);
            parametros.Add("@Valor", valor);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ValorizaCasos",
                Parametros = parametros
            });
        }
            public void CambiarEstado(int caso, int estado)
            {
                Dictionary<String, object> parametros = new Dictionary<string, object>();
                parametros.Add("@Caso", caso);
                parametros.Add("@estado", estado);
                List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
                {
                    procedimiento = "Actualizar",
                    Parametros = parametros
                });
            }
        }
}

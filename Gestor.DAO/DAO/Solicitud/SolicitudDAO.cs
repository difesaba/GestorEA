using Gestor.DAO.DB;
using Gestor.DTO.DTO.Empresa;
using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Mensajes;
using Gestor.DTO.DTO.Productos;
using Gestor.DTO.DTO.Solicitud;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Solicitud
{
    public class SolicitudDAO
    {
        public ConsecutivoSolicitudDTO NuevoConsecutivo()
        {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "NewConsecutivoSolicitud"
            });

            var NuevoConsecutivo = (from q in resultados
                                    select new ConsecutivoSolicitudDTO()
                                    {
                                        NewSolicitud = (int)q["NewSolicitud"]
                                    }
                                    ).FirstOrDefault();

            return NuevoConsecutivo;
        }

        public List<ConsultaTercerosDTO> ConsultaTerceros(string id)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Tercero", id);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaTercero",
                Parametros = parametros
            });
            var consulta = (from q in resultados
                            select new ConsultaTercerosDTO()
                            {
                                usuario = new UsuariosDTO()
                                {
                                    UsuarioId = (int)q["UsuarioId"],
                                    UsuarioNombre = (string)q["UsuarioNombre"]
                                }
                            }).ToList();
            return consulta;
        }

        public List<AutoCompletTercero> CompleteTercero(string data)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Filter", data);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "AutoCompleteTercero",
                Parametros = parametros
            });

            var CompleteTercero = (from q in resultados
                                   select new AutoCompletTercero()
                                   {

                                       id = (int)q["id"],
                                       Descripcion = (string)q["Descripcion"]

                                   }).ToList();

            return CompleteTercero;
        }

        public string CompleteDatosProducto(int producto)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Producto", producto);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CompleteDatosproductos",
                Parametros = parametros
            });

            return (string)resultados[0]["UnidadSiglas"];
        }

        public MensajeDTO CrearSolicitud(string solicitud, int numero, int usuario, string terceros, string fechaini, string fechafin, string observacion, int empresa, int producto, string cant, int tipo)
        {

            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            parametros.Add("@Numero", numero);
            parametros.Add("@Usu", usuario);
            parametros.Add("@Terceros", terceros);
            parametros.Add("@FechaIni", fechaini);
            parametros.Add("@FechaFin", fechafin);
            parametros.Add("@Obs", observacion);
            parametros.Add("@Empresa", empresa);
            parametros.Add("@Prod", producto);
            parametros.Add("@Cant", cant);
            parametros.Add("@Tipo", tipo);


            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CrearSolicitud",
                Parametros = parametros
            });
            var crear = (from q in resultados
                         select new MensajeDTO()
                         {
                             Codigo = (int)q["Codigo"],
                             Mensaje = (string)q["Mensaje"],
                             Tipo = (string)q["Tipo"]
                         }).FirstOrDefault();

            return crear;
        }

        public List<ConsultaDetalleSolicitudDTO> ConsultaDetalleSolicitud(string idSolicitud) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@IdSolicitud", idSolicitud);
        
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaDetalleSolicitud",
                Parametros = parametros
            });

            var detalle = (from q in resultados
                           select new ConsultaDetalleSolicitudDTO()
                           {
                               solicitud = new SolicitudDTO()
                               {
                                   SolicitudId = (int)q["SolicitudId"]
                               },
                               solicitudDetalle = new SolicitudDetalleDTO()
                               {
                                   SolicitudDetId = (int)q["SolicitudDetId"],
                                   SolicitudDetCant = (string)q["SolicitudDetCant"]
                               },
                               productos = new ProductosDTO()
                               {
                                   ProductoDescripcion = (string)q["ProductoDescripcion"]
                               },
                               unidad = new UnidadMedidaDTO()
                               {
                                   UnidadSiglas = (string)q["UnidadSiglas"]
                               }
                           }).ToList();
            return detalle;
        }

        public List<EstadoSolicitudDTO> listarEstadoSolicitud() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListarEstadosSolicitud"
            });
            var lista = (from q in resultados
                         select new EstadoSolicitudDTO()
                         {
                             EstadoId = (int)q["EstadoId"],
                             EstadoDescripcion = (string)q["EstadoDescripcion"]
                         }).ToList();
            return lista;
        }

        public List<ConsultaAprobacionSolicitudesDTO> ConsultaAprobacionSolicitud(string numero, string inicio, string fin) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", numero);
            parametros.Add("@FechaIni",inicio);
            parametros.Add("@FechaFin",fin);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaAprobacionSolicitudes",
                Parametros = parametros
            });

            var consulta = (from q in resultados
                            select new ConsultaAprobacionSolicitudesDTO()
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
                                tipo = new TipoSolicitudDTO() {
                                    TipoId = (int)q["TipoId"],
                                    TipoDescripcion = (string)q["TipoDescripcion"]
                                }
                            }).ToList();
            return consulta;
        }

        public List<NotificacionAprobacionSolicitudDTO> AprobarSolicitudes(int solicitud, int tipo) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            parametros.Add("@Tipo", tipo);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "NotificacionAprobacionSolicitud",
                Parametros = parametros
            });
            var correo = (from q in resultados
                          select new NotificacionAprobacionSolicitudDTO()
                          {
                              Asunto = (string)q["Asunto"],
                              Mensaje = (string)q["Mensaje"],
                              Correo = (string)q["Correo"]
                          }).ToList();
            return correo;
        }

        public List<ConsultaEdicionSolicitudDTO> ConsultaEdicionSolicitud(string numero, string inicio, string fin, string tipo)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", numero);
            parametros.Add("@FechaIni", inicio);
            parametros.Add("@FechaFin", fin);
            parametros.Add("@Tipo", fin);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaEdicionSolicitud",
                Parametros = parametros
            });

            var consulta = (from q in resultados
                            select new ConsultaEdicionSolicitudDTO()
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

        public List<TipoSolicitudDTO> listarTipoSolicitud() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListaTipoSolicitud"
            });
            var lista = (from q in resultados
                         select new TipoSolicitudDTO()
                         {
                             TipoId = (int)q["TipoId"],
                             TipoDescripcion = (string)q["TipoDescripcion"]
                         }).ToList();
            return lista;
        }

        public EncabezadoSolicitudDTO EncabezadoSolicitud(int idSolicitud) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@SolicitudId", idSolicitud);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaEncabezadoSolicitud",
                Parametros = parametros
            });

            var encabezado = (from q in resultados
                              select new EncabezadoSolicitudDTO() {
                                  solicitud  = new SolicitudDTO()
                                  {
                                      SolicitudId = (int)q["SolicitudId"],
                                      SolicitudNumero = (int)q["SolicitudNumero"],
                                      SolicitudFecha = (string)q["SolicitudFecha"],
                                      SolicitudFechaInicio = (string)q["SolicitudFechaInicio"],
                                      SolicitudFechaFin = (string)q["SolicitudFechaFin"],
                                      SolicitudTipo = (int)q["SolicitudTipo"],
                                      SolicitudObservacion = (string)q["SolicitudObservacion"]
                                  },
                                  empresa = new EmpresaDTO() {
                                      EmpresaNombre= (string)q["EmpresaNombre"]
                                  }
                              }).FirstOrDefault();
            return encabezado;

        }

        public MensajeDTO guardaEdicionSolicitud(int idSolicitud, string detalle, int producto, string cantidad, int usuario) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@IdSolicitud", idSolicitud);
            parametros.Add("@IdDetalle",detalle);
            parametros.Add("@Producto", producto);
            parametros.Add("@Cantidad",cantidad);
            parametros.Add("@Usuario",usuario);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ActualizaDetalleSolicitud",
                Parametros = parametros
            });
            var resultado = (from q in resultados
                             select new MensajeDTO()
                             {
                                 Codigo = (int)q["Codigo"],
                                 Mensaje = (string)q["Mensaje"],
                                 Tipo = (string)q["Tipo"]

                             }).FirstOrDefault();
            return resultado;

        }

        public List<ConsultaEliminacionSolicitudesDTO> ConsultaEliminacionSolicitud(string numero, string inicio, string fin,string tipo)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", numero);
            parametros.Add("@FechaIni", inicio);
            parametros.Add("@FechaFin", fin);
            parametros.Add("@Tipo", tipo);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaEliminarSolicitudes",
                Parametros = parametros
            });

            var consulta = (from q in resultados
                            select new ConsultaEliminacionSolicitudesDTO()
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

        public MensajeDTO EliminarSoliciitud( int solicitud){
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "EliminacionSolicitud",
                Parametros = parametros
            });

            var mensaje = (from q in resultados
                           select new MensajeDTO()
                           {
                               Codigo = (int)q["Codigo"],
                               Mensaje = (string)q["Mensaje"],
                               Tipo = (string)q["Tipo"]
                           }).FirstOrDefault();
            return mensaje;
        }

        public List<SolicitudesPendientesDTO> SolicitudesPendientes(int tercero, string numero, string ini, string fin) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Tercero", tercero);
            parametros.Add("@Numero", numero);
            parametros.Add("@FechaIni", ini);
            parametros.Add("@FechaFin", fin);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaSolicitudPendientes",
                Parametros = parametros
            });

            var consulta = (from q in resultados
                            select new SolicitudesPendientesDTO()
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

        public MensajeDTO EliminaDetalle(int solicitud, int detalle) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            parametros.Add("@Detalle", detalle);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "EliminaDetalleSolicitud",
                Parametros = parametros
            });

            var mensaje = (from q in resultados
                           select new MensajeDTO()
                           {
                               Codigo = (int)q["Codigo"],
                               Mensaje = (string)q["Mensaje"],
                               Tipo = (string)q["Tipo"]
                           }).FirstOrDefault();
            return mensaje;
        }
    }
}

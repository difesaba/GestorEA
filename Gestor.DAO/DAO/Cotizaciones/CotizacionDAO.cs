using Gestor.DAO.DB;
using Gestor.DTO.DTO.Cotizacion;
using Gestor.DTO.DTO.Empresa;
using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Mensajes;
using Gestor.DTO.DTO.Productos;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Cotizaciones
{
    public class CotizacionDAO
    {
        public ConsecutivoCotizacionDTO consecutivoCotizacion() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "NewConsecutivoCotizacion"
            });
            var nuevo = (from q in resultados
                         select new ConsecutivoCotizacionDTO() {
                             NewCotizacion = (int)q["NewCotizacion"]
                         }).FirstOrDefault();
            return nuevo;
        }

        public EncabezadoCotizacionDTO encabezadoCotizacion(int solicitud) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "EncabezadoCotizacion",
                Parametros = parametros
            });
            var result = (from q in resultados
                          select new EncabezadoCotizacionDTO()
                          {
                              empresa = new EmpresaDTO()
                              {
                                  EmpresaId = (int)q["EmpresaId"],
                                  EmpresaNombre = (string)q["EmpresaNombre"],
                                  EmpresaNit = (string)q["EmpresaNit"],
                                  EmpresaPais = (string)q["EmpresaPais"],
                                  EmpresCiudad = (string)q["EmpresCiudad"],
                                  EmpresaDireccion = (string)q["EmpresaDireccion"],
                                  EmpresaCorreo = (string)q["EmpresaCorreo"],
                                  EmpresaTelefono = (string)q["EmpresaTelefono"]
                              }
                          }).FirstOrDefault();
            return result;
        }

        public List<ConsultaSolicitudDetDTO> ConsultaSolicitudDet(int solicitud , int usuario)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Solicitud", solicitud);
            parametros.Add("@Usuario", usuario);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaSolicitudDet",
                Parametros = parametros
            });
            var result = (from q in resultados
                          select new ConsultaSolicitudDetDTO()
                          {
                             solicitud = new SolicitudDTO() {
                                 SolicitudId = (int)q["SolicitudId"],
                                 SolicitudNumero = (int)q["SolicitudNumero"]
                             },
                             solicitudDetalle = new SolicitudDetalleDTO() {
                                 SolicitudDetId = (int)q["SolicitudDetId"],
                                 SolicitudDetProd = (int)q["SolicitudDetProd"],
                                 SolicitudDetCant = (string)q["SolicitudDetCant"]
                             },
                             producto = new ProductosDTO() {
                                 ProductoDescripcion = (string)q["ProductoDescripcion"],
                                 ProductoId = (int)q["ProductoId"]
                             },
                             unidad = new UnidadMedidaDTO() {
                                 UnidadSiglas = (string)q["UnidadSiglas"]
                             },
                             cotizacionDetalle= new CotizacionDetalleDTO() {
                                 CotizacionDetId = (int)q["CotizacionDetId"],
                                 CotizacionDetCant = (string)q["CotizacionDetCant"],
                                 CotizacionDetUnitNeto = (string)q["CotizacionDetUnitNeto"],
                                 CotizacionDetUnitario = (string)q["CotizacionDetUnitario"],
                                 CotizacionDetTotal = (string)q["CotizacionDetTotal"]
                             },
                             Total = (string)q["Total"],
                             SubTotal = (string)q["SubTotal"],
                             TotalIva = (string)q["TotalIva"]
                          }).ToList();
            return result;
        }

        public MensajeDTO crearCotizacion(string cotizacionId,int solicitud , int solicitudDet, int tercero, string entrega, string especifi, string cantidad, string uniNeto, string uni, int cotizacionDet) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@CotizacionId", cotizacionId);
            parametros.Add("@Solicitud", solicitud);
            parametros.Add("@SolicitudDet", solicitudDet);
            parametros.Add("@Tercero", tercero);
            parametros.Add("@Entrega", entrega);
            parametros.Add("@Especi", especifi);
            parametros.Add("@Cantidad", cantidad);
            parametros.Add("@UniNeto", uniNeto);
            parametros.Add("@Unitario", uni);
            parametros.Add("@CotizacionDet", cotizacionDet);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CrearCotizacion",
                Parametros = parametros
            });
            var result = (from q in resultados
                          select new MensajeDTO()
                          {
                              Codigo = (int)q["Codigo"],
                              Mensaje = (string)q["Mensaje"],
                              Tipo = (string)q["Tipo"]
                          }).FirstOrDefault();
            return result;
        }

        public List<InfEdicionCotizacionDTO> informeEdicion( string solicitud, string cotizacion, string ini, string fin, int tercero) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Numero", cotizacion);
            parametros.Add("@Solicitud", solicitud);
            parametros.Add("@FechaIni", ini);
            parametros.Add("@FechaFin", fin);
            parametros.Add("@Tercero", tercero);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaCotizacionesEdit",
                Parametros = parametros
            });
            var result = (from q in resultados
                          select new InfEdicionCotizacionDTO()
                          {
                              cotizacion = new CotizacionDTO()
                              {
                                  CotizacionId = (int)q["CotizacionId"],
                                  CotizacionNumero = (int)q["CotizacionNumero"],
                                  CotizacionFecha = (string)q["CotizacionFecha"],
                                  CotizacionEntrega = (string)q["CotizacionEntrega"],
                                  CotizacionEspecificacion = (string)q["CotizacionEspecificacion"]
                              },
                              solicitud = new SolicitudDTO()
                              {
                                  SolicitudNumero = (int)q["SolicitudNumero"],
                                  SolicitudFechaFin = (string)q["SolicitudFechaFin"]
                              },
                              estado = new EstadoSolicitudDTO()
                              {
                                  EstadoDescripcion = (string)q["EstadoDescripcion"]
                              }
                          }).ToList();
            return result;
            
        }

        public List<ConsultaCotizacionesAutorizarDTO> listaAutorizaCotizacion( string cotizacion, string fechaIni, string fechaFin) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Cotizacion", cotizacion);
            parametros.Add("@FechaIni", fechaIni);
            parametros.Add("@FechaFin", fechaFin);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaCotizacionesAutorizar",
                Parametros = parametros
            });

            var result = (from q in resultados
                          select new ConsultaCotizacionesAutorizarDTO()
                          {
                              cotizacion = new CotizacionDTO()
                              {
                                  CotizacionId = (int)q["CotizacionId"],
                                  CotizacionNumero = (int)q["CotizacionNumero"],
                                  CotizacionFecha = (string)q["CotizacionFecha"],
                                  CotizacionEntrega = (string)q["CotizacionEntrega"],
                                  CotizacionEspecificacion = (string)q["CotizacionEspecificacion"],
                              },
                              solicitud = new SolicitudDTO()
                              {
                                  SolicitudNumero = (int)q["SolicitudNumero"]
                              },
                              estado = new EstadoSolicitudDTO()
                              {
                                  EstadoDescripcion = (string)q["EstadoDescripcion"]
                              },
                              CotizacionTotal = (string)q["CotizacionTotal"]
                          }).ToList();
            return result;
        }

        public List<NotificacionAprobacionSolicitudDTO> notificarCotizacion( int cotizacion) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Cotizacion", cotizacion);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "TraerCorreosCotizacion",
                Parametros = parametros
            });
            var enviar = (from q in resultados
                         select new NotificacionAprobacionSolicitudDTO()
                         {
                             Asunto = (string)q["Asunto"],
                             Mensaje = (string)q["Mensaje"],
                             Correo = (string)q["Correo"]
                         }).ToList();

            return enviar;
        }
    }
}

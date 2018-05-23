using Gestor.DAO.DAO.Empresa;
using Gestor.DAO.DAO.Productos;
using Gestor.DAO.DAO.Solicitud;
using Gestor.DTO.DTO.Empresa;
using Gestor.DTO.DTO.Mensajes;
using Gestor.DTO.DTO.Productos;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Solicitudes
{
    public partial class Solicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static EmpresaDTO consultaEmpresa() {
            return new EmpresaDAO().ConsultaEmpresa();
        }

        [WebMethod]
        public static ConsecutivoSolicitudDTO nuevoConsecutivo() {
            return new SolicitudDAO().NuevoConsecutivo();
        }

        [WebMethod]
        public static List<ConsultaTercerosDTO> ConsultaTerceros(string id) {
            return new SolicitudDAO().ConsultaTerceros(id);
        }

        [WebMethod]

        public static List<AutoCompletTercero> CompleteTercero(string data)
        {
            return new SolicitudDAO().CompleteTercero(data);
        }

        [WebMethod]

        public static List<AutoCompletProd> CompleteProd(string data)
        {
            return new ProductosDAO().CompleteProd(data);
        }

        [WebMethod]
        public static string CompleteDatosProducto(int producto) {
            return new SolicitudDAO().CompleteDatosProducto(producto);
        }

        [WebMethod]
        public static MensajeDTO crearSolicitud(string solicitud, int numero, string terceros, string fechaini, string fechafin, string observacion, int empresa, int producto, string cant, int tipo) {
            return new SolicitudDAO().CrearSolicitud(solicitud,numero, (int)HttpContext.Current.Session["UsuarioId"],terceros,fechaini,fechafin,observacion,empresa,producto,cant, tipo);
        }

        [WebMethod]
        public static List<ConsultaDetalleSolicitudDTO> ConsultaDetalleSolicitud(string idSolicitud) {
            return new SolicitudDAO().ConsultaDetalleSolicitud(idSolicitud);
        }

        [WebMethod]
        public static MensajeDTO EliminaDetalle(int solicitud, int detalle) {
            return new SolicitudDAO().EliminaDetalle(solicitud, detalle);
        }
    }
}
using Gestor.DAO.DAO.Productos;
using Gestor.DAO.DAO.Solicitud;
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
    public partial class EdicionSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]

        public static EncabezadoSolicitudDTO EncabezadoSolicitud(int idSolicitud) {
            return new SolicitudDAO().EncabezadoSolicitud(idSolicitud);
        }

        [WebMethod]
        public static List<ConsultaDetalleSolicitudDTO> ConsultaDetalleSolicitud(string idSolicitud)
        {
            return new SolicitudDAO().ConsultaDetalleSolicitud(idSolicitud);
        }

        [WebMethod]

        public static List<AutoCompletProd> CompleteProd(string data)
        {
            return new ProductosDAO().CompleteProd(data);
        }

        [WebMethod]
        public static MensajeDTO guardaEdicionSolicitud(int idSolicitud, string detalle, int producto, string cantidad) {
            return new SolicitudDAO().guardaEdicionSolicitud(idSolicitud,detalle,producto,cantidad, (int)HttpContext.Current.Session["UsuarioId"]);
        }
    }
}
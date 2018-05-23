using Gestor.DAO.DAO.Solicitud;
using Gestor.DTO.DTO.Mensajes;
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
    public partial class EliminacionSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]

        public static List<TipoSolicitudDTO> listarTipoSolicitud()
        {
            return new SolicitudDAO().listarTipoSolicitud();
        }

        [WebMethod]
        public static List<ConsultaEliminacionSolicitudesDTO> ConsultaEliminacionSolicitud(string numero, string inicio, string fin, string tipo)
        {
            return new SolicitudDAO().ConsultaEliminacionSolicitud(numero, inicio, fin, tipo);
        }

        [WebMethod]
        public static MensajeDTO eliminarSolicitud(int solicitud) {
            return new SolicitudDAO().EliminarSoliciitud(solicitud);
        }
    }
}
using Gestor.DAO.DAO.Solicitud;
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
    public partial class InfEditSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ConsultaEdicionSolicitudDTO> ConsultaEdicionSolicitud(string numero, string inicio, string fin, string tipo) {
            return new SolicitudDAO().ConsultaEdicionSolicitud(numero,  inicio,  fin,  tipo);
        }

        [WebMethod]

        public static List<TipoSolicitudDTO> listarTipoSolicitud() {
            return new SolicitudDAO().listarTipoSolicitud();
        }
    }
}
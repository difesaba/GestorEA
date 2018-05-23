using Gestor.DAO.DAO.Mail;
using Gestor.DAO.DAO.Solicitud;
using Gestor.DTO.DTO.Estados;
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
    public partial class AprobacionSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<EstadoSolicitudDTO> listaEstadoSolicitud() {
            return new SolicitudDAO().listarEstadoSolicitud();
        }

        [WebMethod]
        public static List<ConsultaAprobacionSolicitudesDTO> ConsultaAprobacionSolicitud(string numero, string inicio, string fin) {
            return new SolicitudDAO().ConsultaAprobacionSolicitud(numero,inicio,fin);
        }

        [WebMethod]
        public static string aprobacionSolicitud(int solicitud, int tipo){
            return MailDAO.SendMail(new SolicitudDAO().AprobarSolicitudes(solicitud, tipo));
        }
    }
}
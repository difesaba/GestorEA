using Gestor.DAO.DAO.Solicitud;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Cotizaciones
{
    public partial class Cotizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<SolicitudesPendientesDTO> SolicitudesPendientes(string numero, string ini, string fin) {
            return new SolicitudDAO().SolicitudesPendientes((int)HttpContext.Current.Session["UsuarioId"], numero, ini,fin);
        }
    }
}
using Gestor.DAO.DAO.Cotizaciones;
using Gestor.DTO.DTO.Cotizacion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Cotizaciones
{
    public partial class InfEdicionCotizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<InfEdicionCotizacionDTO> informeEdicion(string solicitud, string cotizacion, string ini, string fin) {
            return new CotizacionDAO().informeEdicion(solicitud,cotizacion,ini,fin, (int)HttpContext.Current.Session["UsuarioId"]);
        }
    }
}
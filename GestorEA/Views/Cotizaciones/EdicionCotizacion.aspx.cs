using Gestor.DAO.DAO.Cotizaciones;
using Gestor.DTO.DTO.Cotizacion;
using Gestor.DTO.DTO.Mensajes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Cotizaciones
{
    public partial class EdicionCotizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static EncabezadoCotizacionDTO encabezadoCotizacion(int solicitud)
        {
            return new CotizacionDAO().encabezadoCotizacion(solicitud);
        }

        [WebMethod]
        public static List<ConsultaSolicitudDetDTO> ConsultaSolicitudDet(int solicitud)
        {
            return new CotizacionDAO().ConsultaSolicitudDet(solicitud, (int)HttpContext.Current.Session["UsuarioId"]);
        }

        [WebMethod]
        public static MensajeDTO crearCotizacion(string cotizacionId, int solicitud, int solicitudDet, string entrega, string especifi, string cantidad, string uniNeto, string uni, int cotizacionDet)
        {
            return new CotizacionDAO().crearCotizacion(cotizacionId, solicitud, solicitudDet, (int)HttpContext.Current.Session["UsuarioId"], entrega, especifi, cantidad, uniNeto, uni, cotizacionDet);
        }
    }
}
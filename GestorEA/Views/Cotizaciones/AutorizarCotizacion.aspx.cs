using Gestor.DAO.DAO.Cotizaciones;
using Gestor.DAO.DAO.Mail;
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
    public partial class AutorizarCotizacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ConsultaCotizacionesAutorizarDTO> mostrarAutorizacion(string cotizacion, string fechaIni, string fechaFin)
        {
            return new CotizacionDAO().listaAutorizaCotizacion(cotizacion, fechaIni, fechaFin);
        }

        
        [WebMethod]
        public static string aprobacion(int cotizacion)
        {
           

            return MailDAO.SendMail(new CotizacionDAO().notificarCotizacion(cotizacion));
        }
    }
}
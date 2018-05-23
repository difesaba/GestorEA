using Gestor.DAO.DAO.HelpDesk;
using Gestor.DTO.DTO.HelpDesk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.HelpDesk
{
    public partial class HelpDesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static ConsecutivoHDDTO NewCaso() {
            return new HelpDeskDAO().NuevoConsecutivo();
        }

        [WebMethod]
        public static EncabezaoHDDTO EncabezadoHD() {
            return new HelpDeskDAO().EncabezadoHD((int)HttpContext.Current.Session["UsuarioId"]);
        }

        [WebMethod]
        public static int crearIncidente(int caso,string mensaje) {
            return new HelpDeskDAO().CrearIncidente( caso, (int)HttpContext.Current.Session["UsuarioId"],mensaje);
        }
    }
}
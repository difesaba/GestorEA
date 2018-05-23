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
    public partial class ValorizacionHD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<InformeValorizacionDTO> pintarInforme() {
            return new HelpDeskDAO().informeValorizacion();
        }

        [WebMethod]
        public static ConsultaCaso mostrarCaso(int id)
        {
            return new HelpDeskDAO().ConsultaCaso(id);
        }

        [WebMethod]
        public static bool valorar(int caso, int valor)
        {
             new HelpDeskDAO().valorar(caso, valor);
            return true;
        }
    }
}
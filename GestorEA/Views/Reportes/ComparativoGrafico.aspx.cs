using Gestor.DAO.DAO.Reportes;
using Gestor.DTO.DTO.Reportes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Reportes
{
    public partial class ComparativoGrafico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static IList<Dictionary<string, object>> ReporteComparativo(int solicitud)
        {
            return new ReportesDAO().consultaPrincipal(solicitud);
        }
    }
}
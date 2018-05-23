using Gestor.DAO.DAO.Reportes;
using Gestor.DAO.DAO.Solicitud;
using Gestor.DTO.DTO.Reportes;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Reportes
{
    public partial class Comparativo : System.Web.UI.Page
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
        public static List<ConsultaComparativoDTO> ConsultaComparativo(string numero, string inicio, string fin, string tipo)
        {
            return new ReportesDAO().ConsultaComparativo(numero, inicio, fin, tipo);
        }

        
    }
}
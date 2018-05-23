using Gestor.DAO.DAO.Productos;
using Gestor.DTO.DTO.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Productos
{
    public partial class UnidadMedida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<AutoCompletUnidadDTO> AutoCompleteUnidad(string data) {
            return new UnidadMedidaDAO().AutoCompleteUnidadMedida(data);
        }

        [WebMethod]
        public static List<BuscarUnidadDTO> ConsultarUM(string um) {
            return new UnidadMedidaDAO().ConsultarUnidadMedida(um);
        }

        [WebMethod]
        public static BuscarUnidadDTO crearUM(string siglas, string descripcion) {
            var idUnidad = new UnidadMedidaDAO().crearUnidades(siglas, descripcion);
            
            return new UnidadMedidaDAO().ConsultarUnidadMedida(idUnidad.ToString()).FirstOrDefault();
        }

        [WebMethod]
        public static Boolean ActualizarUnidades(int unidadId, string siglas, string descripcion) {
            new UnidadMedidaDAO().actaulizarMedida(unidadId, siglas,descripcion);
            return true;
        }

    }
}
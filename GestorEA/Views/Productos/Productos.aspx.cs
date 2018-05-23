using Gestor.DAO.DAO.Estados;
using Gestor.DAO.DAO.Productos;
using Gestor.DTO.DTO.Estados;
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
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ConsultarProductosDTO> ConsultarProductos(int idprod, int unidad, int estado)
        {

            return new ProductosDAO().ObtenerProductos(idprod, unidad, estado);
        }

        [WebMethod]
        public static ConsultarProductosDTO CrearProducto(string producto, int medida)
        {

            var idProd = new ProductosDAO().CrearProductos(producto, medida, (int)HttpContext.Current.Session["UsuarioId"]);

            return new ProductosDAO().ObtenerProductos(idProd, medida, 1).FirstOrDefault();

        }

        [WebMethod]

        public static List<AutoCompletProd> CompleteProd(string data) {
            return new ProductosDAO().CompleteProd(data);
        }

        [WebMethod]

        public static List<UnidadMedidaDTO> muestraUnidad() {
            return new UnidadMedidaDAO().listaMedida();
        }

        [WebMethod]
        public static List<EstadosDTO> muestraEstados() {
            return new EstadosDAO().listEstados();
        }


        [WebMethod]
        public static NewConsecutivo traerConsecutivo() {
            return new ProductosDAO().NuevoConsecutivo();
        }

        [WebMethod]
        public static Boolean ActualizarProductos(int idprod, string descripcion, int um, int estado) {
            new ProductosDAO().ActualizarProd( idprod,  descripcion,  um,  estado,(int)HttpContext.Current.Session["UsuarioId"]);
            return true;
        }
    }
}
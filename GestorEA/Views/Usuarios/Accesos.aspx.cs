using Gestor.DAO.DAO.Usuarios;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Usuarios
{
    public partial class Accesos1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ListaRolesDTO> listasRol()
        {
            return new UsuariosDAO().ListaRol();
        }

        [WebMethod]

        public static List<ConsultaAccesosDTO> consultaAcceso(int rol) {
            return new UsuariosDAO().ConsultaAcceso(rol);
        }

        [WebMethod]

        public static string otorgarAccesos(int rol, int permiso, int opcion ) {
            return new UsuariosDAO().otorgarAccesos(rol, permiso, opcion);
        }

    }
}
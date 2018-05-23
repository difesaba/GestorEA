using Gestor.DAO.DAO.Login;
using Gestor.DAO.DAO.MenuDAO;
using Gestor.DTO.DTO.MenuDTO;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.Login
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<MenuDTO> obtenerMenus()
        {
            if (HttpContext.Current.Session["UsuarioRol"] != null)
            {
                return new MenuDAO().pintarMenu((int)HttpContext.Current.Session["UsuarioRol"]);
            }
            else
            {
                return new List<MenuDTO>();
            }

        }

        [WebMethod]
        public static bool datosSesion(string usu, string pass)
        {
            UsuariosDTO usuario = new UsuariosDTO();
            LoginDAO login = new LoginDAO();

            usuario = login.ObtenerDatosUsuario(usu, pass);

            if (usuario != null)
            {
                HttpContext.Current.Session["UsuarioId"] = usuario.UsuarioId;
                HttpContext.Current.Session["UsuarioRol"] = usuario.UsuarioRol;
                HttpContext.Current.Session["UsuarioNombre"] = usuario.UsuarioNombre;
                HttpContext.Current.Session["UsuarioApellido"] = usuario.UsuarioApellido;
                return true;

            }
            else { return false; }

        }
    }
}
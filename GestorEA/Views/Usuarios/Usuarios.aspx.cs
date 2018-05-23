using Gestor.DAO.DAO.Estados;
using Gestor.DAO.DAO.Usuarios;
using Gestor.DTO.DTO.Estados;
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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ConsultarUsuariosDTO> cosultarUsuarios(string usuario, string rol, string cargo) {
            return new UsuariosDAO().ConsultarUsuarios(usuario, rol, cargo);
        }

        [WebMethod]
        public static List<AutoCompleteUsuarioDTO> AutoCompleteUsuarios(string data) {
            return new UsuariosDAO().CompleteUser(data);
        }

        [WebMethod]
        public static List<ListaCargoDTO> listasCargo() {
            return new UsuariosDAO().ListaCargo();
        }

        [WebMethod]
        public static List<ListaRolesDTO> listasRol() {
            return new UsuariosDAO().ListaRol();
        }

        [WebMethod]
        public static List<ListaTipoIDDTO> listaTipo() {
            return new UsuariosDAO().ListaTipoId();
        }

        [WebMethod]
        public static List<EstadosDTO> ListaEstados()
        {
            return new EstadosDAO().listEstados();
        }

        [WebMethod]
        public static string crearUsuarios(string nombre, string apellido, int tipo, string identificacion, string contrasena, string correo, int rol, int cargo) {
            return new UsuariosDAO().crearUsuario(nombre, apellido, tipo, identificacion, contrasena, correo, rol, cargo);
        }

        [WebMethod]
        public static Boolean actualizaUsuario( int usuarioId, string nombre, string apellido, int tipo, string identificacion, string correo, int rol, int cargo, int estado) {
            new UsuariosDAO().ActualizarUsuario(usuarioId,  nombre,  apellido,  tipo,  identificacion,  correo,  rol,  cargo,  estado);
            return true;
        }

        [WebMethod]
        public static List<ConsultaRolesDTO> consultaRoles(int rol)
        {
            return new UsuariosDAO().ConsultarRoles(rol); 
        }

        [WebMethod]

        public static List<ConsultaRolesDTO> crearRoles(string descripcion) {
            var rolId = new UsuariosDAO().CrearRoles(descripcion);
            return new UsuariosDAO().ConsultarRoles(rolId);
        }
    }
}
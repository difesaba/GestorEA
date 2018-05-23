using Gestor.DAO.DB;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Login
{
    public class LoginDAO
    {
        public UsuariosDTO ObtenerDatosUsuario(string usu, string pass)
        {
            UsuariosDTO usuario = new UsuariosDTO();
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@usuario", usu);
            parametros.Add("@pass", pass);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "UsuariosSession",
                Parametros = parametros
            });

            usuario = (from q in resultados
                       select new UsuariosDTO()
                       {
                           UsuarioId = (int)q["UsuarioId"],
                           UsuarioRol = (int)q["UsuarioRol"],
                           UsuarioNombre = (string)q["UsuarioNombre"],
                           UsuarioApellido = (string)q["UsuarioApellido"]

                       }).FirstOrDefault();


            return usuario;
        }
    }
}
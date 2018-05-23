using Gestor.DAO.DB;
using Gestor.DTO.DTO.MenuDTO;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.MenuDAO
{
    public class MenuDAO
    {
        public List<MenuDTO> pintarMenu(int idRol)
        {

            List<MenuDTO> Menu;
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Rol", idRol);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "RolesMenu",
                Parametros = parametros
            });

            Menu = (from q in resultados
                    select new MenuDTO()
                    {
                        MenusRoles = new PermisosDTO()
                        {
                            PermisoId = (int)q["PermisoId"],
                            PermisoNombre = (string)q["PermisoNombre"],
                            URLRuta = (string)q["URLRuta"],
                            PermisoPadre = (int)q["PermisoPadre"]
                        }
                    }).ToList();
            return Menu;
        }
    }
}

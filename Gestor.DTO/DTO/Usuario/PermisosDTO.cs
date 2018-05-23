using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Usuario
{
    public class PermisosDTO
    {
        public int PermisoId { get; set; }
        public string PermisoNombre { get; set; }
        public string URLRuta { get; set; }
        public int PermisoPadre { get; set; }
    }

    public class ConsultaAccesosDTO
    {
        public PermisosDTO permisos { get; set; }
        public RolPermisoDTO rolPermiso { get; set; }
        public RolesDTO roles { get; set; }
    }
}

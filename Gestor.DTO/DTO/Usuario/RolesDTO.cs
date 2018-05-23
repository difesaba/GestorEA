using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Usuario
{
    public class RolesDTO
    {
        public int RolId { get; set; }
        public string RolNombre { get; set; }
    }

    public class ConsultaRolesDTO
    {
        public RolesDTO croles { get; set; }
    }
}

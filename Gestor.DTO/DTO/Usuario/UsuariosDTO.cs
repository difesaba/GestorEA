using Gestor.DTO.DTO.Estados;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Usuario
{
    public class UsuariosDTO
    {
        public int UsuarioId { get; set; }
        public string UsuarioNombre { get; set; }
        public string UsuarioApellido { get; set; }
        public int UsuarioTipoIdentificacion { get; set; }
        public string UsuarioIdentificacion { get; set; }
        public string Usuario { get; set; }
        public string UsuarioContrasena { get; set; }
        public string UsuarioCorreo { get; set; }
        public int UsuarioCargo { get; set; }
        public int UsuarioRol { get; set; }
        public int UsuarioEstado { get; set; }
    }

    public class Productos
    {
        public UsuariosDTO usuario { get; set; }

    }


    public class ConsultarUsuariosDTO {
        public UsuariosDTO usuarios { get; set; }
        public  RolesDTO roles { get; set; }
        public CargoDTO cargo { get; set; }
        public TipoIdentificacionDTO tipo { get; set; }
        public EstadosDTO estados { get; set; }
        public string UsuarioNombreCompleto { get; set; }
    }

    public class AutoCompleteUsuarioDTO
    {
        public Int64 id { get; set; }
        public string Descripcion { get; set; }
    }

    public class ListaCargoDTO {
        public CargoDTO cargos { get; set; }
    }

    public class ListaRolesDTO
    {
        public RolesDTO roles { get; set; }
    }

} 

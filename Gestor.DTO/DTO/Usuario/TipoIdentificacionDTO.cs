using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Usuario
{
    public class TipoIdentificacionDTO
    {
        public int TipoId { get; set; }
        public string TipoSiglas { get; set; }
        public string TipoDescripcion { get; set; }
    }

    public class ListaTipoIDDTO {
        public TipoIdentificacionDTO tipo { get; set; }
    }
}

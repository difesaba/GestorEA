using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Productos
{
    public class UnidadMedidaDTO
    {
        public int UnidadId { get; set; }
        public string UnidadSiglas { get; set; }
        public string UnidadDescripcion { get; set; }
    }

    public class AutoCompletUnidadDTO{
        public Int64 id { get; set; }
        public string Descripcion { get; set; }
    }

    public class BuscarUnidadDTO {
        public UnidadMedidaDTO unidadMedida { get; set; }
    }

}

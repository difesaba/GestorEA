using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Productos
{
    public class ProductosDTO
    {
        public int ProductoId { get; set; }
        public string ProductoDescripcion { get; set; }
        public int ProductoMedida { get; set; }
        public string ProductoFecha { get; set; }
        public int ProductoUsuario { get; set; }
        public int ProductoUsuarioMod { get; set; }
        public string ProductoFechaMod { get; set; }
        public int ProductoEstado { get; set; }
    }

    public class ConsultarProductosDTO
    {
        public ProductosDTO producto { get; set; }
        public UnidadMedidaDTO unidadMedida { get; set; }
        public string EstadosDescripcion { get; set; }
        public int EstadosId { get; set; }
    }

    public class AutoCompletProd {
        public Int64 id { get; set; }
        public string Descripcion { get; set; }
    }

    public class NewConsecutivo {
        public int NewCodigo { get; set; }
    }

}

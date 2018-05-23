using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Cotizacion
{
    public class CotizacionDetalleDTO
    {
        public int CotizacionDetId { get; set; }
        public int CotizacionDetCotizacion { get; set; }
        public int CotizacionDetSolicitudDet { get; set; }
        public string CotizacionDetCant { get; set; }
        public string CotizacionDetUnitNeto { get; set; }
        public string CotizacionDetIVA { get; set; }
        public string CotizacionDetUnitario { get; set; }
        public string CotizacionDetTotal { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Solicitud
{
    public class SolicitudDetalleDTO
    {
        public int SolicitudDetId { get; set; }
        public int SolicitudDetSolicitud { get; set; }
        public string SolicitudDetFecha { get; set; }
        public string SolicitudDetUsu { get; set; }
        public int SolicitudDetProd { get; set; }
        public string SolicitudDetCant { get; set; }
    }
}

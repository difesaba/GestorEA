using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Reportes
{
    public class ReportesDTO
    {

    }

    public class ConsultaComparativoDTO
    {
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
        public TipoSolicitudDTO tipo { get; set; }
    }

    public class ReporteComparativoDTO {
        public int CotizacionNumero { get; set; }
        public string Total { get; set; }
    }
}

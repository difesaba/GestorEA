using Gestor.DTO.DTO.Empresa;
using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Productos;
using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Cotizacion
{
    public class CotizacionDTO
    {
        public int CotizacionId { get; set; }
        public int CotizacionNumero { get; set; }
        public int CotizacionSolicitud { get; set; }
        public string CotizacionFecha { get; set; }
        public int CotizacionTercero { get; set; }
        public string CotizacionEntrega { get; set; }
        public string CotizacionEspecificacion { get; set; }
        public int CotizacionEstado { get; set; }
    }

    public class ConsecutivoCotizacionDTO
    {
        public int NewCotizacion { get; set; }
    }

    public class EncabezadoCotizacionDTO {
        public CotizacionDTO cotizacion { get; set; }
        public EmpresaDTO empresa { get; set; }
    }

    public class ConsultaSolicitudDetDTO {
        public SolicitudDTO solicitud { get; set; }
        public SolicitudDetalleDTO solicitudDetalle { get; set; }
        public ProductosDTO producto { get; set; }
        public UnidadMedidaDTO unidad { get; set; }
        public CotizacionDetalleDTO cotizacionDetalle { get; set; }
        public string Total { get; set; }
        public string SubTotal { get; set; }
        public string TotalIva { get; set; }
    }

    public class InfEdicionCotizacionDTO {
        public CotizacionDTO cotizacion { get; set; }
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
    }

    public class ConsultaCotizacionesAutorizarDTO {
        public CotizacionDTO cotizacion { get; set; }
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
        public string CotizacionTotal { get; set; }
    }

 

}

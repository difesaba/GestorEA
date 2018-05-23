using Gestor.DTO.DTO.Empresa;
using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Productos;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Solicitud
{
    public class SolicitudDTO
    {
        public int SolicitudId { get; set; }
        public int SolicitudNumero { get; set; }
        public string SolicitudFecha { get; set; }
        public int SolicitudUsuario { get; set; }
        public int SolicitudTipo { get; set; }
        public string SolicitudTerceros { get; set; }
        public string SolicitudFechaInicio { get; set; }
        public string SolicitudFechaFin { get; set; }
        public string SolicitudObservacion { get; set; }
        public int SolicitudUsuMod { get; set; }
        public string SolicitudFechaMod { get; set; }
        public int SolicitudEmpresa { get; set; }
        public int SolicitudEstado { get; set; }
        
    }

    public class ConsecutivoSolicitudDTO {
        public int NewSolicitud { get; set; }
    }

    public class ConsultaTercerosDTO {
        public UsuariosDTO usuario { get; set; }
        public bool Cehck { get; set; }
    }

    public class AutoCompletTercero
    {
        public Int64 id { get; set; }
        public string Descripcion { get; set; }
    }

    public class ConsultaDetalleSolicitudDTO {
        public SolicitudDTO solicitud { get; set; }
        public SolicitudDetalleDTO solicitudDetalle { get; set; }
        public ProductosDTO productos { get; set; }
        public UnidadMedidaDTO unidad { get; set; }
    }

    public class ConsultaAprobacionSolicitudesDTO {
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
        public TipoSolicitudDTO tipo { get; set; }
    }

    public class NotificacionAprobacionSolicitudDTO
    {
        public string Asunto { get; set; }
        public string Mensaje { get; set; }
        public string Correo { get; set; }
    }

    public class ConsultaEdicionSolicitudDTO
    {
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
        public TipoSolicitudDTO tipo { get; set; }
    }

    public class EncabezadoSolicitudDTO
    {
        public SolicitudDTO solicitud { get; set; }
        public EmpresaDTO empresa { get; set; }
    }

    public class ConsultaEliminacionSolicitudesDTO
    {
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
        public TipoSolicitudDTO tipo { get; set; }
    }

    public class SolicitudesPendientesDTO
    {
        public SolicitudDTO solicitud { get; set; }
        public EstadoSolicitudDTO estado { get; set; }
        public TipoSolicitudDTO tipo { get; set; }
    }

}

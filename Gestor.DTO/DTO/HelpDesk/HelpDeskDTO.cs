using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.HelpDesk
{
    public class HelpDeskDTO
    {
        public int CasoId { get; set; }
        public int CasoNum { get; set; }
        public int CasoUsu { get; set; }
        public string CasoMesanje { get; set; }
        public int CasoEstado { get; set; }
        public string CasoFecha { get; set; }
        public int CasoUsuAsig { get; set; }
        public string CasoRespuesta { get; set; }
        public string CasoRespuestaFecha { get; set; }

    }

    public class ConsecutivoHDDTO
    {
        public int NewCaso { get; set; }
    }

    public class EncabezaoHDDTO
    {
        public string NombreCompleto { get; set; }
        public string FechaCaso { get; set; }
    }

    public class InformeIncidentes
    {
        public HelpDeskDTO helpDesk { get; set; }
        public UsuariosDTO usuario { get; set; }
        public string Nombre { get; set; }
        public string EstadoNombre { get; set; }
    }

    public class ConsultaCaso
    {
        public HelpDeskDTO helpDesk { get; set; }
        public UsuariosDTO usuario { get; set; }
        public string Nombre { get; set; }
        public string EstadoNombre { get; set; }
        public string Responsable { get; set; }
    }

    public class InformeIncidentesUsuario
    {
        public HelpDeskDTO helpDesk { get; set; }
        public UsuariosDTO usuario { get; set; }
        public string Nombre { get; set; }
        public string EstadoNombre { get; set; }
        public string Responsable { get; set; }
    }


    public class InformeValorizacionDTO
    {
        public HelpDeskDTO helpDesk { get; set; }
        public string EstadoNombre { get; set; }
        public string Reportado { get; set; }
        public string Contestado { get; set; }
        public string CasoCalificacion { get; set; }
    }
}

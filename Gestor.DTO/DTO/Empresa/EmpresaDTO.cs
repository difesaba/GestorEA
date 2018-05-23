using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DTO.DTO.Empresa
{
    public class EmpresaDTO
    {
        public int EmpresaId { get; set; }
        public string EmpresaNombre { get; set; }
        public string EmpresaNit { get; set; }
        public string EmpresaPais { get; set; }
        public string EmpresCiudad { get; set; }
        public string EmpresaDireccion { get; set; }
        public string EmpresaTelefono { get; set; }
        public string EmpresaCorreo { get; set; }

    }
}

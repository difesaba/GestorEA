using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DB
{
    public class ConexionDTO
    {
        public ConexionDTO()
        {
            this.Parametros = new Dictionary<string, object>();
        }

        public string procedimiento { get; set; }
        public Dictionary<string, object> Parametros { get; set; }
    }
}

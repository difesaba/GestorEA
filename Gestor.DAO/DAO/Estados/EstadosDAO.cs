using Gestor.DAO.DB;
using Gestor.DTO.DTO.Estados;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Estados
{
    public class EstadosDAO
    {
        public List<EstadosDTO> listEstados() {
            List<EstadosDTO> listarEstados;
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListarEstados"
            });
            listarEstados = (from q in resultados
                                  select new EstadosDTO()
                                  {
                                      EstadosId = (int)q["EstadosId"],
                                      EstadosDescripcion = (string)q["EstadosDescripcion"]
                                  }).ToList();
            return listarEstados;
        }
    }
}

using Gestor.DAO.DB;
using Gestor.DTO.DTO.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Productos
{
    public class UnidadMedidaDAO
    {
        public List<UnidadMedidaDTO> listaMedida() {
            List<UnidadMedidaDTO> listarUnidadMedida;
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListarUnidadMedida",
            });
            listarUnidadMedida = (from q in resultados
                                  select new UnidadMedidaDTO()
                                  {
                                      UnidadId = (int)q["UnidadId"],
                                      UnidadSiglas = (string)q["UnidadSiglas"]
                                  }).ToList();
            return listarUnidadMedida;
        }


        public List<AutoCompletUnidadDTO> AutoCompleteUnidadMedida(string data)
        {

            List<AutoCompletUnidadDTO> CompleteUnidadMedida;
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Filter", data);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "AutoCompleteUnidadMedida",
                Parametros = parametros
            });
            CompleteUnidadMedida = (from q in resultados
                                  select new AutoCompletUnidadDTO()
                                  {
                                      id = (int)q["id"],
                                      Descripcion = (string)q["Descripcion"]
                                  }).ToList();
            return CompleteUnidadMedida;
        }


        public List<BuscarUnidadDTO> ConsultarUnidadMedida(string um) {
            List<BuscarUnidadDTO> ConsultarMedida;
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Unidad", um);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultarUnidadMedida",
                Parametros = parametros
            });

            ConsultarMedida = (from q in resultados
                                select new BuscarUnidadDTO()
                                {
                                    unidadMedida = new UnidadMedidaDTO(){
                                       UnidadId = (int)q["UnidadId"],
                                       UnidadSiglas = (string)q["UnidadSiglas"],
                                       UnidadDescripcion = (string)q["UnidadDescripcion"]
                                    }
                                }).ToList();
            return ConsultarMedida;
        }


        public int crearUnidades(string siglas, string descripcion) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Siglas", siglas);
            parametros.Add("@Descripcion", descripcion);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CreacionUnidadMedida",
                Parametros = parametros
            });
            return  (int) resultados[0]["UnidadId"];
        }

        public void actaulizarMedida(int unidadId, string siglas, string descripcion) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@UnidadId", unidadId);
            parametros.Add("@Siglas",siglas);
            parametros.Add("@Descripcion",descripcion);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ActualizarUnidadMedida",
                Parametros = parametros
            });
        }

    }
}

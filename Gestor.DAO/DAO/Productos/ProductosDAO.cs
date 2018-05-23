using Gestor.DAO.DB;
using Gestor.DTO.DTO.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Gestor.DTO;
namespace Gestor.DAO.DAO.Productos
{
    public class ProductosDAO
    {
        public List<ConsultarProductosDTO> ObtenerProductos(int productoId, int unidad, int estado)
        {

            List<ConsultarProductosDTO> consultaProducto;
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Prod", productoId);
            parametros.Add("@Unidad", unidad);
            parametros.Add("@Estado", estado);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultarProductos",
                Parametros = parametros
            });

            consultaProducto = (from q in resultados
                                select new ConsultarProductosDTO()
                                {
                                    producto = new ProductosDTO()
                                    {
                                        ProductoId = (int)q["ProductoId"],
                                        ProductoDescripcion = (string)q["ProductoDescripcion"],
                                        ProductoFecha = (string)q["ProductoFecha"]
                                    },
                                    unidadMedida = new UnidadMedidaDTO()
                                    {
                                        UnidadSiglas = (string)q["UnidadSiglas"],
                                        UnidadId = (int)q["UnidadId"]
                                    },
                                    EstadosDescripcion = (string)q["EstadosDescripcion"],
                                    EstadosId = (int)q["EstadosId"]
                                }).ToList();
            return consultaProducto;
        }


        public int CrearProductos(string producto, int medida, int usuario)
        {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Producto", producto);
            parametros.Add("@medida", medida);
            //parametros.Add("@Fecha", fecha);
            parametros.Add("@Usuario", usuario);
            //parametros.Add("@Estado",estado);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CreacionProducto",
                Parametros = parametros
            });
            return (int)resultados[0]["ProductoId"];

        }

        public void ActualizarProducto(int productoId, string descripcion, string fechaMod, int usuarioMod, int estado)
        {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@IdProducto", productoId);
            parametros.Add("@Descripcion", descripcion);
            parametros.Add("@FechaMod", fechaMod);
            //parametros.Add("@UsuarioMod", usuarioMod);
            parametros.Add("@Estado", estado);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ActualizarProducto",
                Parametros = parametros
            });

        }

        public List<AutoCompletProd> CompleteProd(string data) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Filter", data);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "AutoCompleteProducto",
                Parametros = parametros
            });

            var CompleteProd = (from q in resultados
                                select new AutoCompletProd()
                                {

                                    id =  (int)q["id"],
                                    Descripcion = (string)q["Descripcion"]

                                }).ToList();

            return CompleteProd;
        }


        public NewConsecutivo NuevoConsecutivo() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsecutivoCreacionProducto"
            });

            var NuevoConsecutivo = (from q in resultados
                                    select new NewConsecutivo() {
                                        NewCodigo = (int)q["NewCodigo"]
                                    }
                                    ).FirstOrDefault();

            return NuevoConsecutivo;
        }


        public void ActualizarProd(int idprod,string descripcion, int um, int estado, int usuMod) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@IdProducto", idprod);
            parametros.Add("@Descripcion", descripcion);
            parametros.Add("@um", um);
            parametros.Add("@Estado", estado);
            parametros.Add("@UsuarioMod", usuMod);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ActualizarProducto",
                Parametros = parametros
            });
        }

    }
}

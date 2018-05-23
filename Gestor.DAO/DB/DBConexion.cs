using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DB
{
    public class DBConexion
    {
        public string cadenaConexion { get; set; }

        public DBConexion()
        {
            this.cadenaConexion = "Server=tcp:sejmet.database.windows.net,1433;Initial Catalog=Gestor;Persist Security Info=False;User ID=caroli;Password=Difesaba.26;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"; ;
        }

        public List<Dictionary<string, object>> consultarSP(ConexionDTO obj)
        {

            DataTable ds = new DataTable();

            List<Dictionary<string, object>> source = new List<Dictionary<string, object>>();

            List<string> colums = new List<string>();

            using (SqlConnection context = new SqlConnection(this.cadenaConexion))
            {

                SqlCommand cmd = new SqlCommand(obj.procedimiento.Trim(), context);

                if (obj.Parametros != null)
                {

                    foreach (var item in obj.Parametros)
                    {

                        SqlParameter objsp = new SqlParameter(item.Key, item.Value);

                        cmd.Parameters.Add(objsp);

                    }

                }

                cmd.Connection.Open();

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandTimeout = 200;

                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {

                    for (int i = 0; i < rdr.FieldCount; i++)
                    {

                        colums.Add(rdr.GetName(i));

                    }

                    while (rdr.Read())
                    {

                        Dictionary<string, object> data = new Dictionary<string, object>();

                        for (int i = 0; i < colums.Count; i++) { data.Add(colums[i], rdr[colums[i]]); }

                        source.Add(data);

                    }

                }

                cmd.Connection.Close();

                return source;

            }

        }

        public IList<Dictionary<string, object>> ConsultarSPDR(ConexionDTO obj)
        {
            DataTable ds = new DataTable();
            IList<Dictionary<string, object>> source = new List<Dictionary<string, object>>();
            IList<string> colums = new List<string>();

            using (SqlConnection context = new SqlConnection(this.cadenaConexion))
            {
                SqlCommand cmd = new SqlCommand(obj.procedimiento.Trim(), context);
                if (obj.Parametros != null)
                {
                    foreach (var item in obj.Parametros)
                    {
                        SqlParameter objsp = new SqlParameter(item.Key, item.Value);
                        cmd.Parameters.Add(objsp);
                    }
                }
                cmd.Connection.Open();

          
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 200;

                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    for (int i = 0; i < rdr.FieldCount; i++)
                    {
                        colums.Add(rdr.GetName(i));
                    }



                    while (rdr.Read())
                    {
                        Dictionary<string, object> data = new Dictionary<string, object>();
                        for (int i = 0; i < colums.Count; i++) { data.Add(colums[i], rdr[colums[i]]); }
                        source.Add(data);
                    }
                }
                cmd.Connection.Close();
                return source;

            }


        }


    }
}

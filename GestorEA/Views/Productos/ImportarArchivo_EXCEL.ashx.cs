using System;
using System.Linq;
using System.Web;
using System.Data;
using System.Xml.Linq;
using Gestor.DAO.DB;

public class ImportarArchivo_EXCEL : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;

            // Obtener parámetros


            for (int i = 0; i < files.Count; i++)
            {
                string absolutePath = "D:\\.NET Proyecto\\GestorEA\\GestorEA\\Content";

                if (!System.IO.Directory.Exists(absolutePath))
                {
                    System.IO.Directory.CreateDirectory(absolutePath);
                }

                //-------------------------- se guardar el archivo Excel en el servidor -------------------------- 
                HttpPostedFile file = files[i];

                string fname = System.IO.Path.GetFileName(file.FileName);

                fname = string.Concat(fname.Substring(0, fname.LastIndexOf('.')), fname.Substring(fname.LastIndexOf('.'), fname.Length - fname.LastIndexOf('.')));
                file.SaveAs(string.Concat(absolutePath, fname));


                try
                {

                    //-------------------------- se ejecuta procedimiento de validacion -------------------------- 
                    //var xml = ConvertToXml(DT_Migrar);

                    ConexionDTO obj = new ConexionDTO();

                    obj.procedimiento = context.Request.Form["procedimiento"].ToString();
                    obj.Parametros.Add("xmlInput", string.Concat(absolutePath, fname));
                    obj.Parametros.Add("Nombre_Archivo", fname.Split('.')[0]);
                    obj.Parametros.Add("Usuario", context.Request.Form["usuario"]);

                    //if (context.Request.Form["cotizacion"] != null)
                    //{
                    //    obj.parametros.Add("cotizacion", context.Request.Form["cotizacion"].ToString());
                    //}

                    var resultDT = new DBConexion().consultarSP(obj);

                    if (resultDT.Count != 0 && resultDT[0]["resultado"].Equals("error"))
                    {
                        System.IO.File.Delete(string.Concat(absolutePath, fname));
                        context.Response.Write("Error: " + resultDT[0]["error"]);
                        return;
                    }


                    System.IO.File.Delete(string.Concat(absolutePath, fname));

                    context.Response.Write("Bien");
                }
                catch (Exception e)
                {
                    context.Response.Write("Error: " + e.InnerException.Message);
                }


            }
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



    object detalle_migracion(DataTable resultDT)
    {
        var query_result = (from data in resultDT.AsEnumerable()
                            select new
                            {
                                ProCod = data.Field<string>("producto"),
                                ProDesc = data.Field<string>("descripcion"),
                                ProUnidadCont = data.Field<string>("um"),
                                TerID = data.Field<string>("TerID"),
                                TerNombre = data.Field<string>("TerNombre"),
                                TerNit = data.Field<string>("nit"),
                                ProdPPrecioAutorizado = data.Field<decimal?>("ProdPVrUnit"),
                                ProdPPorcDto = data.Field<decimal?>("ProdPPorcDto"),
                                ProdIva = data.Field<decimal?>("ProdPPorcIVA"),
                                ProdPRef = data.Field<string>("ProdPRef"),
                                Ppal = 0,
                                error = data.Field<string>("error"),
                                umError = data.Field<string>("umError"),
                                codError = data.Field<string>("codError"),
                                nitError = data.Field<string>("nitError"),
                                codTerError = data.Field<string>("codTerError"),
                                ExisteMig = data.Field<int?>("ExisteMig"),
                                Dto_error = data.Field<string>("Dto_error"),
                                Valor_error = data.Field<string>("Valor_error")
                            });

        return query_result;
    }

    public XDocument ConvertToXml(DataTable dt)
    {
        System.IO.StringWriter writer = new System.IO.StringWriter();

        writer = new System.IO.StringWriter();
        dt.WriteXml(writer, XmlWriteMode.IgnoreSchema, false);

        System.Xml.Linq.XDocument xDoc = new System.Xml.Linq.XDocument();

        xDoc = System.Xml.Linq.XDocument.Parse(writer.ToString());

        return xDoc;
    }

    DataTable nombrarTablas(DataTable source)
    {

        source.TableName = "ImportarProductosProv";

        source.Columns[0].ColumnName = "Cod";
        source.Columns[1].ColumnName = "Descripcion";
        source.Columns[2].ColumnName = "Um";
        source.Columns[3].ColumnName = "Ref";
        source.Columns[4].ColumnName = "Dto";
        source.Columns[5].ColumnName = "Vr_Costo";
        source.Columns[6].ColumnName = "IVA";
        source.Columns[7].ColumnName = "Cod_Prov";
        source.Columns[8].ColumnName = "Nombre";
        source.Columns[9].ColumnName = "Nit";

        source.Rows[0].Delete();

        source.AcceptChanges();
        return source;
    }


}
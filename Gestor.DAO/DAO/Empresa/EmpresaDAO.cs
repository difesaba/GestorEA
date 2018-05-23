using Gestor.DAO.DB;
using Gestor.DTO.DTO.Empresa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Empresa
{
    public class EmpresaDAO
    {
        public EmpresaDTO ConsultaEmpresa() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaEmpresa"
            });
            
            var consultaEmpresa = (from q in resultados
                                   select new EmpresaDTO() {
                                       EmpresaId = (int)q["EmpresaId"],
                                       EmpresaNombre = (string)q["EmpresaNombre"],
                                       EmpresaNit = (string)q["EmpresaNit"],
                                       EmpresaPais = (string)q["EmpresaPais"],
                                       EmpresCiudad = (string)q["EmpresCiudad"],
                                       EmpresaDireccion = (string)q["EmpresaDireccion"],
                                       EmpresaTelefono = (string)q["EmpresaTelefono"],
                                       EmpresaCorreo = (string)q["EmpresaCorreo"]
                                   }).FirstOrDefault();
            return consultaEmpresa;

        }
    }
}

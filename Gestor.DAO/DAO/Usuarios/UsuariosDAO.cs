using Gestor.DAO.DB;
using Gestor.DTO.DTO.Estados;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Usuarios
{
    public class UsuariosDAO
    {
        public List<ConsultarUsuariosDTO> ConsultarUsuarios(string usuario, string rol, string cargo) {
            List<ConsultarUsuariosDTO> ConsultaUsuario;
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Usuario", usuario);
            parametros.Add("@Rol", rol);
            parametros.Add("@Cargo", cargo);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultarUsuarios",
                Parametros = parametros
            });
            ConsultaUsuario = (from q in resultados
                               select new ConsultarUsuariosDTO()
                               {
                                   usuarios = new UsuariosDTO()
                                   {
                                       UsuarioId = (int)q["UsuarioId"],
                                       UsuarioNombre = (string)q["UsuarioNombre"],
                                       UsuarioApellido = (string)q["UsuarioApellido"],
                                       Usuario = (string)q["Usuario"],
                                       UsuarioIdentificacion = (string)q["UsuarioIdentificacion"],
                                       UsuarioCorreo = (string)q["UsuarioCorreo"]
                                   },
                                   roles = new RolesDTO()
                                   {
                                       RolId = (int)q["RolId"],
                                       RolNombre = (string)q["RolNombre"]
                                   },
                                   cargo = new CargoDTO()
                                   {
                                       CargoId = (int)q["CargoId"],
                                       CargoDescripcion = (string)q["CargoDescripcion"]
                                   },
                                   tipo = new TipoIdentificacionDTO() {
                                       TipoId = (int)q["TipoId"],
                                       TipoSiglas = (string)q["TipoSiglas"]
                                   },
                                   estados = new EstadosDTO() {
                                       EstadosId = (int)q["EstadosId"],
                                       EstadosDescripcion = (string)q["EstadosDescripcion"]
                                   },
                                   UsuarioNombreCompleto = (string)q["NombreCompleto"]
                               }).ToList();
            return ConsultaUsuario;
        }

        public  List<AutoCompleteUsuarioDTO> CompleteUser(string data) {
            Dictionary<String, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Filter", data);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "AutoCompleteUsuarios",
                Parametros = parametros
            });

            var CompleteUser = (from q in resultados
                                select new AutoCompleteUsuarioDTO()
                                {

                                    id = (int)q["id"],
                                    Descripcion = (string)q["Descripcion"]

                                }).ToList();

            return CompleteUser;
        }

        public List<ListaCargoDTO> ListaCargo() {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListarCargos"
            });

            var listaCargos = (from q in resultados
                               select new ListaCargoDTO()
                               {
                                   cargos = new CargoDTO()
                                   {
                                       CargoId = (int)q["CargoId"],
                                       CargoDescripcion = (string)q["CargoDescripcion"]
                                   }
                               }).ToList();
            return listaCargos;
        }


        public List<ListaRolesDTO> ListaRol()
        {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListarRoles"
            });

            var listaRoles = (from q in resultados
                               select new ListaRolesDTO()
                               {
                                   roles = new RolesDTO()
                                   {
                                       RolId = (int)q["RolId"],
                                       RolNombre = (string)q["RolNombre"]
                                   }
                               }).ToList();
            return listaRoles;
        }

        public List<ListaTipoIDDTO> ListaTipoId()
        {
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ListaTipoIdentificacion"
            });

            var listaRoles = (from q in resultados
                              select new ListaTipoIDDTO()
                              {
                                  tipo = new TipoIdentificacionDTO()
                                  {
                                     TipoId = (int)q["TipoId"],
                                     TipoSiglas = (string)q["TipoSiglas"]
                                  }
                              }).ToList();
            return listaRoles;
        }

        public string crearUsuario(string nombre, string apellido, int tipo, string identificacion, string contrasena, string correo, int rol, int cargo) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Nombre",nombre);
            parametros.Add("@Apellido",apellido);
            parametros.Add("@Tipo",tipo);
            parametros.Add("@Identificacion",identificacion);
            parametros.Add("@Contrasena",contrasena);
            parametros.Add("@Correo",correo);
            parametros.Add("@Rol", rol);
            parametros.Add("@Cargo", cargo);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CreacionUsuario",
                Parametros = parametros
            });
            return (string)resultados[0]["Nick"];
        }

        public void ActualizarUsuario(int usuarioId,string nombre, string apellido, int tipo,string identificacion,string correo, int rol,int cargo,int estado) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@UsuarioId", usuarioId);
            parametros.Add("@Nommbre", nombre);
            parametros.Add("@Apellido", apellido);
            parametros.Add("@Tipo",tipo);
            parametros.Add("@Identificacion", identificacion);
            parametros.Add("@Correo",correo);
            parametros.Add("@Rol",rol);
            parametros.Add("@Cargo",cargo);
            parametros.Add("@Estado",estado);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ActualizarUsuario",
                Parametros = parametros
            });
        }

        public List<ConsultaRolesDTO> ConsultarRoles(int rol) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Rol", rol);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultarRoles",
                Parametros = parametros
            });

            var consulta = (from q in resultados
                            select new ConsultaRolesDTO()
                            {
                                croles = new RolesDTO { 
                                    RolId = (int)q["RolId"],
                                    RolNombre = (string)q["RolNombre"]
                                }
                            }).ToList();
            return consulta;
        }

        public int CrearRoles(string descripcion) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@RolDesc", descripcion);
            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "CrearRoles",
                Parametros = parametros
            });
            return (int)resultados[0]["Id"];
        }

        public List<ConsultaAccesosDTO> ConsultaAcceso(int rol) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Rol", rol);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "ConsultaAccesos",
                Parametros = parametros
            });

            var consultaAccesos = (from q in resultados
                                   select new ConsultaAccesosDTO()
                                   {
                                       permisos = new PermisosDTO()
                                       {
                                           PermisoNombre = (string)q["PermisoNombre"],
                                           URLRuta = (string)q["URLRuta"],
                                           PermisoPadre = (int)q["PermisoPadre"],
                                           PermisoId = (int)q["PermisoId"]
                                       },
                                       rolPermiso = new RolPermisoDTO()
                                       {
                                           Rol = (int)q["Rol"],
                                           Permiso = (int)q["Permiso"]
                                       },
                                       roles = new RolesDTO() {
                                           RolNombre = (string)q["RolNombre"],
                                           RolId = (int)q["RolId"]
                                       }
                                   }).ToList();
            return consultaAccesos;
        }

        public string otorgarAccesos(int rol, int permiso, int opcion) {
            Dictionary<string, object> parametros = new Dictionary<string, object>();
            parametros.Add("@Rol", rol);
            parametros.Add("@Permiso",permiso);
            parametros.Add("@Opcion", opcion);

            List<Dictionary<string, object>> resultados = new DBConexion().consultarSP(new ConexionDTO()
            {
                procedimiento = "OtorgarAccesos",
                Parametros = parametros
            });
            return (string)resultados[0]["Mensaje"];
        }
    }
}

﻿using Gestor.DAO.DAO.HelpDesk;
using Gestor.DTO.DTO.HelpDesk;
using Gestor.DTO.DTO.Usuario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorEA.Views.HelpDesk
{
    public partial class Incidentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<InformeIncidentes> listarCasos() {
            return new HelpDeskDAO().InformeCasos();
        }

        [WebMethod]
        public static ConsultaCaso mostrarCaso(int id) {
            return new HelpDeskDAO().ConsultaCaso(id);
        }

        [WebMethod]
        public static List<UsuariosDTO> listaTecnicos() {
            return new HelpDeskDAO().ListaTecnicos();
        }


        [WebMethod]
        public static bool asignaCaso(int caso, int usuario)
        {
            new HelpDeskDAO().AsignaCaso(caso, usuario);
            return true;
        }
    }
}
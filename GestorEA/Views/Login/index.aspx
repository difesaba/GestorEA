<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GestorEA.Views.Login.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../Content/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/fontawesome-all.min.css" rel="stylesheet" />
    <link href="../../Content/Login/Login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Gestor EA</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="#">Conocenós</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#myModal">Iniciar Sesion</a>
      </li>
    </ul>

  </div>
</nav>
        <!-- Fin navegacion intro -->
        <div class="container" style="border-bottom: 2px solid #ccc;">
            <center>
			<img src="../../Content/Img/iphone_Diego.png" alt="" class="styleimg"> 
		</center>
        </div>
        <!-- Fin encabezado imagen -->

        <div class="container">
            <!-- inicio section conocenos -->
            <section>
                <div id="Justificacion">
                    <h1 class="color-h">¿Quiénes Somos?</h1>
                    <p class="textbody" href="">
                        El sistema de información gestor de abastecimiento, brinda control informativo en el proceso de aprovisionamiento, facilitando
					el flujo de compra y venta, en la actualidad tanto a proveedores y compradores.
                    </p>
                </div>

            </section>
        </div>
        <!-- f	in section conocenos -->



        <section id="contact" class="contact " style="width: 500px; margin-bottom: 20px; padding: 50px;">


            <ul class="list-inline list-social">
                <li class="social-twitter">
                    <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li class="social-facebook">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li class="social-google-plus">
                    <a href="#"><i class="fa fa-google-plus"></i></a>
                </li>
                <li class="social-instagram">
                    <a href="#"><i class="fa fa-instagram"></i></a>
                </li>
            </ul>

        </section>

        <footer>
            <div class="container">
                <p>&copy; 2017 Gestor Eficiente de Abastecimiento.</p>
                <ul class="list-inline">
                    <li>
                        <a href="#">Teléfono: 031-254455</a>
                    </li>
                    <li>
                        <a href="#">Email: gestorea.outlook.com.co</a>
                    </li>

                </ul>
            </div>
        </footer>

    </form>

     <!-- Modal Iniciar Session-->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 400px; margin: auto;">
                                    <div class="modal-header" style="background-color: #00b0eb;">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #fff;"></i></span></button>
                                        
                                    </div>
                                    <div class="modal-body" style="width: 400px; margin: auto; background-color: tras">
                                        <h2 class="tittleh1-login" style="margin-bottom: 20px;">Iniciar Sesión</h2>

                                        <div class="login	">
                                            <div id="user-icon" style="width: 70px; margin: auto;">
                                                <i class="fa fa-user-circle fa-5x" style="margin: auto;" aria-hidden="true"></i>
                                            </div>
                                            <div class="form-group" style="width: 300px; margin: auto;">
                                                <label class="control-label titles_contac" for="focusedInput" style="margin-bottom: 20px; margin-top: 20px">Usuario:</label>
                                                <input class="form-control" id="txtUsuario"  value=""  type="text" placeholder="Ej: Diegos" style="width: 300px;" maxlength="20">
                                            </div>

                                            <div class="form-group" style="width: 300px; margin: auto;">
                                                <label class="control-label titles_contac" for="focusedInput" style="margin-bottom: 20px; margin-top: 20px;">Contraseña:</label>
                                                <input class="form-control" id="txtContrasena"  value="" type="password" placeholder="Ej: xxxxxx" style="width: 300px;" maxlength="20">
                                            </div>

                                        </div>


                                        <section class="imglogin">
                                        </section>
                                    </div>
                                    <div class="modal-footer" style="width: 220px; margin: auto; margin-top: 20px; margin-bottom: 20px;">
                                        <button type="button" class="btn btn-warning" data-dismiss="modal">Regresar</button>
                                        <button onclick="iniciar()" type="button" class="btn btn-success">Ingresar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Iniciar Session-->


</body>

<script>

    function iniciar() {
        Usuario = document.getElementById('txtUsuario').value;
        Contrasena = document.getElementById('txtContrasena').value;

        ConsultaAjax("datosSesion", "POST", function (source) {
            if (!source) {
                //Error
                alert('Usuario Incorrecto Intente Nuevamente');
            } else {

                window.location.assign("../Inicio/inicio.aspx");
            }
        }, { usu: Usuario, pass: Contrasena })
    }


</script>
<script src="../../Scripts/jquery-3.3.1.min.js"></script>
<script src="../../Content/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
<script src="../../Scripts/Popper.js"></script>
<script src="../../Scripts/Estandar.js"></script>
<script src="../../Scripts/ServiceAjax/Ajax.js"></script>
 

</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="GestorEA.Views.Usuarios.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../Inicio/inicio.aspx">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
  </ol>
</nav>
    <div ng-app="UsuariosApp">
        <div>
            <h6 style="color: #007bff">Usuarios</h6>
        </div>
        </br>
        <!-- Navs -->
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fas fa-users fa-2x" style="margin-right: 10px;"></i>Usuarios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="far fa-address-book fa-2x" style="margin-right: 10px;"></i>Roles</a>
            </li>
 
        </ul>
        <!-- Navs -->
        <!-- Contents -->
        <div class="tab-content" id="pills-tabContent">
            <!-- Usuarios-->
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <div ng-controller="usuarioControler">
                    <div>
                        <h6>Usuarios</h6>
                    </div>
                    <div>
                        <fieldset class="container-fluid border-content">
                            <legend style="color: #4E8FCB !important">Filtros</legend>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput">Usuario</label>
                                            <div class="group autocomplete" id="DivAcProducto" webmethod="AutoCompleteUsuarios">
                                                <div class="input-icon-right">
                                                    <input type="text" class="form-control form-control-sm" id="txtUsuario" name="txtUsuario" placeholder="Buscar Usuario " maxlength="30">
                                                    <i class="fas fa-search" aria-hidden="true"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput">Cargo</label>
                                            <select class="custom-select custom-select-sm" name="txtCargo" id="txtCargo">
                                                <option selected value="-1">Seleccione</option>
                                                <option ng-repeat="option in listacargos" value="{{option.cargos.CargoId}}">{{option.cargos.CargoDescripcion}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput">Rol</label>
                                            <select class="custom-select custom-select-sm" name="txtRol" id="txtRol">
                                                <option selected value="-1">Seleccione</option>
                                                <option ng-repeat="option in listaroles" value="{{option.roles.RolId}}">{{option.roles.RolNombre}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput">Estado</label>
                                            <select class="custom-select custom-select-sm" name="txtEstado" id="txtEstado">
                                                <option selected value="-1">Seleccione</option>
                                                <option ng-repeat="option in listaEstados" value="{{option.EstadosId}}">{{option.EstadosDescripcion}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class=" col-sm-1">
                                        <div class="form-group ">
                                            <button type="button" class="btn btn-primary  button-search" ng-click="consultarusuarios()">Consultar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <!-- Buttons-->
                        </br>
                        <p>
                            <span data-toggle="collapse" href="#collapseUsuario" role="button" aria-expanded="false"
                                aria-controls="collapseExample"><i class="fas fa-user-plus fa-2x icon-table" title="Crear" data-toggle="tooltip" data-placement="right"></i></span>
                        </p>
                        <!-- Buttons-->
                        <!-- Crear collapse-->
                        <div class="collapse" id="collapseUsuario">
                            <fieldset class="card card-body" role="form">
                                <legend style="color: #4E8FCB !important">Creacion</legend>
                                <div class="container-fluid">
                                    <div>
                                        <h6 style="color: #007bff">Creación Usuario</h6>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Nombres
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <input type="text" class="form-control form-control-sm" id="txtNombre" placeholder="Ingresa tu Nombre" maxlength="30">
                                            </div>
                                        </div>
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Apellidos
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <input type="text" class="form-control form-control-sm" id="txtApellido" placeholder="Ingresa tu Apeliido" maxlength="30">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Tipo Identificación
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <select class="form-control form-control-sm custom-select" id="txtTipo">
                                                    <option selected value="-1">Seleccione</option>
                                                    <option ng-repeat="option in listaTipos" value="{{option.tipo.TipoId}}">{{option.tipo.TipoSiglas}}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Numero Identificación
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <input type="text" class="form-control form-control-sm" id="txtIdentificacion" placeholder="Ingresa tu Identificacion" maxlength="20">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Contraseña
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <input type="password" class="form-control form-control-sm" id="txtContrasena" placeholder="Ingresa tu Contraseña" maxlength="30">
                                            </div>
                                        </div>
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Confirmar Contraseña
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <input type="password" class="form-control form-control-sm" id="txtConfirma" placeholder="Ingresa tu Contraseña" maxlength="30" ng-blur="conrtasena()">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Correo
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <input type="email" class="form-control form-control-sm" id="txtCorreo" placeholder="correo@compania.com" maxlength="50">
                                            </div>
                                        </div>
                                        <div class="col-sm">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Rol
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>
                                                <select class="custom-select custom-select-sm" name="txtRolCreate" id="txtRolCreate">
                                                    <option selected value="-1">Seleccione</option>
                                                    <option ng-repeat="option in listaroles" value="{{option.roles.RolId}}">{{option.roles.RolNombre}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-sm-6">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">
                                                    Cargo
                                                <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                </label>

                                                <select class="custom-select custom-select-sm" name="txtCargoCreate" id="txtCargoCreate">
                                                    <option selected value="-1">Seleccione</option>
                                                    <option ng-repeat="option in listacargos" value="{{option.cargos.CargoId}}">{{option.cargos.CargoDescripcion}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class=" col-sm-2">
                                            <button type="button" class="btn btn-primary" ng-click="crearUsuario();">Guardar</button>
                                            <button type="button" class="btn btn-danger">Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <!-- Crear collapse-->
                        <!-- Table usuarios-->
                        <table class="table table-bordered">
                            <thead class="thead-table">
                                <tr>
                                    <th scope="col" class="tamano-codigo">Usuario</th>
                                    <th scope="col">Nombres</th>
                                    <th scope="col" class="tamano-siglas-table">Tipo ID</th>
                                    <th scope="col">Identificación</th>
                                    <th scope="col">Correo</th>
                                    <th scope="col">Cargo</th>
                                    <th scope="col">Rol</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col" class="icon-table-size">Edición</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat=" p in leerUsuarios" position="{{$index}}">

                                    <td>{{p.usuarios.Usuario}}</td>
                                    <td>{{p.UsuarioNombreCompleto}}</td>
                                    <td>{{p.tipo.TipoSiglas}}</td>
                                    <td>{{p.usuarios.UsuarioIdentificacion}}</td>
                                    <td>{{p.usuarios.UsuarioCorreo}}</td>
                                    <td>{{p.cargo.CargoDescripcion}}</td>
                                    <td>{{p.roles.RolNombre}}</td>
                                    <td>{{p.estados.EstadosDescripcion}}</td>
                                    <td class="icon-table-aling">
                                        <i class="fas fa-edit fa-lg icon-table" data-toggle="modal" data-target="#editModal" ng-click="abriredicion(this)"></i>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- Edicion -->
                        <div class="modal fade bd-example-modal-lg" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel">Edición</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Nombres
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <input type="text" class="form-control form-control-sm" id="txtNombreEdit" ng-model="edicion.UsuarioNombre">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Apellidos
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <input type="text" class="form-control form-control-sm" id="txtApellidoEdit" ng-model="edicion.UsuarioApellido">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Tipo Identificación
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <select class="custom-select custom-select-sm" id="txtTipoEdit" ng-options="item as item.tipo.TipoSiglas for item in listaTipos track by item.tipo.TipoId" ng-model="selectedTipo"></select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Numero Identificación
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <input type="text" class="form-control form-control-sm" id="txtIdentificacionEdit" ng-model="edicion.UsuarioIdentificacion">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Correo
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <input type="email" class="form-control form-control-sm" id="txtCorreoEdit" ng-model="edicion.UsuarioCorreo">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Rol
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <select class="custom-select custom-select-sm" id="txtRolEdit" ng-options="rol as rol.roles.RolNombre for rol in listaroles track by rol.roles.RolId" ng-model="selectedRol"></select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Cargo
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <select class="custom-select custom-select-sm" ng-options="ca as ca.cargos.CargoDescripcion for ca in listacargos track by ca.cargos.CargoId" ng-model="selectedCargo"></select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group ">
                                                        <label for="formGroupExampleInput">
                                                            Estado
                                                            <span><i class="fas fa-asterisk fa-sm required"></i></span>
                                                        </label>
                                                        <select class="custom-select custom-select-sm" ng-options="es as es.EstadosDescripcion for es in listaEstados track by es.EstadosId" ng-model="selectedEstado"></select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                                        <button type="button" class="btn btn-primary" ng-click="guardaEdicion()">Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Edicion -->
                        <!-- Table usuarios-->
                    </div>
                </div>
            </div>
            <!-- Usuarios-->
            <!-- Roles-->
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                <div ng-controller="rolController">
                    <div>
                        <h6>Roles</h6>
                    </div>
                    <fieldset class="container-fluid border-content">
                        <legend style="color: #4E8FCB !important">Filtros</legend>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group ">
                                        <label for="txtRolCreate">Rol</label>
                                        <select class="custom-select custom-select-sm" name="txtRolCrear" id="txtRolCrear">
                                            <option selected value="-1">Seleccione</option>
                                            <option ng-repeat="option in listarrol" value="{{option.roles.RolId}}">{{option.roles.RolNombre}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class=" col-sm-1">
                                    <div class="form-group ">
                                        <button type="button" class="btn btn-primary  button-search" ng-click="consultarRoles()">Consultar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    </br>
                <div>
                    <span data-toggle="modal" data-target="#createRol"><i class="fas fa-plus fa-2x icon-table" title="Crear" data-toggle="tooltip"   data-placement="right" ></i></span>
                </div>
                    <br>
                    <!-- Table usuarios-->
                    <table class="table table-bordered" id="">
                        <thead class="thead-table">
                            <tr>
                                <th scope="col">Rol Nombre</th>
                                <th scope="col" class="icon-table-size">Edición</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="p in rol ">
                                <td>{{p.croles.RolNombre}}</td>
                                <td class="icon-table-aling"><i class="fas fa-edit fa-lg icon-table" ng-click="abriredicion(p)"></i></td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Modal Crear ROl -->
                    <div class="modal fade" id="createRol" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Crear Roles</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <table class="table table-bordered">
                                            <thead class="thead-table">
                                                <tr>
                                                    <th scope="col" class="tamano-codigo">Rol Descripción</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="padding-input-modal">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <input type="text" class="form-control form-control-sm  " id="txtRolDescripcion" placeholder="Ingrese el Rol ">
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" ng-click="crearRol()">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Crear ROl -->
                    <!-- Modal Edicion ROl -->
                    <div class="modal fade" id="editeRol" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edición Roles</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <table class="table table-bordered">
                                            <thead class="thead-table">
                                                <tr>
                                                    <th scope="col" class="tamano-codigo">Rol Descripción</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="padding-input-modal">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <input type="text" ng-model="edicion.ProductoDescripcion" class="form-control form-control-sm" id="txtDescripcionEdit" placeholder="Buscar Producto">
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" ng-click="">Guardar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Edicion ROl -->
                </div>
            </div>

            <!-- Roles-->
            <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">...</div>
        </div>
    </div>
    <!-- Contents -->

    <script>

        var app = angular.module("UsuariosApp", [])

        /*Usuarios*/
        app.controller("usuarioControler", function ($scope) {
            $scope.usuarios = [];
            /*Consulta*/
            $scope.consultarusuarios = function () {
                var usuario = "";
                var rol = -1;
                var cargo = -1;

                ConsultaAjax("cosultarUsuarios", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.leerUsuarios = source;
                        $scope.$apply();
                    }
                }, { usuario: usuario, rol: rol, cargo: cargo })
            }
            /*Lista Cargo*/
            $scope.listaCargo = function () {
                ConsultaAjax("listasCargo", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.listacargos = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaCargo();

            /*Lista Roles*/
            $scope.listaRol = function () {
                ConsultaAjax("listasRol", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.listaroles = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaRol();

            //Listar Estados
            $scope.listarEstados = function () {
                ConsultaAjax("ListaEstados", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.listaEstados = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listarEstados();



            $scope.listaTipo = function () {
                ConsultaAjax("listaTipo", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.listaTipos = source;
                        $scope.$apply;
                    }
                })
            }

            $scope.listaTipo();

            $scope.crearUsuario = function () {

                var nombre = document.getElementById('txtNombre').value;
                var apellido = document.getElementById('txtApellido').value;
                var tipo = document.getElementById('txtTipo').value;
                var identificacion = document.getElementById('txtIdentificacion').value;
                var contrasena = document.getElementById('txtContrasena').value;
                var correo = document.getElementById('txtCorreo').value;
                var rol = document.getElementById('txtRolCreate').value;
                var cargo = document.getElementById('txtCargoCreate').value;

                if (nombre == '' || apellido == '' || tipo =='-1' || correo == '' || rol== '-1' || cargo=='-1' ) {
                    swal('', 'Los campos marcados son obligatorios', 'error');
                    return
                }

                ConsultaAjax("crearUsuarios", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.User = source;
                        swal('', 'Se genero el usuario: ' + $scope.User, 'success');
                        $('#collapseUsuario').collapse('hide');
                        $scope.$apply;
                    }
                }, { nombre: nombre, apellido: apellido, tipo: tipo, identificacion: identificacion, contrasena: contrasena, correo: correo, rol: rol, cargo: cargo })
            }

            /*Edicion usuario*/
            $scope.selectedTipo = {};
            $scope.selectedRol = {};
            $scope.selectedCargo = {};
            $scope.selectedEstado = {};
            $scope.edicion = { UsuarioId: 1, Usuario: '', estado: 1, UsuarioNombre: '', UsuarioApellido: '', TipoId: 1, TipoSiglas: '', UsuarioIdentificacion: '', UsuarioCorreo: '', CargoId: 1, CargoDescripcion: '', RolId: 1, RolNombre: '' };

            $scope.abriredicion = function (p) {
                $scope.selectedTipo.tipo = {};
                $scope.selectedRol.roles = {};
                $scope.selectedCargo.cargos = {};
                var position = p.$index;
                var usuario = $scope.leerUsuarios[position];
                $scope.edicion.UsuarioId = usuario.usuarios.UsuarioId;
                $scope.edicion.Usuario = usuario.usuarios.Usuario;
                $scope.edicion.UsuarioNombre = usuario.usuarios.UsuarioNombre;
                $scope.edicion.UsuarioApellido = usuario.usuarios.UsuarioApellido;
                $scope.selectedTipo.tipo.TipoId = usuario.tipo.TipoId;
                $scope.selectedTipo.tipo.TipoSiglas = usuario.tipo.TipoSiglas;
                $scope.edicion.UsuarioIdentificacion = usuario.usuarios.UsuarioIdentificacion;
                $scope.edicion.UsuarioCorreo = usuario.usuarios.UsuarioCorreo;
                $scope.selectedCargo.cargos.CargoId = usuario.cargo.CargoId;
                $scope.selectedCargo.cargos.CargoDescripcion = usuario.cargo.CargoDescripcion;
                $scope.selectedRol.roles.RolId = usuario.roles.RolId;
                $scope.selectedRol.roles.RolNombre = usuario.roles.RolNombre;
                $scope.selectedEstado.EstadosId = usuario.estados.EstadosId;
                $scope.selectedEstado.EstadosDescripcion = usuario.estados.EstadosDescripcion;
                $('#editModal').modal('show');
            }


            $scope.guardaEdicion = function () {
                var usuarioId = $scope.edicion.UsuarioId;
                var nombre = document.getElementById('txtNombreEdit').value;
                var apellido = document.getElementById('txtApellidoEdit').value;
                var tipo = $scope.selectedTipo.tipo.TipoId;
                var documento = document.getElementById('txtIdentificacionEdit').value;
                var correo = document.getElementById('txtCorreoEdit').value;
                var rol = $scope.selectedRol.roles.RolId;
                var cargo = $scope.selectedCargo.cargos.CargoId;
                var estado = $scope.selectedEstado.EstadosId;
                ConsultaAjax("actualizaUsuario", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.$apply();
                        $('#editModal').modal('hide');
                        swal('', 'Registro Actualizado', 'success');
                    }
                }, { usuarioId: usuarioId, nombre: nombre, apellido: apellido, tipo: tipo, identificacion: documento, correo: correo, rol: rol, cargo: cargo, estado: estado })
            }

            $scope.conrtasena = function () {
                if (document.getElementById('txtConfirma').value != document.getElementById('txtContrasena').value) {
                    document.getElementById('txtContrasena').focus();
                    document.getElementById('txtConfirma').value = '';
                    document.getElementById('txtContrasena').value=''
                    swal('', 'las contraseñas no coinciden', 'error');
                    return
                }
            }
        });
        /*Usuarios*/
        /*item roles*/
        app.controller("rolController", function ($scope) {
            /*Lista Roles*/
            $scope.listaRol = function () {
                ConsultaAjax("listasRol", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.listarrol = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaRol();


            $scope.consultarRoles = function () {
                var rol = document.getElementById('txtRolCrear').value;
                ConsultaAjax("consultaRoles", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.rol = source;
                        $scope.$apply();
                    }
                }, { rol: rol })
            }


            $scope.rol = [];

            $scope.crearRol = function () {
                var descripcion = document.getElementById('txtRolDescripcion').value;
                if (descripcion == '') {
                    swal('', 'El rol es obligatorio', 'warning');
                    return;
                }
                ConsultaAjax("crearRoles", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.rol = [];
                        $scope.rol.push(source);
                        $scope.$apply();
                        $('#createRol').modal('hide');
                        swal('', 'Registro guardado', 'success');
                    }
                }, { descripcion: descripcion })
            }

            $scope.abriredicion = function (p) {
                $('#editeRol').modal('show');
            }
        });
        /*item roles*/

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</asp:Content>

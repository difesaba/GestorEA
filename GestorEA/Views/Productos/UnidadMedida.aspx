<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnidadMedida.aspx.cs" Inherits="GestorEA.Views.Productos.UnidadMedida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../Inicio/inicio.aspx">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Administración de Productos</li>
    <li class="breadcrumb-item active" aria-current="page">Unidad de Medida</li>
  </ol>
</nav>
    <div ng-app="UnidadMedidaApp">
        <div ng-controller="UnidadMedidaController">
            </br>
    <div class="container-fluid">
        <h6 style="color: #007bff">Unidad de Medida</h6>
    </div>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Filtros</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Descripcion Unidad Medida</label>
                                    <div class="group autocomplete" id="DivAcProducto" webmethod="AutoCompleteUnidad">
                                        <div class="input-icon-right">
                                            <input type="text" class="form-control form-control-sm" id="txtUnidad" name="txtUnidad" placeholder="Buscar Unidad" maxlength="30">
                                            <i class="fas fa-search" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" col-sm-1">
                                <div class="form-group ">
                                    <button type="button" class="btn btn-primary  button-search" ng-click="consultarUnidadMedida()">Consultar</button>
                                    
                                </div>
                            </div>

                        </div>
                    </div>
                </fieldset>
            </div>
            <br>
            <div class="container-fluid">

                <span data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"><i class="fas fa-plus-circle fa-2x icon-table" title="Crear" data-toggle="tooltip"   data-placement="right"></i></span>
                <div class="collapse" id="collapseExample">
                    <br>
                    <fieldset class="card card-body">
                        <legend style="color: #4E8FCB !important">Crear Unidades</legend>
                        <table class="table table-bordered">
                            <thead  class="thead-table">
                                <tr>
                                    <th scope="col" class="tamano-siglas-table">Siglas</th>
                                    <th scope="col">Descripción Unidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="padding-input-modal">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="text" class="form-control form-control-sm" id="txtSiglas" placeholder="Siglas" maxlength="5">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="padding-input-modal">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="text" class="form-control form-control-sm" id="txtDescripcion" placeholder="Ingrese la Descripcion" maxlength="30">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <div class="row">
                            <div class=" col-sm-2">
                                <button type="button" class="btn btn-primary " ng-click="crearUnidades()">Guardar</button>
                                <button type="button" class="btn btn-danger">Cancelar</button>
                            </div>
                        </div>

                    </fieldset>
                </div>
            </div>
            <br>
            <div class="container-fluid">
                <table class="table table-bordered">
                    <thead>
                        <tr class="thead-table">
                            <th scope="col" class="tamano-siglas-table">Unidad Siglas</th>
                            <th scope="col">Descripción</th>
                            <th scope="col" class="icon-table-size ">Edición</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in unidadMedida">
                             
                            <th >{{p.unidadMedida.UnidadSiglas}} </th>
                            <td>{{p.unidadMedida.UnidadDescripcion}} </td>
                            <td class="icon-table-aling"><i class="fas fa-edit fa-lg icon-table" data-toggle="modal" data-target="#editModal" ng-click="abriredicion(p)"></i></td>
                           
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Modal -->
            <!-- Edicion -->
            <div class="modal fade bd-example-modal-lg" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
                aria-hidden="true" data-keyboard="false" data-backdrop="static">
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

                                <table class="table table-bordered">
                                    <thead class="thead-table">
                                        <tr>
                                            <th scope="col" class="tamano-siglas-table">Siglas</th>
                                            <th scope="col">Descripcion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="hidden" id="txtUnidadIdEdit" value="{{edicion.UnidadId}}"/>
                                                        <input type="text" class="form-control form-control-sm" id="txtSiglasEdit"  ng-model="edicion.UnidadSiglas" placeholder="Buscar Producto" maxlength="5">
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="text" class="form-control form-control-sm" id="txtDescripcionEdit" ng-model="edicion.UnidadDescripcion"  maxlength="30">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" ng-click="actualizarUnidad()">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edicion -->
            <!-- Modal -->

            
            
        </div>
    </div>

    <script>


        var app = angular.module("UnidadMedidaApp", [])
        app.controller("UnidadMedidaController", function ($scope) {
            $scope.unidadMedida = [];

 
            //Consultar Unidades
            $scope.consultarUnidadMedida = function () {
                var unidad = "-1";
                if (document.getElementById('txtUnidad').value == undefined || document.getElementById('txtUnidad').value == "") {
                    unidad = "-1";
                } else {

                    unidad = JSON.parse(document.getElementById('txtUnidad').getAttribute('result')).id;
                }
 
                ConsultaAjax("ConsultarUM", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {

                        $scope.unidadMedida = source;

                        $scope.$apply();
                    }
                }, { um: unidad })
            }

            //Crear Unidades
            $scope.crearUnidades = function () {
                var siglas = document.getElementById('txtSiglas').value;
                var descripcion = document.getElementById('txtDescripcion').value;  

                if (siglas == '' || siglas == undefined) {
                    swal('', 'Es obligatorio dilegenciar las siglas', 'warning');
                    document.getElementById('txtSiglas').focus();
                    return;
                }

                if (descripcion == '' || descripcion == undefined) {
                    swal('', 'La Descripcion es obligatoria', 'warning');
                    document.getElementById('txtDescripcion').focus();
                    return;
                }

                ConsultaAjax("crearUM", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.unidadMedida = [];
                        $scope.unidadMedida.push(source);
                        $scope.$apply();
                        $('#collapseExample').collapse('hide');
                        swal('', 'Registro guardado', 'success');
                        $scope.consultarUnidadMedida();
                        document.getElementById('txtSiglas').value = "";
                        document.getElementById('txtDescripcion').value="";
                    }
                }, { siglas: siglas, descripcion: descripcion, })
            }

            $scope.edicion = { UnidadId: 1, UnidadSiglas: '',  ProductoDescripcion: '' };
            $scope.abriredicion = function(p){
                $scope.edicion.UnidadId = p.unidadMedida.UnidadId;
                $scope.edicion.UnidadSiglas = p.unidadMedida.UnidadSiglas;
                $scope.edicion.UnidadDescripcion = p.unidadMedida.UnidadDescripcion
                //alert($scope.edicion.UnidadId )
                $('#editModal').modal('show');
            }

            $scope.actualizarUnidad = function () {
                var unidadId = document.getElementById('txtUnidadIdEdit').value;
                var siglas = document.getElementById('txtSiglasEdit').value;
                var descripcion = document.getElementById('txtDescripcionEdit').value;

                if (siglas == '' || siglas == undefined) {
                    swal('', 'Es obligatorio dilegenciar las siglas', 'warning');
                    document.getElementById('txtSiglas').focus();
                    return;
                }

                if (descripcion == '' || descripcion == undefined) {
                    swal('', 'La Descripcion es obligatoria', 'warning');
                    document.getElementById('txtDescripcion').focus();
                    return;
                }

                ConsultaAjax("ActualizarUnidades", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.unidadMedida = [];
                        $scope.$apply();
                        $('#editModal').modal('hide');
                        $scope.consultarUnidadMedida();
                        swal('', 'Registro Actualizado', 'success');
                    }
                }, { unidadId: unidadId, siglas: siglas, descripcion: descripcion})
            }

            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        })


    </script>


</asp:Content>

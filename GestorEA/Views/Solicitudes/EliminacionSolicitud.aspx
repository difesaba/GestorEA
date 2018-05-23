<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminacionSolicitud.aspx.cs" Inherits="GestorEA.Views.Solicitudes.EliminacionSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <div ng-app="deteleSoliApp">
        <div ng-controller="deteleController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Eliminación de Solicitudes</h6>
            </div>
            </br>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Filtros</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Solicitud N°</label>
                                    <input type="text" class="form-control form-control-sm" id="txtNumero" name="txtNumero" placeholder="Ingrese el Numero">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Fecha Inicial</label>
                                    <input type="text" class="form-control form-control-sm" id="txtFechaInicio" name="txtFechaInicio" >
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Fecha Final</label>
                                    <input type="text" class="form-control form-control-sm " id="txtFechaFin" name="txtFechaFin" >
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Tipo</label>
                                    <select class="custom-select custom-select-sm" name="txtTipo" id="txtTipo">
                                        <option selected value="-1">Seleccione</option>
                                        <option ng-repeat="option in listatipo" value="{{option.TipoId}}">{{option.TipoDescripcion}}</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class=" col-sm-1">
                                <div class="form-group ">
                                    <button type="button" class="btn btn-primary  button-search" ng-click="consultaSolicitud()">Consultar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <br />
                <table class="table table-bordered" id="tableProductos">
                    <thead class="thead-table">
                        <tr>
                            <th scope="col" class="tamano-codigo-table">Solicitud</th>
                            <th scope="col" class="size-date-aprob">Fecha Incio</th>
                            <th scope="col" class="size-date-aprob">Fecha Fin</th>
                            <th scope="col">Observación</th>
                            <th scope="col" class="size-status-aprob">Tipo</th>
                            <th scope="col" class="size-status-aprob">Estado</th>
                            <th scope="col" class="icon-table-size">Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in consultaDelete">
                            <td>{{p.solicitud.SolicitudNumero}}</td>
                            <td>{{p.solicitud.SolicitudFechaInicio}}</td>
                            <td>{{p.solicitud.SolicitudFechaFin}}</td>
                            <td>{{p.solicitud.SolicitudObservacion}}</td>
                            <td>{{p.tipo.TipoDescripcion}}</td>
                            <td>{{p.estado.EstadoDescripcion}}</td>
                            <td class="icon-table-aling"><i class="fas fa-trash-alt fa-lg" ng-click="eliminarSolicitud(p)"></i></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        /*Fecha Actual*/
        var f = new Date();
        var fecha = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());


        /*Fecha Actual*/
        /*Calendarios*/
        $('#txtFechaInicio').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'dd/mm/yyyy'
        });
        $('#txtFechaFin').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'dd/mm/yyyy'
        });
        document.getElementById('txtFechaInicio').value = (f.getDate() + "/" + (f.getMonth()) + "/" + f.getFullYear());
        document.getElementById('txtFechaFin').value = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
    </script>
    <script>
        var app = angular.module("deteleSoliApp", [])
        app.controller("deteleController", function ($scope) {

            $scope.listaTipo = function () {
                ConsultaAjax("listarTipoSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.listatipo = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaTipo();

            $scope.consultaSolicitud = function () {
                var solicitud = document.getElementById('txtNumero').value;
                var ini = document.getElementById('txtFechaInicio').value;
                var fin = document.getElementById('txtFechaFin').value;
                var tipo = document.getElementById('txtTipo').value;

                ConsultaAjax("ConsultaEliminacionSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.consultaDelete = source;
                        $scope.$apply();
                    }
                }, { numero: solicitud, inicio: ini, fin: fin, tipo: tipo })
            }

            $scope.eliminarSolicitud = function (p) {
                var solicitud = p.solicitud.SolicitudId;
                ConsultaAjax("eliminarSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.delete = source;
                        $scope.consultaSolicitud();
                        swal('', $scope.delete.Mensaje, $scope.delete.Tipo);
                        $scope.$apply();
                    }
                }, { solicitud: solicitud })
            }
        })
    </script>
</asp:Content>

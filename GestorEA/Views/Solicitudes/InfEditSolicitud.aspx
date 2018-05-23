<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InfEditSolicitud.aspx.cs" Inherits="GestorEA.Views.Solicitudes.InfEditSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <div ng-app="informeApp">
        <div ng-controller="informeController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Edición de Solicitudes</h6>
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
                                    <input type="text" class="form-control form-control-sm" id="txtFechaInicio" name="txtFechaInicio">
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Fecha Final</label>
                                    <input type="text" class="form-control form-control-sm " id="txtFechaFin" name="txtFechaFin">
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
                                    <button type="button" class="btn btn-primary  button-search" ng-click="consulta()">Consultar</button>
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
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in consultaSolicitudes">
                            <td><a href="EdicionSolicitud.aspx?solicitudId={{p.solicitud.SolicitudId}}">{{p.solicitud.SolicitudNumero}}</a></td>
                            <td>{{p.solicitud.SolicitudFechaInicio}}</td>
                            <td>{{p.solicitud.SolicitudFechaFin}}</td>
                            <td>{{p.solicitud.SolicitudObservacion}}</td>
                            <td>{{p.tipo.TipoDescripcion}}</td>
                            <td>{{p.estado.EstadoDescripcion}}</td>
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

        var app = angular.module("informeApp", [])
        app.controller("informeController", function ($scope) {

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

            $scope.consulta = function  () {
                var numero = document.getElementById('txtNumero').value;
                var inicio = document.getElementById('txtFechaInicio').value;
                var fin = document.getElementById('txtFechaFin').value;
                var tipo = document.getElementById('txtTipo').value;

                ConsultaAjax("ConsultaEdicionSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.consultaSolicitudes = source;
                        $scope.$apply();
                    }
                }, {numero : numero, inicio : inicio, fin : fin, tipo : tipo})
            }
        })
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AprobacionSolicitud.aspx.cs" Inherits="GestorEA.Views.Solicitudes.AprobacionSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <div ng-app="aprobarSolicitudApp">
        <div ng-controller="aprobarController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Aprobación de Solicitud</h6>
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
                                    <input type="text" class="form-control form-control-sm" id="txtNumero" name="txtNumero" placeholder="Ingrese el Numero" onKeyDown="blockLetras(this);">
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
                            
                            <div class=" col-sm-1">
                                <div class="form-group ">
                                    <button type="button" class="btn btn-primary  button-search" ng-click="consultarSolicitudes()">Consultar</button>
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
                            <th scope="col" class="icon-table-size">Aprobar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in consultaAprobacion">
                            <td>{{p.solicitud.SolicitudNumero}}</td>
                            <td>{{p.solicitud.SolicitudFechaInicio}}</td>
                            <td>{{p.solicitud.SolicitudFechaFin}}</td>
                            <td>{{p.solicitud.SolicitudObservacion}}</td>
                            <td>{{p.tipo.TipoDescripcion}}</td>
                            <td>{{p.estado.EstadoDescripcion}}</td>
                            <td class="icon-table-aling"><i id="iconAproba" class="far fa-square fa-lg icon-table" ng-click="aprobarSolicitud(p)"></i></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
            

        function bloquearLetras(objeto) {
            if ((event.keyCode < 41 && event.keyCode > 36) || event.keyCode == 16 || event.keyCode == 36 || event.keyCode == 35) {
                event.returnValue = true;
                return true;
            }
            if ((event.keyCode < 58 && event.keyCode > 47) || (event.keyCode < 106 && event.keyCode > 95) || event.keyCode == 13 || event.keyCode == 9 || event.keyCode == 8 || event.keyCode == 110 || event.keyCode == 190 || event.keyCode == 46) {
                event.returnValue = true;   
                return true;
            }
            else {
                event.returnValue = false;
                return false;
            }

        }


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
        document.getElementById('txtFechaInicio').value = (f.getDate() + "/" + (f.getMonth() ) + "/" + f.getFullYear());
        document.getElementById('txtFechaFin').value = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
    </script>
    <script>
        var app = angular.module("aprobarSolicitudApp", [])
        app.controller("aprobarController", function ($scope) {

            $scope.listaEstado = function () {
                ConsultaAjax("listaEstadoSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.listaSolicitud = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaEstado();

            $scope.consultarSolicitudes = function () {
                var numero = document.getElementById('txtNumero').value;
                var inicio = document.getElementById('txtFechaInicio').value;
                var fin = document.getElementById('txtFechaFin').value;
                

                ConsultaAjax("ConsultaAprobacionSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.consultaAprobacion = source;
                        $scope.$apply();
                    }
                }, { numero: numero, inicio: inicio, fin: fin })

            }

            $scope.aprobarSolicitud = function (p) {
                document.getElementById('iconAproba').className = "far fa-check-square fa-lg icon-table";
                var solicitud = p.solicitud.SolicitudId;
                var tipo = p.tipo.TipoId;

                ConsultaAjax("aprobacionSolicitud", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.enviado = source;
                        $scope.consultarSolicitudes();
                        swal("", "Aprobacion y notificacion Realizada");
                        $scope.$apply();
                    }
                }, { solicitud: solicitud, tipo : tipo })
            }

        })




    </script>
</asp:Content>

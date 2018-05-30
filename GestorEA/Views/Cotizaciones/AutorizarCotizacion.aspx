<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AutorizarCotizacion.aspx.cs" Inherits="GestorEA.Views.Cotizaciones.AutorizarCotizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../Inicio/inicio.aspx">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Cotizaciones</li>
        <li class="breadcrumb-item active" aria-current="page">Autorizar Cotización</li>
      </ol>
    </nav>
    <div ng-app="autorizaApp">
        <div ng-controller="autorizaController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Autorizar Cotización</h6>
            </div>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Filtros</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Cotización N°</label>
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

                            <div class=" col-sm-1">
                                <div class="form-group ">
                                    <button type="button" class="btn btn-primary  button-search" ng-click="cosultaCotizaciones()">Consultar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <br />
                <table class="table table-bordered" id="tableProductos">
                    <thead class="thead-table">
                        <tr>
                            <th scope="col" class="tamano-codigo-table">Cotizacion Numero</th>
                            <th scope="col" class="tamano-codigo-table">Solicitud Numero</th>
                            <th scope="col" class="size-date-aprob">Fecha</th>
                            <th scope="col" class="size-date-aprob">Fecha Entrega</th>
                            <th scope="col">Especificaciones</th>
                            <th scope="col" class="size-status-aprob">Total</th>
                            <th scope="col" class="size-status-aprob">Estado</th>
                            <th scope="col" class="icon-table-size">Aprobar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in consulta">
                            <td><a href="ComparativoGrafico.aspx?solicitudId={{p.solicitud.SolicitudId}}">{{p.cotizacion.CotizacionNumero}}</a></td>
                            <td>{{p.solicitud.SolicitudNumero}}</td>
                            <td>{{p.cotizacion.CotizacionFecha}}</td>
                            <td>{{p.cotizacion.CotizacionEntrega}}</td>
                            <td>{{p.cotizacion.CotizacionEspecificacion}}</td>
                            <td>{{p.CotizacionTotal}}</td>
                            <td>{{p.estado.EstadoDescripcion}}</td>
                            <td class="icon-table-aling"><i id="iconAproba" class="far fa-square fa-lg icon-table" ng-click="aprobar(p)"></i></td>
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
        var app = angular.module("autorizaApp", [])
        app.controller("autorizaController", function ($scope) {

            $scope.cosultaCotizaciones = function () {
 
                var cotizacion = document.getElementById('txtNumero').value;
                var fechaIni = document.getElementById('txtFechaInicio').value;
                var fechaFin = document.getElementById('txtFechaFin').value;

                ConsultaAjax("mostrarAutorizacion", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.consulta = source;
                        $scope.$apply();
                    }
                }, { cotizacion: cotizacion, fechaIni: fechaIni, fechaFin: fechaFin })

            }

            $scope.aprobar = function (p) {
                document.getElementById('iconAproba').className = "far fa-check-square fa-lg icon-table";
                var cotizacion = p.cotizacion.CotizacionId;

                ConsultaAjax("aprobacion", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.enviado = source;
                        $scope.cosultaCotizaciones();
                        swal("", "Aprobacion y notificacion Realizada");
                        $scope.$apply();
                    }
                }, { cotizacion: cotizacion })
            }

          
        })
    </script>
</asp:Content>

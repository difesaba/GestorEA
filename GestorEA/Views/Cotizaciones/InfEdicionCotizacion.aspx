<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InfEdicionCotizacion.aspx.cs" Inherits="GestorEA.Views.Cotizaciones.InfEdicionCotizacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <div ng-app="editApp">
        <div ng-controller="editController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Edición de Cotización</h6>
            </div>
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
                            <div class="col-sm-2">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Cotización N°</label>
                                    <input type="text" class="form-control form-control-sm" id="txtCotizacion" name="txtCotizacion" placeholder="Ingrese el Numero">
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
                                    <button type="button" class="btn btn-primary  button-search" ng-click="consultaCotizacion()">Consultar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <br />
                <table class="table table-bordered">
                    <thead class="thead-table">
                        <tr>
                            <th scope="col" class="tamano-codigo-table">Solicitud No</th>
                            <th scope="col" class="tamano-codigo-table">Cotización No</th>
                            <th scope="col" class="size-date-aprob">Fecha</th>
                            <th scope="col" class="size-date-aprob">Cierre Solicitud</th>
                            <th scope="col" class="size-date-aprob">Entrega</th>
                            <th scope="col">Especificación</th>
                            <th scope="col" class="size-status-aprob">Estado</th>
                            <th scope="col" class="icon-table-size">Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in consulta">
                            <td>{{p.solicitud.SolicitudNumero}}</td>
                            <td>{{p.cotizacion.CotizacionNumero}}</td>
                            <td>{{p.cotizacion.CotizacionFecha}}</td>
                            <td>{{p.solicitud.SolicitudFechaFin}}</td>
                            <td>{{p.cotizacion.CotizacionEntrega}}</td>
                            <td>{{p.cotizacion.CotizacionEspecificacion}}</td>
                            <td>{{p.estado.EstadoDescripcion}}</td>
                            <td class="icon-table-aling"><a href="EdicionCotizacion.aspx?CotizacionId={{p.cotizacion.CotizacionId}}&CotizacionNumero={{p.cotizacion.CotizacionNumero}}&SolicitudNumero={{p.solicitud.SolicitudNumero}}"><i id="iconAproba" class="fas fa-edit fa-lg icon-table" ng-click="aprobarSolicitud(p)"></i></a></td>
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
        var app = angular.module("editApp", [])
        app.controller("editController", function ($scope) {

            $scope.consultaCotizacion = function () {
                var numero = document.getElementById('txtNumero').value;
                var cotizacion = document.getElementById('txtCotizacion').value;
                var ini = document.getElementById('txtFechaInicio').value;
                var fin = document.getElementById('txtFechaFin').value;
               
                ConsultaAjax("informeEdicion", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.consulta = source;
                        $scope.$apply();
                    }
                }, { solicitud: numero, cotizacion: cotizacion, ini: ini, fin: fin })
            }
        })
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EdicionSolicitud.aspx.cs" Inherits="GestorEA.Views.Solicitudes.EdicionSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <div ng-app="edicionApp">
        <div ng-controller="edicionController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Creación Solicitud</h6>
            </div>
            <div class="container-fluid">
                <div class="container-fluid" style="background-color: #f5f6fa; padding: 5px; color: #007bff">
                    <i class="fas fa-arrow-circle-left fa-2x"></i>
                    <i class="fas fa-plus-circle fa-2x"></i>
                    <i class="fas fa-print fa-2x"></i>
                </div>
            </div>
            </br>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Encabezado</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Solicitud No :</label>
                            </div>
                            <div class="col-sm-3">
                                <label id="consecutivo">{{encabezado.solicitud.SolicitudNumero}}</label>
                            </div>
                            <div class="col-sm-3 tittle-head-color"> 
                                <label for="formGroupExampleInput">Fecha :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput" id="FechaActual">{{encabezado.solicitud.SolicitudFecha}}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Empresa :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput">{{encabezado.empresa.EmpresaNombre}}</label>
                            </div>
                       
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">NIT :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput">{{encabezado.empresa.EmpresaNit}}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Fecha Inicio :</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control form-control-sm input-Fecha" id="txtFechaInicio"  value="{{encabezado.solicitud.SolicitudFechaInicio}}"     />
                            </div>
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Fecha Fin :</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control form-control-sm input-Fecha" id="txtFechaFin" value="{{encabezado.solicitud.SolicitudFechaInicio}}" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Observaciones :</label>
                            </div>
                            <div class="col-sm-1">
                                <i class="far fa-sticky-note fa-2x" style="color: #007bff;" data-toggle="modal" data-target="#modalObservaciones"></i>
                            </div>
                        </div>
                    </div>
                </fieldset>
                </br>
           
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Detalle</legend>

                    <table class="table table-bordered">
                        <thead class="thead-table">
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col" class="size-um-solicitud">UM</th>
                                <th scope="col" class="size-cant-solicitud">Cantidad</th>
                                <th scope="col" class="icon-table-size">Guardar</th>
                                 <th scope="col" class="icon-table-size">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="p in detalleSolic">
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label for id="formGroupExampleInput" >{{p.productos.ProductoDescripcion}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label for id="formGroupExampleInput" >{{p.unidad.UnidadSiglas}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12 alling-numbers">
                                            <input type="text" class="form-control form-control-sm alling-numbers"  value="{{p.solicitudDetalle.SolicitudDetCant}}" id="{{p.solicitudDetalle.SolicitudDetId}}">
                                        </div>
                                    </div>
                                </td>
                                <td class="icon-table-aling icon-solicitud-det">
                                    <i class="fas fa-save fa-lg"  ng-click="guardar(p)"></i>                          
                                </td>
                                <td class="icon-table-aling icon-solicitud-det">
                                    <i class="fas fa-times fa-lg"></i>                          
                                </td>
                            </tr>
                            <tr>
                                <td class="input-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="group autocomplete" id="DivAcProducto" webmethod="CompleteProd">
                                        <div class="input-icon-right">
                                            <input type="text" class="form-control form-control-sm" id="txtProducto" name="txtProducto" placeholder="Buscar Producto" ng-blur="completarDatosProducto()">
                                            <i class="fas fa-search" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label for id="txtUm" >{{datosProducto}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="input-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12" >
                                            <input type="text" class="form-control form-control-sm alling-numbers"  id="txtCant" value="0.00">
                                        </div>
                                    </div>
                                </td>
                                <td class="icon-table-aling icon-solicitud-det">
                                    <i class="fas fa-save fa-lg" ng-click="nuevoDetalle()"></i>                              
                                </td>
                                 
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
            
            </div>
            <!-- Modals -->
            <!-- Modal Observaciones -->
            <div class="modal fade" id="modalObservaciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Observaciones</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <textarea class="form-control" id="txtObservaciones" rows="3">{{encabezado.solicitud.SolicitudObservacion}}</textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                </div>
            </div>
        </div>
    </div>

            <!-- Modal Observaciones -->
            <!-- Modal Terceros -->
            <div class="modal fade" id="modalTerceros" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Terceros</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="group autocomplete" id="DivAcProducto" webmethod="CompleteTercero">
                                <div class="input-icon-right">
                                    <input type="text" class="form-control form-control-sm" id="txtTercero" placeholder="Buscar Terceros" ng-model="filterTercero">
                                    <i class="fas fa-search" aria-hidden="true"></i>
                                
                                </div>
                             </div>
                        </div> 
                    </div>
                    </br>
                        <table class="table">
                            <thead class="thead-table table-bordered">
                                <tr>
                                    <th scope="col" class="tamano-codigo-table">Codigo</th>
                                    <th scope="col">Tercero</th>
                                    <th scope="col" class="icon-table-size">Agregar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="p in listaTercero | filter: filterTercero">
                                    <td style="padding:3px;">{{p.usuario.UsuarioId}}</td>
                                    <td style="padding:3px;">{{p.usuario.UsuarioNombre}}</td>
                                    <td style="padding-top:5px; padding-right: 3px; padding-left:3px; padding-bottom:3px;">
                                        <input type="checkbox" class="form-control" aria-label="Text input with checkbox" ng-click="agregarTerceros(p)" ng-checked="p.Check">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                </div>
            </div>
        </div>
            </div>
    
            <!-- Modal Terceros -->
            <!-- Modals -->
            <input type="hidden" id="idSolicitud"  />
        </div>
    </div>

    <script>
        function ObtenerQueryString() {
            var get = {};
            var loc = document.location.href;
            var getString = loc.split('?')[1];
            if (getString != undefined) {

                var GET = getString.split('&');


                for (var i = 0, l = GET.length; i < l; i++) {
                    var tmp = GET[i].split('=');
                    get[tmp[0]] = unescape(decodeURI(tmp[1]));
                }
            }
            return get;
        }
        document.getElementById('idSolicitud').value = ObtenerQueryString().solicitudId;

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

        var app = angular.module("edicionApp", [])

        app.controller("edicionController", function ($scope) {

            $scope.encabezadoSolicitud = function () {
                var solicitudId = document.getElementById('idSolicitud').value;
                ConsultaAjax("EncabezadoSolicitud", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.encabezado = source;
                        $scope.$apply();
                    }
                }, { idSolicitud: solicitudId })
            }
            $scope.encabezadoSolicitud();

            $scope.detalleSolicitud = function () {
                var id = document.getElementById('idSolicitud').value;
                ConsultaAjax("ConsultaDetalleSolicitud", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.detalleSolic = source;
                        document.getElementById('txtProducto').value = '';
                        document.getElementById('txtUm').value = '';
                        document.getElementById('txtCant').value = '0.00';
                        $scope.$apply();
                    }
                }, { idSolicitud: id })
            }
            $scope.detalleSolicitud();

            $scope.guardar = function (p) {
                var solicitud = document.getElementById('idSolicitud').value;
                var detalle = p.solicitudDetalle.SolicitudDetId;
                var producto = p.solicitudDetalle.SolicitudDetProd;
                var cantidad = document.getElementById(p.solicitudDetalle.SolicitudDetId).value;
                var id = document.getElementById('idSolicitud').value;

                ConsultaAjax("guardaEdicionSolicitud", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {

                        $scope.respuesta = source;
                        swal('', $scope.respuesta.Mensaje, $scope.respuesta.Tipo);
                        $scope.$apply();
                    }
                }, { idSolicitud: solicitud, detalle: detalle, producto: producto, cantidad: cantidad })
            }

            $scope.nuevoDetalle = function () {
                var solicitud = document.getElementById('idSolicitud').value;
                var detalle = ''
                var producto = JSON.parse(document.getElementById('txtProducto').getAttribute('result')).id;
                var cantidad = document.getElementById('txtCant').value;
                
                ConsultaAjax("guardaEdicionSolicitud", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {

                        $scope.respuesta = source;
                        swal('', $scope.respuesta.Mensaje, $scope.respuesta.Tipo);
                        $scope.detalleSolicitud();
                        $scope.$apply();
                    }
                }, { idSolicitud: solicitud, detalle: detalle, producto: producto, cantidad: cantidad })
            }

            $scope.updateEncabezado = function () {
                var fechaini = document.getElementById('txtFechaInicio').value;
                var fechafin = document.getElementById('txtFechaFin').value;
                var obs = document.getElementById('txtObservaciones').value;
            }

        })
    </script>
</asp:Content>

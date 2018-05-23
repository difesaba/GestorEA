<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EdicionCotizacion.aspx.cs" Inherits="GestorEA.Views.Cotizaciones.EdicionCotizacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <div ng-app="cotizacionApp">
        <div ng-controller="cotizacionController">
            <div class="container-fluid">
                <h7 style="color: #007bff">Edición de Cotización</h7>
            </div>
            <br />
            <div class="container-fluid">
                <div class="container-fluid" style="background-color: #f5f6fa; padding: 5px; color: #007bff">
                    <i class="fas fa-arrow-circle-left fa-2x"></i>
                    <i class="fas fa-print fa-2x"></i>
                </div>
            </div>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Encabezado</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Cotización No :</label>
                            </div>
                            <div class="col-sm-3">
                                <label id="consecutivo"></label>
                            </div>
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Fecha :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput" id="FechaActual"></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Solicitud No :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput" id="txtSolicitud"></label>
                            </div>

                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Empresa :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput">{{encabezado.empresa.EmpresaNombre}}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">NIT: </label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput">{{encabezado.empresa.EmpresaNit}}</label>
                            </div>
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Fecha Entrega :</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control form-control-sm input-Fecha" id="txtFechaEntrega" value="" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Correo :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput" id="txtCorreo">{{encabezado.empresa.EmpresaCorreo}}</label>
                            </div>
                             <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Dirección :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput" id="txtDireccion">{{encabezado.empresa.EmpresaPais}}-{{encabezado.empresa.EmpresCiudad}}-{{encabezado.empresa.EmpresaDireccion}}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Contacto :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput" id="txtTelefono">{{encabezado.empresa.EmpresaTelefono}}</label>
                            </div>
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Especificaciones :</label>
                            </div>
                            <div class="col-sm-1">
                                <i class="far fa-sticky-note fa-2x" style="color: #007bff;" data-toggle="modal" data-target="#modalObservaciones"></i>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <br />
                <table class="table table-bordered">
                        <thead class="thead-table">
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col" class="size-um-solicitud">UM</th>
                                <th scope="col" class="size-cant-solicitud">Cantidad</th>
                                <th scope="col" class="size-cant-solicitud">UnitarioNeto</th>
                                <th scope="col" class="size-cant-solicitud">IVA</th>
                                <th scope="col" class="size-cant-solicitud">Unitario</th>
                                <th scope="col" class="size-cant-solicitud">Total</th>
                                 
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="p in solicitudDet">
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label for id="formGroupExampleInput" >{{p.producto.ProductoDescripcion}}</label>
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
                                            <label id="txtCant{{p.solicitudDetalle.SolicitudDetId}}" class="alling-numbers">{{p.solicitudDetalle.SolicitudDetCant}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12 alling-numbers">
                                            <input type="text" class="form-control form-control-sm alling-numbers"  id="txtNeto{{p.solicitudDetalle.SolicitudDetId}}" value="{{p.cotizacionDetalle.CotizacionDetUnitNeto}}" ng-blur="calular(p)">
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12 alling-numbers">
                                            <label for="" id="" class="alling-numbers">19 %</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12 alling-numbers">
                                            <label  id="txtUnitario{{p.solicitudDetalle.SolicitudDetId}}" class="alling-numbers">{{p.cotizacionDetalle.CotizacionDetUnitario}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="label-td-solicitud">
                                    <div class="row">
                                        <div class="col-sm-12 alling-numbers">
                                            <label  id="txtTotal{{p.solicitudDetalle.SolicitudDetId}}" class="alling-numbers">{{p.cotizacionDetalle.CotizacionDetTotal}}</label>
                                        </div>
                                    </div>
                                </td>
                               
                            </tr>
                        </tbody>
                    </table>
                    </br>
                    <label>Subtotal: $</label>
                    <label id="txtSub">0.00</label>
                    <label>IVA: $</label>
                    <label id="txtIva">0.00</label>
                    <label>Total: $</label>
                    <label id="txtTotal">0.0</label>
            </div>
            <!-- Modal Observaciones -->
                <div class="modal fade" id="modalObservaciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Especificaciones</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <textarea class="form-control" id="txtEspcifi" rows="3"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Observaciones -->
            <!-- Hiddens -->
                <input type="hidden" id="txtCotizacionId" />
            <!-- Hiddens -->
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
        document.getElementById('consecutivo').textContent = ObtenerQueryString().CotizacionNumero;
        document.getElementById('txtSolicitud').textContent = ObtenerQueryString().SolicitudNumero;
        document.getElementById('txtCotizacionId').textContent = ObtenerQueryString().CotizacionId;

        var f = new Date();
        var fecha = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
        /*Fecha Actual*/
        /*Calendarios*/
        $('#txtFechaEntrega').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'dd/mm/yyyy'
        });
        document.getElementById('txtFechaEntrega').value = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
        document.getElementById('FechaActual').textContent = fecha;

    </script>
    <script>
        var app = angular.module("cotizacionApp", [])
        app.controller("cotizacionController", function ($scope) {

            $scope.encabezadoCotizacion = function () {
                var solicitud = document.getElementById('txtSolicitud').textContent;
                ConsultaAjax("encabezadoCotizacion", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.encabezado = source;
                        $scope.$apply();
                    }
                }, { solicitud: solicitud })
            }
            $scope.encabezadoCotizacion();

            $scope.solicitudDetalle = function () {
                var solicitud = document.getElementById('txtSolicitud').textContent;
                ConsultaAjax("ConsultaSolicitudDet", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.solicitudDet = source;
                        // document.getElementById('txtCotizacionId').value = $scope.solicitudDet.cotizacionDetalle.CotizacionDetId;
                        $scope.$apply();
                        document.getElementById('txtSub').textContent = $scope.solicitudDet[0].SubTotal;
                        document.getElementById('txtIva').textContent = $scope.solicitudDet[0].TotalIva;
                        document.getElementById('txtTotal').textContent = $scope.solicitudDet[0].Total;
                    }
                }, { solicitud: solicitud })
            }
            $scope.solicitudDetalle();

            $scope.crearCotizacion = function (p) {
                var cotizacionId = document.getElementById('txtCotizacionId').textContent;
                var solicitud = document.getElementById('txtSolicitud').textContent;
                var solicitudDetId = p.solicitudDetalle.SolicitudDetId;
                var entrega = document.getElementById('txtFechaEntrega').value;
                var especifi = document.getElementById('txtEspcifi').value;
                var cantidad = p.solicitudDetalle.SolicitudDetCant;
                var uniNeto = document.getElementById('txtNeto' + p.solicitudDetalle.SolicitudDetId).value;
                var unitario = document.getElementById('txtUnitario' + p.solicitudDetalle.SolicitudDetId).textContent;
                var cotizacionDet = p.cotizacionDetalle.CotizacionDetId;

                ConsultaAjax("crearCotizacion", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.crear = source;
                        $scope.solicitudDetalle();
                        if ($scope.crear.Codigo > 0) {
                            document.getElementById('txtCotizacionId').value = $scope.crear.Codigo

                        }
                        swal('', $scope.crear.Mensaje, $scope.crear.Tipo)
                        $scope.$apply();
                    }
                }, { cotizacionId: cotizacionId, solicitud: solicitud, solicitudDet: solicitudDetId, entrega: entrega, especifi: especifi, cantidad: cantidad, uniNeto: uniNeto, uni: unitario, cotizacionDet: cotizacionDet })
            }

            $scope.calular = function (p) {

                if (document.getElementById('txtNeto' + p.solicitudDetalle.SolicitudDetId).value < 0 ) {
                    swal('', 'No se pueden ingresar valores negativos', 'error');
                    return;
                }
              
                var unitneto = document.getElementById('txtNeto' + p.solicitudDetalle.SolicitudDetId).value;
                var cant = document.getElementById('txtCant' + p.solicitudDetalle.SolicitudDetId).textContent;
                var sub = parseFloat(document.getElementById('txtSub').textContent);
                var iva = parseFloat(document.getElementById('txtIva').textContent);
                var total = parseFloat(document.getElementById('txtTotal').textContent);

                document.getElementById('txtUnitario' + p.solicitudDetalle.SolicitudDetId).textContent = (unitneto * 1.19);

                document.getElementById('txtTotal' + p.solicitudDetalle.SolicitudDetId).textContent = (cant) * (unitneto * 1.19);

                document.getElementById('txtSub').textContent = (sub) + (cant) * (unitneto);
                document.getElementById('txtIva').textContent = (iva) + (cant) * (unitneto * 0.19);
                document.getElementById('txtTotal').textContent = (total) + (cant) * (unitneto * 1.19);

                $scope.crearCotizacion(p);
            }

        })
    </script>
</asp:Content>

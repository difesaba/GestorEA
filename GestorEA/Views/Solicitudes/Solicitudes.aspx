<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Solicitudes.aspx.cs" Inherits="GestorEA.Views.Solicitudes.Solicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    </br>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../Inicio/inicio.aspx">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Solicitudes</li>
        <li class="breadcrumb-item active" aria-current="page">Crear Solicitud</li>
      </ol>
    </nav>
    <div ng-app="solicitudApp">
        <div ng-controller="solicitudController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Creación Solicitud</h6>
            </div>
            <div class="container-fluid">
                <div class="container-fluid" style="background-color: #f5f6fa; padding: 5px; color: #007bff">
                    <i class="fas fa-plus-circle fa-2x" onclick="redirect()" title="Nuevo" data-toggle="tooltip"   data-placement="right"></i>
                    <i class="fas fa-print fa-2x" title="Imprimir" data-toggle="tooltip"   data-placement="right"></i>
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
                                <label id="consecutivo">{{newConsecutivo.NewSolicitud}}</label>
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
                                <label for="formGroupExampleInput">Empresa :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput">{{empresa.EmpresaNombre}}</label>
                            </div>
                       
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">NIT :</label>
                            </div>
                            <div class="col-sm-3">
                                <label for="formGroupExampleInput">{{empresa.EmpresaNit}}</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Fecha Inicio :</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control form-control-sm input-Fecha" id="txtFechaInicio" value=""     />
                            </div>
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Fecha Fin :</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control form-control-sm input-Fecha" id="txtFechaFin" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Solicitud :</label>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-check form-check-inline" >
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="txtPublica" value="" style="margin-top:3px;" ng-click="seleccionPublica()">
                                    <label class="form-check-label" for="inlineRadio1" style="margin-top:3px;">Publica</label>
                                </div>
                                <div class="form-check form-check-inline" >
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="txtPrivada" value="" data-toggle="modal"
                                        data-target="#modalTerceros" style="margin-top:3px;" ng-click="seleccionPrivada()">
                                    <label class="form-check-label" for="inlineRadio2" style="margin-top:3px;">Privada</label>
                                </div>
                            </div>
                            <div class="col-sm-3 tittle-head-color">
                                <label for="formGroupExampleInput">Observaciones :</label>
                            </div>
                            <div class="col-sm-1">
                                <i class="far fa-sticky-note fa-lg" style="color: #007bff;" data-toggle="modal" data-target="#modalObservaciones"></i>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            </br>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Detalle</legend>

                    <table class="table table-bordered">
                        <thead class="thead-table">
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col" class="size-um-solicitud">UM</th>
                                <th scope="col" class="size-cant-solicitud">Cantidad</th>
                                <th scope="col" class="icon-table-size">Acción</th>
                                 
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
                                            <label for id="formGroupExampleInput" class="alling-numbers">{{p.solicitudDetalle.SolicitudDetCant}}</label>
                                        </div>
                                    </div>
                                </td>
                                <td class="icon-table-aling icon-solicitud-det">
                                    <i class="fas fa-times fa-2x" ng-click="eliminaDetalle(p)"></i>                          
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
                                    <i class="fas fa-save fa-lg" ng-click="guardarSolicitud()"></i>                              
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
                    <textarea class="form-control" id="txtObservaciones" rows="3"></textarea>
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
            <!-- Hiddens -->
             <input type="hidden" id="txtSolicitudId" />
            <!-- Hiddens -->
        </div>
    </div>

    <script>
        /*Fecha Actual*/
        var f = new Date();
        var fecha = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
        document.getElementById('FechaActual').textContent = fecha;
        
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
        document.getElementById('txtFechaInicio').value = (f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());;    
        document.getElementById('txtFechaFin').value = (f.getDate() + "/" + (f.getMonth() + 2) + "/" + f.getFullYear());
    </script>
    <script>
        /*Angular*/
        
        
        var app = angular.module("solicitudApp", [])

        app.controller("solicitudController", function ($scope) {


            var tipo = "";

            $scope.concatTerceros="";

            $scope.seleccionPrivada = function () {
                tipo = 1;
                document.getElementById('txtPublica').value = '';
            }

            $scope.seleccionPublica = function () {
                tipo = 0;
                $scope.concatTerceros = "";
                document.getElementById('txtPrivada').value = '';
                $scope.Consultaterceros();
            }

            $scope.empresa = function () {
                ConsultaAjax("consultaEmpresa", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.empresa = source;
                        $scope.$apply();
                    }
                })
            }

            $scope.empresa();

            $scope.newSolicitud = function () {
                ConsultaAjax("nuevoConsecutivo", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.newConsecutivo = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.newSolicitud();

            $scope.Consultaterceros = function () {
                var tercero = document.getElementById('txtTercero').value;
                ConsultaAjax("ConsultaTerceros", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.listaTercero = source;
                        $scope.$apply();
                    }
                }, {id: tercero})
            }

            $scope.detalleSolicitud = function () {
                var id = document.getElementById('txtSolicitudId').value;
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




            $scope.agregarTerceros = function (p) {
                var concate=  p.usuario.UsuarioId;
                $scope.concatTerceros = $scope.concatTerceros+concate+",";
            }
        

            $scope.Consultaterceros();

            $scope.completarDatosProducto = function () {

             
                var codigo = JSON.parse(document.getElementById('txtProducto').getAttribute('result')).id;
            
                ConsultaAjax("CompleteDatosProducto", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.datosProducto = source;
                        $scope.$apply();
                    }
                }, { producto: codigo })
            }

            $scope.guardarSolicitud = function () {
                    var idSolicitud = document.getElementById('txtSolicitudId').value;
                    var numero = document.getElementById('consecutivo').textContent;
                    var terceros = $scope.concatTerceros;
                    var fechaIni = document.getElementById('txtFechaInicio').value;
                    var fechaFin = document.getElementById('txtFechaFin').value;
                    var observaciones = document.getElementById('txtObservaciones').value;
                    var empresa = $scope.empresa.EmpresaId;
                    var producto = JSON.parse(document.getElementById('txtProducto').getAttribute('result')).id;
                    var cantidad = document.getElementById('txtCant').value;
                    var tipooferta = tipo;

                   

                    ConsultaAjax("CrearSolicitud", "POST", function (source) {

                        if (!source) {
                            alert('No se ha completado la transaccion');
                        }
                        else {
                            $scope.solicitud = source;
                            if ($scope.solicitud.Codigo > 0) {
                                document.getElementById('txtSolicitudId').value = $scope.solicitud.Codigo;
                            }
                            $scope.detalleSolicitud();
                            swal('', $scope.solicitud.Mensaje, $scope.solicitud.Tipo);
                            
                            document.getElementById("txtPublica").setAttribute('disabled', 'disabled')
                            document.getElementById("txtPrivada").setAttribute('disabled', 'disabled')
                            $('#txtPublica').attr('disabled', true);
                            $('#txtPrivada').attr('disabled', true);
                             
                            $scope.$apply();
                        }

                    }, { solicitud: idSolicitud, numero: numero, terceros: terceros, fechaini: fechaIni, fechafin: fechaFin, observacion: observaciones, empresa: empresa, producto: producto, cant: cantidad, tipo: tipo})
            }

            $scope.eliminaDetalle = function (p) {
                var solicitud = p.solicitud.SolicitudId;
                var detalle = p.solicitudDetalle.SolicitudDetId;
                ConsultaAjax("EliminaDetalle", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.elimina = source;
                        $scope.$apply();
                        swal('', $scope.elimina.Mensaje, $scope.elimina.Tipo);
                        $scope.detalleSolicitud();
                    }
                }, { solicitud: solicitud, detalle: detalle })
            }
        })

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        function redirect() {
            window.location.assign('Solicitudes.aspx');
        }
       

    </script>
     
</asp:Content>

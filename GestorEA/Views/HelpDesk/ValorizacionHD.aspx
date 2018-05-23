<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ValorizacionHD.aspx.cs" Inherits="GestorEA.Views.HelpDesk.ValorizacionHD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div ng-app="hdApp">
        <div ng-controller="informeController">
            <div class="container-fluid">
                <div>
                    <h5 style="color: #007bff">Valorizacion de Incidentes</h5>
                </div>
                <br />
                <table class="table table-bordered" id="tableProductos">
                    <thead class="thead-table">
                        <tr>
                            <th scope="col" class="tamano-codigo-table">N° Incidente</th>
                            <th scope="col">Reportado por:</th>
                            <th scope="col" class="tamano-codigo-table">Fecha Incidente</th>
                            <th scope="col">Mensaje</th>
                            <th scope="col">Respuesta</th>
                            <th scope="col" class="tamano-codigo-table">Fecha Respuesta</th>
                            <th scope="col">Solucionado por:</th>
                            <th scope="col" class="tamano-codigo-table">Valorizacion</th>
                            <th scope="col" class="icon-table-size">Valorar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in informe">
                            <td>{{p.helpDesk.CasoNum}}</td>
                            <td>{{p.Reportado}}</td>
                            <td>{{p.helpDesk.CasoFecha}}</td>
                            <td>{{p.helpDesk.CasoMesanje}}</td>
                            <td>{{p.helpDesk.CasoRespuesta}}</td>
                            <td>{{p.helpDesk.CasoRespuestaFecha}}</td>
                            <td>{{p.Contestado}}</td>
                            <td>{{p.CasoCalificacion}}</td>
                            <td class="icon-table-aling"><i class="fas fa-mouse-pointer fa-lg icon-table" data-toggle="modal" data-target="#exampleModal" ng-click="leerCasos(p)"></i></td>
                        </tr>
                    </tbody>
                </table>



                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Respuesta Caso</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput" style="color: red; font-weight: bold">N° Incidente   = </label>
                                                <label for="formGroupExampleInput" id="txtCaso">  {{casoHD.helpDesk.CasoNum}}</label>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <fieldset class="container border-content">
                                                    <legend style="color: #4E8FCB !important">Mensaje</legend>
                                                    <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" id="txtMensaje">{{casoHD.helpDesk.CasoMesanje}}</label>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group ">
                                                <label for="formGroupExampleInput">Valorizar</label>
                                                <select class="custom-select custom-select-sm" name="txtValor" id="txtValor">
                                                    <option selected value="-1">Seleccione</option>
                                                    <option value="1">Malo</option>
                                                    <option value="2">Bueno</option>
                                                    <option value="3">Excelente</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Volver</button>
                                <button type="button" class="btn btn-primary" ng-click="guardarValor()">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
    </div>
    <script>
        var app = angular.module("hdApp", [])
        app.controller("informeController", function ($scope) {

            $scope.pintar = function () {
                ConsultaAjax("pintarInforme", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.informe = [];
                        $scope.informe = source;
                        $scope.$apply();
                    }
                })
            }

            $scope.pintar();

            $scope.leerCasos = function (p) {
                  
                var casoid = p.helpDesk.CasoId;
                ConsultaAjax("mostrarCaso", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.casoHD = source;
                        $scope.$apply();

                    }
                }, { id: casoid })
            }


            $scope.guardarValor = function (p) {

                var caso = document.getElementById('txtCaso').textContent;
                var valor = document.getElementById('txtValor').value;
                if (valor == '-1') {
                    swal('', 'Es obligatorio Seleccionar un valor ', 'error');
                    return;
                }
                ConsultaAjax("valorar", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.valor = source;
                        $scope.$apply();
                        swal('', 'Se Realizo la Valorizacion ', 'success');
                        $('#exampleModal').modal('hide');
                        $scope.pintar();
                    }
                }, { caso: caso, valor: valor })
            }

        })
    </script>
</asp:Content>

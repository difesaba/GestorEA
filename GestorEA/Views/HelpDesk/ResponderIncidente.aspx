<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResponderIncidente.aspx.cs" Inherits="GestorEA.Views.HelpDesk.ResponderIncidente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div ng-app="hdApp">
        <div ng-controller="listaCotroller">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5">
                        <fieldset class="border-content">
                            <legend style="color: #4E8FCB !important">Incidentes sin Asignar</legend>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Casos</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="p in listaCasos">
                                        <td>
                                            <div style="background-color: #ecf0f1; padding: 5px;">
                                                <div class="row">
                                                    <div class="col-sm-2">
                                                        <label for="formGroupExampleInput" style="color: red; font-weight: bold">No Incidente</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" id="txtCaso">{{p.helpDesk.CasoNum}}</label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <label for="formGroupExampleInput" style="color: red; font-weight: bold">Fecha Incidente</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" id="txtCaso">{{p.helpDesk.CasoFecha}}</label>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="far fa-hand-pointer fa-2x" style="color: #4E8FCB" ng-click="leerCasos(p)"></i>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 ">
                                                     <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal " style="font-weight: bold" id="txtCaso">De:  >  {{p.Nombre}}</label>
                                                </div>
                                                 <div class="col-sm-6 ">
                                                        <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal " style="font-weight: bold" id="txtCaso">Estado: > {{p.EstadoNombre}}</label>
         
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </div>

                    <div class="col-md-7">
                        <fieldset class="border-content">
                            <legend style="color: #4E8FCB !important">Encabezado</legend>
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput" style="color: red; font-weight: bold">No Incidente: </label>
                                            <label for="formGroupExampleInput"   style="font-weight: normal" id="txtCaso">{{casoHD.helpDesk.CasoNum}}</label>
                                        </div>
                                    </div>


                                    <div class="col-sm-3">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput" style="font-weight: bold;color: #4E8FCB">Fecha Incidente: </label>
                                            <label for="formGroupExampleInput"   style="font-weight: normal" id="txtCaso">{{casoHD.helpDesk.CasoFecha}}</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="formGroupExampleInput" style="font-weight: bold;color: #4E8FCB">Responsable: </label>
                                            <label for="formGroupExampleInput" style="font-weight: normal" id="txtEstado">{{casoHD.Responsable}}</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group ">
                                            <label for="formGroupExampleInput" style="font-weight: bold;color: #4E8FCB">Estado: </label>
                                            <label for="formGroupExampleInput" style="font-weight: normal" id="txtEstado">{{casoHD.EstadoNombre}}</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <fieldset class="container border-content">
                                                <legend style="color: #4E8FCB !important">Mensaje</legend>
                                                <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" id="txtMensaje">{{casoHD.helpDesk.CasoMesanje}}</label>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class=" col-sm-1">
                                        <div class="form-group ">

                                            <button type="button" class="btn btn-primary  button-search" ng-click="enviar();">Responder</button>
                                        </div>
                                    </div>

                                </div>
                            </div>


                        </fieldset>
                        <fieldset class="border-content">
                            <br />
                            <legend style="color: #4E8FCB !important">Respuesta</legend>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Ingresa tu respuesta</label>
                                <textarea class="form-control" id="txtRespuesta" rows="3"></textarea>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var app = angular.module("hdApp", [])
        app.controller("listaCotroller", function ($scope) {

            $scope.casos = [];

            $scope.pintarLista = function () {
                ConsultaAjax("listarCasos", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.casos = [];
                        $scope.listaCasos = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.pintarLista();



            $scope.leerCasos = function (p) {
                //$scope.leer.casoId = p.helpdesk.CasoId;
                $scope.selectedTecnico.UsuarioId = p.helpDesk.CasoUsuAsig;
                var casoid = p.helpDesk.CasoId;
                $scope.lisTecnico();
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

            $scope.selectedTecnico = {};

            $scope.lisTecnico = function () {
                ConsultaAjax("listaTecnicos", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.listaTecnicos = source;
                        $scope.$apply();
                    }
                })
            }

            $scope.enviar = function () {
                var caso = document.getElementById('txtCaso').textContent;
                var respuesta = document.getElementById('txtRespuesta').value;

                ConsultaAjax("responder", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.responder = source;
                        $scope.$apply();
                        swal('', 'Se respondio el incidenete numero: ' + caso, 'success');
                        document.getElementById('txtEstado').textContent = 'Completado';
                        $scope.pintarLista();
                    }
                }, { caso: caso, respuesta: respuesta })
            }

        })



    </script>
</asp:Content>

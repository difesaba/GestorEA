<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HelpDesk.aspx.cs" Inherits="GestorEA.Views.HelpDesk.HelpDesk" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div ng-app="hdApp">
            <div ng-controller="hdCotroller">
                <div class="container-fluid">
                    <fieldset class="container-fluid border-content">
                        <legend style="color: #4E8FCB !important">Incidentes</legend>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-2">
                                    <div class="form-group ">
                                        <label for="formGroupExampleInput" style="color: red;font-weight: bold">No Incidente</label>
                                        <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" id="txtCaso">{{newCaso.NewCaso}}</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group ">
                                        <label for="formGroupExampleInput" style="font-weight: bold; padding-left: 0px;">Fecha</label>
                                        <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" id="txtFecha">{{encabezado.FechaCaso}}</label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group ">
                                        <label for="formGroupExampleInput" style="font-weight: bold">Usuario</label>
                                        <label for="formGroupExampleInput" class="form-control form-control-sm  label-modal" style="font-weight: normal" >{{encabezado.NombreCompleto}}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <br />
                    <fieldset class="container-fluid border-content">
                        <legend style="color: #4E8FCB !important">Mensaje</legend>
                        <div class="form-group">
                            <textarea class="form-control" id="txtMensaje" rows="3"></textarea>
                        </div>
                    </fieldset>
                    <br />
                    <button type="button" class="btn btn-primary" ng-click="crearIncidente()">Enviar:    <i class="fab fa-telegram-plane"></i></button>
                </div>
            </div>
        </div>
        <script>

           

            var app = angular.module("hdApp", [])
            app.controller("hdCotroller",function ($scope) {
                $scope.hd = []; 

                $scope.limpiarCombo = function () {
                    document.getElementById('txtMensaje').value = "";
                }

               $scope.consecutivo = function () {
                    ConsultaAjax("NewCaso", "POST", function (source) {
                       if (!source) {
                           //Error
                           alert('No se ha completado la transaccion');
                       } else {
                           $scope.hd = [];
                           $scope.newCaso = source;
                           $scope.$apply();
                       }
                   })
               }

               $scope.consecutivo();


               $scope.datosEncabezado = function () {
                   ConsultaAjax("EncabezadoHD","POST",function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }else {
                        $scope.encabezado = source;
                        $scope.$apply();
                    }
                })
               }
               $scope.datosEncabezado();

               $scope.crearIncidente = function () {
                   var caso = document.getElementById('txtCaso').textContent;
                   var fecha = document.getElementById('txtFecha').textContent;
                   var mensaje = document.getElementById('txtMensaje').value;
                   if (mensaje == undefined || mensaje == null || mensaje == '') {
                       swal('', 'Por favor diligencie una descripcion', 'error');
                       return;
                   }
                   ConsultaAjax("crearIncidente","POST",function (source) {
                       if (!source) {
                           alert('No se ha completado la transaccion');
                       } else {
                           $scope.generado = source;
                           swal('', 'Se ha creado el incidenete numero: '+$scope.generado, 'success');
                           $scope.$apply();
                           $scope.consecutivo();
                           $scope.limpiarCombo();
                       }
                   }, { caso: caso,  mensaje: mensaje })
               }


            });
        </script>


    </asp:Content>
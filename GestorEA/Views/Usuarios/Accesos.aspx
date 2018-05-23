<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Accesos.aspx.cs" Inherits="GestorEA.Views.Usuarios.Accesos1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div ng-app="accesoApp">
        <div ng-controller="accesoController">
            <div class="container-fluid">
                <h6 style="color: #007bff">Accesos</h6>
            </div>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Filtros</legend>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group ">
                                <label for="formGroupExampleInput">Rol</label>
                                <select class="custom-select custom-select-sm" name="txtRol" id="txtRol">
                                    <option selected value="-1">Seleccione</option>
                                    <option ng-repeat="option in listaroles" value="{{option.roles.RolId}}">{{option.roles.RolNombre}}</option>
                                </select>
                            </div>
                        </div>
                        <div class=" col-sm-1">
                                <div class="form-group ">

                                    <button type="button" class="btn btn-primary  button-search" ng-click="consulta()">Consultar</button>
                                </div>
                            </div>
                    </div>
                </fieldset>
            </div>
            <br />
            <div class="container-fluid">
                <table class="table table-bordered" id="tableProductos">
                    <thead class="thead-table">
                        <tr>
                            <th scope="col">Permiso</th>
                            <th scope="col">Ruta</th>
                            <th scope="col">Rol</th>
                            <th scope="col" class="icon-table-size">Acceso</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in accesos">
                            <td>{{p.permisos.PermisoNombre}}</td>
                            <td>{{p.permisos.URLRuta}}</td>
                            <td>{{p.roles.RolNombre}}</td>
                            <td class="icon-table-aling">
                                <i  id="txtCheck" ng-if="p.rolPermiso.Permiso == 0" class="far fa-square fa-lg icon-table" ng-click="otorgar(p)"></i>
                                <i  id="txtCheck" ng-if="p.rolPermiso.Permiso > 0" class="far fa-check-square fa-lg icon-table" ng-click="otorgar(p)"></i>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        var app = angular.module("accesoApp", [])
        app.controller("accesoController", function ($scope) {

            $scope.listaRol = function () {
                ConsultaAjax("listasRol", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.listaroles = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaRol();

            $scope.consulta = function () {
                var rol = document.getElementById('txtRol').value;
                if (rol == '-1' || rol == '') {
                    swal('', 'Selecione un rol', 'warning');
                }
                $scope.consultaAccesos(rol);
            }

            $scope.consultaAccesos = function (rol) {
                
                ConsultaAjax("consultaAcceso", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.accesos = source;
                        $scope.$apply();
                    }
                }, {rol:rol})
            }

            $scope.otorgar = function (p) {
                var rol = p.roles.RolId;
                var permiso = p.permisos.PermisoId;
                var opcion = p.rolPermiso.Permiso;
            
                if (p.rolPermiso.Permiso > 0) {
                    opcion = 0;
                }
                else {
                    opcion = 1;
                }
           
                ConsultaAjax("otorgarAccesos", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.accesos = source;
                        $scope.$apply();
                        swal('', $scope.accesos, 'success');
                        $scope.consultaAccesos(rol);
                    }
                }, { rol: rol, permiso: permiso, opcion: opcion })
                
            }
        })
    </script>
</asp:Content>

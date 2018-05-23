<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="GestorEA.Views.Productos.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../Inicio/inicio.aspx">Inicio</a></li>
    <li class="breadcrumb-item active" aria-current="page">Productos</li>
  </ol>
</nav>
    <div ng-app="productosApp">
        <div ng-controller="productosController">
            </br>
    <div class="container-fluid">
        <h6 style="color: #007bff">Productos</h6>
    </div>
            <div class="container-fluid">
                <fieldset class="container-fluid border-content">
                    <legend style="color: #4E8FCB !important">Filtros</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Producto</label>
                                    <div class="group autocomplete" id="DivAcProducto" webmethod="CompleteProd">
                                        <div class="input-icon-right">
                                            <input type="text" class="form-control form-control-sm" id="txtProducto" name="txtProducto" placeholder="Buscar Producto" maxlength="100">
                                            <i class="fas fa-search" aria-hidden="true"></i>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Unidad de Medida</label>
                                    <select class="custom-select custom-select-sm" name="txtUnidad" id="txtUnidad">
                                        <option selected value="-1">Seleccione</option>
                                        <option ng-repeat="option in misunidades" value="{{option.UnidadId}}">{{option.UnidadSiglas}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ">
                                    <label for="formGroupExampleInput">Estado</label>
                                    <select class="custom-select custom-select-sm" name="txtEstado" id="txtEstado">
                                        <option selected value="-1">Seleccione</option>
                                        <option ng-repeat="option in estados" value="{{option.EstadosId}}">{{option.EstadosDescripcion}}</option>
                                    </select>
                                </div>
                            </div>

                            <div class=" col-sm-1">
                                <div class="form-group ">

                                    <button type="button" class="btn btn-primary  button-search" ng-click="consultarProductos()">Consultar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            </br>
            <div class="container-fluid">
                <span data-toggle="modal"  data-target="#createModal"><i class="fas fa-plus-circle fa-2x icon-table"  ng-click="consecutivo()" title="Crear" data-toggle="tooltip"   data-placement="right"></i></span>
                <i class="fas fa-file-excel fa-2x icon-table" onclick="ExportToExcel();" title="Exportar" data-toggle="tooltip" data-placement="right"></i>
                <i class="fas fa-print fa-2x icon-table" onclick=" imprimir()" title="Imprimir" data-toggle="tooltip" data-placement="right"></i>
                <input type="file" name="txtarchivo" id="txtarchivo"  value="" />
                <button onclick="ImportarArchivo()" >asa</button>     
            </div>
            <br>
            <div class="container-fluid">
                <table class="table table-bordered" id="tableProductos">
                    <thead class="thead-table">
                        <tr>
                            <th scope="col" class="tamano-codigo-table">Codigó</th>
                            <th scope="col">Descripción</th>
                            <th scope="col" class="tamano-siglas-table">Unidad Medida</th>
                            <th scope="col" class="tamano-fecha-table">Fecha</th>
                            <th scope="col">Estado</th>
                            <th scope="col" class="icon-table-size">Edición</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in productos">
                            <td>{{p.producto.ProductoId}}</td>
                            <td>{{p.producto.ProductoDescripcion}}</td>
                            <td>{{p.unidadMedida.UnidadSiglas}}</td>
                            <td>{{p.producto.ProductoFecha}}</td>
                            <td>{{p.EstadosDescripcion}}</td>
                            <td class="icon-table-aling"><i class="fas fa-edit fa-lg icon-table" ng-click="abriredicion(p)"></i></td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <!-- Modal -->
            <!-- Creacion -->
            <div class="modal fade bd-example-modal-lg" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="createModalLabel">Creación</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">

                                <table class="table table-bordered" id="tableSd">
                                    <thead class="thead-table">
                                        <tr>
                                            <th scope="col" class="tamano-codigo">Codigó</th>
                                            <th scope="col">Descripción</th>
                                            <th scope="col">Unidad Medida</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">

                                                        <input type="text" class="form-control form-control-sm  label-modal" id="txtCodigo" value="{{newConsecutivo.NewCodigo}}" readonly>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="text" class="form-control form-control-sm  " id="txtDescripcion" placeholder="Ingrese la descripcion   " ng-model="nuevo.descripcion">
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <select class="custom-select custom-select-sm" name="txtUm" id="txtUm">
                                                            <option selected value="-1">Seleccione</option>
                                                            <option ng-repeat="option in misunidades" value="{{option.UnidadId}}">{{option.UnidadSiglas}}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" class="btn btn-primary" ng-click="agregarProducto()">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Creacion -->
            <!-- Edicion -->
            <div class="modal fade bd-example-modal-lg" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
                aria-hidden="true" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Edición</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">

                                <table class="table table-bordered">
                                    <thead class="thead-table">
                                        <tr>
                                            <th scope="col">Descripción</th>
                                            <th scope="col">Unidad Medida</th>
                                            <th scope="col">Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="text" ng-model="edicion.ProductoDescripcion" class="form-control form-control-sm" id="txtDescripcionEdit" placeholder="Buscar Producto">
                                                        <input type="hidden" id="txtCodEdit" value="{{edicion.ProductoId}}" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <select class="custom-select custom-select-sm" ng-options="item as item.UnidadSiglas for item in misunidades track by item.UnidadId" ng-model="selectedUM"></select>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="padding-input-modal">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <select class="custom-select custom-select-sm" ng-options="es as es.EstadosDescripcion for es in estados track by es.EstadosId" ng-model="selectedEstado"></select>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" class="btn btn-primary" ng-click="actualizar()">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Edicion -->
            <!-- Modal -->


        </div>
    </div>

    <script>

        function ImportarArchivo() {

            var file = document.getElementById('txtarchivo').files[0]
            if (file != null) {

                try {
                
                    archivo = file
                    nameFile = file.name;

                    var data = new FormData();
                    // data.append("path", path);
                    data.append("archivo", file);
                    data.append("nombre", "Productoa");
                    //data.append("cotizacion", IdCotizacion);
                    data.append("usuario", 1)
                    data.append("procedimiento", "ImportarProductos")

                    $.ajax({
                        type: "POST",
                        url: 'ImportarArchivo_EXCEL.ashx',
                        contentType: false,
                        processData: false,

                        data: data,
                        success: function (data) {
                            var source = data.split('Error');

                            if (source != 'Bien') {
                                Notificaciones({ codigo: 1, mensaje: source[1] });
                            } else {
                                Notificaciones({ codigo: 0, mensaje: "se guardó la cotización correctamente" });
                            }

                            $("input[type$='file']").val('');
                          //  $('.cargando').fadeOut();

                        },
                        error: function (jqXHR, textStatus) {
                            Notificaciones({ codigo: 1, mensaje: "Error al cargar el archivo de cotización" });
                            //$('.cargando').fadeOut();
                        }
                    });


                } catch (e) {
                    Notificaciones({ codigo: 1, mensaje: "No ha seleccionado un archvo a migrar" });
                }
            }

        }

        function bloquearLetras() {
            return true;
        }



        var app = angular.module("productosApp", [])/*llaves cuadradas por que no depende de otro modulo*/
        app.controller("productosController", function ($scope) {
            $scope.productos = [];

            $scope.nuevo = { codigo: 1, um: 1, estado: 1, descripcion: '' };
            $scope.edicion = { ProductoId: 1, UnidadSiglas: 1, estado: 1, ProductoDescripcion: '' };
            $scope.nuevo.codigo = 13333;
            $scope.selectedUM = {};
            $scope.selectedEstado = {};


            //Agregar Producto
            $scope.agregarProducto = function () {
                $scope.consecutivo();

                var descripcion = document.getElementById('txtDescripcion').value;
                var um = document.getElementById('txtUm').value;

                if (descripcion == '' || descripcion == undefined) {
                    swal('', 'La descripción del producto es obligatoria', 'warning');
                    document.getElementById('txtDescripcion').focus();
                    return;
                }
                if (um == '' || um == '-1' ) {
                    swal('', 'La Unidad de Medida es obligatoria', 'warning');
                    document.getElementById('txtDescripcion').focus();
                    return;
                }

                ConsultaAjax("CrearProducto", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {
                        $scope.productos = [];
                        $scope.productos.push(source);
                        $scope.$apply();

                        $('#createModal').modal('hide');
                        swal('', 'Registro guardado', 'success');
                        $scope.limpiarmodeloCreacion();
                    } selectedEstado

                }, { producto: descripcion, medida: um })
            }

            $scope.limpiarmodeloCreacion = function () {
                document.getElementById('txtDescripcion').value = "";
                document.getElementById('txtUm').value = "";
            }

            //Edicion Producto


            $scope.abriredicion = function (p) {
                $scope.edicion.ProductoId = p.producto.ProductoId;
                $scope.edicion.ProductoDescripcion = p.producto.ProductoDescripcion;
                $scope.edicion.UnidadId = p.unidadMedida.UnidadId;
                $scope.edicion.UnidadSiglas = p.unidadMedida.UnidadSiglas;
                $scope.edicion.Estado = p.EstadosDescripcion;
                $scope.selectedUM.UnidadSiglas = p.unidadMedida.UnidadSiglas;
                $scope.selectedUM.UnidadId = p.unidadMedida.UnidadId;
                $scope.selectedEstado.EstadosId = p.EstadosId;
                $scope.selectedEstado.EstadosDescripcion = p.EstadosDescripcion;
                $('#editModal').modal('show');
            }


            //Consultar
            $scope.consultarProductos = function () {



                if (document.getElementById('txtProducto').value == undefined || document.getElementById('txtProducto').value == "") {
                    var codigo = "-1";
                } else {

                    var codigo = JSON.parse(document.getElementById('txtProducto').getAttribute('result')).id;
                }

                var um = document.getElementById('txtUnidad').value;
                var estado = document.getElementById('txtEstado').value;

                ConsultaAjax("ConsultarProductos", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {

                        $scope.productos = source;

                        $scope.$apply();
                    }
                }, { idprod: codigo, unidad: um, estado: estado })
            }


            //Listar Unidades
            $scope.listaUnidades = function () {
                ConsultaAjax("muestraUnidad", "POST", function (source) {
                    $scope.unidades = [];
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.misunidades = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaUnidades();


            //Listar Estados
            $scope.listaEstados = function () {
                ConsultaAjax("muestraEstados", "POST", function (source) {
                    $scope.estados = [];
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.estados = source;
                        $scope.$apply();
                    }
                })
            }
            $scope.listaEstados();

            //mostrar Proximo consecutivo
            $scope.consecutivo = function () {
                ConsultaAjax("traerConsecutivo", "POST", function (source) {
                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.newConsecutivo = source;
                        $scope.$apply();

                    }
                })
            }



            $scope.actualizar = function () {
                //alert($scope.selectedUM.UnidadId);


                var idprod = document.getElementById("txtCodEdit").value;
                var descripcion = document.getElementById("txtDescripcionEdit").value;
                var um = $scope.selectedUM.UnidadId;
                var estado = $scope.selectedEstado.EstadosId;

                if (descripcion == '' || descripcion == undefined) {
                    swal('', 'La descripción del producto es obligatoria', 'warning');
                    document.getElementById('txtDescripcion').focus();
                    return;
                }

                if (um == '' || um == '-1') {
                    swal('', 'La unidad de medida es obligatoria', 'warning');
                    document.getElementById('txtDescripcionEdit').focus();
                    return;
                }

                if (estado == '' || estado == '-1') {
                    swal('', 'Seleccione un estado', 'warning');
                    document.getElementById('txtDescripcionEdit').focus();
                    return;
                }

                ConsultaAjax("ActualizarProductos", "POST", function (source) {
                    if (!source) {
                        //Error
                        alert('No se ha completado la transaccion');
                    } else {

                        $scope.$apply();
                        $('#editModal').modal('hide');
                        swal('', 'Registro Actualizado', 'success');
                        $scope.limpiarmodeloCreacion();
                    }
                }, { idprod: idprod, descripcion: descripcion, um: um, estado: estado })
            }

            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        });

    </script>
    <script>
        function ExportToExcel(mytblId) {
            var htmltable = document.getElementById("tableProductos");
            var html = htmltable.outerHTML;
            window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }

        function imprimir() {
            window.print();
        }


        function HandleBrowseClick() {
            var fileinput = document.getElementById("browse");
            fileinput.click();
        }

        function Handlechange() {
            var fileinput = document.getElementById("browse");
            var textinput = document.getElementById("txtarchivo");
            textinput.value = fileinput.value;

        }
    </script>

</asp:Content>



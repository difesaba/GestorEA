<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComparativoGrafico.aspx.cs" Inherits="GestorEA.Views.Reportes.ComparativoGrafico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="../Inicio/inicio.aspx">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Reportes</li>
        <li class="breadcrumb-item"><a href="Comparativo.aspx">Comparativo de Cotizaciones</a></li>
      </ol>
    </nav>
    <div ng-app="graficoApp">
        <div ng-controller="graficoController">
            <canvas id="bar-chart" width="400" height="200"></canvas>
            <input type="hidden" name="idSolicitud" id ="idSolicitud" value="" />
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
        
    </script>
    <script>
        var app = angular.module("graficoApp", [])

        app.controller("graficoController", function ($scope) {
            $scope.informe = function () {
                var solicitud = document.getElementById('idSolicitud').value;
                ConsultaAjax("ReporteComparativo", "POST", function (source) {

                    if (!source) {
                        alert('No se ha completado la transaccion');
                    }
                    else {
                        $scope.grafico = source;
                        Object.keys($scope.grafico[0])
                        Object.values($scope.grafico[0])
                        new Chart(document.getElementById("bar-chart"), {
                            type: 'bar',
                            data: {
                                labels: Object.keys($scope.grafico[0]),
                                datasets: [
                                    {
                                        label: "Valor",
                                        backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                                        data: Object.values($scope.grafico[0])
                                    }
                                ]
                            },
                            options: {
                                legend: { display: false },
                                title: {
                                    display: true,
                                    text: 'Comparativo'
                                },
                                animation: {
                                    duration: 7000,
                                    xAxis: true,
                                    yAxis: true,
                                }
                            }
                        });
                        $scope.$apply();
                    }
                }, { solicitud: solicitud })
            }
            $scope.informe();
        })
    </script>
</asp:Content>

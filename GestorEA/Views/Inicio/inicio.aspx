<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="GestorEA.Views.Inicio.inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    </br>
    <div class="container-fluid">
        <h5 style="color:#007bff">Trabajamos para ti..</h5>
    </div>
    </br>
    <div class="container">
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home"
                    aria-selected="true">Innovación</a>
                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile"
                    aria-selected="false">Eficiencia
                    <i class="fas fa-chart-line fa-lg"></i>
                </a>

            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            </br>
                <center>
                    <img class="card-img-top" src="../../Content/Img/julian-o-hayon-143085.jpg" alt="Card image cap"> 
                </center>
                </br>
                <div class="container" >
                    <div class="container">
                    <div class="card">
                        <div class="card-header">
                             Nuestra Innovación
                        </div>
                        <div class="card-body">
                            <p class="card-text">Tenemos un plan estratégico. Se llama hacer las cosas bien.</p>
                            <p class="card-text">Trabajamos para que puedas realizar tu proceso donde quieras en cualquier dispositivo. Estamos contigo en todas partes.</p>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            </br>
            <center> 
                <img class="card-img-top" src="../../Content/Img/volkan-olmez-73767.jpg" alt="Card image cap">
            </center>
        </br>
        <div class="container">
            <div class="container">
                <div class="card">
                    <div class="card-header">
                         Nuestra Eficiencia
                    </div>
                    <div class="card-body">
                        <p class="card-text">Logramos realizar el uso mas eficaz de los recursos deuna sociedad para satisfacer las necesidades y deseos de las personas
                        para su abastecimiento.</p>
                        <p class="card-text">Trabajamos para que puedas realizar tu proceso de manera ágil.</p>
                    </div>
                </div>
            </div>
        </div>
            </div>
        </div>
    </div>
</asp:Content>

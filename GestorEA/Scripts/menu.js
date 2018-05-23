/// <reference path="underscore.js" />


var url = window.location.href.split('Views')[0] + "/views/login/index.aspx/obtenerMenus";

ConsultaAjax(url, 'POST', function (source) {
    var result = '';
    var _html = '';
    for (var i = 0; i < source.length; i++) {
        var menu = source[i].MenusRoles;

        if (menu.PermisoPadre == 0) {
            _html += menu_padre(source, menu, i);
        }
    }

    $('.menu').append(_html);
}, undefined, false);

function findwhere(data, idmenu) {
    var sub_menu = [];

    for (var i = 0; i < data.length; i++) {
        var menus = data[i].MenusRoles;

        if (menus.PermisoPadre == idmenu) {
            sub_menu.push(menus);
        }
    }

    return sub_menu;
}


function menu_padre(menus, data, _position) {
    var html_padre = '';
    html_padre = ' <li class="nav-item dropdown" style="font-size:12px;">';
    html_padre += '<a class="nav-link dropdown-toggle" style="font-size:12px;" role="button" href= "#" id= "menu_' + _position + '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >';
    html_padre += data.PermisoNombre;
    html_padre += '</a >';
    var filter = findwhere(menus, data.PermisoId);

    if (filter.length != 0) {
        html_padre += '<div class="dropdown-menu" style="font-size:12px;" aria-labelledby="menu_' + _position + '">';
        html_padre += rendeizar_hijos(filter);
        html_padre += '</div>';
    }

    html_padre += '</li > ';

    return html_padre;
}

function rendeizar_hijos(data) {
    var html_sub_menu = '';

    for (var i = 0; i < data.length; i++) {
        var itm = data[i];
        html_sub_menu += '<a class="dropdown-item" style="font-size:12px;" onclick="direccionarMenu(this)" ruta="' + itm.URLRuta + '">' + itm.PermisoNombre + '</a>';
    }
    return html_sub_menu;
}

function direccionarMenu(e) {
    var ruta = $(e).attr('ruta');

    var _ruta = window.location.href.split('Views')[0] + 'Views/' + ruta;

    window.location.assign(_ruta);

}
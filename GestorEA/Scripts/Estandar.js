/*Fecha Actual*/


/*Fin Actual*/
$(document).ready(function () {
    

    $(".dropdown-menu a.dropdown-toggle").on("click", function (e) {
        var $el = $(this);
        var $parent = $(this).offsetParent(".dropdown-menu");
        if (
            !$(this)
                .next()
                .hasClass("show")
        ) {
            $(this)
                .parents(".dropdown-menu")
                .first()
                .find(".show")
                .removeClass("show");
        }
        var $subMenu = $(this).next(".dropdown-menu");
        $subMenu.toggleClass("show");

        $(this)
            .parent("li")
            .toggleClass("show");

        $(this)
            .parents("li.nav-item.dropdown.show")
            .on("hidden.bs.dropdown", function (e) {
                $(".dropdown-menu .show").removeClass("show");
            });

        if (!$parent.parent().hasClass("navbar-nav")) {
            $el.next().css({ top: $el[0].offsetTop, left: $parent.outerWidth() - 4 });
        }

        return false;
    });
});



//=========================================================================================================================================
//                                               AUTOCOMPLETE

var sourceAC;
var timeOutWriteAC;
var ACFocus;
var ACValue;
var limpiarTexto = false;
var focusOut_event;

function eventosAC() {
    $('.autocomplete').find('input').keyup(function (e) {
        ACFocus = $(this);

        if (e.keyCode != 40 && e.keyCode != 38) {
            if (timeOutWriteAC)                
                clearTimeout(timeOutWriteAC);

            timeOutWriteAC = setTimeout(Autocomplete, 500);
        }

        //keycode para enter
        //if (e.keyCode == 13) {
        //    limpiarTexto = false;
        //    clearTimeout(timeOutWriteAC);
        //    $(ACFocus).closest('div').find('div.resultAC').find("div[class$='hover']").trigger('click')
        //    focusOut();
        //    $(ACFocus).blur();
        //}

    });

    $('.autocomplete').find('input').keydown(function (e) {
        if ($(ACFocus).attr('busqueda') != undefined && $('.resultAC').find('div[class*="option"]').length == 0) {
            if (e.keyCode == 9 || e.keyCode == 13) {
                var result = {};
                result.Descripcion = $(ACFocus).val();
                result.id = "-1";
                $(ACFocus).attr('result', JSON.stringify(result))
                $(ACFocus).closest('div[class*="autocomplete"]').find('.resultAC').remove();
                if (e.keyCode == 13)
                    $(ACFocus).blur();
                return;
            }
        }
        ACValue = $(this).val();

        if (e.keyCode == 9 || e.keyCode == 13) {
            //jau, cuando se da tab se quedaba pegado la seleccion anterior
            if ($(ACFocus).val() == '') return;
            limpiarTexto = false;

            var selected = $('.resultAC').find('.hover');
            if (selected.length > 0) {
                $(selected).click();
            } else {

                $('.resultAC').find('div[class*="option"]').first().addClass('hover');
                //ACFocus = $('.resultAC').find('div[class*="option"]').first();
                $('.resultAC').find('div[class*="option"]').first().click();
            }
            var value = $(ACFocus).attr('result');

            if (value != undefined) {
                value = JSON.parse(value);

                if (Object.keys(value).indexOf('Descripcion') > -1)
                    $(ACFocus).val(value.Descripcion);
                $(ACFocus).closest('div[class*="autocomplete"]').find('.resultAC').remove();
            }
            //if (e.keyCode == 13)
            //    $(ACFocus).blur();
        }

        if (e.keyCode == 40 || e.keyCode == 38) {
            if (e.keyCode == 40) {
                var ACHover = $('.resultAC').find('div[class*="hover"]');
                if (ACHover != undefined && ACHover.length > 0) {

                    $(ACHover).removeClass('hover');
                    $(ACHover).next().addClass('hover');

                    if (parseInt($(ACHover).attr('id')) >= 9)
                        $('.resultAC').scrollTop($('.resultAC').scrollTop() + 25);

                    if (parseInt($(ACHover).attr('id')) + 1 == $('.resultAC').find('div[class*="option"]').length) {
                        $('.resultAC').scrollTop(0);
                        $($('.resultAC').find('div[class*="option"]')[0]).addClass('hover');
                    }
                }

                else { $($('.resultAC').find('div')[0]).addClass('hover'); }

                $(this).val($('.resultAC').find('div[class*="hover"]').text());
            }

            if (e.keyCode == 38) {

                var ACHover = $('.resultAC').find('div[class*="hover"]');
                if (ACHover != undefined && ACHover.length > 0) {

                    $(ACHover).prev().addClass('hover');
                    $(ACHover).removeClass('hover');

                    if (parseInt($(ACHover).attr('id')) >= 9)
                        $('.resultAC').scrollTop($('.resultAC').scrollTop() - 25);

                    if (parseInt($(ACHover).attr('id')) == 0) {
                        $('.resultAC').scrollTop($('.resultAC').height());
                        $($('.resultAC').find('div[class*="option"]')).last().addClass('hover');
                    }
                } else {
                    $('.resultAC').find('div[class*="option"]').last().addClass('hover');
                    $('.resultAC').scrollTop($('.resultAC').height());
                }
            }
        }

        //if (e.keyCode == 13 || e.keyCode == 9) {

        //    var ACHover = $('.resultAC').find('div[class*="hover"]');
        //    if (ACHover.length > 0) {
        //        $(ACHover).click();
        //    } else {
        //        SeleccionAC();
        //    }
        //    if (e.keyCode == 13) {
        //        $(ACFocus).next().focus();
        //    }
        //}
    });

    $('.autocomplete').find('input').focus(function () {
        $('.autocomplete').closest('div[class*="autocomplete"]').find('.resultAC').remove();
        ACFocus = $(this);
        CrearEventos();
    });

    $('.autocomplete').find('input').focusin(function () {

        focusOut_event = undefined;
    });

    $('.autocomplete').find('input').click(function () {

    })
}

//eventosAC();

function focusOut() {
    //focusOut_event = setTimeout(function () {
    if (focusOut_event) {
        focusOut_event = undefined;
        if (limpiarTexto) {
            $(ACFocus).removeAttr('result');
            $(ACFocus).val('');
        }

        if ($(ACFocus).val().trim() != '') {
            var value = $(ACFocus).attr('result');

            if (value != undefined) {
                value = JSON.parse(value);

                if (Object.keys(value).indexOf('Descripcion') > -1)
                    $(ACFocus).val(value.Descripcion);
            }
        } else
            $(ACFocus).removeAttr('result');

        $(ACFocus).closest('div[class*="autocomplete"]').find('.resultAC').remove();
    }
    else {
        if ($(ACFocus).val() == '') {
            $(ACFocus).removeAttr('result');
            $(ACFocus).val('');
        }
    }
    // }, 300);

}

function focusIn() {

    focusOut_event = undefined;
    $(ACFocus).closest('div[class*="autocomplete"]').removeAttr('onfocusout');
}

function CrearEventos() {
    var autocomplete = $(ACFocus).closest('div[class*="autocomplete"]');
    $(autocomplete).attr('onfocusout', "focusOut()");
}

function position_AC(label) {
    var size = $(window).height();
    var position = ($(ACFocus).offset().top) + 100;
    var InTable = $(ACFocus).closest('tr');

    _class = "";

    if ((size > position)) {

        if (InTable.length >= 1) {
            var tamTable = $(ACFocus).closest('table').height();

            tamTable = (size - $('.foot-table').height());
            if (tamTable <= position + 10) {
                _class = "result-bottom";
            }
            else {
                _class = "result-top";
            }
        } else
            _class = "result-top";
    }
    else
        if (label.length > 0)
            _class = "result-bottom";
        else
            _class = "result-bottom-full";

    return _class;
}

function Autocomplete() {
    AlimpiarTexto = false;

    var label = $(ACFocus).closest('div[class*="autocomplete"]').find('label');
    var template = $.parseHTML("<div class='resultAC' onfocusin='focusIn()'></div>");

    $(template).addClass(position_AC(label));


    var metodo = $(ACFocus).closest('div[class*="autocomplete"]').attr('webMethod');
    sourceAC = [];

    $(ACFocus).closest('div[class*="autocomplete"]').find('.resultAC').remove();

    if ($(ACFocus).val().trim() != "") {

        //VALIDACION DE ATRIBUTOS DE PARAMETROS 
        var dependent = $(ACFocus).closest('div[class*="autocomplete"]').attr('dependent');
        var arrayParams = $(ACFocus).closest('div[class*="autocomplete"]').attr('arrayparams');
        var onclikItem = $(ACFocus).closest('div[class*="autocomplete"]').attr('clickItemAutoComplete');

        if (dependent != undefined) {

            var resultDependet = $('#' + dependent).attr('result');
            if (resultDependet != undefined && resultDependet != "") {
                var parametros = {};
                parametros = JSON.parse($('#' + dependent).attr('result'));
                parametros.value = $(ACFocus).val();
                ConsulaMethodAAC(metodo, parametros);
            } else {
                limpiarTexto = true;
                $(template).append("<span style='display:block; height:40px; padding:8px 0px; text-align:center'>No ha seleccionado un valor en " + $('#' + dependent).closest('div[class*="autocomplete"]').find('label').text() + "</span>")
                $(ACFocus).closest('div[class*="autocomplete"]').append(template)
                return
            }

        } else if (arrayParams != undefined) {

            var params = JSON.parse(arrayParams);
            params.filter = $(ACFocus).val();
            arrayParams = JSON.stringify(params);

            ConsulaMethodAAC(metodo, JSON.parse(arrayParams));
        }
        else { ConsulaMethodAAC(metodo, $(ACFocus).val()); }


        $('.resultAC').find('div').hover(function () {
            $('.resultAC').find('div[class*="hover"]').removeClass('hover');
            $(this).addClass('hover');
        });
    }
}

function renderizarAC() {
    var label = $(ACFocus).closest('div[class*="autocomplete"]').find('label');
    var template = $.parseHTML("<div class='resultAC' onfocusin='focusIn()'></div>");
    var dependent = $(ACFocus).closest('div[class*="autocomplete"]').attr('dependent');
    var arrayParams = $(ACFocus).closest('div[class*="autocomplete"]').attr('arrayparams');
    var onclikItem = $(ACFocus).closest('div[class*="autocomplete"]').attr('clickItemAutoComplete');


    if (sourceAC != null) {
        if (sourceAC.length > 0) {
            for (var j = 0; j < sourceAC.length; j++) {
                var option = ''


                option = "<div title='" + sourceAC[j]['Descripcion'] + "' style='color:" + sourceAC[j]['color'] + ";' data-toggle='tooltip' class='option'  id='" + j + "'  onclick='SeleccionAC(" + JSON.stringify(sourceAC[j]).split("'").join('´').toString() + " , " + onclikItem + ")'>" + sourceAC[j]['Descripcion'] + "<div>";
                $(template).append(option);
            }
            $(ACFocus).closest('div[class*="autocomplete"]').append(template);
        } else {
            if ($(ACFocus).val().trim() != "") {
                $(template).append("<span style='display:block; height:40px; padding:8px 0px; text-align:center'>No se encontraron registros</span>")
                $(ACFocus).closest('div[class*="autocomplete"]').append(template)
            }
        }
    }
    else {
        if ($(ACFocus).val().trim() != "") {
            $(template).append("<span style='display:block; height:40px; padding:8px 0px; text-align:center'>No se encontraron registros</span>")
            $(ACFocus).closest('div[class*="autocomplete"]').append(template)
        }
    }
}

function SeleccionAC(objecto, funOnItemClick) {
    if (objecto != undefined)
        $(ACFocus).attr('result', JSON.stringify(objecto));
    else
        $(ACFocus).removeAttr('result');

    focusOut_event = true;
    focusOut();

    if (funOnItemClick != undefined && funOnItemClick != null)
        funOnItemClick();

    $(ACFocus).focus();

    FunctionAC(objecto);

}

function FunctionAC(parametros) {
    var fn = $(ACFocus).closest('div[class*="autocomplete"]').attr('fnSelected') != undefined ? $(ACFocus).closest('div[class*="autocomplete"]').attr('fnSelected') + '(' + JSON.stringify(parametros) + ')' : '';
    eval(fn);
}


function ConsulaMethodAAC(metodo, parametros) {

    var _url = "";

    if (window.location.href.split('?').length != 0) {
        _url = window.location.href.split('.aspx')[0] + '.aspx/' + metodo;
    } else {
        _url = window.location.href + '.aspx/' + metodo;
    }
    
   console.log('Va a servidor a consultar resultado AC');
    

    if (metodo == 'GET') {
        for (var i = 0; i < parametros.length; i++) {
            _url += +'/' + parametros[i];
        }
    } else {
        if (parametros != undefined) {

 
            if (parametros[parametros.length - 1] == '.') {
                parametros += '0';
            }

        //    _url += '/' + parametros;
        }
    }

    var req = new XMLHttpRequest();
    req.open('POST', _url, true);
    req.setRequestHeader("Content-type", "application/json");
    req.onreadystatechange = function (aEvt) {
        if (req.readyState == 4) {
            if (req.status == 200) {
                sourceAC = JSON.parse(req.response).d;
                renderizarAC();
            }
        }
    };

    parametros = JSON.stringify({ data: parametros});

    req.send(parametros);
    


}

/*Obtner datos por query string*/
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
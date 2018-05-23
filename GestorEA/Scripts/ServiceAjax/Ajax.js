
function ConsultaAjax(metodo, type, callback, parametros, armarurl) {

    var _url = '';

    if (armarurl == undefined) {

    if (window.location.href.split('?').length != 0) {
        _url = window.location.href.split('.aspx')[0] + '.aspx/' + metodo;
        } else {
            _url = window.location.href +  metodo;
        }


     //   _url = window.location.href+ '/'+metodo;
    } else {
        _url = metodo;
    }


    var req = new XMLHttpRequest();
    contentType: "application/json; charset=utf-8"
    if (type == 'GET' || type == 'DELETE') {
        if (parametros != undefined) {
            for (var i = 0; i < parametros.length; i++) {
                _url += '/' + parametros[i];
            }

        }

    }

    req.open(type, _url, true);
    req.onreadystatechange = function (aEvt) {

        if (req.readyState == 4) {

            if (req.status == 200) {

                if (callback != undefined)
                    callback(JSON.parse(req.response).d);
            } else {
                console.error('Error: ' + req.responseText);

            }

        }

    };

    if (type != 'GET') {

        req.setRequestHeader("Content-type", "application/json");

        if (parametros != undefined) {

            parametros = JSON.stringify(parametros);

            req.send(parametros);

        } else {

            req.send(null);

        }
    }
}
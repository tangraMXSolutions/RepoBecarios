

function validaNavegador(){
    
    var ua= navigator.userAgent, tem, 
    M= ua.match(/(edge|opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if(/trident/i.test(M[1])){
        tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
        return 'IE '+(tem[1] || '');
    }
    if(M[1]=== 'Chrome'){
        tem= ua.match(/\b(OPR|Edge)\/(\d+)/);
        if(tem!= null) return tem.slice(1).join(' ').replace('OPR', 'Opera');
    }
    M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
    if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
    M=M.join(' ').toUpperCase().replace('EDGE','').replace('MSIE','').replace('SAFARI','').replace('CHROME','').replace('FIREFOX','');//.replace(/[^a-zA-Z\s!?]+/g,'');
    if(parseInt(M)>=5){
        var url = window.location.href;
        url=url+'index__.jsp';    
        window.location.href=url;
    }   
}


document.onkeydown = function () {
    if (window.event && window.event.keyCode == 116) {
        window.event.keyCode = 505;
    }
    if (window.event && window.event.keyCode == 505) {
        return false;
    }
}

window.onload = function () {
    //alert(document.getElementById('lblMensaje').innerHTML);
    //alert(document.getElementById('lblMensaje').innerHTML.toUpperCase().indexOf('.:'));
    if (document.getElementById('lblMensaje').innerHTML.toUpperCase().indexOf('.:') > -1) {
        document.getElementById('lblMensaje').innerHTML='Mov. Exitoso';
        document.getElementById('lblMensaje').className = 'bien';
    } else {
        document.getElementById('lblMensaje').className = 'error';
    }
    
}

function abandonarSistema(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=SALIR";
    document.forms[nombreFormulario].submit();
}

function registrarInventario(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=REGISTRAR_INVENTARIO_ACTIVOS";
    document.getElementById('txtGuardar').value = '1';
    document.forms[nombreFormulario].submit();
}
function registrarComplementoCodigo(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=REGISTRAR_COMPLEMENTO_CODIGO";
    document.getElementById('txtPrimera').value = '2';
    document.forms[nombreFormulario].submit();
}
function buscarComplementoCodigo(nombreFormulario) {    
    document.forms[nombreFormulario].action = "ServiceTracker?accion=BUSCAR_COMPLEMENTO_CODIGO";    
    var form=document.getElementById(nombreFormulario);
    alert(form.controls);
    form.submit();
    //document.forms[nombreFormulario].submit();
}
function selectComboCliente(combo, parameter) {

    //if(combo.options[combo.selectedIndex].value!='-1'){
    document.getElementById(parameter).value = combo.options[combo.selectedIndex].value;
    document.forms['frmListado'].action = "ServiceTracker?accion=INGRESAR&cbCliente=" + combo.options[combo.selectedIndex].value;
    document.forms['frmListado'].submit();
    //}
}
function inventarioActivos(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=INVENTARIO_ACTIVOS";
    document.forms[nombreFormulario].submit();
}
function reciboOrdenCompra(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=RECIBO_ORDEN_DE_COMPRA";
    document.forms[nombreFormulario].submit();
}
function selectValorCombo(combo, parameter)
{
    document.getElementById(parameter).value = combo.options[combo.selectedIndex].value;

}
function surtidoEtapa1(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=SURTIDO_ETAPA1_SELECCION";
    document.forms[nombreFormulario].submit();
}
function surtidoEtapa1Maquila(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=SURTIDO_ETAPA1_SELECCION_MAQUILA";
    document.forms[nombreFormulario].submit();
}
function etapaAcomodo(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=ETAPA_ACOMODO";
    document.forms[nombreFormulario].submit();
}
function surtidoEtapa2(nombreFormulario) {
    if (document.getElementById('idLocalidad').value != document.getElementById('txtLocalidad').value) {
        alert('No corresponde la localidad');
        document.getElementById('txtLocalidad').focus();
        return false;
    } else {
        document.forms[nombreFormulario].action = "ServiceTracker?accion=CONTINUAR_SURTIDO_ETAPA1";
        document.forms[nombreFormulario].submit();
        return true;
    }
}
function selectValorComboSurtidoEtapa1(combo, parameter, nombreFormulario) {
    document.getElementById(parameter).value = combo.options[combo.selectedIndex].text;
    document.getElementById('txtPedido').value = combo.options[combo.selectedIndex].text;
    if (combo.options[combo.selectedIndex].value != -1) {
        document.getElementById('txtPedido').value = combo.options[combo.selectedIndex].text;
        //alert(combo.options[combo.selectedIndex].text);
        document.forms[nombreFormulario].action = "ServiceTracker?accion=SURTIDO_ETAPA1&cbPedido=" + combo.options[combo.selectedIndex].text + '&txtPedido=' + combo.options[combo.selectedIndex].text;
        document.forms[nombreFormulario].submit();
    }
}
function selectValorComboMaquilaEtapa1(combo, parameter, nombreFormulario) {
    document.getElementById(parameter).value = combo.options[combo.selectedIndex].text;
    document.getElementById('txtPedido').value = combo.options[combo.selectedIndex].text;
    if (combo.options[combo.selectedIndex].value != -1) {
        document.getElementById('txtPedido').value = combo.options[combo.selectedIndex].text;
        //alert(combo.options[combo.selectedIndex].text);
        document.forms[nombreFormulario].action = "ServiceTracker?accion=SURTIDO_ETAPA1_MAQUILA&cbPedido=" + combo.options[combo.selectedIndex].text + '&txtPedido=' + combo.options[combo.selectedIndex].text;
        document.forms[nombreFormulario].submit();
    }
}

function arrastreAcomodo(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=CONFIRMA_LOCALIDAD";
    document.forms[nombreFormulario].submit();
}

function setFiscalCheck(objeto) {

    if (objeto.checked) {
        document.getElementById('txtFiscal').value = '1';
    } else {
        document.getElementById('txtFiscal').value = '0';
    }

}

function traspasoUbicacion(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=TRASPASO_UBICACION";
    document.forms[nombreFormulario].submit();
}

function registrarUbicacion(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=REGISTRAR_TRASPASO_UBICACION";
    document.getElementById('txtGuardar').value = '1';
    document.forms[nombreFormulario].submit();
}


function traspasoPiezas(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=TRASPASO_PIEZAS";
    document.forms[nombreFormulario].submit();
}

function registrarPiezas(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=REGISTRAR_TRASPASO_PIEZAS&cbCalidad=" + document.getElementById('cbCalidad').value;
    document.getElementById('txtGuardar').value = '1';
    document.forms[nombreFormulario].submit();
}

function traspasoMarbete(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=TRASPASO_MARBETE";
    document.forms[nombreFormulario].submit();
}

function registrarMarbete(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=REGISTRAR_TRASPASO_MARBETE";
    document.getElementById('txtGuardar').value = '1';
    document.forms[nombreFormulario].submit();
}

function traspasoTarima(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=TRASPASO_TARIMA";
    document.forms[nombreFormulario].submit();
}

function registrarTarima(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=REGISTRAR_TRASPASO_TARIMA&cbCalidad=" + document.getElementById('cbCalidad').value;
    document.getElementById('txtGuardar').value = '1';
    document.forms[nombreFormulario].submit();
}

function inventarioExistencia(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=INVENTARIO_EXISTENCIA";
    document.forms[nombreFormulario].submit();
}
function inventarioExistenciaSKU(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=INVENTARIO_EXISTENCIA&accion2=1";
    document.forms[nombreFormulario].submit();
}

/*
function asociarMaquila(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=ASOCIAR_TARIMA";
    document.forms[nombreFormulario].submit();
}*/
function asociarMaquila(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=ASOCIAR_MAQUILA";
    document.forms[nombreFormulario].submit();
}

function asociarMaquilaRegistro(nombreFormulario){
     document.forms[nombreFormulario].action = "ServiceTracker?accion=ASOCIAR_TARIMA_REGISTRO";
    document.forms[nombreFormulario].submit();
    
}

function iniciarMaquila(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=INICIAR_MAQUILA";
    document.forms[nombreFormulario].submit();
}

function iniciarMaquilaRegistro(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=INICIAR_MAQUILA_REGISTRO";
    document.forms[nombreFormulario].submit();
}

function cerrarMaquila(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=CERRAR_MAQUILA";
    document.forms[nombreFormulario].submit();
}
function cerrarMaquilaRegistro(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=CERRAR_MAQUILA_REGISTRO";
    document.forms[nombreFormulario].submit();
}
function cerrarDetallesMaquilaRegistro(nombreFormulario) {
    document.forms[nombreFormulario].action = "ServiceTracker?accion=CERRAR_MAQUILA_DETALLES";
    document.forms[nombreFormulario].submit();
}
function reciboCompraConsulta(nombreFormulario){
     document.forms[nombreFormulario].action = "ServiceTracker?accion=RECIBO_LPN_INGRESADO";
    document.forms[nombreFormulario].submit();
}
function reciboCompraConsultaDetalle(nombreFormulario){
     document.forms[nombreFormulario].action = "ServiceTracker?accion=RECIBO_LPN_INGRESADO_CONSULTA";
    document.forms[nombreFormulario].submit();
}




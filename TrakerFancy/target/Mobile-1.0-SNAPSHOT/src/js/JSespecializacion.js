function licencia() {
    var cadena = document.getElementById('txtAnada').value;
    if (cadena.substring(0, 1) != ".") {
        var tamanio = cadena.length;
        var comienza = tamanio - 10;
        var fecha =  '20' + cadena.substring(22, 24)+ "."+ cadena.substring(24, 26) + "."+ cadena.substring(26, 28)   ;
        ;
        var lote = cadena.substring(comienza, tamanio - 2);
        
        
        document.getElementById('txtVigencia').value=fecha;
        document.getElementById('txtAnada').value=lote;
        
    }else{
        document.getElementById('txtAnada').value=cadena.replace(".","");
    }
/*    if (document.getElementById('txtAnada').value != '' && document.getElementById('txtCantidad').value == '') {

    }*/
    /* var cadena="";
     if(document.getElementById('txtAnada').value!='' && document.getElementById('txtCantidad').value=='' ){
     cadena=document.getElementById('txtAnada').value;
     //cadena=cadena.replace(/\(02\)/g, "|");
     //cadena=cadena.replace(/\(20\)/g, "|");
     //cadena=cadena.replace(/\(15\)/g, "|");
     //cadena=cadena.replace(/\(37\)/g, "|");
     //cadena=cadena.replace(/\(10\)/g, "|");
     cadena=cadena.replace(/["'\(\)]/g, "");
     //alert(cadena);
     /* if(document.getElementById('txtCantidad').value==''){
     document.getElementById('txtCantidad').value=cadena.substring(31,34);
     }else{
     document.getElementById('txtCantidad').value=Number(document.getElementById('txtCantidad').value)*Number(cadena.substring(31,34));
     }
     */

    var cantidad = "";
    //cantidad= Number(document.getElementById('txtCantidad').value=cadena.substring(30,33))*
    //         Number(document.getElementById('txtCharola').value);
    //document.getElementById('txtAnada').value=cadena.substring(35,46);
    //document.getElementById('txtMarbete').value=cadena.substring(2,17);
    //document.getElementById('txtMarbete').value="";
    //document.getElementById('txtVigencia').value=cadena.substring(22,28);   
    //181031
    /*var dd='',mm='',aa='',fecha;
     fecha=document.getElementById('txtVigencia').value;
     aa = fecha.substring(0,2);
     fecha=fecha.substring(2);//1031
     mm = fecha.substring(0,2);
     fecha=fecha.substring(2);
     dd = fecha;
     fecha=dd+'.'+mm+'.20'+aa;
     //document.getElementById('txtVigencia').value=fecha;
     //document.getElementById('txtCantidad').value=cantidad;
     document.getElementById("ListaCalidad").selectedIndex = "1";
     }else{
     //document.getElementById('txtVigencia').value="";
     //document.getElementById('txtCantidad').value="";
     document.getElementById("ListaCalidad").selectedIndex = "1";
     }*/
}



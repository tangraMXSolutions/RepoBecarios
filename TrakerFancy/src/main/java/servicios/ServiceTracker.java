/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import form.FormInventarioPosicion;
import business.BLCalidad;
import business.BLCore;
import business.BLDocumento;
import business.BLInventario;
import business.BLInventarioExistencia;
import business.BLPedido;
import business.BLProducto;
import business.BLSurtido;
import business.BLTraspaso;
import business.BLUsuario;
import constantes.Pages;
import constantes.Version;
import dataBase.ConexionDB;
import enums.TipoDeMovimiento;
import form.FormAcomodo;
import form.FormCodigo;
import form.FormInventario;
import form.FormMaquila;
import form.FormMaquilaEtapa1;
import form.FormMarbete;
import form.FormOrdenCompra;
import form.FormPiezas;
import form.FormSusrtidoEtapa3;
import form.FormTarima;
import form.FormUbicacion;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojos.core.Calidad;
import pojos.core.Documento;
import pojos.core.ListadoCalidad;
import pojos.core.ListadoDocumento;
import pojos.core.ListadoPedido;
import pojos.core.ListadoPedidoElementoPendienteDeSurtir;
import pojos.core.ListadoPosicion;
import pojos.core.Localizacion;
import pojos.core.Lote;
import pojos.core.Lpn;
import pojos.core.Maquila;
import pojos.core.Pedido;
import pojos.core.Producto;
import pojos.core.RecepcionDeProducto;
import pojos.core.Respuesta;
import pojos.core.Tarima;
import pojos.core.TipoDeEntrada;
import pojos.core.Ubicacion;
import pojos.core.Usuario;
import pojos.elemento.ElementoPendienteDeSurtir;
import helpers.Util;

/**
 *
 * @author omarsorianoz
 */
@WebServlet(name = "ServiceTracker", urlPatterns = {"/ServiceTracker"})
public class ServiceTracker extends HttpServlet {

    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        //Set character encoding as UTF-8
        request.setCharacterEncoding("UTF-8");
        filterChain.doFilter(request, response);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.sendRedirect(Util.getURL("index.jsp"));
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.sendRedirect("web_menu.jsp");
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (Pages.INGRESAR.equals(request.getParameter("accion"))) {
            ingresar(request, response);
        } else if (Pages.PAGINA_LOGIN.equals(request.getParameter("accion"))) {
            Version.VERSION_NAVEGADOR=Integer.parseInt((request.getParameter("version")!=null)?request.getParameter("version"):"3");
            login(request, response);
        } else if (Pages.INVENTARIO_ACTIVOS.equals(request.getParameter("accion"))) {
            inventarioActivos(request, response);
        } else if (Pages.REGISTRAR_INVENTARIO_ACTIVOS.equals(request.getParameter("accion"))) {
            registrarInventarioActivos(request, response);
        } else if (Pages.RECIBO_ORDEN_DE_COMPRA.equals(request.getParameter("accion"))) {
            ordenDeCompra(request, response);
        } else if (Pages.REGISTRO_RECIBO_ORDEN_DE_COMPRA.equals(request.getParameter("accion"))) {
            registrarOrdenDeCompra(request, response);
        } else if (Pages.SURTIDO_ETAPA1_SELECCION.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 1 Surtido");
            surtidoEtapa1Seleccion(request, response);
        } else if (Pages.SURTIDO_ETAPA1.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 1 Surtido");
            surtidoEtapa1(request, response);
        } else if (Pages.CONTINUAR_SURTIDO_ETAPA1.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 2 Surtido");
            continuarSurtidoEtapa1(request, response);
        } else if (Pages.CONTINUAR_SURTIDO_ETAPA2.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 3 Surtido");
            continuarSurtidoEtapa2(request, response);
        } else if (Pages.CONFIRMA_LOCALIDAD.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Acomodo");
            acomodo(request, response);
        } else if (Pages.REGISTRAR_ACOMODO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Acomodo");
            arrastreAcomodo(request, response);
        } else if (Pages.ETAPA_ACOMODO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Acomodo");
            setAcomodo(request, response);
        } else if (Pages.PAGINA_SALIR.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Salir");
            salir(request, response);
        } else if (Pages.TRASPASO_UBICACION.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Traspaso");
            Ubicacion(request, response);
        } else if (Pages.REGISTRAR_TRASPASO_UBICACION.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Traspaso");
            registrarTraspasoUbicacion(request, response);
        } else if (Pages.TRASPASO_PIEZAS.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Traspaso");
            Piezas(request, response);
        } else if (Pages.REGISTRAR_TRASPASO_PIEZAS.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Traspaso");
            registrarTraspasoPiezas(request, response);
        } else if (Pages.TRASPASO_MARBETE.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Marbete");
            Marbete(request, response);
        } else if (Pages.REGISTRAR_TRASPASO_MARBETE.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Marbete");
            registrarTraspasoMarbete(request, response);
        } else if (Pages.TRASPASO_TARIMA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Traspaso");
            Tarima(request, response);
        } else if (Pages.REGISTRAR_TRASPASO_TARIMA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Traspaso");
            registrarTraspasoTarima(request, response);
        } else if (Pages.INVENTARIO_EXISTENCIA.equals(request.getParameter("accion"))) {
            listarInventarioExistencia(request, response);
        } else if (Pages.ASOCIAR_TARIMA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Asociar");
            asociarTaquila(request, response);
        } else if (Pages.ASOCIAR_TARIMA_REGISTRO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            asociarMaquilaRegistro(request, response);
        } else if (Pages.INICIAR_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            iniciarMaquila(request, response);
        } else if (Pages.INICIAR_MAQUILA_REGISTRO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            iniciarMaquilaRegistro(request, response);
        } else if (Pages.CERRAR_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            cerrarMaquila(request, response);
        } else if (Pages.CERAR_MAQUILA_REGISTRO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            cerrarMaquilaRegistro(request, response);
        } else if (Pages.CERRAR_MAQUILA_DETALLES.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            cerrarDetalleMaquilaRegistro(request, response);
        } else if (Pages.RECIBO_LPN_INGRESADO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Recibo");
            ordenDeCompraConsulta(request, response);
        } else if (Pages.RECIBO_LPN_INGRESADO_CONSULTA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Recibo");
            ordenDeCompraConsultaDetalle(request, response);
        } //Inicia Modificaciones de Maquila
        else if (Pages.ASOCIAR_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Maquila");
            asociarMaquila(request, response);
        } else if (Pages.SURTIDO_ETAPA1_SELECCION_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 1 Surtido");
            surtidoMaquilaEtapa1Seleccion(request, response);
        } else if (Pages.SURTIDO_ETAPA1_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 1 Surtido");
            surtidoEtapa1(request, response);
        } else if (Pages.CONTINUAR_SURTIDO_ETAPA1_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 2 Surtido");
            continuarSurtidoEtapa1Maquila(request, response);
        } else if (Pages.CONTINUAR_SURTIDO_ETAPA2_MAQUILA.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Etapa 3 Surtido");
            continuarSurtidoEtapa2Maquila(request, response);
        } else if (Pages.REGISTRAR_COMPLEMENTO_CODIGO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Complemento Codigo");
            registrarComplementoCodigo(request, response);
        } else if (Pages.BUSCAR_COMPLEMENTO_CODIGO.equals(request.getParameter("accion"))) {
            request.setAttribute("formulario", "Complemento Codigo");
            buscarComplementoCodigo(request, response);
        }

        //processRequest(request, response);
    }

    void registrarComplementoCodigo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        new ConexionDB(getServletConfig().getServletContext());
        BLProducto blProducto = new BLProducto();
        String mensaje = "";
        RequestDispatcher send = null;
        boolean isError = false;
        if (request.getParameter("txtSkuClave") == null || String.valueOf(request.getParameter("txtSkuClave")).equals("")) {
            mensaje = "Se debe de Ingresar SKU del Producto";
            isError = true;
        }
        Producto producto = new Producto(request.getParameter("txtSkuClave").toString().trim());
        Producto productoTmp = blProducto.consultaSku(new Producto(request.getParameter("txtSkuClave").toString().trim()));
        producto = productoTmp;
        producto.setEAN13(((request.getParameter("txtEan") != null) ? request.getParameter("txtEan") : ""));
        producto.setUPC128(((request.getParameter("txtUpc") != null) ? request.getParameter("txtUpc") : ""));
        producto.setSkuAlterno1(((request.getParameter("txtCodigoDeBarra") != null) ? request.getParameter("txtCodigoDeBarra") : ""));
        /*
        producto.setDescripcion(productoTmp.getDescripcion());
        producto.setDescripcionCorta(productoTmp.getDescripcionCorta());
        producto.setEstatus(productoTmp.getEstatus());
        producto.setDetalleKit(productoTmp.getDetalleKit());
         */
        Respuesta respuesta = null;
        if (productoTmp != null) {
            respuesta = blProducto.actualizarCodigo(producto);
        } else {
            respuesta = blProducto.nuevo(producto);
        }
        FormCodigo formCodigo = null;
        send = request.getRequestDispatcher(Util.getURL("complemento_codigos.jsp"));
        if (respuesta != null) {
            if (respuesta.ExisteError()) {
                mensaje = respuesta.getError();
                formCodigo = new FormCodigo(
                        String.valueOf((request.getParameter("txtSkuClave") != null) ? request.getParameter("txtSkuClave") : ""),
                        String.valueOf((request.getParameter("txtEan") != null) ? request.getParameter("txtEan") : ""),
                        String.valueOf((request.getParameter("txtUpc") != null) ? request.getParameter("txtUpc") : ""),
                        String.valueOf((request.getParameter("txtCodigoDeBarra") != null) ? request.getParameter("txtCodigoDeBarra") : ""),
                        String.valueOf((request.getParameter("txtDescripcion") != null) ? request.getParameter("txtDescripcion") : ""),
                        Integer.parseInt((request.getParameter("txtExisto") != null) ? request.getParameter("txtExisto") : "")
                );
            } else {
                formCodigo = new FormCodigo(
                        "",
                        "",
                        "",
                        "",
                        "",
                        0
                );
            }
        }
        request.setAttribute("formComplementoCodigo", formCodigo);
        request.setAttribute("mensaje", mensaje);
        send.forward(request, response);

    }

    void buscarComplementoCodigo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        new ConexionDB(getServletConfig().getServletContext());
        BLProducto blProducto = new BLProducto();
        String mensaje = "";
        RequestDispatcher send = null;
        boolean isError = false;
        send = request.getRequestDispatcher(Util.getURL("complemento_codigos.jsp"));
        FormCodigo formCodigo = null;
        if (request.getParameter("txtSkuClave") == null || String.valueOf(request.getParameter("txtSkuClave")).equals("")) {
            mensaje = "Se debe de Ingresar el dato de busqueda Producto";
            isError = true;
        } else {
            Producto producto = blProducto.consultaSku(new Producto(request.getParameter("txtSkuClave").toString().trim()));

            if (producto != null) {
                formCodigo = new FormCodigo(
                        producto.getSku(),
                        producto.getEAN13(),
                        producto.getUPC128(),
                        String.valueOf((request.getParameter("txtCodigoDeBarra") != null) ? request.getParameter("txtCodigoDeBarra") : ""),
                        producto.getDescripcion(),
                        1
                );
                request.setAttribute("existo", "1");
            } else {
//                formCodigo = new FormCodigo(
//                        String.valueOf((request.getParameter("txtSkuClave") != null) ? request.getParameter("txtSkuClave") : ""),
//                        String.valueOf((request.getParameter("txtEan") != null) ? request.getParameter("txtEan") : ""),
//                        String.valueOf((request.getParameter("txtUpc") != null) ? request.getParameter("txtUpc") : ""),
//                        String.valueOf((request.getParameter("txtCodigoDeBarra") != null) ? request.getParameter("txtCodigoDeBarra") : ""),
//                        String.valueOf((request.getParameter("txtDescripcion") != null) ? request.getParameter("txtDescripcion") : ""),
//                        0
//                );
                formCodigo = new FormCodigo(
                        String.valueOf((request.getParameter("txtSkuClave") != null) ? request.getParameter("txtSkuClave") : ""),
                        "",
                        "",
                        "",
                        "",
                        0
                );
            }
        }
        request.setAttribute("formComplementoCodigo", formCodigo);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("isError", isError);
        send.forward(request, response);

    }

    void continuarSurtidoEtapa2Maquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");

        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        RequestDispatcher send = null;
        boolean isError = false;
        if (request.getParameter("txtProducto") == null || String.valueOf(request.getParameter("txtProducto")).equals("")) {
            mensaje = "Se debe de ingresar Producto";
            isError = true;
        }
        if (request.getParameter("txtCantidad") == null || String.valueOf(request.getParameter("txtCantidad")).equals("")) {
            mensaje = "Se debe de ingresar Cantidad";
            isError = true;
        } else if (request.getParameter("idSku") == null || String.valueOf(request.getParameter("idSku")).equals("")) {
            mensaje = "No se tiene identificada el SKU";
            isError = true;
        } else if ((!String.valueOf(request.getParameter("idSku").replace("¡", "").replace("!", "").replace("+", "").trim()).equals(String.valueOf(request.getParameter("txtProducto").replace("¡", "").replace("!", "").replace("+", "").trim())))
                && (!String.valueOf(request.getParameter("idEan").replace("¡", "").replace("!", "").replace("+", "").trim()).equals(String.valueOf(request.getParameter("txtProducto").replace("¡", "").replace("!", "").replace("+", "").trim())))
                && (!String.valueOf(request.getParameter("idUpc").replace("¡", "").replace("!", "").replace("+", "").trim()).equals(String.valueOf(request.getParameter("txtProducto").replace("¡", "").replace("!", "").replace("+", "").trim())))) {
            mensaje = "No corresponde al Producto del Pedido";
            isError = true;
        } else if (Integer.parseInt(request.getParameter("txtCantidad")) < 0) {
            mensaje = "La cantidad debe de ser mayor o igual a cero";
            isError = true;
        }
        FormSusrtidoEtapa3 formSusrtidoEtapa3 = new FormSusrtidoEtapa3(request.getParameter("txtProducto"), String.valueOf((request.getParameter("txtCantidad") != null) ? request.getParameter("txtCantidad") : ""), String.valueOf((request.getParameter("txtCantidad") != null) ? request.getParameter("txtCantidad") : ""), String.valueOf((request.getParameter("txtCantidad") != null) ? request.getParameter("txtCantidad") : ""));
        request.setAttribute("formSusrtidoEtapa3", formSusrtidoEtapa3);
        float cantidad = 0;
        request.setAttribute("mensaje", mensaje);
        try {
            cantidad = Float.parseFloat(String.valueOf(request.getParameter("txtCantidad")));
        } catch (Exception exception) {
            mensaje = exception.getMessage();
            isError = true;
        }
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
            send.forward(request, response);
            return;
        }
        ElementoPendienteDeSurtir elementoPendienteDeSurtir = (ElementoPendienteDeSurtir) request.getSession().getAttribute("elementoPendienteDeSurtir");
        request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
        send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
        if (elementoPendienteDeSurtir.getCantidadASurtir() == 0) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa1.jsp"));
        } //Debe de permitir pasar con cntidad igual a cero
        /*else if (cantidad < elementoPendienteDeSurtir.getCantidadASurtir()) {
            mensaje = "No se puede Capturar una cantidad menor [" + elementoPendienteDeSurtir.getCantidadASurtir() + "]";
            isError = true;
        } */ else if (cantidad > elementoPendienteDeSurtir.getCantidadASurtir()) {
            mensaje = "No se puede Capturar una mayor [" + elementoPendienteDeSurtir.getCantidadASurtir() + "]";
            isError = true;
        } else {
            Usuario user = (Usuario) request.getSession().getAttribute("usuario");
            ElementoPendienteDeSurtir oElementoPendienteDeSurtir = new ElementoPendienteDeSurtir();
            oElementoPendienteDeSurtir.setCantidadASurtir(cantidad);
            oElementoPendienteDeSurtir.setCantidadSurtida(cantidad);
            oElementoPendienteDeSurtir.setIdentificador(elementoPendienteDeSurtir.getIdentificador());
            oElementoPendienteDeSurtir.setPedido(new Pedido(elementoPendienteDeSurtir.getIdentificador()));
            Respuesta respuesta = blSurtido.surtirProducto(new Usuario(user.getIdentificador(), user.getUsuario(), user.getPassword()), oElementoPendienteDeSurtir);
            if (respuesta != null) {
                mensaje = respuesta.getMostarMensaje();
                isError = false;

                String[] numeros = ((String[]) request.getSession().getAttribute("numeros"));
                //ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(request.getParameter("cbPedido")))));
                ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(numeros[0].trim()))));
                if (listadoPedidoElementoPendienteDeSurtir != null && listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().size() > 0) {
                    elementoPendienteDeSurtir = listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().get(0);
                    request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
                    request.getSession().setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);

                } else {
                    surtidoEtapa1Seleccion(request, response);
                }
            }
            isError = respuesta.ExisteError();
            if (!isError) {
                send = request.getRequestDispatcher(Util.getURL("surtido_etapa2_maquila.jsp"));
            } else {
                send = request.getRequestDispatcher(Util.getURL("surtido_etapa3_maquila.jsp"));
            }
        }

        request.setAttribute("mensaje", mensaje);
        send.forward(request, response);

    }

    void ingresar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        Usuario usuario = ((Usuario) request.getSession().getAttribute("usuario"));
        //usuario.setClienteWms(new Cliente(Integer.parseInt(request.getParameter("cbCliente"))));
        usuario.getCuenta().setIdentificador(Integer.parseInt(request.getParameter("cbCliente")));

        BLCore.Usuario().nuevoLog(usuario);
        request.getSession().setAttribute("usuario", usuario);
        request.setAttribute("formulario", "Menú Principal WMS");
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("menu_principal.jsp"));
        send.forward(request, response);
    }

    void inventarioActivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        BLCalidad blCalidad = new BLCalidad();
        new ConexionDB(getServletConfig().getServletContext());
        ListadoCalidad listaCalidad = blCalidad.consultaTodosLista();
        request.getSession().setAttribute("listaCalidad", listaCalidad);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("inventario_activos.jsp"));
        FormInventario formInventario = new FormInventario("", "", "", "", "", "-1", "", "", 0, 1, 0, "");
        request.setAttribute("formulario", "Inventarios");
        request.getSession().setAttribute("formInventario", formInventario);
        send.forward(request, response);

    }

    void surtidoEtapa1Seleccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLPedido blPedido = new BLPedido();
        ListadoPedido listaPedido = blPedido.consultaPedidos(Pages.SURTIDO);
        request.setAttribute("listaPedido", listaPedido);
        request.setAttribute("formulario", "Selección de Pedido");
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("surtido_etapa1.jsp"));
        send.forward(request, response);

    }
//balo etiqueta.

    void surtidoMaquilaEtapa1Seleccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLPedido blPedido = new BLPedido();
        ListadoPedido listaPedido = blPedido.consultaPedidos(Pages.MAQUILA);
        request.setAttribute("listaPedido", listaPedido);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("surtido_etapa1_maquila.jsp"));
        send.forward(request, response);

    }

    void surtidoEtapa1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        boolean isError = false;
        if (request.getParameter("cbPedido") == null || String.valueOf(request.getParameter("cbPedido")).equals("") || String.valueOf(request.getParameter("cbPedido")).equals("-1")) {
            mensaje = "Se debe de Seleccionar Pedido";
            isError = true;
        }
        String numero = request.getParameter("cbPedido");
        String[] numeros = numero.split("-");
        //ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(request.getParameter("cbPedido")))));
        ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(numeros[0].trim()))));
        if (listadoPedidoElementoPendienteDeSurtir != null && listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().size() > 0) {
            ElementoPendienteDeSurtir elementoPendienteDeSurtir = listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().get(0);
            request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
            request.getSession().setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
            request.getSession().setAttribute("numeros", numeros);
        }
        RequestDispatcher send = null;
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa1.jsp"));
        } else {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa2.jsp"));
        }
        send.forward(request, response);

    }

    void surtidoEtapa1Maquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        boolean isError = false;
        if (request.getParameter("cbPedido") == null || String.valueOf(request.getParameter("cbPedido")).equals("") || String.valueOf(request.getParameter("cbPedido")).equals("-1")) {
            mensaje = "Se debe de Seleccionar Pedido";
            isError = true;
        }
        String numero = request.getParameter("cbPedido");
        String[] numeros = numero.split("-");
        //ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(request.getParameter("cbPedido")))));
        ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(numeros[0].trim()))));
        if (listadoPedidoElementoPendienteDeSurtir != null && listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().size() > 0) {
            ElementoPendienteDeSurtir elementoPendienteDeSurtir = listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().get(0);
            request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
            request.getSession().setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
            request.getSession().setAttribute("numeros", numeros);
        }
        RequestDispatcher send = null;
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa1_maquila.jsp"));
        } else {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa2_maquila.jsp"));
        }
        send.forward(request, response);

    }

    void surtidoEtapa2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        boolean isError = false;
        if (request.getParameter("txtLocalidad") == null || String.valueOf(request.getParameter("txtLocalidad")).equals("")) {
            mensaje = "Se debe de ingresar Localidad";
            isError = true;
        }
        ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(request.getParameter("cbPedido")))));
        if (listadoPedidoElementoPendienteDeSurtir != null && listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().size() > 0) {
            ElementoPendienteDeSurtir elementoPendienteDeSurtir = listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().get(0);
            request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
            request.getSession().setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = null;
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa1.jsp"));
        } else {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa2.jsp"));
        }
        send.forward(request, response);

    }

    void continuarSurtidoEtapa1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        boolean isError = false;
        if (request.getParameter("txtLocalidad") == null || String.valueOf(request.getParameter("txtLocalidad")).equals("")) {
            mensaje = "Se debe de ingresar Localidad";
            isError = true;
        } else if (request.getParameter("idLocalidad") == null || String.valueOf(request.getParameter("idLocalidad")).equals("")) {
            mensaje = "No se tiene identificada la localidad";
            isError = true;
        } else if (!String.valueOf(request.getParameter("idLocalidad")).equals(String.valueOf(request.getParameter("txtLocalidad")))) {
            mensaje = "No corresponde la localidad";
            isError = true;
        }
        request.setAttribute("elementoPendienteDeSurtir", request.getSession().getAttribute("elementoPendienteDeSurtir"));
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = null;
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa2.jsp"));
        } else {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
        }
        send.forward(request, response);

    }

    void continuarSurtidoEtapa1Maquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        boolean isError = false;
        if (request.getParameter("txtLocalidad") == null || String.valueOf(request.getParameter("txtLocalidad")).equals("")) {
            mensaje = "Se debe de ingresar Localidad";
            isError = true;
        } else if (request.getParameter("idLocalidad") == null || String.valueOf(request.getParameter("idLocalidad")).equals("")) {
            mensaje = "No se tiene identificada la localidad";
            isError = true;
        } else if (!String.valueOf(request.getParameter("idLocalidad")).equals(String.valueOf(request.getParameter("txtLocalidad")))) {
            mensaje = "No corresponde la localidad";
            isError = true;
        }
        request.setAttribute("elementoPendienteDeSurtir", request.getSession().getAttribute("elementoPendienteDeSurtir"));
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = null;
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa2.jsp"));
        } else {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
        }
        send.forward(request, response);

    }

    void setAcomodo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        String mensaje = "";
        FormAcomodo formAcomodo = new FormAcomodo("", "", "");
        request.getSession().setAttribute("formAcomodo", formAcomodo);
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = null;
        send = request.getRequestDispatcher(Util.getURL("acomodo.jsp"));
        send.forward(request, response);
    }

    void continuarSurtidoEtapa2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");

        new ConexionDB(getServletConfig().getServletContext());
        BLSurtido blSurtido = new BLSurtido();
        String mensaje = "";
        RequestDispatcher send = null;
        boolean isError = false;
        if (request.getParameter("txtProducto") == null || String.valueOf(request.getParameter("txtProducto")).equals("")) {
            mensaje = "Se debe de ingresar Producto";
            isError = true;
        }
        if (request.getParameter("txtCantidad") == null || String.valueOf(request.getParameter("txtCantidad")).equals("")) {
            mensaje = "Se debe de ingresar Cantidad";
            isError = true;
        } else if (request.getParameter("idSku") == null || String.valueOf(request.getParameter("idSku")).equals("")) {
            mensaje = "No se tiene identificada el SKU";
            isError = true;
        } else if ((!String.valueOf(request.getParameter("idSku").replace("¡", "").replace("!", "").replace("+", "").trim()).equals(String.valueOf(request.getParameter("txtProducto").replace("¡", "").replace("!", "").replace("+", "").trim())))
                && (!String.valueOf(request.getParameter("idEan").replace("¡", "").replace("!", "").replace("+", "").trim()).equals(String.valueOf(request.getParameter("txtProducto").replace("¡", "").replace("!", "").replace("+", "").trim())))
                && (!String.valueOf(request.getParameter("idUpc").replace("¡", "").replace("!", "").replace("+", "").trim()).equals(String.valueOf(request.getParameter("txtProducto").replace("¡", "").replace("!", "").replace("+", "").trim())))) {
            mensaje = "No corresponde al Producto del Pedido";
            isError = true;
        } else if (Integer.parseInt(request.getParameter("txtCantidad")) < 0) {
            mensaje = "La cantidad debe de ser mayor o igual a cero";
            isError = true;
        }
        FormSusrtidoEtapa3 formSusrtidoEtapa3 = new FormSusrtidoEtapa3(request.getParameter("txtProducto"), String.valueOf((request.getParameter("txtCantidad") != null) ? request.getParameter("txtCantidad") : ""), String.valueOf((request.getParameter("txtCantidad") != null) ? request.getParameter("txtCantidad") : ""), String.valueOf((request.getParameter("txtCantidad") != null) ? request.getParameter("txtCantidad") : ""));
        request.setAttribute("formSusrtidoEtapa3", formSusrtidoEtapa3);
        float cantidad = 0;
        request.setAttribute("mensaje", mensaje);
        try {
            cantidad = Float.parseFloat(String.valueOf(request.getParameter("txtCantidad")));
        } catch (Exception exception) {
            mensaje = exception.getMessage();
            isError = true;
        }
        if (isError) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
            send.forward(request, response);
            return;
        }
        ElementoPendienteDeSurtir elementoPendienteDeSurtir = (ElementoPendienteDeSurtir) request.getSession().getAttribute("elementoPendienteDeSurtir");
        request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
        send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
        if (elementoPendienteDeSurtir.getCantidadASurtir() == 0) {
            send = request.getRequestDispatcher(Util.getURL("surtido_etapa1.jsp"));
        } //Debe de permitir pasar con cntidad igual a cero
        /*else if (cantidad < elementoPendienteDeSurtir.getCantidadASurtir()) {
            mensaje = "No se puede Capturar una cantidad menor [" + elementoPendienteDeSurtir.getCantidadASurtir() + "]";
            isError = true;
        } */ else if (cantidad > elementoPendienteDeSurtir.getCantidadASurtir()) {
            mensaje = "No se puede Capturar una mayor [" + elementoPendienteDeSurtir.getCantidadASurtir() + "]";
            isError = true;
        } else {
            Usuario user = (Usuario) request.getSession().getAttribute("usuario");
            ElementoPendienteDeSurtir oElementoPendienteDeSurtir = new ElementoPendienteDeSurtir();
            oElementoPendienteDeSurtir.setCantidadASurtir(cantidad);
            oElementoPendienteDeSurtir.setCantidadSurtida(cantidad);
            oElementoPendienteDeSurtir.setIdentificador(elementoPendienteDeSurtir.getIdentificador());
            oElementoPendienteDeSurtir.setPedido(new Pedido(elementoPendienteDeSurtir.getIdentificador()));
            Respuesta respuesta = blSurtido.surtirProducto(new Usuario(user.getIdentificador(), user.getUsuario(), user.getPassword()), oElementoPendienteDeSurtir);
            if (respuesta != null) {
                mensaje = respuesta.getMostarMensaje();
                isError = false;

                String[] numeros = ((String[]) request.getSession().getAttribute("numeros"));
                //ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(request.getParameter("cbPedido")))));
                ListadoPedidoElementoPendienteDeSurtir listadoPedidoElementoPendienteDeSurtir = blSurtido.getElementoPedido(new Pedido(Integer.parseInt(String.valueOf(numeros[0].trim()))));
                if (listadoPedidoElementoPendienteDeSurtir != null && listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().size() > 0) {
                    elementoPendienteDeSurtir = listadoPedidoElementoPendienteDeSurtir.getListElementoPendienteDeSurtir().get(0);
                    request.setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);
                    request.getSession().setAttribute("elementoPendienteDeSurtir", elementoPendienteDeSurtir);

                } else {
                    surtidoEtapa1Seleccion(request, response);
                }
            }
            isError = respuesta.ExisteError();
            if (!isError) {
                send = request.getRequestDispatcher(Util.getURL("surtido_etapa2.jsp"));
            } else {
                send = request.getRequestDispatcher(Util.getURL("surtido_etapa3.jsp"));
            }
        }

        request.setAttribute("mensaje", mensaje);
        send.forward(request, response);

    }

    void ordenDeCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");

        BLCalidad blCalidad = new BLCalidad();
        new ConexionDB(getServletConfig().getServletContext());
        ListadoCalidad listaCalidad = blCalidad.consultaTodosLista();
        request.getSession().setAttribute("listaCalidad", listaCalidad);
        BLDocumento blDocumento = new BLDocumento();
        ListadoDocumento listaDocumento = blDocumento.consultaDocumentoParaRecepcionProductoLista(((Usuario) request.getSession().getAttribute("usuario")).getCuenta());
        request.getSession().setAttribute("listaDocumento", listaDocumento);
        FormOrdenCompra formOrdenCompra = new FormOrdenCompra("", "", "", "", "-1", "", "", 0, 1, "");
        request.getSession().setAttribute("formOrdenCompra", formOrdenCompra);
        request.setAttribute("formulario", "Órden de Compra");
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("recibo_orden_compra.jsp"));
        send.forward(request, response);

    }

    void registrarInventarioActivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        boolean isError = false;
        String mensaje = "";
        FormInventario formInventario = new FormInventario(String.valueOf(
                request.getParameter("txtReferencia")),
                String.valueOf(request.getParameter("txtLocalidad")),
                String.valueOf(request.getParameter("txtLpn")),
                String.valueOf(request.getParameter("txtProducto")),
                String.valueOf(request.getParameter("txtCantidad")),
                String.valueOf(request.getParameter("cbCalidad")),
                String.valueOf(request.getParameter("txtAnada")),
                String.valueOf(request.getParameter("txtMarbete")),
                Integer.parseInt(String.valueOf(request.getParameter("txtFiscal"))), 1, 0,
                String.valueOf(request.getParameter("txtVigencia"))
        );

        request.getSession().setAttribute("formInventario", formInventario);
        if (request.getParameter("txtReferencia") == null || String.valueOf(request.getParameter("txtReferencia")).equals("")) {
            mensaje = "Se debe de Ingresar la referencia";
            isError = true;
        } else if (request.getParameter("txtLocalidad") == null || String.valueOf(request.getParameter("txtLocalidad")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad";
            isError = true;
        } else if (request.getParameter("txtLpn") == null || String.valueOf(request.getParameter("txtLpn")).equals("")) {
            mensaje = "Se debe de Ingresar LPN";
            isError = true;
        } else if (request.getParameter("txtProducto") == null || String.valueOf(request.getParameter("txtProducto")).equals("")) {
            mensaje = "Se debe de Ingresar el producto";
            isError = true;
        } else if (request.getParameter("txtCantidad") == null || String.valueOf(request.getParameter("txtCantidad")).equals("")) {
            mensaje = "Se debe de Ingresar la cantidad";
            isError = true;
        } else if (request.getParameter("cbCalidad") == null || String.valueOf(request.getParameter("cbCalidad")).equals("") || String.valueOf(request.getParameter("cbCalidad")).equals("-1")) {
            mensaje = "Se debe de Ingresar la calidad";
            isError = true;
        }/*else if (request.getParameter("txtMarbete") == null || String.valueOf(request.getParameter("txtMarbete")).equals("")) {
         mensaje = "Se debe de Ingresar marbete";
         isError = true;
         }*/ else if (request.getParameter("txtFiscal") == null || String.valueOf(request.getParameter("txtFiscal")).equals("")) {
            mensaje = "Se debe seleccionar fiscal";
            isError = true;
        } else if (Integer.parseInt(request.getParameter("txtCantidad")) <= 0) {
            mensaje = "La cantidad debe de ser mayor a cero";
            isError = true;
        }

        if (!isError) {
            try {

                new ConexionDB(getServletConfig().getServletContext());
                Usuario user = ((Usuario) request.getSession().getAttribute("usuario"));
                BLInventario blInventario = new BLInventario();
                Respuesta respuesta = null;
                //Usuario usuario = new Usuario(0, user.getUsuario().toUpperCase(), user.getUsuario().toUpperCase());
                String Referencia = String.valueOf(request.getParameter("txtReferencia"));
                Lpn lpn = new Lpn(0, String.valueOf(request.getParameter("txtLpn")));
                Producto producto = new Producto(String.valueOf(request.getParameter("txtProducto")));
                int Cantidad = Integer.parseInt(String.valueOf(request.getParameter("txtCantidad")));
                Ubicacion ubicacion = new Ubicacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidad"))));
                Calidad calidad = new Calidad(Integer.parseInt(String.valueOf(request.getParameter("cbCalidad"))));
                Lote lote = new Lote(0);
                lote.setDescripcion(request.getParameter("txtAnada"));
                String serie = String.valueOf(request.getParameter("txtMarbete"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String fecha = ((request.getParameter("txtVigencia") != null) ? request.getParameter("txtVigencia") : null);
                Date caducidad = new Date();
                if (fecha != null) {
                    fecha = ((fecha.contains(".")) ? fecha.replace('.', '-') : fecha);
                    caducidad = formatter.parse(fecha);
                }

                int fiscal = Integer.parseInt(String.valueOf(request.getParameter("txtFiscal")));
                respuesta = blInventario.registraInventarioActivosDirecto(Referencia, lpn, producto, Cantidad, ubicacion, calidad, lote, serie, fiscal, caducidad, user);

                if (respuesta != null) {
                    if (!respuesta.ExisteError()) {
                        formInventario = new FormInventario(String.valueOf(
                                request.getParameter("txtReferencia")),
                                String.valueOf(request.getParameter("txtLocalidad")),
                                "",
                                "",
                                "",
                                String.valueOf(request.getParameter("cbCalidad")),
                                "",
                                "",
                                Integer.parseInt(String.valueOf(request.getParameter("txtFiscal"))), 0, 0,
                                String.valueOf(request.getParameter("txtVigencia"))
                        );

                        request.removeAttribute("txtProducto");
                        request.removeAttribute("txtCantidad");
                        request.getSession().setAttribute("formInventario", formInventario);

                    }
                    mensaje = respuesta.getMostarMensaje();

                }
            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("formulario", "Inventarios");
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("inventario_activos.jsp"));
        send.forward(request, response);

    }

    void registrarOrdenDeCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        boolean isError = false;
        String mensaje = "";
        FormOrdenCompra formOrdenCompra = new FormOrdenCompra(
                String.valueOf(request.getParameter("cbDocumento")),
                String.valueOf(request.getParameter("txtLpn")),
                String.valueOf(request.getParameter("txtProducto")),
                String.valueOf(request.getParameter("txtCantidad")),
                String.valueOf(request.getParameter("cbCalidad")),
                String.valueOf(request.getParameter("txtAnada")),
                String.valueOf(request.getParameter("txtMarbete")),
                Integer.parseInt(String.valueOf(request.getParameter("txtFiscal"))), 1,
                String.valueOf(request.getParameter("txtVigencia"))
        );
        request.getSession().setAttribute("formOrdenCompra", formOrdenCompra);

        if (request.getParameter("cbDocumento") == null || String.valueOf(request.getParameter("cbDocumento")).equals("")) {
            mensaje = "Se debe de Seleccionar un documento";
            isError = true;
        } else if (request.getParameter("txtLpn") == null || String.valueOf(request.getParameter("txtLpn")).equals("")) {
            mensaje = "Se debe de Ingresar LPN";
            isError = true;
        } else if (request.getParameter("txtProducto") == null || String.valueOf(request.getParameter("txtProducto")).equals("")) {
            mensaje = "Se debe de Ingresar el Producto";

            isError = true;
        } else if (request.getParameter("txtCantidad") == null || String.valueOf(request.getParameter("txtCantidad")).equals("")) {
            mensaje = "Se debe de Ingresar la Cantidad";

            isError = true;
        } else if (request.getParameter("cbCalidad") == null || String.valueOf(request.getParameter("cbCalidad")).equals("") || String.valueOf(request.getParameter("cbCalidad")).equals("-1")) {
            mensaje = "Se debe de Ingresar la calidad";

            isError = true;
        }/* else if (request.getParameter("txtAnada") == null || String.valueOf(request.getParameter("txtAnada")).equals("")) {
         mensaje = "Se debe de Ingresar la añada";

         isError = true;
         } else if (request.getParameter("txtMarbete") == null || String.valueOf(request.getParameter("txtMarbete")).equals("")) {
         mensaje = "Se debe de Ingresar el Marbete";

         isError = true;
         }*/ else if (request.getParameter("txtFiscal") == null || String.valueOf(request.getParameter("txtFiscal")).equals("")) {
            mensaje = "Se debe de Ingresar el numero de Serie";

            isError = true;
        }
        if (!isError) {
            try {
                Usuario user = (Usuario) request.getSession().getAttribute("usuario");

                RecepcionDeProducto recepcionDeProducto = new RecepcionDeProducto();
                recepcionDeProducto.setTipoDeMovimiento(TipoDeMovimiento.AGREGAR);
                recepcionDeProducto.setDocumento(new Documento(new TipoDeEntrada(), Integer.parseInt(String.valueOf(request.getParameter("cbDocumento")))));
                recepcionDeProducto.setTarima(new Tarima(1));
                recepcionDeProducto.setLPN(String.valueOf(request.getParameter("txtLpn")));
                recepcionDeProducto.setSku(String.valueOf(request.getParameter("txtProducto")));
                recepcionDeProducto.setCantidad(Double.parseDouble(String.valueOf(request.getParameter("txtCantidad"))));
                recepcionDeProducto.setCalidad(new Calidad(Integer.parseInt(String.valueOf(request.getParameter("cbCalidad")))));
                recepcionDeProducto.setLote(String.valueOf(request.getParameter("txtAnada")));
                recepcionDeProducto.setNumeroDeSerie(String.valueOf(request.getParameter("txtMarbete")));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = null;
                try {
                    String fecha = ((request.getParameter("txtVigencia") != null) ? request.getParameter("txtVigencia") : null);
                    if (fecha != null) {
                        fecha = ((fecha.contains(".")) ? fecha.replace('.', '-') : fecha);
                        date = formatter.parse(fecha);
                        System.out.println(date);
                        System.out.println(formatter.format(date));
                    } else {
                        date = new Date();
                    }

                } catch (ParseException e) {
                    date = new Date();
                    e.printStackTrace();
                }
                recepcionDeProducto.setCaducidad(date);

                Respuesta respuesta = BLCore.RecepcionDeProducto().recibirProductoFiscal(
                        new Usuario(user.getIdentificador(), "", ""), recepcionDeProducto,
                        Integer.parseInt(String.valueOf(request.getParameter("txtFiscal")))
                );
                if (!respuesta.ExisteError()) {
                    formOrdenCompra = new FormOrdenCompra(
                            String.valueOf(request.getParameter("cbDocumento")),
                            "",
                            "",
                            "",
                            String.valueOf(request.getParameter("cbCalidad")),
                            "",
                            "",
                            Integer.parseInt(String.valueOf(request.getParameter("txtFiscal"))), 0,
                            String.valueOf(request.getParameter("txtVigencia"))
                    );
                    request.getSession().setAttribute("formOrdenCompra", formOrdenCompra);
                }
                mensaje = respuesta.getMostarMensaje();

            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("formulario", "Registro");
            RequestDispatcher send = request.getRequestDispatcher(Util.getURL("recibo_orden_compra.jsp"));
        send.forward(request, response);

    }

    void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("txtUsuario") != null && request.getParameter("txtPassword") != null) {
            BLUsuario bLUsuario = new BLUsuario();
            Usuario usuario = new Usuario(0, String.valueOf(URLDecoder.decode(request.getParameter("txtUsuario"), "UTF-8")), URLDecoder.decode(String.valueOf(request.getParameter("txtPassword")), "UTF-8"));
            new ConexionDB(getServletConfig().getServletContext());
            usuario = bLUsuario.consulta(usuario);
            if (usuario == null) {
                RequestDispatcher send = request.getRequestDispatcher(Util.getURL("index.jsp"));
                request.setAttribute("mensaje", "Usuario No Válido");
                send.forward(request, response);
            } else {
                BLCore.Usuario().nuevoLog(usuario);
                request.getSession().setAttribute("usuario", usuario);
                request.setAttribute("formulario", "Selección Cliente");
                RequestDispatcher send = request.getRequestDispatcher(Util.getURL("listado.jsp"));
                send.forward(request, response);
            }
        } else {
            request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
            RequestDispatcher send = request.getRequestDispatcher(Util.getURL("index.jsp"));
            send.forward(request, response);
        }
    }

    void arrastreAcomodo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isError = false;
        String mensaje = "";

        if (request.getParameter("txtLpn") == null || String.valueOf(request.getParameter("txtLpn")).equals("")) {
            mensaje = "Se debe de Ingresar LPN";
            isError = true;
        } else if (request.getParameter("txtLocalidad") == null || String.valueOf(request.getParameter("txtLocalidad")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad";
            isError = true;
        }
        FormAcomodo formAcomodo = new FormAcomodo(request.getParameter("txtLpn"), request.getParameter("txtLocalidad"), request.getParameter("txtNumeroPiezas"));

        if (!isError) {
            try {
                Usuario user = (Usuario) request.getSession().getAttribute("usuario");
                String numero = request.getParameter("txtLocalidad");
                Localizacion pLocalidad = new Localizacion(Integer.parseInt(String.valueOf(numero)));
                numero = request.getParameter("txtLpn");
                String numeroPiezas = "0";
                if (request.getParameter("txtNumeroPiezas") != null && !request.getParameter("txtNumeroPiezas").equals("")) {
                    numeroPiezas = request.getParameter("txtNumeroPiezas");
                }
                Respuesta respuesta = BLCore.Acomodo().confirmarAcomodo(
                        user,
                        numero,
                        pLocalidad,
                        Integer.parseInt(numeroPiezas)
                );
                mensaje = respuesta.getMostarMensaje();
                if (mensaje.trim().equals("") || mensaje.trim().indexOf(".:") != -1) {
                    formAcomodo = new FormAcomodo("", "", "");
                }
            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.getSession().setAttribute("formAcomodo", formAcomodo);
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("acomodo.jsp"));
        send.forward(request, response);
    }

    void acomodo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("menu_acomodo.jsp"));
        send.forward(request, response);

    }

    void salir(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getSession().invalidate();
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("index.jsp"));
        send.forward(request, response);

    }

    void Ubicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        BLCalidad blCalidad = new BLCalidad();
        new ConexionDB(getServletConfig().getServletContext());
        ListadoCalidad listaCalidad = blCalidad.consultaTodosLista();
        request.getSession().setAttribute("listaCalidad", listaCalidad);
        new ConexionDB(getServletConfig().getServletContext());
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_ubicacion.jsp"));
        FormUbicacion formUbicacion = new FormUbicacion("", "", 0);
        request.getSession().setAttribute("formUbicacion", formUbicacion);
        send.forward(request, response);

    }

    void registrarTraspasoUbicacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        boolean isError = false;
        String mensaje = "";
        FormUbicacion formUbicacion = new FormUbicacion(String.valueOf(
                request.getParameter("txtOrigen")),
                String.valueOf(request.getParameter("txtDestino")), 0
        );

        request.getSession().setAttribute("formUbicacion", formUbicacion);
        if (request.getParameter("txtOrigen") == null || String.valueOf(request.getParameter("txtOrigen")).equals("")) {
            mensaje = "Se debe de Ingresar el origen";
            isError = true;
        } else if (request.getParameter("txtDestino") == null || String.valueOf(request.getParameter("txtDestino")).equals("")) {
            mensaje = "Se debe de Ingresar el destino";
            isError = true;
        }

        if (!isError) {
            try {

                new ConexionDB(getServletConfig().getServletContext());
                Usuario user = ((Usuario) request.getSession().getAttribute("usuario"));
                BLInventario blInventario = new BLInventario();
                Respuesta respuesta = null;
                Ubicacion ubicacion = new Ubicacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidad"))));
                //respuesta = blInventario.registraInventarioActivosDirecto();

                if (respuesta != null) {
                    if (!respuesta.ExisteError()) {
                        formUbicacion = new FormUbicacion(String.valueOf(
                                request.getParameter("txtOrigen")),
                                String.valueOf(request.getParameter("txtDestino")), 0);

                        request.getSession().setAttribute("formUbicacion", formUbicacion);

                    }
                    mensaje = respuesta.getMostarMensaje();

                }
            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_ubicacion.jsp"));
        send.forward(request, response);

    }

    void Piezas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        BLCalidad blCalidad = new BLCalidad();
        new ConexionDB(getServletConfig().getServletContext());
        ListadoCalidad listaCalidad = blCalidad.consultaTodosLista();
        request.getSession().setAttribute("listaCalidad", listaCalidad);
        new ConexionDB(getServletConfig().getServletContext());
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_piezas.jsp"));
        FormPiezas formPiezas = new FormPiezas("", "", "", "", "", "", "", 0);
        request.getSession().setAttribute("formPiezas", formPiezas);
        send.forward(request, response);

    }

    void registrarTraspasoPiezas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        boolean isError = false;
        String mensaje = "";
        FormPiezas formPiezas = new FormPiezas(String.valueOf(
                request.getParameter("txtLocalidadorigen")),
                String.valueOf(request.getParameter("txtLpnorigen")),
                String.valueOf(request.getParameter("txtProducto")),
                String.valueOf(request.getParameter("txtCantidad")),
                String.valueOf(request.getParameter("txtLocalidaddestino")),
                String.valueOf(request.getParameter("txtLpndestino")),
                String.valueOf(request.getParameter("cbCalidad")), 0
        );

        request.getSession().setAttribute("formPiezas", formPiezas);

        if (request.getParameter("txtLocalidadorigen") == null || String.valueOf(request.getParameter("txtLocalidadorigen")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad de origen";
            isError = true;
        } else if (request.getParameter("txtLpnorigen") == null || String.valueOf(request.getParameter("txtLpnorigen")).equals("")) {
            mensaje = "Se debe de Ingresar LPN de origen";
            isError = true;
        } else if (request.getParameter("txtProducto") == null || String.valueOf(request.getParameter("txtProducto")).equals("")) {
            mensaje = "Se debe de Ingresar el producto";
            isError = true;
        } else if (request.getParameter("txtCantidad") == null || String.valueOf(request.getParameter("txtCantidad")).equals("")) {
            mensaje = "Se debe de Ingresar la cantidad";
            isError = true;
        } else if (request.getParameter("txtLocalidaddestino") == null || String.valueOf(request.getParameter("txtLocalidaddestino")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad de destino";
            isError = true;
        } else if (request.getParameter("txtLpndestino") == null || String.valueOf(request.getParameter("txtLpndestino")).equals("")) {
            mensaje = "Se debe de Ingresar el LPN de destino";
            isError = true;
        } else if (request.getParameter("cbCalidad") == null || String.valueOf(request.getParameter("cbCalidad")).equals("")) {
            mensaje = "Se debe de Seleccionar estaus de Calidad";
            isError = true;
        }
        int cantidad = 0;
        try {
            cantidad = Integer.parseInt(request.getParameter("txtCantidad").toString());
        } catch (Exception exception) {
            exception.printStackTrace();
            mensaje = "Cantidad debe de ser un valor numerico";
            cantidad = 0;
        }
        if (cantidad <= 0) {
            if (mensaje.trim().equals("")) {
                mensaje = "La cantidad debe de ser mayor a cero";
            }
            isError = true;
        }

        if (!isError) {
            try {

                new ConexionDB(getServletConfig().getServletContext());
                Usuario user = ((Usuario) request.getSession().getAttribute("usuario"));
                BLTraspaso blTraspaso = new BLTraspaso();
                Respuesta respuesta = null;
                Localizacion localizacionOrigen = new Localizacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidadorigen"))));
                Localizacion localizacionDestino = new Localizacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidaddestino"))));
                Producto producto = new Producto(0);
                producto.setSku(request.getParameter("txtProducto"));
                respuesta = blTraspaso.confirmarTraspasoPieza(
                        user,
                        localizacionOrigen,
                        request.getParameter("txtLpnorigen").toString(),
                        localizacionDestino,
                        request.getParameter("txtLpndestino").toString(),
                        producto,
                        cantidad,
                        Integer.parseInt(request.getParameter("cbCalidad").toString())
                );

                if (respuesta != null) {
                    if (!respuesta.ExisteError()) {
                        formPiezas = new FormPiezas(
                                String.valueOf(request.getParameter("txtLocalidadorigen")),
                                String.valueOf(request.getParameter("txtLpnorigen")),
                                String.valueOf(request.getParameter("txtProducto")),
                                String.valueOf(request.getParameter("txtCantidad")),
                                String.valueOf(request.getParameter("txtLocalidaddestino")),
                                String.valueOf(request.getParameter("txtLpndestino")),
                                String.valueOf(request.getParameter("cbCalidad")),
                                0
                        );

                        request.getSession().setAttribute("formPiezas", formPiezas);

                    }
                    if (!respuesta.getErrorSql().equals("")) {
                        mensaje = respuesta.getErrorSql();
                    } else if (!respuesta.getMostarMensaje().equals("")) {
                        mensaje = respuesta.getMostarMensaje();
                    } else {
                        mensaje = respuesta.getMensaje();
                    }

                }
            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_piezas.jsp"));
        send.forward(request, response);

    }

    void Marbete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");

        new ConexionDB(getServletConfig().getServletContext());
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_marbete.jsp"));
        FormMarbete formMarbete = new FormMarbete("", "", "", "", "", "", "", 0);
        request.getSession().setAttribute("formMarbete", formMarbete);
        send.forward(request, response);

    }

    void registrarTraspasoMarbete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        boolean isError = false;
        String mensaje = "";
        FormMarbete formMarbete = new FormMarbete(String.valueOf(
                request.getParameter("txtLocalidadorigen")),
                String.valueOf(request.getParameter("txtLpnorigen")),
                String.valueOf(request.getParameter("txtProducto")),
                String.valueOf(request.getParameter("txtCantidad")),
                String.valueOf(request.getParameter("txtMarbete")),
                String.valueOf(request.getParameter("txtLocalidaddestino")),
                String.valueOf(request.getParameter("txtLpndestino")), 0
        );

        request.getSession().setAttribute("formMarbete", formMarbete);
        if (request.getParameter("txtLocalidadorigen") == null || String.valueOf(request.getParameter("txtLocalidadorigen")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad de origen";
            isError = true;
        } else if (request.getParameter("txtLpnorigen") == null || String.valueOf(request.getParameter("txtLpnorigen")).equals("")) {
            mensaje = "Se debe de Ingresar LPN de origen";
            isError = true;
        } else if (request.getParameter("txtProducto") == null || String.valueOf(request.getParameter("txtProducto")).equals("")) {
            mensaje = "Se debe de Ingresar el producto";
            isError = true;
        } else if (request.getParameter("txtCantidad") == null || String.valueOf(request.getParameter("txtCantidad")).equals("")) {
            mensaje = "Se debe de Ingresar la cantidad";
            isError = true;
        } else if (request.getParameter("txtMarbete") == null || String.valueOf(request.getParameter("txtMarbete")).equals("")) {
            mensaje = "Se debe de Ingresar el marbete";
            isError = true;
        } else if (request.getParameter("txtLocalidaddestino") == null || String.valueOf(request.getParameter("txtLocalidaddestino")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad de destino";
            isError = true;
        } else if (request.getParameter("txtLpndestino") == null || String.valueOf(request.getParameter("txtLpndestino")).equals("")) {
            mensaje = "Se debe de Ingresar el LPN de destino";
            isError = true;
        }

        if (!isError) {
            try {

                new ConexionDB(getServletConfig().getServletContext());
                Usuario user = ((Usuario) request.getSession().getAttribute("usuario"));
                BLInventario blInventario = new BLInventario();
                Respuesta respuesta = null;
                Ubicacion ubicacion = new Ubicacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidad"))));
                //respuesta = blInventario.registraInventarioActivosDirecto();

                if (respuesta != null) {
                    if (!respuesta.ExisteError()) {
                        formMarbete = new FormMarbete(
                                String.valueOf(request.getParameter("txtLocalidadorigen")),
                                String.valueOf(request.getParameter("txtLpnorigen")),
                                String.valueOf(request.getParameter("txtProducto")),
                                String.valueOf(request.getParameter("txtCantidad")),
                                String.valueOf(request.getParameter("txtMarbete")),
                                String.valueOf(request.getParameter("txtLocalidaddestino")),
                                String.valueOf(request.getParameter("txtLpndestino")), 0);

                        request.getSession().setAttribute("formMarbete", formMarbete);

                    }
                    mensaje = respuesta.getMostarMensaje();

                }
            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_marbete.jsp"));
        send.forward(request, response);

    }

    void Tarima(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        BLCalidad blCalidad = new BLCalidad();
        new ConexionDB(getServletConfig().getServletContext());
        ListadoCalidad listaCalidad = blCalidad.consultaTodosLista();
        request.getSession().setAttribute("listaCalidad", listaCalidad);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_tarima.jsp"));
        FormTarima formTarima = new FormTarima("", "", "", 0);
        request.getSession().setAttribute("formTarima", formTarima);
        send.forward(request, response);

    }

    void listarInventarioExistencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BLInventarioExistencia blInventario = new BLInventarioExistencia();
        new ConexionDB(getServletConfig().getServletContext());
        String elpn = (String) ((request.getParameter("elpn") != null) ? request.getParameter("elpn") : "");
        int Accion2 = ((request.getParameter("accion2")) != null ? Integer.parseInt(request.getParameter("accion2")) : 0);
        FormInventarioPosicion formInventario = new FormInventarioPosicion(elpn);
        ListadoPosicion listaInventario = null;
        if (!elpn.equals("")) {
            listaInventario = blInventario.consultaExistenciaxPosicion(String.valueOf(request.getParameter("elpn")), Accion2);
            request.getSession().setAttribute("listaInventario", listaInventario);
        }

        RequestDispatcher send;
        if (Accion2 != 0) {
            if (listaInventario != null) {
                for (int numero = 0; numero < listaInventario.getListCalidad().size(); numero++) {
                    formInventario.setCantidad(formInventario.getCantidad() + listaInventario.getListCalidad().get(numero).getCantidad());
                }
            }
            send = request.getRequestDispatcher(Util.getURL("inventario_sku.jsp"));
        } else {
            send = request.getRequestDispatcher(Util.getURL("inventario_posicion.jsp"));
        }
        request.setAttribute("formulario", "Inventario");
        request.getSession().setAttribute("formInventario", formInventario);
        send.forward(request, response);

    }

    void registrarTraspasoTarima(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        boolean isError = false;
        String mensaje = "";
        FormTarima formTarima = new FormTarima(String.valueOf(
                request.getParameter("txtLocalidadorigen")),
                String.valueOf(request.getParameter("txtTarima")),
                String.valueOf(request.getParameter("txtLocalidaddestino")), 0,
                String.valueOf(request.getParameter("cbCalidad"))
        );

        request.getSession().setAttribute("formTarima", formTarima);
        if (request.getParameter("txtLocalidadorigen") == null || String.valueOf(request.getParameter("txtLocalidadorigen")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad de origen";
            isError = true;
        } else if (request.getParameter("txtTarima") == null || String.valueOf(request.getParameter("txtTarima")).equals("")) {
            mensaje = "Se debe de Ingresar la tarima";
            isError = true;
        } else if (request.getParameter("txtLocalidaddestino") == null || String.valueOf(request.getParameter("txtLocalidaddestino")).equals("")) {
            mensaje = "Se debe de Ingresar la localidad de destino";
            isError = true;
        } else if (request.getParameter("cbCalidad") == null || String.valueOf(request.getParameter("cbCalidad")).equals("")) {
            mensaje = "Se debe de Seleccionar la Calidad del Producto";
            isError = true;
        }

        if (!isError) {
            try {

                new ConexionDB(getServletConfig().getServletContext());
                Usuario user = ((Usuario) request.getSession().getAttribute("usuario"));
                BLTraspaso blTraspaso = new BLTraspaso();
                Respuesta respuesta = null;
                Localizacion localizacionOrigen = new Localizacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidadorigen"))));
                Localizacion localizacionDestino = new Localizacion(Integer.parseInt(String.valueOf(request.getParameter("txtLocalidaddestino"))));
                String lpn = request.getParameter("txtTarima").toString();
                respuesta = blTraspaso.confirmarTraspaso(user, localizacionOrigen, lpn, localizacionDestino, Integer.parseInt(request.getParameter("cbCalidad").toString()));
                if (respuesta != null) {
                    if (!respuesta.ExisteError()) {
                        formTarima = new FormTarima(String.valueOf(
                                request.getParameter("txtLocalidadorigen")),
                                String.valueOf(request.getParameter("txtTarima")),
                                String.valueOf(request.getParameter("txtLocalidaddestino")), 0, request.getParameter("cbCalidad").toString());

                        request.getSession().setAttribute("formTarima", formTarima);
                    }
                    if (!respuesta.getMostarMensaje().trim().equals("")) {
                        mensaje = respuesta.getMostarMensaje();
                    } else {
                        mensaje = respuesta.getMensaje();
                    }
                }
            } catch (Exception exception) {
                mensaje = exception.getMessage();
            }
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("traspaso_tarima.jsp"));
        send.forward(request, response);

    }

    void asociarMaquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquilaEtapa1 formMaquilaEtapa1 = new FormMaquilaEtapa1();
        try {
            //formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaDocumentosEnProceso());
        } catch (Exception e) {
            request.getSession().setAttribute("mensaje", "Error al recuperar Catalogo");
        }

        request.getSession().setAttribute("formMaquilaEtapa1", formMaquilaEtapa1);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("surtido_etapa1.jsp"));
        //RequestDispatcher send = request.getRequestDispatcher("sur.jsp");
        send.forward(request, response);

    }

    void asociarTaquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaDocumentosEnProceso());
        } catch (Exception e) {
            request.getSession().setAttribute("mensaje", "Error al recuperar Catalogo de documentos");
        }

        request.getSession().setAttribute("formMaquila", formMaquila);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_asociar.jsp"));
        send.forward(request, response);

    }

    void asociarMaquilaRegistro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        Respuesta oRespuesta = new Respuesta();
        Maquila maquila = new Maquila();
        maquila.setIdentificador(Integer.parseInt(request.getParameter("idDocumento")));
        maquila.getLpn().setDescripcion(request.getParameter("txtLpnAsignar"));

        if (request.getParameter("txtLpnAsignar") == null) {
            oRespuesta.setExisteError(true);
            oRespuesta.setMensaje("Debes ingresar un lpn para asignar");
        }
        if (!oRespuesta.ExisteError()) {

            try {
                oRespuesta = BLCore.Maquila().insertaLpnAMaquila(maquila);
            } catch (Exception e) {
            }
        }
        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaDocumentosEnProceso());

        } catch (Exception e) {
        }
        request.setAttribute("respuesta", oRespuesta);
        request.getSession().setAttribute("formMaquila", formMaquila);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_asociar.jsp"));
        send.forward(request, response);

    }

    void iniciarMaquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaIniciarMaquila());
        } catch (Exception e) {
            request.getSession().setAttribute("mensaje", "Error al recuperar Catalogo de documentos");
        }

        request.getSession().setAttribute("formMaquila", formMaquila);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_iniciar.jsp"));
        send.forward(request, response);

    }

    void iniciarMaquilaRegistro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        Respuesta oRespuesta = new Respuesta();
        Maquila maquila = new Maquila();

        maquila.setNoPacks(Integer.parseInt(request.getParameter("txtPacks")));
        maquila.setLote(String.valueOf(request.getParameter("txtLote")));
        maquila.setIdentificador(Integer.parseInt(request.getParameter("idDocumento")));
        maquila.setNoCharolas(Integer.parseInt(request.getParameter("txtCharolas")));
        maquila.setNoPallet(request.getParameter("txtNoPallet"));

        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaIniciarMaquila());
            oRespuesta = BLCore.Maquila().insertarDetalleMaquila(maquila);
        } catch (Exception e) {
            request.getSession().setAttribute("mensaje", "Error al recuperar Catalogo de documentos");
        }

        request.getSession().setAttribute("formMaquila", formMaquila);
        request.setAttribute("respuesta", oRespuesta);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_iniciar.jsp"));
        send.forward(request, response);

    }

    void cerrarMaquila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaCierreMaquila());
        } catch (Exception e) {
            request.getSession().setAttribute("mensaje", "Error al recuperar Catalogo de documentos");
        }

        request.getSession().setAttribute("formMaquila", formMaquila);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_cierre.jsp"));
        send.forward(request, response);

    }

    void cerrarMaquilaRegistro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        Respuesta oRespuesta = new Respuesta();
        Maquila maquila = new Maquila();
        maquila.setIdentificador(Integer.parseInt(request.getParameter("idDocumento")));

        if (!oRespuesta.ExisteError()) {

            try {
                oRespuesta = BLCore.Maquila().cerarMaquila(maquila);
            } catch (Exception e) {
            }
        }
        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaCierreMaquila());

        } catch (Exception e) {
        }
        request.setAttribute("respuesta", oRespuesta);
        request.getSession().setAttribute("formMaquila", formMaquila);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_cierre.jsp"));
        send.forward(request, response);

    }

    void cerrarDetalleMaquilaRegistro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        new ConexionDB(getServletConfig().getServletContext());
        FormMaquila formMaquila = new FormMaquila();
        Respuesta oRespuesta = new Respuesta();
        Maquila maquila = new Maquila();
        maquila.setIdentificador(Integer.parseInt(request.getParameter("idDocumento")));
        formMaquila.setIdentificadorDocumento(Integer.parseInt(request.getParameter("idDocumento")));
        if (!oRespuesta.ExisteError()) {

            try {
                formMaquila.setDetallesCierreMaquila(BLCore.Maquila().consultaDetalleCierreMaquila(maquila));
            } catch (Exception e) {
            }
        }
        try {
            formMaquila.setListaDocumentosMaquila(BLCore.Maquila().consultaCierreMaquila());

        } catch (Exception e) {
        }
        request.setAttribute("respuesta", oRespuesta);
        request.getSession().setAttribute("formMaquila", formMaquila);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("maquila_cierre.jsp"));
        send.forward(request, response);

    }

    void ordenDeCompraConsulta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");
        new ConexionDB(getServletConfig().getServletContext());
        BLDocumento blDocumento = new BLDocumento();
        ListadoDocumento listaDocumento = blDocumento.consultaDocumentoParaRecepcionProductoLista(((Usuario) request.getSession().getAttribute("usuario")).getCuenta());
        request.getSession().setAttribute("listaDocumento", listaDocumento);
        FormOrdenCompra formOrdenCompra = new FormOrdenCompra("", "", "", "", "-1", "", "", 0, 1, "");
        request.getSession().setAttribute("formOrdenCompra", formOrdenCompra);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("recibo_orden_consulta.jsp"));
        send.forward(request, response);

    }

    void ordenDeCompraConsultaDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setAttribute("mensaje", "Debe de Ingresar Usuario/Contraseña");

        BLCalidad blCalidad = new BLCalidad();
        new ConexionDB(getServletConfig().getServletContext());
        BLDocumento blDocumento = new BLDocumento();
        RecepcionDeProducto recepcionDeProducto = new RecepcionDeProducto();
        recepcionDeProducto.setDocumento(new Documento(new TipoDeEntrada(), Integer.parseInt(String.valueOf(request.getParameter("cbDocumento")))));
        ArrayList<RecepcionDeProducto> listaRecepcion = new ArrayList<RecepcionDeProducto>();
        try {
            listaRecepcion = BLCore.RecepcionDeProducto().consultarProductoRecibido(recepcionDeProducto);
        } catch (Exception e) {
        }

        ListadoDocumento listaDocumento = blDocumento.consultaDocumentoParaRecepcionProductoLista(((Usuario) request.getSession().getAttribute("usuario")).getCuenta());
        request.getSession().setAttribute("listaDocumento", listaDocumento);
        FormOrdenCompra formOrdenCompra = new FormOrdenCompra("", "", "", "", "-1", "", "", 0, 1, "");
        request.getSession().setAttribute("formOrdenCompra", formOrdenCompra);
        if (listaRecepcion.size() == 0) {
            request.setAttribute("mensaje", "No hay datos  asignados a este documento");
        }
        request.setAttribute("listaRecepcionProducto", listaRecepcion);
        RequestDispatcher send = request.getRequestDispatcher(Util.getURL("recibo_orden_consulta.jsp"));
        send.forward(request, response);

    }

    //el codigo para registrar
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

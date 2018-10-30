/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

/**
 *
 * @author omarsorianoz
 */
public class FormSusrtidoEtapa3 {
    private String producto;
    private String cantidad;
    private String upc;

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public String getEan() {
        return ean;
    }

    public void setEan(String ean) {
        this.ean = ean;
    }
    private String ean;

    public FormSusrtidoEtapa3(String producto, String cantidad,String upc,String ean) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.upc=upc;
        this.ean = ean;
    }
    

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }
}

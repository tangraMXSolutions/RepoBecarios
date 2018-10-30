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
public class FormOrdenCompra {
    private String documento;
    private String lpn;
    private String producto;
    private String cantidad;
    private String calidad;
    private String anada;
    private String marbete;
    private String vigencia;
    private int fiscal;
    private int primera;

    public FormOrdenCompra(String documento, String lpn, String producto, String cantidad, String calidad, String anada, String marbete, int fiscal,int primera,String vigencia) {
        this.documento = documento;
        this.lpn = lpn;
        this.producto = producto;
        this.cantidad = cantidad;
        this.calidad = calidad;
        this.anada = anada;
        this.marbete = marbete;
        this.fiscal = fiscal;
        this.primera=primera;
        this.vigencia=vigencia;
    }
    

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getLpn() {
        return lpn;
    }

    public void setLpn(String lpn) {
        this.lpn = lpn;
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

    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }

    public String getAnada() {
        return anada;
    }

    public void setAnada(String anada) {
        this.anada = anada;
    }

    public String getMarbete() {
        return marbete;
    }

    public void setMarbete(String marbete) {
        this.marbete = marbete;
    }

    public int getFiscal() {
        return fiscal;
    }

    public void setFiscal(int fiscal) {
        this.fiscal = fiscal;
    }

    /**
     * @return the primera
     */
    public int getPrimera() {
        return primera;
    }

    /**
     * @param primera the primera to set
     */
    public void setPrimera(int primera) {
        this.primera = primera;
    }

    /**
     * @return the vigencia
     */
    public String getVigencia() {
        return vigencia;
    }

    /**
     * @param vigencia the vigencia to set
     */
    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
    }
    
}

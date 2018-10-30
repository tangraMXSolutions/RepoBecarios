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
public class FormInventario {
    private String referencia;
    private String localidad;
    private String lpn;
    private String producto;
    private String cantidad;
    private int primera;
    private int guardar;
    private String vigencia;
    
    public FormInventario()
    {}

    public FormInventario(String referencia, String localidad, String lpn, String producto, String cantidad, String calidad, String anada, String marbete, int fiscal,int primera,int guardar,String vigencia) {
        this.referencia = referencia;
        this.localidad = localidad;
        this.vigencia=vigencia;
        this.lpn = lpn;
        this.producto = producto;
        this.cantidad = cantidad;
        this.calidad = calidad;
        this.anada = anada;
        this.marbete = marbete;
        this.fiscal = fiscal;
        this.primera = primera;
        this.guardar=guardar;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
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
    private String calidad;
    private String anada;
    private String marbete;
    private int fiscal;

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
     * @return the guardar
     */
    public int getGuardar() {
        return guardar;
    }

    /**
     * @param guardar the guardar to set
     */
    public void setGuardar(int guardar) {
        this.guardar = guardar;
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

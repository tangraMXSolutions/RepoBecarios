/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

/**
 *
 * @author PC
 */
public class FormPiezas {
    
    private String localidadorigen;
    private String lpnorigen;
    private String producto;
    private String cantidad;
    private String localidaddestino;
    private String lpndestino;
    private String calidad;
    private int guardar;

    public FormPiezas(String localidadorigen, String lpnorigen, String producto, String cantidad, String localidaddestino, String lpndestino, int guardar) {
        this.localidadorigen = localidadorigen;
        this.lpnorigen = lpnorigen;
        this.producto = producto;
        this.cantidad = cantidad;
        this.localidaddestino = localidaddestino;
        this.lpndestino = lpndestino;
        this.guardar = guardar;
    }

    public FormPiezas(String localidadorigen, String lpnorigen, String producto, String cantidad, String localidaddestino, String lpndestino, String calidad, int guardar) {
        this.localidadorigen = localidadorigen;
        this.lpnorigen = lpnorigen;
        this.producto = producto;
        this.cantidad = cantidad;
        this.localidaddestino = localidaddestino;
        this.lpndestino = lpndestino;
        this.calidad = calidad;
        this.guardar = guardar;
    }

    public String getLocalidadorigen() {
        return localidadorigen;
    }

    public void setLocalidadorigen(String localidadorigen) {
        this.localidadorigen = localidadorigen;
    }

    public String getLpnorigen() {
        return lpnorigen;
    }

    public void setLpnorigen(String lpnorigen) {
        this.lpnorigen = lpnorigen;
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

    public String getLocalidaddestino() {
        return localidaddestino;
    }

    public void setLocalidaddestino(String localidaddestino) {
        this.localidaddestino = localidaddestino;
    }

    public String getLpndestino() {
        return lpndestino;
    }

    public void setLpndestino(String lpndestino) {
        this.lpndestino = lpndestino;
    }

    public int getGuardar() {
        return guardar;
    }

    public void setGuardar(int guardar) {
        this.guardar = guardar;
    }

    /**
     * @return the calidad
     */
    public String getCalidad() {
        return calidad;
    }

    /**
     * @param calidad the calidad to set
     */
    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }
    
    
}

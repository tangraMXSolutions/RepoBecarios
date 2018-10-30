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
public class FormMarbete {
    private String localidadorigen;
    private String lpnorigen;
    private String producto;
    private String cantidad;
    private String marbete;
    private String localidaddestino;
    private String lpndestino;
    private int guardar;

    public FormMarbete(String localidadorigen, String lpnorigen, String producto, String cantidad, String marbete, String localidaddestino, String lpndestino, int guardar) {
        this.localidadorigen = localidadorigen;
        this.lpnorigen = lpnorigen;
        this.producto = producto;
        this.cantidad = cantidad;
        this.marbete = marbete;
        this.localidaddestino = localidaddestino;
        this.lpndestino = lpndestino;
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

    public String getMarbete() {
        return marbete;
    }

    public void setMarbete(String marbete) {
        this.marbete = marbete;
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
    
    
}

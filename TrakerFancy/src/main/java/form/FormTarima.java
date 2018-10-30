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
public class FormTarima {
    
    private String localidadorigen;
    private String tarima;
    private String localidaddestino;
    private int guardar;
    private String calidad;

    public FormTarima(String localidadorigen, String tarima, String localidaddestino, int guardar) {
        this.localidadorigen = localidadorigen;
        this.tarima = tarima;
        this.localidaddestino = localidaddestino;
        this.guardar = guardar;
    }

    public FormTarima(String localidadorigen, String tarima, String localidaddestino, int guardar, String calidad) {
        this.localidadorigen = localidadorigen;
        this.tarima = tarima;
        this.localidaddestino = localidaddestino;
        this.guardar = guardar;
        this.calidad = calidad;
    }
    

    public String getLocalidadorigen() {
        return localidadorigen;
    }

    public void setLocalidadorigen(String localidadorigen) {
        this.localidadorigen = localidadorigen;
    }

    public String getTarima() {
        return tarima;
    }

    public void setTarima(String tarima) {
        this.tarima = tarima;
    }

    public String getLocalidaddestino() {
        return localidaddestino;
    }

    public void setLocalidaddestino(String localidaddestino) {
        this.localidaddestino = localidaddestino;
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

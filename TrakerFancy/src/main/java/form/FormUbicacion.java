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
public class FormUbicacion {
    private String origen;
    private String destino;
    private int guardar;

    public FormUbicacion(String origen, String destino, int guardar) {
        this.origen = origen;
        this.destino = destino;
        this.guardar = guardar;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getGuardar() {
        return guardar;
    }

    public void setGuardar(int guardar) {
        this.guardar = guardar;
    }
}

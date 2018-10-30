/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

import java.util.ArrayList;
import pojos.cia.Turno;
import pojos.core.Lpn;
import pojos.core.Maquila;
import pojos.core.Pedido;
import pojos.core.Producto;

/**
 *
 * @author sozo
 */
public class FormMaquilaEtapa1 {
    
    private ArrayList<Pedido> listaPedidosMaquila;
    private ArrayList<Maquila> listaMaquila;
    private ArrayList<Turno> listaTurno;
    private String idResposanble;
    private String nombreResponsable;
    private int numeroParticipantes;
    private int numeroProductoTerminado;
    private ArrayList<Producto> productos;
    
    
    public FormMaquilaEtapa1(){
    this.listaPedidosMaquila = new ArrayList<Pedido>();
    this.listaMaquila = new ArrayList<Maquila>();
    this.listaTurno = new ArrayList<Turno>();
    this.idResposanble="";
    this.nombreResponsable="";
    this.numeroParticipantes=0;
    this.numeroProductoTerminado=0;
    this.productos =  new ArrayList<Producto>();
    }

    public ArrayList<Pedido> getListaPedidosMaquila() {
        return listaPedidosMaquila;
    }

    public void setListaPedidosMaquila(ArrayList<Pedido> listaPedidosMaquila) {
        this.listaPedidosMaquila = listaPedidosMaquila;
    }

    public ArrayList<Maquila> getListaMaquila() {
        return listaMaquila;
    }

    public void setListaMaquila(ArrayList<Maquila> listaMaquila) {
        this.listaMaquila = listaMaquila;
    }

    public ArrayList<Turno> getListaTurno() {
        return listaTurno;
    }

    public void setListaTurno(ArrayList<Turno> listaTurno) {
        this.listaTurno = listaTurno;
    }

    public String getIdResposanble() {
        return idResposanble;
    }

    public void setIdResposanble(String idResposanble) {
        this.idResposanble = idResposanble;
    }

    public String getNombreResponsable() {
        return nombreResponsable;
    }

    public void setNombreResponsable(String nombreResponsable) {
        this.nombreResponsable = nombreResponsable;
    }

    public int getNumeroParticipantes() {
        return numeroParticipantes;
    }

    public void setNumeroParticipantes(int numeroParticipantes) {
        this.numeroParticipantes = numeroParticipantes;
    }

    public int getNumeroProductoTerminado() {
        return numeroProductoTerminado;
    }

    public void setNumeroProductoTerminado(int numeroProductoTerminado) {
        this.numeroProductoTerminado = numeroProductoTerminado;
    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

}

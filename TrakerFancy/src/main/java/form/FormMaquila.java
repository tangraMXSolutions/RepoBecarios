/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

import java.util.ArrayList;
import pojos.core.Lpn;
import pojos.core.Maquila;

/**
 *
 * @author Emmanuel
 */
public class FormMaquila {
    
    private Lpn lpn;
    private int identificadorDocumento;
    private String documento;
    private ArrayList<Lpn> listaLpn;
    private ArrayList<Maquila> listaDocumentosMaquila;
    private ArrayList<Maquila> detallesCierreMaquila;
    private String lote;
    private int charolas;
    private int packs;
    private int noPallets;
    
    
    public FormMaquila(){
    this.lpn = new Lpn();
    this.documento="";
    this.listaLpn = new ArrayList<Lpn>();
    this.listaDocumentosMaquila=new ArrayList<Maquila>();
     this.detallesCierreMaquila=new ArrayList<Maquila>();
    this.identificadorDocumento=0;
    this.lote="";
    this.packs=0;
    this.charolas=0;
    this.noPallets=0;
    }

    public FormMaquila(Lpn lpn, String documento) {
        this.lpn = lpn;
        this.documento = documento;
    }

    public FormMaquila(Lpn lpn, String documento, ArrayList<Lpn> listaLpn) {
        this.lpn = lpn;
        this.documento = documento;
        this.listaLpn = listaLpn;
    }
    
    
    

    /**
     * @return the lpn
     */
    public Lpn getLpn() {
        return lpn;
    }

    /**
     * @param lpn the lpn to set
     */
    public void setLpn(Lpn lpn) {
        this.lpn = lpn;
    }

    /**
     * @return the documento
     */
    public String getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(String documento) {
        this.documento = documento;
    }

    /**
     * @return the listaLpn
     */
    public ArrayList<Lpn> getListaLpn() {
        return listaLpn;
    }

    /**
     * @param listaLpn the listaLpn to set
     */
    public void setListaLpn(ArrayList<Lpn> listaLpn) {
        this.listaLpn = listaLpn;
    }

    /**
     * @return the listaDocumentosMaquila
     */
    public ArrayList<Maquila> getListaDocumentosMaquila() {
        return listaDocumentosMaquila;
    }

    /**
     * @param listaDocumentosMaquila the listaDocumentosMaquila to set
     */
    public void setListaDocumentosMaquila(ArrayList<Maquila> listaDocumentosMaquila) {
        this.listaDocumentosMaquila = listaDocumentosMaquila;
    }

    /**
     * @return the identificadorDocumento
     */
    public int getIdentificadorDocumento() {
        return identificadorDocumento;
    }

    /**
     * @param identificadorDocumento the identificadorDocumento to set
     */
    public void setIdentificadorDocumento(int identificadorDocumento) {
        this.identificadorDocumento = identificadorDocumento;
    }

    /**
     * @return the lote
     */
    public String getLote() {
        return lote;
    }

    /**
     * @param lote the lote to set
     */
    public void setLote(String lote) {
        this.lote = lote;
    }

    /**
     * @return the charolas
     */
    public int getCharolas() {
        return charolas;
    }

    /**
     * @param charolas the charolas to set
     */
    public void setCharolas(int charolas) {
        this.charolas = charolas;
    }

    /**
     * @return the packs
     */
    public int getPacks() {
        return packs;
    }

    /**
     * @param packs the packs to set
     */
    public void setPacks(int packs) {
        this.packs = packs;
    }

    /**
     * @return the noPallets
     */
    public int getNoPallets() {
        return noPallets;
    }

    /**
     * @param noPallets the noPallets to set
     */
    public void setNoPallets(int noPallets) {
        this.noPallets = noPallets;
    }

    /**
     * @return the detallesCierreMaquila
     */
    public ArrayList<Maquila> getDetallesCierreMaquila() {
        return detallesCierreMaquila;
    }

    /**
     * @param detallesCierreMaquila the detallesCierreMaquila to set
     */
    public void setDetallesCierreMaquila(ArrayList<Maquila> detallesCierreMaquila) {
        this.detallesCierreMaquila = detallesCierreMaquila;
    }
    
    
}

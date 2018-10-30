/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

/**
 *
 * @author Omar
 */
public class FormCodigo {
    private String sku;
    private String ean;
    private String upc;
    private String codigoDeBarra;
    private int existe;
    private String descripcion;

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
    
    public FormCodigo(String sku, String ean, String upc, String codigoDeBarra,String descripcion, int existe) {
        this.sku = sku;
        this.ean = ean;
        this.upc = upc;
        this.codigoDeBarra = codigoDeBarra;
        this.existe = existe;
        this.descripcion=descripcion;
    }

    public int getExiste() {
        return existe;
    }

    public void setExiste(int existe) {
        this.existe = existe;
    }
    

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getEan() {
        return ean;
    }

    public void setEan(String ean) {
        this.ean = ean;
    }

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public String getCodigoDeBarra() {
        return codigoDeBarra;
    }

    public void setCodigoDeBarra(String codigoDeBarra) {
        this.codigoDeBarra = codigoDeBarra;
    }

    public FormCodigo(String sku, String ean, String upc, String codigoDeBarra,String descripcion) {
        this.sku = sku;
        this.ean = ean;
        this.upc = upc;
        this.codigoDeBarra = codigoDeBarra;
        this.descripcion=descripcion;
    }
    
    
    
}

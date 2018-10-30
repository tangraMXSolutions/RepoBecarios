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
public class FormAcomodo {
    private String lpn;
    private String localidad;
    private String numeroPiezas;

    public String getNumeroPiezas() {
        return numeroPiezas;
    }

    public void setNumeroPiezas(String numeroPiezas) {
        this.numeroPiezas = numeroPiezas;
    }

    

    public FormAcomodo(String lpn, String localidad, String numeroPiezas) {
        this.lpn = lpn;
        this.localidad = localidad;
        this.numeroPiezas = numeroPiezas;
    }
    
    

    /**
     * @return the lpn
     */
    public String getLpn() {
        return lpn;
    }

    /**
     * @param lpn the lpn to set
     */
    public void setLpn(String lpn) {
        this.lpn = lpn;
    }

    /**
     * @return the localidad
     */
    public String getLocalidad() {
        return localidad;
    }

    /**
     * @param localidad the localidad to set
     */
    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    
}

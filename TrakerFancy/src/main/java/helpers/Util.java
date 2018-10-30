/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import constantes.*;

/**
 *
 * @author omarsorianoz
 */
public class Util {
    public static String getURL(String url){
        String tmpUrl=url;
        if(Version.VERSION_NAVEGADOR>=Version.VERSION_NAVEGADOR_TOPE)
            tmpUrl=url.replace(".jsp", "__.jsp");
        return tmpUrl;        
    }
    
}

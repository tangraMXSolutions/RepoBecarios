/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataBase;

import dalGeneral.generales.GlobalesDAL;
import javax.servlet.ServletContext;

/**
 *
 * @author omarsorianoz
 */
public class ConexionDB {
    
    public ConexionDB(ServletContext context) {
        this.Init(context);
    }
    
    private void Init(ServletContext context) {
        String DataBaseEngine = context.getInitParameter("DataBaseEngine");        
        String DataSource = context.getInitParameter("DataSource");        
        String DataBase = context.getInitParameter("DataBase");
        String User = context.getInitParameter("User");
        String Password = context.getInitParameter("Password");
        String Driver = context.getInitParameter("Driver");
        Integer Port = Integer.parseInt(context.getInitParameter("Port"));
        GlobalesDAL.ConexionPorProperties(DataBaseEngine, DataSource, DataBase, User, Password, Port, Driver);
    }
    
}

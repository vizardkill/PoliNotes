/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Logs;
import Modelos.ILogs;
import Modelos.Logs;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Logs {

    public controller_Logs() {
    }
    
    public boolean setLog(Logs log) {
        ILogs ldao = new DAO_Logs();
        boolean result = ldao.SetLog(log);
        return result;
    }
    
    public List<Logs> getLogs() {
        ILogs ldao = new DAO_Logs();
        List<Logs> listaLogs = ldao.getLogs();
        return listaLogs;
    }
    
}

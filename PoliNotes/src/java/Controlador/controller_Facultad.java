/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Facultad;
import Modelos.Facultad;
import Modelos.IFacultad;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Facultad {

    public controller_Facultad() {
    }
    
    public boolean setFacultad(Facultad fac) {
        IFacultad fdao = new DAO_Facultad();
        boolean result = fdao.setFacultad(fac);
        return result; 
    }
    
    public List<Object> getFacultad() {
        IFacultad fdao = new DAO_Facultad();
        List<Object> listaFacultad = fdao.getFacultad();
        return listaFacultad; 
    }
    
    public boolean updateFacultad(Facultad fac){
        IFacultad fdao = new DAO_Facultad();
        boolean result = fdao.updateFacultad(fac);
        return result; 
    }
    
    public boolean deleteFacultad(Facultad fac) {
        IFacultad fdao = new DAO_Facultad();
        boolean result = fdao.deleteFacultad(fac);
        return result; 
    }
    
}

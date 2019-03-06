/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Materia;
import Modelos.IMateria;
import Modelos.Materia;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Materias {

    public boolean setMateria(Materia ma) {
        IMateria dmateria = new DAO_Materia();
        boolean result = dmateria.setMateria(ma);
        return result;
    }

    public List<Object> getMateria() {
        IMateria dmateria = new DAO_Materia();
        List<Object> materias = dmateria.getMateria();
        return materias;
    }

    public boolean updateMateria(Materia ma) {
        IMateria dmateria = new DAO_Materia();
        boolean result = dmateria.updateMateria(ma);
        return result;
    }

    public boolean deleteMateria(Materia ma) {
        IMateria dmateria = new DAO_Materia();
        boolean result = dmateria.deleteMateria(ma);
        return result;
    }
    
    //**********************************PROCEDIMIENTOS ALMACENADOS**************************************
    public boolean P_ValidarMateria(String tipo, Materia ma) {
        IMateria dmateria = new DAO_Materia();
        boolean result = dmateria.P_ValidarMateria(tipo, ma);
        return result;
    }

}

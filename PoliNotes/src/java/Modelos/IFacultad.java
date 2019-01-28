/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.List;

/**
 *
 * @author clan-
 */
public interface IFacultad {
    
    public boolean setFacultad(Facultad fac);
    
    public List<Object> getFacultad();
    
    public boolean updateFacultad(Facultad fac);
    
    public boolean deleteFacultad(Facultad fac);
    
    //Procedimientos Almacenados
    public boolean P_ValidFacultad(String tipo, Facultad fac);
}

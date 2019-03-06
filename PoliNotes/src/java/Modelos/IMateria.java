/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.List;

/**
 *
 * @author scardonas
 */
public interface IMateria {
    
    public boolean setMateria(Materia ma);
    
    public List<Object> getMateria();
    
    public boolean updateMateria(Materia ma);
    
    public boolean deleteMateria(Materia ma);
    
    //Procedimientos Almacenados
    public boolean P_ValidarMateria(String tipo, Materia ma);
}

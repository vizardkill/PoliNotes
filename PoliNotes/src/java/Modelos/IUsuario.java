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
public interface IUsuario {

    public boolean setUser(Usuario user);

    public List<Usuario> getUser();

    public boolean updateUser(Usuario user);

    public boolean deleteUser(Usuario user);
    
    //Procedimientos Almacenados
    public boolean Login(Usuario user);

}

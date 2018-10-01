/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Usuario;
import Metodos.SecurityPass;
import Modelos.IUsuario;
import Modelos.Usuario;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Usuario {

    public boolean setUser(Usuario user) {
        SecurityPass md5 = new SecurityPass();
        String hash = md5.getMD5(user.getPASSWORD_USER());
        user.setPASSWORD_USER(hash);

        IUsuario udao = new DAO_Usuario();
        boolean result = udao.setUser(user);
        return result;
    }

    public void updateUser(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        udao.updateUser(user);
    }

    public boolean deleteUser(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.deleteUser(user);
        return result;
    }

    public List<Usuario> getUsers() {
        IUsuario udao = new DAO_Usuario();
        List<Usuario> users = udao.getUser();
        return users;
    }
    
    
    //**********************************PROCEDIMIENTOS ALMACENADOS**************************************
    public boolean P_Login(Usuario user) {
        SecurityPass md5 = new SecurityPass();
        String hash = md5.getMD5(user.getPASSWORD_USER());
        user.setPASSWORD_USER(hash);
        
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.P_Login(user);
        return result;
    }
    
    public boolean P_ValidUser(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.P_ValidUser(user);
        return result;
    }
    
    public boolean P_ValidEmail(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.P_ValidEmail(user);
        return result;
    }
    
    public boolean P_ValidDoc(Usuario user) {
        IUsuario udao = new DAO_Usuario();
        boolean result = udao.P_ValidDoc(user);
        return result;
    }
    
    
}

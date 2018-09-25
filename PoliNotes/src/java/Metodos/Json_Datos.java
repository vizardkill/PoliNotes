/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import Controlador.controller_Usuario;
import Modelos.Usuario;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import javax.servlet.http.HttpSession;

/**
 *
 * @author clan-
 */
public class Json_Datos {

    public Json_Datos() {
    }

    public String Json_Login(Usuario user, HttpSession session) {
        com.google.gson.JsonObject json = new JsonObject();
        controller_Usuario cuser = new controller_Usuario();
        boolean aux = cuser.P_Login(user);
        
        JsonArray array = new JsonArray();
        JsonObject item = new JsonObject();
        
    
        item.addProperty("response", aux);
        item.addProperty("nombre", user.getNOMBRE_USER());
        item.addProperty("apellidos", user.getAPELLIDOS_USER());
        item.addProperty("documento", user.getDOC_USER());

        
        array.add(item);
        
        json.add("HTTP", array);
        return json.toString();

    }
}

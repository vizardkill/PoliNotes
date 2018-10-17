/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import Controlador.controller_Logs;
import Controlador.controller_Usuario;
import Modelos.Logs;
import Modelos.Usuario;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author clan-
 */
public class Json_Datos {

    public Json_Datos() {
    }

    public String Json_Login(Usuario user) {
        com.google.gson.JsonObject json = new JsonObject();
        controller_Usuario cuser = new controller_Usuario();

        boolean aux = cuser.P_Login(user);
        if (aux) {
            JsonArray array = new JsonArray();
            JsonObject item = new JsonObject();

            item.addProperty("resulset", aux);
            item.addProperty("nombre", user.getNOMBRE_USER());
            item.addProperty("apellidos", user.getAPELLIDOS_USER());
            item.addProperty("documento", user.getDOC_USER());
            array.add(item);
            json.add("data", array);
            return json.toString();
        }
        return "false";
    }
    
    public String Json_Logs(Logs log) {
        com.google.gson.JsonObject json = new JsonObject();
        controller_Logs c_logs = new controller_Logs();
        List<Logs> listaLogs = c_logs.getLogs();
        
        JsonArray array = new JsonArray();
        for (Logs x : listaLogs) {
            JsonObject item = new JsonObject();
            
            item.addProperty("NOMBRE_USER", x.getNOMBRE_USER());
            item.addProperty("NOMBRE_TIPO_PERFIL",x.getNOMBRE_TIPO_PERFIL());
            item.addProperty("ACCCION_LOGS", x.getACCION_LOGS());
            item.addProperty("DESCRIPCION_LOGS", x.getDESCRIPCION_LOGS());
            item.addProperty("FECHA_LOGS", x.getFECHA_LOGS());
            array.add(item);
            
        }
        json.add("Logs", array);
        return json.toString();   
    }
}

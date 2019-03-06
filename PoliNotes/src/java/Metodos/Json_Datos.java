/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import Controlador.controller_Facultad;
import Controlador.controller_Logs;
import Controlador.controller_Materias;
import Controlador.controller_Tipo_Perfil;
import Controlador.controller_Usuario;
import Modelos.Facultad;
import Modelos.Logs;
import Modelos.Materia;
import Modelos.Tipo_Perfil;
import Modelos.Usuario;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.util.List;

/**
 *
 * @author clan-
 */
public class Json_Datos {

    public Json_Datos() {
    }

    public String Json_Login(Usuario user) {
        JsonObject json = new JsonObject();
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

    public String Json_Logs() {
        JsonObject json = new JsonObject();
        controller_Logs c_logs = new controller_Logs();
        List<Logs> listaLogs = c_logs.getLogs();

        JsonArray array = new JsonArray();
        for (Logs x : listaLogs) {
            JsonObject item = new JsonObject();

            item.addProperty("NOMBRE_USER", x.getNOMBRE_USER());
            item.addProperty("NOMBRE_TIPO_PERFIL", x.getNOMBRE_TIPO_PERFIL());
            item.addProperty("ACCCION_LOGS", x.getACCION_LOGS());
            item.addProperty("DESCRIPCION_LOGS", x.getDESCRIPCION_LOGS());
            item.addProperty("FECHA_LOGS", x.getFECHA_LOGS());
            array.add(item);

        }
        json.add("Logs", array);
        return json.toString();
    }

    public String Json_Facultad() {
        JsonObject json = new JsonObject();
        controller_Facultad c_Fac = new controller_Facultad();
        List<Object> listaFacultad = c_Fac.getFacultad();

        JsonArray array = new JsonArray();
        JsonObject item = new JsonObject();

        int aux = 0;

        for (final Object x : listaFacultad) {

            if (aux == 2) {
                aux = 0;
                array.add(item);
                item = new JsonObject();
            }

            if (x.getClass().equals(Facultad.class)) {
                aux = aux + 1;
                Facultad f = (Facultad) x;
                item.addProperty("ID_FACULTAD", f.getID_FACULTAD());
                item.addProperty("CODIGO_FACULTAD", f.getCODIGO_FACULTAD());
                item.addProperty("NOMBRE_FACULTAD", f.getNOMBRE_FACULTAD());
                item.addProperty("DECANO_FACULTAD", f.getDECANO_FACULTAD());
            }

            if (x.getClass().equals(Usuario.class)) {
                aux = aux + 1;
                Usuario u = (Usuario) x;
                item.addProperty("NOMBRE_APELLIDOS_USER", u.getNOMBRE_USER() + " " + u.getAPELLIDOS_USER());
                item.addProperty("CORREO_USER", u.getCORREO_USER());
                item.addProperty("CELULAR_USER", u.getCELULAR_USER());
            }
        }
        if (aux == 2) {
            array.add(item);
        }
        json.add("Facultades", array);
        return json.toString();
    }

    public String Json_Decanos_reg() {
        JsonObject json = new JsonObject();
        controller_Usuario c_user = new controller_Usuario();
        List<Usuario> listaDecanos = c_user.getUserDecano_reg();

        JsonArray array = new JsonArray();
        for (Usuario x : listaDecanos) {
            JsonObject item = new JsonObject();

            item.addProperty("DOC_USER", x.getDOC_USER());
            item.addProperty("NOMBRE_USER", x.getNOMBRE_USER());
            item.addProperty("APELLIDOS_USER", x.getAPELLIDOS_USER());
            array.add(item);
        }
        json.add("Decanos", array);
        return json.toString();
    }

    public String Json_Decanos_mod() {
        JsonObject json = new JsonObject();
        controller_Usuario c_user = new controller_Usuario();
        List<Usuario> listaDecanos = c_user.getUserDecano_mod();

        JsonArray array = new JsonArray();
        for (Usuario x : listaDecanos) {
            JsonObject item = new JsonObject();

            item.addProperty("DOC_USER", x.getDOC_USER());
            item.addProperty("NOMBRE_USER", x.getNOMBRE_USER());
            item.addProperty("APELLIDOS_USER", x.getAPELLIDOS_USER());
            array.add(item);
        }
        json.add("Decanos", array);
        return json.toString();
    }

    public String Json_Perfiles() {
        JsonObject json = new JsonObject();
        controller_Tipo_Perfil cperfil = new controller_Tipo_Perfil();
        List<Tipo_Perfil> listaPerfil = cperfil.getPerfil();

        JsonArray array = new JsonArray();
        for (Tipo_Perfil x : listaPerfil) {
            JsonObject item = new JsonObject();

            item.addProperty("ID_TIPO_PERFIL", x.getID_TIPO_PERFIL());
            item.addProperty("NOMBRE_TIPO_PERFIL", x.getNOMBRE_TIPO_PERFIL());
            array.add(item);
        }
        json.add("Perfiles", array);
        return json.toString();
    }
    
    public String Json_Usuarios() {
        JsonObject json = new JsonObject();
        controller_Usuario cuser = new controller_Usuario();
        List<Usuario> listaUsuarios = cuser.getUsers();

        JsonArray array = new JsonArray();
        for (Usuario x : listaUsuarios) {
            JsonObject item = new JsonObject();

            item.addProperty("DOC_USER", x.getDOC_USER());
            item.addProperty("NICK_USER", x.getNICK_USER());
            item.addProperty("NOMBRE_USER", x.getNOMBRE_USER());
            item.addProperty("APELLIDOS_USER", x.getAPELLIDOS_USER());
            item.addProperty("CELULAR_USER", x.getCELULAR_USER());
            item.addProperty("CORREO_USER", x.getCORREO_USER());
            
            array.add(item);
        }
        json.add("Usuarios", array);
        return json.toString();
    
    
    }

    public String Json_Materias() {
        JsonObject json = new JsonObject();
        controller_Materias cmateria = new controller_Materias();
        List<Object> listamaterias = cmateria.getMateria();

        JsonArray array = new JsonArray();
        JsonObject item = new JsonObject();

        int aux = 0;
        
        for (final Object x : listamaterias) {

            if (aux == 2) {
                aux = 0;
                array.add(item);
                item = new JsonObject();
            }

            if (x.getClass().equals(Facultad.class)) {
                aux = aux + 1;
                Facultad f = (Facultad) x;
                item.addProperty("CODIGO_FACULTAD", f.getCODIGO_FACULTAD());
                item.addProperty("NOMBRE_FACULTAD", f.getNOMBRE_FACULTAD());
            }

            if (x.getClass().equals(Materia.class)) {
                aux = aux + 1;
                Materia m = (Materia) x;
                item.addProperty("ID_MATERIA", m.getID_MATERIA());
                item.addProperty("CODIGO_MATERIA", m.getCODIGO_MATERIA());
                item.addProperty("NOMBRE_MATERIA", m.getNOMBRE_MATERIA());
            }
        }
        if (aux == 2) {
            array.add(item);
        }
        json.add("Materias", array);
        return json.toString();
    }
}

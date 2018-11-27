/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Tipo_Perfil;
import Modelos.ITipo_Perfil;
import Modelos.Tipo_Perfil;
import java.util.List;

/**
 *
 * @author scardonas
 */
public class controller_Tipo_Perfil {

    public boolean setPerfil(Tipo_Perfil perfil) {
        ITipo_Perfil tdao = new DAO_Tipo_Perfil();
        boolean result = tdao.setPerfil(perfil);
        return result;
    }

    public boolean updatePerfil(Tipo_Perfil perfil) {
        ITipo_Perfil tdao = new DAO_Tipo_Perfil();
        boolean result = tdao.updatePerfil(perfil);
        return result;
    }

    public boolean deletePerfil(Tipo_Perfil perfil) {
        ITipo_Perfil tdao = new DAO_Tipo_Perfil();
        boolean result = tdao.deletePerfil(perfil);
        return result;
    }

    public List<Tipo_Perfil> getPerfil() {
        ITipo_Perfil tdao = new DAO_Tipo_Perfil();
        List<Tipo_Perfil> listaPerfil = tdao.getPerfil();
        return listaPerfil;
    }
}

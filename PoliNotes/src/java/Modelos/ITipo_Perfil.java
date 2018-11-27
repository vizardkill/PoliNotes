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
public interface ITipo_Perfil {
    
    public boolean setPerfil(Tipo_Perfil perfil);

    public List<Tipo_Perfil> getPerfil();

    public boolean updatePerfil(Tipo_Perfil perfil);

    public boolean deletePerfil(Tipo_Perfil perfil);
}

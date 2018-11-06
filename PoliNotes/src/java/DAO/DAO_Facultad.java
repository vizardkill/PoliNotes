/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Modelos.Facultad;
import Modelos.IFacultad;
import Modelos.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 *
 * @author clan-
 */
public class DAO_Facultad implements IFacultad{

    @Override
    public boolean setFacultad(Facultad fac) {
        Connection con;
        String sql = "INSERT INTO FACULTAD(ID_FACULTAD, CODIGO_FACULTAD, NOMBRE_FACULTAD, DECANO_FACULTAD) VALUES(?,?,?,?)";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, fac.getID_FACULTAD());
                ps.setString(2, fac.getCODIGO_FACULTAD());
                ps.setString(3, fac.getNOMBRE_FACULTAD());
                ps.setString(4, fac.getDECANO_FACULTAD());
                

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Facultad, método registrar: " + e);
            return false;
        }
        return true;
    }

    @Override
    public List<Object> getFacultad() {
        Connection con;
        Statement stm;
        ResultSet rs;

        String sql = "SELECT * FROM v_Facultad ORDER BY NOMBRE_FACULTAD";

        List<Facultad> listaFacultad = new ArrayList<>();
        List<Usuario> listaUsuario = new ArrayList<>();
        List<Object> result = new ArrayList<Object>();

        try {
            con = Conexion.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Facultad fac = new Facultad();
                Usuario user = new Usuario();
                
                fac.setID_FACULTAD(rs.getInt("ID_FACULTAD"));
                fac.setCODIGO_FACULTAD(rs.getString("CODIGO_FACULTAD"));
                fac.setNOMBRE_FACULTAD(rs.getString("NOMBRE_FACULTAD"));
                fac.setDECANO_FACULTAD(rs.getString("DECANO_FACULTAD"));
                listaFacultad.add(fac);
                
                user.setNOMBRE_USER(rs.getString("NOMBRE_USER"));
                user.setAPELLIDOS_USER(rs.getString("APELLIDOS_USER"));
                user.setCORREO_USER(rs.getString("CORREO_USER"));
                user.setCELULAR_USER(rs.getString("CELULAR_USER"));
                listaUsuario.add(user);    
            }
            result.addAll(listaFacultad);
            result.addAll(listaUsuario);
            
            stm.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_FACULTAD, método obtener");
        }
        return result;
    }

    @Override
    public boolean updateFacultad(Facultad fac) {
        Connection con;

        String sql = "UPDATE FACULTAD SET "
                + "CODIGO_FACULTAD   = ?, "
                + "NOMBRE_FACULTAD   = ?,"
                + "DECANO_FACULTAD   = ? "
                + "WHERE ID_FACULTAD = ?";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, fac.getCODIGO_FACULTAD());
                ps.setString(2, fac.getNOMBRE_FACULTAD());
                ps.setString(3, fac.getDECANO_FACULTAD());
                ps.setInt(4, fac.getID_FACULTAD());
                

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_FACULTAD, método actualizar");
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteFacultad(Facultad fac) {
        Connection con;

        String sql = "DELETE FROM FACULTAD WHERE ID_FACULTAD = ?";

        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, fac.getID_FACULTAD());
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_FACULTAD, método eliminar: " + e);
            return false;
        }
        return true;
    }
}

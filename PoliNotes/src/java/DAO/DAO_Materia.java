/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Conexion.Conexion;
import Modelos.Facultad;
import Modelos.IMateria;
import Modelos.Materia;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author scardonas
 */
public class DAO_Materia implements IMateria {

    @Override
    public boolean setMateria(Materia ma) {
        Connection con;
        String sql = "INSERT INTO MATERIA VALUES(?,?,?,?)";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, ma.getID_MATERIA());
                ps.setString(2, ma.getCODIGO_MATERIA());
                ps.setString(3, ma.getNOMBRE_MATERIA());
                ps.setInt(4, ma.getFACULTAD_MATERIA());
                
                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Materia, método registrar: " + e);
            return false;
        }
        return true; }

    @Override
    public List<Object> getMateria() {
        Connection con;
        Statement stm;
        ResultSet rs;

        String sql = "SELECT * FROM v_Materias ORDER BY NOMBRE_MATERIA";

        List<Object> result = new ArrayList<>();

        try {
            con = Conexion.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Facultad fac = new Facultad();
                Materia ma = new Materia();

                fac.setCODIGO_FACULTAD(rs.getString("CODIGO_FACULTAD"));
                fac.setNOMBRE_FACULTAD(rs.getString("NOMBRE_FACULTAD"));
                result.add(fac);

                ma.setID_MATERIA(rs.getInt("ID_MATERIA"));
                ma.setCODIGO_MATERIA(rs.getString("CODIGO_MATERIA"));
                ma.setNOMBRE_MATERIA(rs.getString("NOMBRE_MATERIA"));
                result.add(ma);
            }

            stm.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Materia, método obtener" + e);
        }
        return result;
    }

    @Override
    public boolean updateMateria(Materia ma) {
        Connection con;

        String sql = "UPDATE MATERIA SET "
                + "CODIGO_MATERIA   = ?, "
                + "NOMBRE_MATERIA   = ?,"
                + "FACULTAD_MATERIA   = ? "
                + "WHERE ID_MATERIA = ?";
        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, ma.getCODIGO_MATERIA());
                ps.setString(2, ma.getNOMBRE_MATERIA());
                ps.setInt(3, ma.getFACULTAD_MATERIA());
                ps.setInt(4, ma.getID_MATERIA());

                ps.executeUpdate();
                ps.close();
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Materia, método actualizar: " + e);
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteMateria(Materia ma) {
        Connection con;

        String sql = "DELETE FROM MATERIA WHERE ID_MATERIA = ?";

        try {
            con = Conexion.getConexion();
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, ma.getID_MATERIA());
                ps.executeUpdate();
                ps.close();
            }
        } catch (SQLException e) {
            System.out.println("Error: Clase DAO_Materia, método eliminar: " + e);
            return false;
        }
        return true;
    }

    //**************************************************Procedimientos Almacenados******************************************************
    @Override
    public boolean P_ValidarMateria(String tipo, Materia ma) {
        Connection con;
        con = Conexion.getConexion();
        int valor;
        try (CallableStatement cst = con.prepareCall("{call Validaciones_Materia (?,?,?)}")) {

            cst.setString(1, tipo);
            
            if (tipo.equals("ValidarCodigoMateria")) {
                cst.setString(2, ma.getCODIGO_MATERIA());
            }

            if (tipo.equals("ValidarNombreMateria")) {
                cst.setString(2, ma.getNOMBRE_MATERIA());
            }   
            cst.registerOutParameter(3, java.sql.Types.INTEGER);

            cst.execute();

            valor = cst.getInt(3);

            cst.close();

        } catch (SQLException ex) {
            System.out.println("Error: Procedimiento Almacenado, método P_ValidarMateria: " + ex);
            return false;
        }

        if (valor == 1) {
            return true;
        }
        return false;
    }
    
    
    
}

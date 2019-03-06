/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.controller_Facultad;
import Controlador.controller_Materias;
import Controlador.controller_Tipo_Perfil;
import Controlador.controller_Usuario;
import Metodos.Json_Datos;
import Modelos.Facultad;
import Modelos.Materia;
import Modelos.Tipo_Perfil;
import Modelos.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author clan-
 */
public class Ingreso extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Ingreso</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ingreso at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Peticion = request.getParameter("Peticion");

        //************************************** Validaciones de la Tabla Usuario *********************************
        if (Peticion.equals("ValidarNickUsuario")) {
            Usuario user = new Usuario();
            user.setNICK_USER(request.getParameter("R_NICK_USER"));
            controller_Usuario cuser = new controller_Usuario();
            boolean result = cuser.P_ValidUser(Peticion, user);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarEmailUsuario")) {
            Usuario user = new Usuario();
            user.setCORREO_USER(request.getParameter("CORREO_USER"));
            controller_Usuario cuser = new controller_Usuario();
            boolean result = cuser.P_ValidUser(Peticion, user);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarDocUsuario")) {
            Usuario user = new Usuario();
            user.setDOC_USER(request.getParameter("DOC_USER"));
            controller_Usuario cuser = new controller_Usuario();
            boolean result = cuser.P_ValidUser(Peticion, user);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        //************************************** Validaciones de la Tabla Facultad *********************************
        if (Peticion.equals("ValidarCodigoFacultad")) {
            Facultad fac = new Facultad();
            if (request.getParameter("CODIGO_FACULTAD") != null && !request.getParameter("CODIGO_FACULTAD").isEmpty()) {
                fac.setCODIGO_FACULTAD(request.getParameter("CODIGO_FACULTAD").toUpperCase());
            }

            if (request.getParameter("MOD_CODIGO_FACULTAD") != null && !request.getParameter("MOD_CODIGO_FACULTAD").isEmpty()) {
                fac.setCODIGO_FACULTAD(request.getParameter("MOD_CODIGO_FACULTAD").toUpperCase());
            }

            controller_Facultad cfac = new controller_Facultad();
            boolean result = cfac.P_ValidFacultad(Peticion, fac);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarNombreFacultad")) {
            Facultad fac = new Facultad();
            if (request.getParameter("NOMBRE_FACULTAD") != null && !request.getParameter("NOMBRE_FACULTAD").isEmpty()) {
                fac.setCODIGO_FACULTAD(request.getParameter("NOMBRE_FACULTAD").toUpperCase());
            }

            if (request.getParameter("MOD_NOMBRE_FACULTAD") != null && !request.getParameter("MOD_NOMBRE_FACULTAD").isEmpty()) {
                fac.setCODIGO_FACULTAD(request.getParameter("MOD_NOMBRE_FACULTAD").toUpperCase());
            }

            controller_Facultad cfac = new controller_Facultad();
            boolean result = cfac.P_ValidFacultad(Peticion, fac);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        //************************************** Validaciones de la Tabla Materia *********************************
        if (Peticion.equals("ValidarCodigoMateria")) {
            Materia ma = new Materia();
            if (request.getParameter("CODIGO_MATERIA") != null && !request.getParameter("CODIGO_MATERIA").isEmpty()) {
                ma.setCODIGO_MATERIA(request.getParameter("CODIGO_MATERIA").toUpperCase());
            }

            controller_Materias cma = new controller_Materias();
            boolean result = cma.P_ValidarMateria(Peticion, ma);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }

        if (Peticion.equals("ValidarNombreMateria")) {
            Materia ma = new Materia();
            if (request.getParameter("NOMBRE_MATERIA") != null && !request.getParameter("NOMBRE_MATERIA").isEmpty()) {
                ma.setCODIGO_MATERIA(request.getParameter("NOMBRE_MATERIA").toUpperCase());
            }

            controller_Materias cma = new controller_Materias();
            boolean result = cma.P_ValidarMateria(Peticion, ma);
            if (result) {
                response.getWriter().write("false");
            } else {
                response.getWriter().write("true");
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);
        Usuario user = new Usuario();
        user.setNICK_USER(request.getParameter("NICK_USER"));
        user.setPASSWORD_USER(request.getParameter("PASSWORD_USER"));

        Json_Datos login = new Json_Datos();
        if (login.Json_Login(user).equals("false")) {
            response.getWriter().write("false");
        } else {
            session.setAttribute("NICK_USER", user.getNICK_USER());
            session.setAttribute("NOMBRE_USER", user.getNOMBRE_USER());
            session.setAttribute("APELLIDOS_USER", user.getAPELLIDOS_USER());
            session.setAttribute("DOC_USER", user.getDOC_USER());
            request.getRequestDispatcher("JSP/Administrador/Inicio.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

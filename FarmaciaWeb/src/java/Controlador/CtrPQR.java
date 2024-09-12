/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.PQR;
import Modelo.PQRDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOME
 */
@WebServlet(name = "CtrPQR", urlPatterns = {"/CtrPQR"})
public class CtrPQR extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    PQRDAO pqrdao = new PQRDAO();
    PQR pqr = new PQR();
    int idpqr;
    List<PQR> listapqr = new ArrayList();
    List<PQR> listpqr = pqrdao.listarpqr();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom, cor, tel, tip, des;

        String accion = request.getParameter("accion");
        System.out.println("accion: " + accion);

        String usuarioID = (String) request.getSession().getAttribute("id");
        request.setAttribute("contador", listapqr.size());
        switch (accion) {
            case "CrearPQR":
                nom = request.getParameter("nombre");
                cor = request.getParameter("correo");
                tel = request.getParameter("telefono");
                tip = request.getParameter("tipo");
                des = request.getParameter("descripcion");

                PQR pqr = new PQR();
                pqr.setTblUsuID(usuarioID);
                pqr.setPqrNombre(nom);
                pqr.setPqrCorreo(cor);
                pqr.setPqrTelefono(tel);
                pqr.setPqrTipo(tip);
                pqr.setPqrDescripcion(des);

                pqrdao.crearPQR(pqr);
                listpqr = pqrdao.listarpqr();
                request.getRequestDispatcher("CtrProductoLi?accion=home").forward(request, response);
                break;

            case "listarPQR":
                request.setAttribute("pqr", listpqr);
                request.getRequestDispatcher("/Vistas/PqrAdm.jsp").forward(request, response);

                break;
            case "Estado":
                String idActu = request.getParameter("idp");
                System.out.println("Actualizar estado de PQR: " + idActu);
                boolean actualizado = pqrdao.estadoPQR(idActu, "Contestada");

                if (actualizado) {
                    listpqr = pqrdao.listarpqr();
                    request.setAttribute("pqr", listpqr);
                    request.getRequestDispatcher("CtrPQR?accion=listarPQR").forward(request, response);
                }
                break;

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
        processRequest(request, response);
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
        processRequest(request, response);
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

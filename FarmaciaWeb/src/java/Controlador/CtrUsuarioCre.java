/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author SENA
 */
public class CtrUsuarioCre extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario us = new Usuario();

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
            out.println("<title>Servlet CtrUsuarioCre</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrUsuarioCre at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public static String encriptarcontrasena(String password) {
        String passwordencriptado = BCrypt.hashpw(password, BCrypt.gensalt());
        return passwordencriptado;
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
        List<Usuario> list = dao.listarT();

        String id, nom, ape, dir, tel, cor, usu, pas, tip, idActu;
        String accion = request.getParameter("accion");
        System.out.println("accion: " + accion);
        switch (accion) {
            case "nuevo":

                id = request.getParameter("id");
                System.out.println("identificacion: " + id);
                nom = request.getParameter("nombre");
                ape = request.getParameter("apellido");
                dir = request.getParameter("direccion");
                tel = request.getParameter("telefono");
                cor = request.getParameter("email");
                usu = request.getParameter("usuario");
                pas = request.getParameter("contrasena");
                tip = "Usuario";

                us.setUsuid(id);
                us.setUsutipo(tip);
                us.setUsuusuario(usu);
                us.setUsunombre(nom);
                us.setUsuapellido(ape);
                us.setUsucorreo(cor);
                String contrasenaencriptada = encriptarcontrasena(pas);
                us.setUsucontrasena(contrasenaencriptada);
                us.setUsutelefono(tel);
                us.setUsudireccion(dir);

                dao.crear(us);
                list = dao.listarT();
                request.setAttribute("usuarios", list);
                request.getRequestDispatcher("Vistas/LogginPage.jsp?mensaje=0").forward(request, response);
                break;
            case "Listar":
                request.setAttribute("usuarios", list);
                request.getRequestDispatcher("/Vistas/ListarUsuariosAdm.jsp").forward(request, response);
                break;
            case "eliminarUsu":
                String ide = request.getParameter("idu");
                System.out.println("eliminar: " + ide);
                if (ide != null) {
                    dao.eliminarUsu(ide);
                    list = dao.listarT();
                    request.setAttribute("usuarios", list);
                    request.getRequestDispatcher("/Vistas/ListarUsuariosAdm.jsp").forward(request, response);
                } else {
                    System.out.println("El parámetro 'idu' es nulo");
                }
                break;

            case "tipoUsu":
                idActu = request.getParameter("id");
                System.out.println("Actualizar tipo Usuario " + idActu);
                boolean nuevotp = dao.tipoUsu(idActu, "Administrador");
                if (nuevotp) {
                    list = dao.listarT();
                    request.setAttribute("usuarios", list);
                    request.getRequestDispatcher("CtrUsuarioCre?accion=Listar").forward(request, response);
                }
                break;
            case "buscarn":
                 String nombreBusqueda = request.getParameter("nombre");
                 List<Usuario> listaFiltrada = dao.listarN(nombreBusqueda);
                 request.setAttribute("usuarios", listaFiltrada);
                 request.getRequestDispatcher("/Vistas/ListarUsuariosAdm.jsp").forward(request, response);
                break;
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

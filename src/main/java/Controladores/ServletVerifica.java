/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;
import Modelos.cBaseDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletVerifica", urlPatterns = {"/ServletVerifica"})
public class ServletVerifica extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String xnom = request.getParameter("xnom");
            String opcion = request.getParameter("opcion"); // Obtener la opción seleccionada

            cBaseDatos objDB = new cBaseDatos();

            // Verificar la opción seleccionada
            if ("cargos".equals(opcion)) {
                // Si la opción es "Cargos", redirigir a cargos.jsp
                HttpSession misession = request.getSession(true);
                misession.setAttribute("usuario", xnom.toUpperCase());
                response.sendRedirect("/WebJava04/cargos.jsp");
            } else if ("areas".equals(opcion)) {
                // Si la opción es "Áreas", redirigir a áreas.jsp
                HttpSession misession = request.getSession(true);
                misession.setAttribute("usuario", xnom.toUpperCase());
                response.sendRedirect("/WebJava04/areas.jsp");
            } else {
                // Opción no válida, redirigir al usuario a la página de inicio
                response.sendRedirect("/WebJava04/index.html");
            }
        } finally { 
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
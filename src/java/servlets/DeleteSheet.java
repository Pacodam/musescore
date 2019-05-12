/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.EjbMusic;
import entities.Sheetmusic;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
@WebServlet(name = "DeleteSheet", urlPatterns = {"/DeleteSheet"})
public class DeleteSheet extends HttpServlet {

     @EJB
    EjbMusic ejb;
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
        
            User u = (User) request.getSession(true).getAttribute("user");
            List<Sheetmusic> sheets = ejb.getSheetsFromUser(u);
            request.setAttribute("sheets", sheets);
            //primero recibimos el indicador de que se ha seleccionado un sheet para  borrar, solicitamos confirmación
           if (request.getParameter("send") != null) {
            int id = Integer.parseInt(request.getParameter("sheetId"));
             ejb.deleteSheet(id);
             request.setAttribute("status", "Sheet deleted. Redirecting to menu");
            request.getRequestDispatcher("/redirection.jsp").forward(request, response);
            
        }
           //si se ha producido la confirmación, se borra el sheet
        
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
         if(request.getParameter("send2") != null){
            int id = Integer.parseInt(request.getParameter("id"));
               System.out.println(id);
            ejb.deleteSheet(id);
             request.setAttribute("status", "Sheet deleted. Redirecting to menu");
            request.getRequestDispatcher("/redirection.jsp").forward(request, response);
          
          }
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

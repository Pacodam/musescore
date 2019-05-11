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
@WebServlet(name = "ModifySheet", urlPatterns = {"/ModifySheet"})
public class ModifySheet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        if (request.getParameter("send") != null) {
            int id = Integer.parseInt(request.getParameter("sheetId"));
            Sheetmusic s = ejb.getSheetById(id);
            System.out.println("**************" + s);
            request.setAttribute("sheet", s);
            User u = (User) request.getSession(true).getAttribute("user");
            List<Sheetmusic> sheets = ejb.getSheetsFromUser(u);
            request.setAttribute("sheets", sheets);
            request.getRequestDispatcher("/modifySheet.jsp").forward(request, response);
            
        }
        else if(request.getParameter("send2") != null){
            int id = Integer.parseInt(request.getParameter("sheetId"));
            //nos traemos el sheet
            String title = request.getParameter("title");
            String artist  = request.getParameter("artist");
            String instrument = request.getParameter("instrument");
            String genre = request.getParameter("genre");
            String difficulty  = request.getParameter("difficulty");
            Boolean printed  = Boolean.parseBoolean(request.getParameter("printed"));
            User u = (User) request.getSession(true).getAttribute("user");
            //User user = ejb.getUser((String) request.getParameter("user"));
            Sheetmusic sheet = new Sheetmusic();
            sheet.setIdsheetmusic(id);
            sheet.setArtist(artist);
            sheet.setTitle(title);
            sheet.setInstrument(instrument);
            sheet.setGenre(genre);
            sheet.setDifficulty(difficulty);
            sheet.setPrinted(printed);
            sheet.setOwner(u);

            ejb.modifySheet(sheet);
             request.setAttribute("status", "Sheet modified. Redirecting to menu");
            request.getRequestDispatcher("/redirection.jsp").forward(request, response);
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

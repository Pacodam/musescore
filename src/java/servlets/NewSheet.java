/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.EjbMusic;
import entities.Sheetmusic;
import entities.User;
import exceptions.MusicException;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "NewSheet", urlPatterns = {"/NewSheet"})
public class NewSheet extends HttpServlet {

     @EJB
    EjbMusic ejb;
     
     public static final String STATUS_OK = "userOk";
    public static final String STATUS_ERROR = "userError";
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
       
        String title = request.getParameter("title");
        String artist  = request.getParameter("artist");
        String instrument = request.getParameter("instrument");
        String genre = request.getParameter("genre");
        String difficulty  = request.getParameter("difficulty");
        Boolean printed  = Boolean.parseBoolean(request.getParameter("printed"));
        User u = (User) request.getSession(true).getAttribute("user");
        //User user = ejb.getUser((String) request.getParameter("user"));
        Sheetmusic sheet = new Sheetmusic();
        sheet.setArtist(artist);
        sheet.setTitle(title);
        sheet.setInstrument(instrument);
        sheet.setGenre(genre);
        sheet.setDifficulty(difficulty);
        sheet.setPrinted(printed);
        sheet.setOwner(u);
        
        ejb.insertSheet(sheet);
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
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


package com.klsoukas.samplecarshoponlinemanagement.controller;

import com.klsoukas.samplecarshoponlinemanagement.model.GoogleTokenVerificationUtil;
import com.klsoukas.samplecarshoponlinemanagement.model.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class TokenSignIn extends HttpServlet {

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
        response.setContentType("text/plain;charset=UTF-8");
        
        HttpSession session = request.getSession();

        StringBuffer url = request.getRequestURL();
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();        
        String ajaxResponseUrlString = url.substring(0,url.length() - uri.length() + contextPath.length());    
        
        if(session.getAttribute("user") != null){
            response.getWriter().write(ajaxResponseUrlString);
        }
        else{

            String idTokenString = request.getParameter("idtoken");
            UserBean user = GoogleTokenVerificationUtil.userIsValid(idTokenString);
            if(user == null){
                System.out.println("Invalid Id token or database Error!");
                response.getWriter().write(ajaxResponseUrlString);
            }
            else{

                session.invalidate();
                session = request.getSession();
                session.setAttribute("user", user);

                response.getWriter().write(ajaxResponseUrlString);
            }
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
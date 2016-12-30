
package com.klsoukas.samplecarshoponlinemanagement.controller;

import com.klsoukas.samplecarshoponlinemanagement.model.BrandBean;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDao;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDaoImpl;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ImageServingServlet extends HttpServlet {

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

        //small images/ logos are getting requested without any additional path after servlet path , but only from the query string by way of setting a query parameter
        //getpathinfo is null here no extra path after servlet just a query string
        if(request.getPathInfo()==null){
            BrandDao brandDao = new BrandDaoImpl();
            BrandBean b = brandDao.findBrandById(Integer.parseInt(request.getParameter("id")));
            byte[] logo = b.getLogo();
            if(logo != null){
                String fileExtension = b.getFileExtension();

                response.setContentType(getServletContext().getMimeType(fileExtension));
                response.setContentLength(logo.length);
                response.getOutputStream().write(logo);
               
            }
            else{


             request.getRequestDispatcher("images/logos/default_logo/no image.png").forward(request,response);
            }
     
        }
        else{
            //big images get requested as whole file names without query string body meaning without any parameters, just their path after this servlet... getPathInfo() == location stored in db
            String filename = URLDecoder.decode(request.getPathInfo(), "UTF-8");
            File file = new File(getServletContext().getInitParameter("uploads_location")+filename);

            response.setHeader("Content-Type", getServletContext().getMimeType(filename));
            response.setHeader("Content-Length", String.valueOf(file.length()));

            Files.copy(file.toPath(), response.getOutputStream());
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


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
//                File f = new File("/webapp_files"+request.getContextPath()+"/logos/default_logo/no image.png");
//              
//                response.setContentType(getServletContext().getMimeType(f.toString()));
//                response.setContentLength((int)f.length());
//                Files.copy(f.toPath(), response.getOutputStream());

             request.getRequestDispatcher("images/logos/default_logo/no image.png").forward(request,response);
            }
     
        }
        else{
            String filename = URLDecoder.decode(request.getPathInfo(), "UTF-8");
            File file = new File(filename);
            response.setHeader("Content-Type", getServletContext().getMimeType(filename));
            response.setHeader("Content-Length", String.valueOf(file.length()));
//            response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
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

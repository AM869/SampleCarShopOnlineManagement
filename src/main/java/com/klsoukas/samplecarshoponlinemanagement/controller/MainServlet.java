
package com.klsoukas.samplecarshoponlinemanagement.controller;

import com.klsoukas.samplecarshoponlinemanagement.model.BrandBean;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDao;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDaoImpl;
import com.klsoukas.samplecarshoponlinemanagement.model.CarBean;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDao;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainServlet extends HttpServlet {

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

        System.out.println("1"+request.getServletContext());
        System.out.println("2"+request.getRequestURL());
        System.out.println("3"+request.getRequestURI());
        System.out.println("4"+request.getServletPath());
        System.out.println("5"+request.getPathInfo());
        System.out.println("6"+request.getContextPath());
        

        BrandDao brandDao = new BrandDaoImpl();
        List<BrandBean> brandList = brandDao.findAllBrands();
        request.setAttribute("brandList", brandList);
        
        
        CarDao carDao = new CarDaoImpl();
        List<CarBean> carList = carDao.findAllCars();
        request.setAttribute("carList",carList);
        
        request.getRequestDispatcher("WEB-INF/jsp/main.jsp").forward(request, response);

//        response.setHeader("Access-Control-Allow-Origin","http://www.w3schools.com");
//        request.getRequestDispatcher("WEB-INF/jsp/main.jsp").include(request,response);
        
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

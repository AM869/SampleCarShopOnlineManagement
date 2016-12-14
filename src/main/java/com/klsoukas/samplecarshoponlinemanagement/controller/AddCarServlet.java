/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.klsoukas.samplecarshoponlinemanagement.controller;

import com.klsoukas.samplecarshoponlinemanagement.model.BrandBean;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDao;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDaoImpl;
import com.klsoukas.samplecarshoponlinemanagement.model.CarBean;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDao;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDaoImpl;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Xristos
 */
public class AddCarServlet extends HttpServlet {
    
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
        
        
        BrandDao brandDao = new BrandDaoImpl();
        List<BrandBean> brandList = brandDao.findAllBrands();
        request.setAttribute("brandList", brandList);
        
        
        CarDao carDao = new CarDaoImpl();
        List<CarBean> carList = carDao.findAllCars();
        request.setAttribute("carList",carList);
        
        request.getRequestDispatcher("WEB-INF/jsp/addCars.jsp").forward(request, response);
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
        
        
        String submittedForm = request.getParameter("submit");
        System.out.println("zzzzu "+request.getParameter("submit"));
        if(submittedForm.equals("submitBrand")){
            BrandBean newBrand = new BrandBean();
            newBrand.setName(request.getParameter("name"));
            Part logoPart = request.getPart("file");
            if(logoPart.getSubmittedFileName().equals("") || logoPart.getSize()>=65000){
            } else {
                InputStream logo = logoPart.getInputStream();
                newBrand.setLogo(logo);
            }
            BrandDao brandDao = new BrandDaoImpl();
            brandDao.createBrand(newBrand);
        }
        else if(submittedForm.equals("submitCars")){
            
            String a = request.getParameter("brand");
            String b = request.getParameter("model");
            String c = request.getParameter("description");
            
            String d = request.getParameter("carNumber");
            
            System.out.println(a+"\n"+b+"\n"+c+"\n"+d);
            
            Collection<Part> parts = request.getParts();
            Iterator<Part> part_iterator = parts.iterator();
            while(part_iterator.hasNext()){
                Part currPart = part_iterator.next();
                System.out.println("name: "+currPart.getName()+ ", getsubmittedfilename: "+currPart.getSubmittedFileName());
            }
            
            
        }
        
        
        response.sendRedirect(request.getContextPath()+"/addcars");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

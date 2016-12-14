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
import com.klsoukas.samplecarshoponlinemanagement.model.PhotoBean;
import com.klsoukas.samplecarshoponlinemanagement.model.PhotoDao;
import com.klsoukas.samplecarshoponlinemanagement.model.PhotoDaoImpl;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
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
            
            int carsAdded = Integer.parseInt(request.getParameter("carNumber"));
            ArrayList<PhotoBean> photoList = new ArrayList<>();
            for(int i=1; i<=carsAdded;i++){
                CarBean c = new CarBean();
                
                c.setBrand_fk(Integer.parseInt(request.getParameter("brand"+i)));
                c.setModel(request.getParameter("model"+i));
                if(!request.getParameter("description"+i).isEmpty()){
                    c.setDescription(request.getParameter("description"));
                }
                
                CarDao carDao = new CarDaoImpl();
                int car_id = carDao.createCar(c);
                
                
                Collection<Part> parts = request.getParts();
                Iterator<Part> part_iterator = parts.iterator();
                while(part_iterator.hasNext()){
                    Part currentPart = part_iterator.next();
                    String uploadedFileName = currentPart.getSubmittedFileName();
                    if(uploadedFileName != null  && !uploadedFileName.isEmpty()){
                            
                        String uploadedFileExtension = uploadedFileName.substring(uploadedFileName.lastIndexOf("."));

                        if(currentPart.getSize()>8000000 || !( (uploadedFileExtension.equals(".jpg")) 
                                || (uploadedFileExtension.equals(".jpeg")) 
                                || (uploadedFileExtension.equals(".png")) 
                                || (uploadedFileExtension.equals(".gif")) 
                                )){

                            currentPart.delete();

                        }
                        else{
                            if(currentPart.getName().equals("file"+i)){
                                InputStream fileStream = currentPart.getInputStream();

                                File uploads_location = new File("/webapp_files"+request.getContextPath()+"/car_photos");
                                if(!uploads_location.exists()){
                                    uploads_location.mkdirs();
                                }

                                File car_specific_location = new File(uploads_location, "/"+car_id);
                                car_specific_location.mkdir();

                                File photo = File.createTempFile("car_id_"+car_id+"_photo",uploadedFileExtension,car_specific_location);

                                Files.copy(fileStream, photo.toPath(),StandardCopyOption.REPLACE_EXISTING);

                                PhotoBean p = new PhotoBean();
                                p.setCar_fk(car_id);
                                p.setLocation(photo.toString());
                                photoList.add(p);
                            }
                        }                        
                    }
                }              
            }
            /*adding photolist here in db for all images send*/
            PhotoDao photoDao = new PhotoDaoImpl();
            photoDao.addPhotos(photoList);
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

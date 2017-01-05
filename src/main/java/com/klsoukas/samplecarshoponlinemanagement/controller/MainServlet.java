
package com.klsoukas.samplecarshoponlinemanagement.controller;

import com.klsoukas.samplecarshoponlinemanagement.model.BrandBean;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDao;
import com.klsoukas.samplecarshoponlinemanagement.model.BrandDaoImpl;
import com.klsoukas.samplecarshoponlinemanagement.model.CarBean;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDao;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

        BrandDao brandDao = new BrandDaoImpl();
        List<BrandBean> brandList = brandDao.findAllBrands();
        request.setAttribute("brandList", brandList);
        
        
//        CarDao carDao = new CarDaoImpl();
//        List<CarBean> carList = carDao.findAllCars();
//        request.setAttribute("carList",carList);
  
        //replaced with servletContext attribute carList;
        
      
        //get fully cached array list from servlet context
        List<CarBean> fullCarList = (List<CarBean>)getServletContext().getAttribute("carList");
        //get its size
        int carList_max_size = fullCarList.size();        

        //decide max page number by dividing by numbers of item displayed each time
        int max_page_number = carList_max_size/5;
        
        //check if there should be a last page with the remaining members (== max car number modulo number of displayed cars per page)
        if(carList_max_size%5>0){
            max_page_number++;
        }
        
        
        int page_number = 1;
        if(request.getParameter("page")!=null){
            try{
                page_number = Integer.parseInt(request.getParameter("page"));
                if(page_number>max_page_number){
                    page_number=1;
                }
            }
            //Will throw NumberFormaException if some user possibly posts random input as "page" value in URL query string,
            //so we catch Exception and make page_number to default to 1 in case of user manually changing the url GET query string
            catch(Exception e){
                //make default page number always be 1
                page_number = 1;
            }
        }

        
        List<CarBean> carList = new ArrayList<CarBean>(5);
        
        for(int i=0+(page_number-1)*5; i<5+(page_number-1)*5; i++){
            try{
                CarBean c = fullCarList.get(i);
                carList.add(c);
            }
            catch(IndexOutOfBoundsException e){
                break;
            }
            
        }
        
        request.setAttribute("carList",carList);
        request.setAttribute("maxPageNumber",max_page_number);
        
        request.getRequestDispatcher("WEB-INF/jsp/main.jsp").forward(request, response);
 
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

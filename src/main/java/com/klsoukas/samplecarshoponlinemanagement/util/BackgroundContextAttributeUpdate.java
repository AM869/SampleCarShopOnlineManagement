
package com.klsoukas.samplecarshoponlinemanagement.util;

import com.klsoukas.samplecarshoponlinemanagement.controller.AddCarServlet;
import com.klsoukas.samplecarshoponlinemanagement.model.CarBean;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDao;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDaoImpl;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;


public class BackgroundContextAttributeUpdate implements Runnable{

    ServletContext sc;
    public BackgroundContextAttributeUpdate(ServletContext sc){
        this.sc = sc;
    }
    
    @Override
    public void run() {
//                    try {
//                TimeUnit.MINUTES.sleep(1);
//                System.out.println("--SCHEDULED RUNNABLE SLEPT 1 MIN-- --asddsa-- --asddsa-- --asddsa--");
//            } catch (InterruptedException ex) {
//                Logger.getLogger(AddCarServlet.class.getName()).log(Level.SEVERE, "WHATSSSSSSSS MY IP HUH ???????????????????????????????????????????????", ex);
//            }
                    
                    
        CarDao carDao = new CarDaoImpl();
        List<CarBean> carlist = carDao.findAllCars();
        sc.setAttribute("carList",carlist);
    }
    
    
    
}

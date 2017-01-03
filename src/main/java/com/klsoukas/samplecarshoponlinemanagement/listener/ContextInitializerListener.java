
package com.klsoukas.samplecarshoponlinemanagement.listener;

import com.klsoukas.samplecarshoponlinemanagement.model.CarBean;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDao;
import com.klsoukas.samplecarshoponlinemanagement.model.CarDaoImpl;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class ContextInitializerListener implements ServletContextListener {

    ExecutorService executor;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
        executor = Executors.newFixedThreadPool(10);
        
        
        
        ServletContext sc = sce.getServletContext();       
        CarDao carDao = new CarDaoImpl();
        List<CarBean> carlist = carDao.findAllCars();
        sc.setAttribute("carList",carlist);
        
        sc.setAttribute("executor",executor);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        executor.shutdownNow();
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.klsoukas.samplecarshoponlinemanagement.listener;

import com.klsoukas.samplecarshoponlinemanagement.controller.AddCarServlet;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;

/**
 * Web application lifecycle listener.
 *
 * @author Xristos
 */
public class NewServletListener implements ServletContextAttributeListener {

    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        String attrName = event.getName();
        if(attrName.equals("newCarsAdded")){
            try {
                TimeUnit.MINUTES.sleep(1);
                System.out.println("--ADDED-- --asddsa-- --asddsa-- --asddsa--");
            } catch (InterruptedException ex) {
                Logger.getLogger(AddCarServlet.class.getName()).log(Level.SEVERE, "WHATSSSSSSSS MY IP HUH ???????????????????????????????????????????????", ex);
            }
        }

    }

    @Override
    public void attributeRemoved(ServletContextAttributeEvent event) {

    }

    @Override
    public void attributeReplaced(ServletContextAttributeEvent arg0) {
        String attrName = arg0.getName();
        if(attrName.equals("newCarsAdded")){
            try {
                TimeUnit.MINUTES.sleep(1);
                System.out.println("--REPLACED-- --asddsa-- --asddsa-- --asddsa--");
            } catch (InterruptedException ex) {
                Logger.getLogger(AddCarServlet.class.getName()).log(Level.SEVERE, "WHATSSSSSSSS MY IP HUH ???????????????????????????????????????????????", ex);
            }
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.klsoukas.samplecarshoponlinemanagement.model;

import java.util.List;

/**
 *
 * @author Xristos
 */
public interface CarDao {
    
    List<CarBean> findAllCars();
    
    boolean createCar(CarBean newCar);
    
}

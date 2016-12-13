/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.klsoukas.samplecarshoponlinemanagement.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Xristos
 */
public class CarDaoImpl implements CarDao{

    @Override
    public List<CarBean> findAllCars() {
        try {
            Class.forName(DbUtil.DRIVER_CLASS_NAME);
            
            Connection con = DriverManager.getConnection(DbUtil.CONNECTION_URL,DbUtil.USERNAME,DbUtil.PASSWORD);
            
            PreparedStatement pstmt = con.prepareStatement("SELECT  brand.logo, brand.name, car.id, car.brand_fk, car.model, car.description, photo.location, photo.id as photoId "
                    + "FROM car INNER JOIN brand ON car.brand_fk = brand.id LEFT JOIN photo ON car.id = photo.car_fk "
                    + "ORDER BY car.id");
            
            ResultSet res = pstmt.executeQuery();
            
            List<CarBean> carList = new ArrayList<>();
            List<PhotoBean> photoList = new ArrayList<>();
            
            int prevCarId = 0;
            
            while(res.next()){
                
                if (res.getInt("id")!= prevCarId){
                    CarBean c = new CarBean();
                    c.setBrandLogo(res.getBinaryStream("logo"));
                    c.setBrandName(res.getString("name"));
                    c.setId(res.getInt("id"));
                    c.setBrand_fk(res.getInt("brand_fk"));
                    c.setModel(res.getString("model"));
                    c.setDescription(res.getString("description"));
                    if(res.getInt("photoId")!= 0){
                        photoList = new ArrayList<>();
                        PhotoBean p = new PhotoBean();
                        p.setId(res.getInt("photoId"));
                        p.setLocation(res.getString("location"));
                        photoList.add(p);
                        c.setPhotoList(photoList);
                    }
                    carList.add(c);
                    prevCarId = res.getInt("id");
                }
                else{
                    PhotoBean p = new PhotoBean();
                    p.setId(res.getInt("photoId"));
                    p.setLocation(res.getString("location"));
                    photoList.add(p);
                }
                
            }
            
            return carList;
            
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(CarDaoImpl.class.getName()).log(Level.SEVERE, "Incorrect Driver Class Name!", ex);
            return null;
        }
        catch (SQLException ex) {
            Logger.getLogger(CarDaoImpl.class.getName()).log(Level.SEVERE, "Database Error Occured!", ex);
            return null;
        }
        
        
    }

    @Override
    public boolean createCar(CarBean newCar) {
         try {
            Class.forName(DbUtil.DRIVER_CLASS_NAME);
            
            Connection con = DriverManager.getConnection(DbUtil.CONNECTION_URL,DbUtil.USERNAME,DbUtil.PASSWORD);
            
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO car (brand_fk,model,description) VALUES (?,?,?)");
            pstmt.setInt(1,newCar.getBrand_fk());
            pstmt.setString(2,newCar.getModel());
            pstmt.setString(3,newCar.getDescription());
            
            int updatedRowCount = pstmt.executeUpdate();
            
            return updatedRowCount == 1;
         }
        
        catch (ClassNotFoundException ex) {
            Logger.getLogger(CarDaoImpl.class.getName()).log(Level.SEVERE, "Incorrect Driver Class Name!", ex);
            return false;
        }
        catch (SQLException ex) {
            Logger.getLogger(CarDaoImpl.class.getName()).log(Level.SEVERE, "Database Error Occured!", ex);
            return false;
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.klsoukas.samplecarshoponlinemanagement.model;

import java.io.InputStream;
import java.util.List;

/**
 *
 * @author Xristos
 */
public class CarBean {
    //car related fields
    private int id;
    private int brand_fk;
    private String model;
    private String description;
    
    //brand related fields
    private String brandName;

    //photo related field
    private List<PhotoBean> photoList;

    //utility methods
    public int getPhotoNumber(){
        if(photoList !=null){
            return photoList.size();
        }
        else{
            return 0;
        }      
    }
    
    public List<PhotoBean> getPhotoList() {
        return photoList;
    }

    public void setPhotoList(List<PhotoBean> photoList) {
        this.photoList = photoList;
    }
    
    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    
    public CarBean(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBrand_fk() {
        return brand_fk;
    }

    public void setBrand_fk(int brand_fk) {
        this.brand_fk = brand_fk;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}

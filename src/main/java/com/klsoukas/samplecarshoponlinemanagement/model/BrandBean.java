
package com.klsoukas.samplecarshoponlinemanagement.model;

import java.io.InputStream;

/**
 *
 * @author Xristos
 */
public class BrandBean {
    
    private int id;
    private String name;
    private InputStream logo;

    public BrandBean(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public InputStream getLogo() {
        return logo;
    }

    public void setLogo(InputStream logo) {
        this.logo = logo;
    }


    
    
    
    
}

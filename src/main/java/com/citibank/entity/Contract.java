package com.citibank.entity;

import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * Created by liuhao on 15-7-15.
 */
@Repository
public class Contract {
    private Date signTime;//签约时间
    private int firstId;//甲方id
    private int secondId;//乙方id
    private String firstName;//甲方名称
    private String secondName;//乙方名称
    private String path;//合同路径
    private int stockCreditorId;//股债权id
    private int state;//状态

    public Date getSignTime() {
        return signTime;
    }

    public void setSignTime(Date signTime) {
        this.signTime = signTime;
    }

    public int getFirstId() {
        return firstId;
    }

    public void setFirstId(int firstId) {
        this.firstId = firstId;
    }

    public int getSecondId() {
        return secondId;
    }

    public void setSecondId(int secondId) {
        this.secondId = secondId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public int getStockCreditorId() {
        return stockCreditorId;
    }

    public void setStockCreditorId(int stockCreditorId) {
        this.stockCreditorId = stockCreditorId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}

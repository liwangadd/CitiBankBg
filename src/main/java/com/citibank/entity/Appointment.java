package com.citibank.entity;

import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * Created by liuhao on 15-7-15.
2 */
@Repository
public class Appointment {
    private String appointmentName;//预约方
    private int contractWay;//联系方式
    private Date appointmentTime;//预约时间
    private Date submitTime;//预约提交时间
    private Date finishedTime;//预约完成时间
    private int flag;//标记是否完成

    public String getAppointmentName() {
        return appointmentName;
    }

    public void setAppointmentName(String appointmentName) {
        this.appointmentName = appointmentName;
    }

    public int getContractWay() {
        return contractWay;
    }

    public void setContractWay(int contractWay) {
        this.contractWay = contractWay;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public Date getFinishedTime() {
        return finishedTime;
    }

    public void setFinishedTime(Date finishedTime) {
        this.finishedTime = finishedTime;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }
}

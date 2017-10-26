package com.citibank.entity;

import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * Created by liuhao on 15-7-15.
 */
@Repository
public class Message {
    private Date time;//时间
    private String content;//内容
    private int investorId;//投资者id
    private int companyId;//公司id
    /**
     * //标志位0:企业
     * 1:投资者
     */
    private int flag;

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getInvestorId() {
        return investorId;
    }

    public void setInvestorId(int investorId) {
        this.investorId = investorId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }
}

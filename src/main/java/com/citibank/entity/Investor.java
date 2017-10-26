package com.citibank.entity;

import org.springframework.stereotype.Repository;

/**
 * Created by liuhao on 15-7-14.
 */
@Repository
public class Investor {
    private String investorName;//'投资人姓名
    private String companyArea;//所在地区
    private String funBody;//资金主体
    private String companyName;//公司名称
    private String address;//公司地址
    private int registeredCapital;//注册资本
    private String legalRepresentative;//法定代表人信息
    private String legalRepresentativeMandator;//法定代表人委托人信息
    private String companyScale;//公司规模
    private int totalMoney;//拥有资金额
    private String contactWay;//联系方式
    private String investArea;//投资地区
    private String investField;//投资领域
    private String investStage;//投资阶段
    private String investPeriod;//投资周期
    private String investIndustry;//投资行业
    private int investMoney;//投资意向金额
    private String investType;//投资类型
    private String material;//所需材料
    private String investHistory;//投资历史
    private String successCase;//达成案例
    private String investPreference;//投资偏好
    private String shareholderBackgroud;//股东背景
    private String managedFund;//管理基金
}

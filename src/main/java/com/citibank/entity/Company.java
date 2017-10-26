package com.citibank.entity;

import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * Created by liuhao on 15-7-13.
 */
@Repository
public class Company {

    private String username;//用户名
    private String password;//密码
    private String companyName;//公司名
    private String companyType;//公司类型
    private double registerCapital;//注册资本
    private String bussinessLisence;//营业执照注册号
    private String companyCode;
    private String legalPresentative;//法定代表人
    private Date formedTime;//成立时间
    private String officialWeb;//官网地址
    private String baseAddress;//总部地址
    private String registerAddress;//注册地址
    private String consultPhone;//咨询电话
    private String workingFiled;//所属行业
    private String majorAffair;//主营业务
    private String revenueModels;//盈利模式
    private String teamDescription;//团队描述
    private String logo;//logo
    private String companyPicture;//公司照片
    private String bussinessConcept;//公司经营理念
    private String scale;//规模
    private double occupiedArea;//占地面积
    private String guarantor;//担保方
    private String patentsHonors;//专利与荣誉
    private String subdivideIndustry;//细分行业
    private String productService;//产品服务
    private String relatedOrganization;//相关机构
    private String technologicalAdvantage;//技术优势
    private String productAdvantage;//产品优势
    private String marketAdvantage;//市场优势
    private String industryOverview;//行业概况
    private String developmentStrategy;//发展战略

    public double getRegisterCapital() {
        return registerCapital;
    }

    public void setRegisterCapital(double registerCapital) {
        this.registerCapital = registerCapital;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    public String getBussinessLisence() {
        return bussinessLisence;
    }

    public void setBussinessLisence(String bussinessLisence) {
        this.bussinessLisence = bussinessLisence;
    }

    public String getLegalPresentative() {
        return legalPresentative;
    }

    public void setLegalPresentative(String legalPresentative) {
        this.legalPresentative = legalPresentative;
    }

    public Date getFormedTime() {
        return formedTime;
    }

    public void setFormedTime(Date formedTime) {
        this.formedTime = formedTime;
    }

    public String getOfficialWeb() {
        return officialWeb;
    }

    public void setOfficialWeb(String officialWeb) {
        this.officialWeb = officialWeb;
    }

    public String getRegisterAddress() {
        return registerAddress;
    }

    public void setRegisterAddress(String registerAddress) {
        this.registerAddress = registerAddress;
    }

    public String getBaseAddress() {
        return baseAddress;
    }

    public void setBaseAddress(String baseAddress) {
        this.baseAddress = baseAddress;
    }

    public String getConsultPhone() {
        return consultPhone;
    }

    public void setConsultPhone(String consultPhone) {
        this.consultPhone = consultPhone;
    }

    public String getWorkingFiled() {
        return workingFiled;
    }

    public void setWorkingFiled(String workingFiled) {
        this.workingFiled = workingFiled;
    }

    public String getMajorAffair() {
        return majorAffair;
    }

    public void setMajorAffair(String majorAffair) {
        this.majorAffair = majorAffair;
    }

    public String getRevenueModels() {
        return revenueModels;
    }

    public void setRevenueModels(String revenueModels) {
        this.revenueModels = revenueModels;
    }

    public String getTeamDescription() {
        return teamDescription;
    }

    public void setTeamDescription(String teamDescription) {
        this.teamDescription = teamDescription;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getCompanyPicture() {
        return companyPicture;
    }

    public void setCompanyPicture(String companyPicture) {
        this.companyPicture = companyPicture;
    }

    public String getBussinessConcept() {
        return bussinessConcept;
    }

    public void setBussinessConcept(String bussinessConcept) {
        this.bussinessConcept = bussinessConcept;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public double getOccupiedArea() {
        return occupiedArea;
    }

    public void setOccupiedArea(double occupiedArea) {
        this.occupiedArea = occupiedArea;
    }

    public String getGuarantor() {
        return guarantor;
    }

    public void setGuarantor(String guarantor) {
        this.guarantor = guarantor;
    }

    public String getPatentsHonors() {
        return patentsHonors;
    }

    public void setPatentsHonors(String patentsHonors) {
        this.patentsHonors = patentsHonors;
    }

    public String getSubdivideIndustry() {
        return subdivideIndustry;
    }

    public void setSubdivideIndustry(String subdivideIndustry) {
        this.subdivideIndustry = subdivideIndustry;
    }

    public String getProductService() {
        return productService;
    }

    public void setProductService(String productService) {
        this.productService = productService;
    }

    public String getRelatedOrganization() {
        return relatedOrganization;
    }

    public void setRelatedOrganization(String relatedOrganization) {
        this.relatedOrganization = relatedOrganization;
    }

    public String getTechnologicalAdvantage() {
        return technologicalAdvantage;
    }

    public void setTechnologicalAdvantage(String technologicalAdvantage) {
        this.technologicalAdvantage = technologicalAdvantage;
    }

    public String getMarketAdvantage() {
        return marketAdvantage;
    }

    public void setMarketAdvantage(String marketAdvantage) {
        this.marketAdvantage = marketAdvantage;
    }

    public String getIndustryOverview() {
        return industryOverview;
    }

    public void setIndustryOverview(String industryOverview) {
        this.industryOverview = industryOverview;
    }

    public String getDevelopmentStrategy() {
        return developmentStrategy;
    }

    public void setDevelopmentStrategy(String developmentStrategy) {
        this.developmentStrategy = developmentStrategy;
    }
}

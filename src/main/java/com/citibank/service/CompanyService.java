package com.citibank.service;

import java.util.Map;

/**
 * Created by zjm on 2015/7/13.
 */
public interface CompanyService {
    public Map<String, Object> userRegister(Map<String, Object> reqs);

    public Map<String,Object> userLogin(Map<String, Object> reqs);

    //验证用户名
    public String confirmEmail(Map<String,Object> reqs);
    //验证企业代码
    public String confirmCompanyCode(Map<String,Object> reqs);
    //验证企业名称
    public String confirmCompanyName(Map<String,Object> reqs);
    //验证营业执照注册号
    public String confirmBussinessLisence(Map<String,Object> reqs);
    //获取公司信息
    public Map<String, Object> getCompanyInfo(String userId);
    //更新公司信息
    public int saveCompanyInfo(Map<String,Object> map,String userId);


}

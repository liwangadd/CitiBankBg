package com.citibank.service;

import com.citibank.dao.Page;

import java.util.Map;

/**
 * Created by Administrator on 2015/7/22.
 */
public interface VisitorService {

    //咨询界面
//    public Page<Map<String,Object>> getPolicyList(int pageIndex);

//    public Map<String,Object> getPolicyInfoDetail(String id);

//    public Page<Map<String,Object>> getMarketList(int pageIndex);

//    public Map<String,Object> getMarketInfoDetail(String id);

    //融资企业
    public Page<Map<String,Object>> getFinancingCom(int pageIndex);

    //投资中心
    public Map<String,Object> investCenter();

    //企业服务
    public Map<String,Object> companyService();

    //验证邮箱
    public String confirmEmail(String email);

    //验证公司名字
    public String confirmName(String name);

    public Map<String,Object> login(String username,String password);


}

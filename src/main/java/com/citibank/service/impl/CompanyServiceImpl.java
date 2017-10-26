package com.citibank.service.impl;

import com.citibank.common.IdUtil;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;


/**
 * Created by zjm on 2015/7/13.
 */

@Service("CompanyService")
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public MySQLSimpleDaoImpl getMySQLSimpleDao() {
        return mySQLSimpleDao;
    }

    public void setMySQLSimpleDao(MySQLSimpleDaoImpl mySQLSimpleDao) {
        this.mySQLSimpleDao = mySQLSimpleDao;
    }

    public Map<String, Object> userRegister(Map<String, Object> reqs) {
        Map<String,Object> map=new HashMap<String, Object>();
        String result = "success";
        try{
            Date date = new Date();
            reqs.put("formedTime",date);
            String id = IdUtil.uuid();
            reqs.put("companyId",id);
            mySQLSimpleDao.create("company",reqs);

        }catch (Exception e){
            e.printStackTrace();
            result = "failed";
        }
        map.put("result",result);

        return map;
    }

    public Map<String,Object> userLogin(Map<String, Object> reqs) {
        Map<String,Object> result = new HashMap<String, Object>();
        String sql = "select *from company where username=:username and password=:password";
        List<Map<String,Object>> list = mySQLSimpleDao.queryForList(sql,reqs);
        if(list.size()==1){
            result.put("result","success");
            result.put("companyId",list.get(0).get("companyId"));
        }
        else{
            result.put("result","failed");
        }
        return result;

    }

    public String confirmEmail(Map<String, Object> reqs) {

        String result = "success";
        String sql = "select *from company where username = :user_name";
        if(mySQLSimpleDao.queryForList(sql,reqs).size()!=0){
            result = "failed";
        }
        return result;
    }

    public String confirmCompanyCode(Map<String, Object> reqs) {
        String result = "success";
        String sql = "select *from company where company_ode=:company_code";
        if(mySQLSimpleDao.queryForList(sql,reqs).size()!=0){
            result = "failed";
        }
        return result;
    }

    public String confirmCompanyName(Map<String, Object> reqs) {
        String result = "success";
        String sql = "select *from company where companyName = :company_name";
        if(mySQLSimpleDao.queryForList(sql,reqs).size()!=0){
            result = "failed";
        }
        return result;
    }

    public String confirmBussinessLisence(Map<String, Object> reqs) {
        String result = "success";
        String sql = "select *from company where businessLisence=:businessLisence";
        if(mySQLSimpleDao.queryForList(sql,reqs).size()!=0){
            result = "failed";
        }
        return result;
    }

    //获取公司信息
    public Map<String, Object> getCompanyInfo(String userId) {
        String sql = "select *from company where companyId=:companyId";
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("companyId",userId);
        List<Map<String, Object>> result = mySQLSimpleDao.queryForList(sql,param);
        if(result.size()==0){
            Map<String ,Object> map=new HashMap<String, Object>();
            map.put("error","true");
            return map;
        }
        return result.get(0);
    }

    public int saveCompanyInfo(Map<String, Object> map,String userId) {

        Map<String,Object> cons=new HashMap<String, Object>();
        cons.put("companyId", userId);
        try {

        }catch (Exception e){

            e.printStackTrace();
        }
        return  mySQLSimpleDao.update("company", map, cons);
    }



}

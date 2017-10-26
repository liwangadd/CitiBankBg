package com.citibank.service.impl;

import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.PersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by liuhao on 15-7-15.
 */
@Service("PersonService")
public class PersonalServiceImp implements PersonalService {
    @Autowired
    private MySQLSimpleDaoImpl personalDao;
    public Page<Map<String, Object>> orderByDefault(Map<String, Object> reqs) {
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String sql="select * from attention";
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,new Order());
    }

    public Page<Map<String, Object>> orderByCompanyName(Map<String, Object> reqs) {
        MySQLSimpleDaoImpl personalDao=new MySQLSimpleDaoImpl();
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String sql="select * from attention left join company on attention.companyId=company.companyId";
        Order order=new Order().asc("companyName");
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,order);
    }

    public Page<Map<String, Object>> orderByProductName(Map<String, Object> reqs) {
        MySQLSimpleDaoImpl personalDao=new MySQLSimpleDaoImpl();
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String sql="select * from attention left join stockcreditor on attention.stockCreditorId=stockcreditor.id";
        Order order=new Order().asc("productName");
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,order);
    }

    public Page<Map<String, Object>> orderByAttentionState(Map<String, Object> reqs) {
        MySQLSimpleDaoImpl personalDao=new MySQLSimpleDaoImpl();
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String sql="select * from attention";
        Order order=new Order().asc("attentionState");
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,order);
    }
//有问题没有关注时间
    public Page<Map<String, Object>> orderByAttentionTime(Map<String, Object> reqs) {
        MySQLSimpleDaoImpl personalDao=new MySQLSimpleDaoImpl();
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String sql="select * from attention";
        Order order=new Order().asc("attentionStateTime");
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,order);
    }
//查询两个表的内容显示
    public Page<Map<String, Object>> orderByProductType(Map<String, Object> reqs) {
        MySQLSimpleDaoImpl personalDao=new MySQLSimpleDaoImpl();
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String sql="select * from attention";
        Order order=new Order().asc("productType");
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,order);
    }

    public Page<Map<String, Object>> orderByKeyValue(Map<String, Object> reqs) {
        MySQLSimpleDaoImpl personalDao=new MySQLSimpleDaoImpl();
        int start=Integer.parseInt((String) reqs.get("pageIndex"));
        String key= (String) reqs.get("key");
        String sql=String.format("select * from company where companyName like %s or from stockcreditor where productName like %s","%"+key+"%","%"+key+"%");
        Order order=new Order().asc("companyName");
        return personalDao.pageQuery(sql,new HashMap<String, Object>(),start,10,order);
    }
}

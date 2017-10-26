package com.citibank.service.impl;

import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.SystemMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mrtian on 2015/7/16.
 */
@Service
public class SystemMessageServiceImpl implements SystemMessageService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public MySQLSimpleDaoImpl getMySQLSimpleDao() {
        return mySQLSimpleDao;
    }

    public void setMySQLSimpleDao(MySQLSimpleDaoImpl mySQLSimpleDao) {
        this.mySQLSimpleDao = mySQLSimpleDao;
    }

    public List<Map<String, Object>> getAllMessage() {
        String sql = "select * from message";
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        list = mySQLSimpleDao.queryForList(sql);
        if (list.size() > 0) {
            System.out.println("找到list!");
            return list;
        } else {
            System.out.println("没找到list!");
            return null;
        }
    }

    public Page<Map<String, Object>> getSystemMessage(Map<String, Object> reqs, int flag) {
        int pageSize = 10;
        int pageIndex = 1;
        String sql = "select * from message where flag=0";
        pageIndex = Integer.parseInt(reqs.get("pageIndex").toString());
        Order order = new Order().asc("time");
        Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, pageSize, order);
        if (page.getSize() > 0) {
            //System.out.println("找到page!");
            return page;
        } else {
            //System.out.println("没找到page!");
            return null;
        }
    }

    public Page<Map<String, Object>> getMessageByTime(Map<String, Object> reqs, int flag) {
        int pageSize = 10;
        int pageIndex = 0;
        if (flag == 0)//代表企业
        {
            String sql = "select * from message where companyId=:companyId and flag=0 and tag=0";
            pageIndex = Integer.parseInt(reqs.get("pageIndex").toString());
            Order order = new Order().asc("companyId");
            Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, pageSize, order);
            if (page.getSize() > 0) {
                System.out.println("找到page!");
                return page;
            } else {
                System.out.println("没找到page!");
                return null;
            }
        } else if (flag == 1)//代表投资者
        {
            String sql = "select * from message where time=:time and flag=1 and tag=0";
            pageIndex = Integer.parseInt(reqs.get("pageIndex").toString());
            Order order = new Order().asc("companyId");
            Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, pageSize, order);
            if (page.getSize() > 0) {
                System.out.println("找到page!");
                return page;
            } else {
                System.out.println("没找到page!");
                return null;
            }
        }
        return null;
    }

    public Page<Map<String, Object>> getMessageByContent(Map<String, Object> reqs, int flag) {
        int pageSize = 10;
        int pageIndex = 0;
        if (flag == 0)//代表企业
        {
            String sql = "select * from message where content=:content and flag=0 and tag=0";
            pageIndex = Integer.parseInt(reqs.get("pageIndex").toString());
            Order order = new Order().asc("companyId");
            Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, pageSize, order);
            if (page.getSize() > 0) {
                System.out.println("找到page!");
                return page;
            } else {
                System.out.println("没找到page!");
                return null;
            }
        } else if (flag == 1)//代表投资者
        {
            String sql = "select * from message where time=:time and flag=1 and tag=0";
            pageIndex = Integer.parseInt(reqs.get("pageIndex").toString());
            Order order = new Order().asc("companyId");
            Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, pageSize, order);
            if (page.getSize() > 0) {
                System.out.println("找到page!");
                return page;
            } else {
                System.out.println("没找到page!");
                return null;
            }
        }
        return null;
    }
}

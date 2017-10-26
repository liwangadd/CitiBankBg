package com.citibank.service.impl;

import com.citibank.common.IdUtil;
import com.citibank.dao.ConditionUtil;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.MessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * Created by zjm on 2015/7/16.
 */
@Service("MessageService")
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public String sendMessage(Map<String, Object> reqs, HttpSession session) {
        reqs.put("id", IdUtil.uuid());
        String result = "success";
        Date date = new Date();
        reqs.put("time", date);
        reqs.put("status", 0);
        if (Integer.parseInt(session.getAttribute("userType").toString()) == 0) {
            reqs.put("flag", 0);
        } else {
            reqs.put("flag", 1);
        }
        try {
            mySQLSimpleDao.create("message", reqs);
        } catch (Exception e) {
            result = "failed";
            e.printStackTrace();
        }
        return result;
    }


    public List<Map<String, Object>> showMessage(Map<String, Object> reqs, HttpSession session) {

        int userType = Integer.parseInt(session.getAttribute("userType").toString());
        int flag = Integer.parseInt(reqs.get("flag").toString());

        //userType 公司类型是0，投资者类型是1，
        if (userType == 0) {
            String sql = "select *from message where flag=:1";
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("flag", 1);
            return mySQLSimpleDao.queryForList(sql, map);
        } else {
            String sql = "select *from message where flag=:0";
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("flag", 0);
            return mySQLSimpleDao.queryForList(sql, map);
        }

    }

    public Map<String, Object> checkMessage(Map<String, Object> reqs, HttpSession session) {
        Map<String, Object> map1 = new HashMap<String, Object>();
        Map<String, Object> map2 = new HashMap<String, Object>();
        map1.put("status", 1);
        map2.put("id", reqs.get("id"));
        mySQLSimpleDao.update("message", map1, map2);
        return mySQLSimpleDao.retrieve("message", map2);
    }

    public String DirectionalDisclosure(Map<String, Object> reqs) {

        String result = "success";

        String sql = "insert into file where id=:id and uploadId=:uploadId and filePath=:filePath";
        try {
            mySQLSimpleDao.executeUpdate(sql, reqs);
        } catch (Exception e) {
            result = "failed";
            e.printStackTrace();
        }
        return result;
    }

    public Page<Map<String, Object>> getSystemMessage(int pageIndex, String queryContent) {
        int pageSize = 10;
        String sql = "select * from message where flag=0";
        Order order = new Order().asc("time");
        Map<String, Object> reqs = new HashMap<String, Object>();
        if (!"".equals(queryContent)) {
            sql += " and content like :query_content";
            reqs.put("query_content", ConditionUtil.like(queryContent));
        }
        Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs,
                pageIndex, pageSize, order);
        if (page.getSize() > 0) {
            //System.out.println("找到page!");
            return page;
        } else {
            //System.out.println("没找到page!");
            return null;
        }
    }
}

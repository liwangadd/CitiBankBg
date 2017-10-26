package com.citibank.service.impl;

import com.citibank.dao.ConditionUtil;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.AppointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Nikolas on 2015/7/16.
 */
@Service
public class AppointServiceImpl implements AppointService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public Page<Map<String, Object>> getAppoint(Map<String, Object> reqs) {
        String sql = "select * from appointment where userId = :user_id and flag =:flag";
        int pageSize = 10;
        int pageIndex = Integer.parseInt(reqs.get("pageIndex").toString());
        Order order = new Order().asc(reqs.get("column").toString());
        if(reqs.containsKey("queryContent")){
            sql+=" and appointmentName like ";
            sql+= ConditionUtil.like(reqs.get("queryContent").toString());
        }
        Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, pageSize, order);
        if (page.getSize() > 0) {
            //System.out.println("找到page!");
            return page;
        } else {
            //System.out.println("没找到page!");
            return null;
        }
    }

    public boolean completeReservation(String reserId) {
        Map<String, Object> columns = new HashMap<String, Object>();
        columns.put("flag", 1);
        Map<String, Object> cons = new HashMap<String, Object>();
        cons.put("id", reserId);
        try {
            mySQLSimpleDao.update("appointment", columns, cons);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}

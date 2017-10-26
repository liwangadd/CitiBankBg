package com.citibank.service.impl;

import com.citibank.common.IdUtil;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.ElectronicalContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.Mapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liuhao on 15-7-21.
 */
@Service("ElectronicalContractService")
public class ElectronicalContractServiceImpl implements ElectronicalContractService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;
    private String sql = "select * from contract";

    //获得合同未完成的对方
    public Map<String, Object> getStateZeroOppositor(String id) {
        String mySql = String.format("select * from contract where secondId=%s and state=%d", id, 0);
        List<Map<String, Object>> list = mySQLSimpleDao.queryForList(sql, new HashMap<String, Object>());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", map);
        return map;
    }

    public List<Map<String, Object>> getOppositorList() {
        String sql = "select * from contract";
        return mySQLSimpleDao.queryForList(sql, new HashMap<String, Object>());
    }


    public boolean signState(Map<String, Object> reqs) {
        //有secondName,path,secondId
        String id = (String) reqs.get("id");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("state", 1);
        Map<String, Object> conds = new HashMap<String, Object>();
        conds.put("id", id);
        try {

            mySQLSimpleDao.update("contract", map, conds);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Page<Map<String, Object>> orderByTime() {
        Order order = new Order().asc("signTime");
        return mySQLSimpleDao.pageQuery(sql, new HashMap<String, Object>(), 1, 10, order);
    }

    public Page<Map<String, Object>> orderByOppositor() {
        Order order = new Order().asc("secondId");
        return mySQLSimpleDao.pageQuery(sql, new HashMap<String, Object>(), 1, 10, order);
    }

    public Page<Map<String, Object>> orderByState() {
        Order order = new Order().asc("state");
        return mySQLSimpleDao.pageQuery(sql, new HashMap<String, Object>(), 1, 10, order);
    }

    public Page<Map<String, Object>> selectByKeyValue(String key) {
        String mySql = String.format("select * from contract where secondName like %s or content like %s", "%" + key + "%", "%" + key + "%");
        Order order = new Order().asc("secondName");

        return mySQLSimpleDao.pageQuery(sql, new HashMap<String, Object>(), 1, 10, order);

    }
}

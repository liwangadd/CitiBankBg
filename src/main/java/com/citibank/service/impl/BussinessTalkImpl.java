package com.citibank.service.impl;

import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.BussinessTalk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by mrtian on 2015/7/23.
 */
@Service
public class BussinessTalkImpl implements BussinessTalk {
    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public MySQLSimpleDaoImpl getMySQLSimpleDao() {
        return mySQLSimpleDao;
    }

    public void setMySQLSimpleDao(MySQLSimpleDaoImpl mySQLSimpleDao) {
        this.mySQLSimpleDao = mySQLSimpleDao;
    }

    public List<Map<String, Object>> getAllTalker(Map<String, Object> req) {
        String sql = "select * from attention where companyId =: companyId attentionState =: '2'";
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        list = mySQLSimpleDao.queryForList(sql, req);
        return list;
    }


    public boolean changeContract(Map<String, Object> req) {  //通过公司Id修改
        String sql = "select * from contract where secondId =: secondId";
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        list = mySQLSimpleDao.queryForList(sql, req);
        return true;
    }

    public boolean uploadingContract(Map<String, Object> req) {
        String sql = "insert into contract()values()";
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        list = mySQLSimpleDao.queryForList(sql, req);
        return true;
    }
}

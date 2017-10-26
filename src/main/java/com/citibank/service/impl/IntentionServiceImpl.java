package com.citibank.service.impl;

import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.IntentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by liuhao on 15-7-21.
 */
@Service("IntentionService")
public class IntentionServiceImpl implements IntentionService{
    @Autowired
    MySQLSimpleDaoImpl mySQLSimpleDao;
    public boolean publishIntention(Map<String, Object> map)
    {
        try {
            mySQLSimpleDao.create("stockcreditor", map);
           return true;
            }
        catch (Exception e)
        {
            return false;
        }

    }

    public Map<String, Object> getInvestorinfoById(String id) {
        String sql=String.format("select * from investor where investorid=%s",id);
        return mySQLSimpleDao.queryForList(sql,new HashMap<String, Object>()).get(0);
    }

}

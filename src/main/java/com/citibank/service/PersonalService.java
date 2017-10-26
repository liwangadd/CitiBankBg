package com.citibank.service;

import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2015/7/23.
 */
public interface PersonalService {

    public Page<Map<String, Object>> orderByDefault(Map<String, Object> reqs);

    public Page<Map<String, Object>> orderByCompanyName(Map<String, Object> reqs);

    public Page<Map<String, Object>> orderByProductName(Map<String, Object> reqs);

    public Page<Map<String, Object>> orderByAttentionState(Map<String, Object> reqs);
    //有问题没有关注时间
    public Page<Map<String, Object>> orderByAttentionTime(Map<String, Object> reqs);
    //查询两个表的内容显示
    public Page<Map<String, Object>> orderByProductType(Map<String, Object> reqs);

    public Page<Map<String, Object>> orderByKeyValue(Map<String, Object> reqs);

}

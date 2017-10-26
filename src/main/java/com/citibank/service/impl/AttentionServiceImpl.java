package com.citibank.service.impl;

import com.citibank.dao.ConditionUtil;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.AttentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by dell on 2015/7/28.
 */
@Service
public class AttentionServiceImpl implements AttentionService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public Page<Map<String, Object>> getMyAttentionByCompanyId(String userId, int pageIndex,
                                                               String column,String queryContent) {
        String sql = "select a.attentionState, a.productType, o.companyName, s.productName from attention a join investor o on a.otherId = o.investorId" +
                " join stockcreditor s on a.attStockCreditorId = s.id where a.userId = :user_id";
        column=" a."+column;
        Order order = new Order().asc(column);
        Map<String,Object> reqs=new HashMap<String, Object>();
        reqs.put("user_id", userId);
        if(!"".equals(queryContent)){
            sql+=" and o.companyName like :query_content";
            reqs.put("query_content", ConditionUtil.like(queryContent));
        }
        Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, 10, order);
        if (page.getSize() > 0) {
            return page;
        } else {
            return null;
        }
    }

    public Page<Map<String, Object>> getMyAttentionByInvestorId(String userId, int pageIndex,
                                                                String column,String queryContent) {
        String sql = "select a.attentionState, a.productType, o.companyName, s.productName from attention a join company o on a.otherId = o.companyId" +
                " join stockcreditor s on a.attStockCreditorId = s.id where a.userId = :user_id";
        column=" a."+column;
        Order order = new Order().asc(column);
        Map<String,Object> reqs=new HashMap<String, Object>();
        reqs.put("user_id", userId);
        if(!"".equals(queryContent)){
            sql+=" and o.companyName like :query_content";
            reqs.put("query_content", ConditionUtil.like(queryContent));
        }
        Page<Map<String, Object>> page = mySQLSimpleDao.pageQuery(sql, reqs, pageIndex, 10, order);
        if (page.getSize() > 0) {
            return page;
        } else {
            return null;
        }
    }
}

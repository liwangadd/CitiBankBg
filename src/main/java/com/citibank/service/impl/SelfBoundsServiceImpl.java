package com.citibank.service.impl;

import com.citibank.dao.ConditionUtil;
import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.SelfBoundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Nikolas on 2015/7/16.
 */
@Service
public class SelfBoundsServiceImpl implements SelfBoundsService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public Page<Map<String, Object>> getSelfBounds(String userId, int pageIndex, String queryContent, int userType) {
        StringBuffer sb=new StringBuffer();
        if(userType==0) {
            sb.append("select a.id, a.signTime, s.investIndustry as industry, s.productName from contract a left join investor u on a.secondId = u.investorId " +
                    "left join stockcreditor s on a.stockCreditorId = s.id where a.firstId =  :user_id");
        }else{
            sb.append("select a.id, a.signTime, s.investIndustry as industry, s.productName from contract a left join company u on a.secondId = u.companyId " +
                    "left join stockcreditor s on a.stockCreditorId = s.id where a.firstId = :user_id");
        }
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("user_id", userId);
        if(!"".equals(queryContent)){
            sb.append(" and s.productName  like :query_content");
            map.put("query_content", ConditionUtil.like(queryContent));
        }
        return mySQLSimpleDao.pageQuery(sb.toString(), map, pageIndex, 10, new Order());
    }


}

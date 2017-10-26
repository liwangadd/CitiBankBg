package com.citibank.service.impl;

import com.citibank.dao.Order;
import com.citibank.dao.Page;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.FinancingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zjm on 2015/7/21.
 * 公司的撮合配对
 * 加上投资者的撮合配对
 */

@Service("FinancingService")
public class FinancingServiceImpl implements FinancingService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public MySQLSimpleDaoImpl getMySQLSimpleDao() {
        return mySQLSimpleDao;
    }

    public void setMySQLSimpleDao(MySQLSimpleDaoImpl mySQLSimpleDao) {
        this.mySQLSimpleDao = mySQLSimpleDao;
    }

    public Page<Map<String, Object>> getMatching(Map<String, Object> params
//                                                 int fundBody,
//                                                 int lowMoney,
//                                                 int highMoney,
//                                                 double leastDemand,
//                                                 double highestDemand) {
    ) {
        Order order = new Order().asc("id");
        StringBuffer sb = new StringBuffer();
        sb.append("select s.id, s.productName,s.investArea as registerAddress, s.investIndustry as workingFiled,s.fundBody as investMoney,s.productType from stockcreditor s where 1=1");

        if (params.containsKey("investArea")) {
            sb.append(" and investArea=:investArea");
        }
        if (params.containsKey("investIndustry")) {
            sb.append(" and investIndustry=:investIndustry");
        }
//        System.out.println(params.toString());
        return mySQLSimpleDao.pageQuery(sb.toString(), params, 1, 10, order);

    }

    public Page<Map<String, Object>> getDefault(String userId) {
        String sql = "select s.id, s.productName,s.investArea as registerAddress, s.investIndustry as workingFiled,s.fundBody as investMoney,s.productType from stockcreditor s";
        return mySQLSimpleDao.pageQuery(sql, new HashMap<String, Object>(), 1, 10, new Order());
    }

    //
    public Page<Map<String, Object>> getDefaultInvestor() {
        String sql = "select s.*, i.username from " +
                "stockcreditor as s,investor as i where " +
                "s.userId=i.investorId";
        return mySQLSimpleDao.pageQuery(sql, new HashMap<String, Object>(), 1, 10, new Order());

    }

    //通过搜索名称和产品类型
    public Page<Map<String, Object>> getProductByNameAndType(Map<String, Object> req) {
        String sql = "select * from stockcreditor where productName=:productName and " +
                "productType=:productType";
        return mySQLSimpleDao.pageQuery(sql, req, 1, 10, new Order());
    }

    //通过搜索名称
    public Page<Map<String, Object>> getProductByName(Map<String, Object> reqs) {
        String sql = "select * from stockcreditor where productName=:productName";
        return mySQLSimpleDao.pageQuery(sql, reqs, 1, 10, new Order());

    }

    //通过id来来搜索产品
    public Page<Map<String, Object>> getProductById(Map<String, Object> req) {
        String sql = "select * from stockcreditor where id=:id";
        return mySQLSimpleDao.pageQuery(sql, req, 1, 10, new Order());
    }

    public Page<Map<String, Object>> getMatchingCompany(Map<String, Object> map, int pageIndex) {
        String sql = "select * from stockcreditor where investArea=:investArea " +
                "and investIndustry=:investIndustry and investMoney between :lowMoney and :highMoney " +
                "and creditRank between :lowCreditRank and :highCreditRank and leastReturnDemand between :lowLeastReturnDemand and :highLeastReturnDemand";
        Order order = new Order().asc("productName");
        Page<Map<String,Object>> pages = mySQLSimpleDao.pageQuery(sql, map, (pageIndex - 1) * 10 + 1, 10, order);
        
        return pages;
    }

}
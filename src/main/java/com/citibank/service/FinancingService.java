package com.citibank.service;


import com.citibank.dao.Page;

import java.util.Map;

/**
 * Created by zjm on 2015/7/21.
 */
public interface FinancingService {
    //撮合配对

    public Page<Map<String, Object>> getMatching(Map<String,Object> params
//                                                int fundBody,
//                                                int lowMoney,
//                                                int highMoney,
//                                                double leastDemand,
//                                                double heightDemand);
    );

    public Page<Map<String, Object>> getMatchingCompany(Map<String, Object> map, int pageIndex);

    public Page<Map<String, Object>> getDefault(String userId);

    public Page<Map<String, Object>> getDefaultInvestor();

    public Page<Map<String, Object>> getProductById(Map<String, Object> req);

    public Page<Map<String, Object>> getProductByName(Map<String, Object> reqs);

    //意向发布
    public Page<Map<String, Object>> getProductByNameAndType(Map<String, Object> req);

    //业务洽谈


    //电子签约


}

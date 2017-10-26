package com.citibank.service;

import java.util.Map;

/**
 * Created by liwang on 15-7-24.
 */
public interface FinanceService {

    public Map<String,Object> saveFinance(Map<String,Object> param);

    public Map<String,Object> getFinance(String userId);

}

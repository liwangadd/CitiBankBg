package com.citibank.service;

import com.citibank.dao.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by liwang on 15-7-21.
 */
public interface AssetService {

    public Page<Map<String, Object>> getCompanyStock(String userId, int pageIndex, String queryContent,
                                                     String duration, int type);

    public int getTotalMoney(String userId, String duration);

    public Page<Map<String,Object>> getInvestorStock(String userId, int pageIndex, String queryContent,
                                                     String duration, int type);

    //公司模式下的股权列表
    public List<Map<String,Object>> getCompanyStockManage(int value);

    //公司模式下的债券列表
    public List<Map<String,Object>> getCompanyDebtManage(int value);

    //公司模式资产管理搜索
    public Page<Map<String,Object>> getSearchContent(int type,String content);

    //投资者模式下的投资概况/股权管理/债权管理列表
    public Page<Map<String,Object>> getInventorCondition(int type,int value,String userId);

    //投资者模式下资产管理搜索
    public Page<Map<String,Object>> getInventorSearchContent(int type,String content,String userId);






}

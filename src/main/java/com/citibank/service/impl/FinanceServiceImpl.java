package com.citibank.service.impl;

import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by liwang on 15-7-24.
 */
@Service
public class FinanceServiceImpl implements FinanceService {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    public Map<String, Object> saveFinance(Map<String, Object> param) {
        String result;
        try {
            mySQLSimpleDao.create("financedata", param);
            result="success";
        }catch(Exception e){
            result="failed";
        }
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("result", result);
        return map;
    }

    public HashMap<String, Object> getFinance(String userId) {
        String sql="select * from financedata where id = ?";
        List<Map<String, Object>> list = mySQLSimpleDao.queryForList(sql,"b");
        Map<String,Object> map=list.get(0);
        HashMap<String,Object> result=new HashMap<String, Object>();
        //销售收入
        int saleIncome=Integer.valueOf(map.get("sellIncome").toString());
        //营业成本
        int bussinessCost=Integer.valueOf(map.get("bussinessCost").toString());
        //资产总额
        int totalAsset=Integer.valueOf(map.get("bussinessCost").toString());
        //负债总额
        int totalDebt=Integer.valueOf(map.get("totalDebt").toString());
        //流动资产
        int flowAsset=Integer.valueOf(map.get("flowAsset").toString());
        //流动负债
        int flowDebt=Integer.valueOf(map.get("flowDebt").toString());
        //当期销售净收入
        int currentSaleIncome=Integer.valueOf(map.get("currentSaleIncome").toString());
        //当期现销收入
        int currentRevenue=Integer.valueOf(map.get("currentRevenue").toString());
        //期末应收账款
        int finalReceivables=Integer.valueOf(map.get("finalReceivables").toString());
        //期初应收账余额
        int preReceivables=Integer.valueOf(map.get("preReceivables").toString());
        //利润
        int profit=Integer.valueOf(map.get("profit").toString());
        //所有者权益总额
        int ownerEquity=Integer.valueOf(map.get("ownerEquity").toString());
        //主营业务收入净额
        int majorBussinessIncome=Integer.valueOf(map.get("majorBussinessIncome").toString());
        //平均资产总额
        int averTotalAsset=Integer.valueOf(map.get("averTotalAsset").toString());

        result.put("saleProfit", (saleIncome-bussinessCost)/saleIncome*100+"%");
        result.put("assetDebt",totalDebt*100/totalAsset+"%");
        result.put("flowRate", flowAsset*100/flowDebt+"%");
        result.put("accountTurn", (currentSaleIncome - currentRevenue) / ((finalReceivables + preReceivables) / 2));
        if(Integer.valueOf(result.get("accountTurn").toString())!=0) {
            result.put("accountDay", 360 /Integer.valueOf(result.get("accountTurn").toString()));
        }else{
            result.put("accountDay","非法");
        }
        result.put("rewardRate", profit*100/ownerEquity+"%");
        result.put("assetTurn",majorBussinessIncome*100/averTotalAsset+"%");
        result.put("profit",profit);
        System.out.println(result.toString());
        return result;
    }
    
}

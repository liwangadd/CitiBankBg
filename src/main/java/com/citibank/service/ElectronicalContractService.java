package com.citibank.service;

import com.citibank.common.MacUtil;
import com.citibank.dao.Page;
import com.sun.javafx.logging.PulseLogger;
import javafx.beans.binding.ObjectExpression;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by liuhao on 15-7-21.
 */
public interface ElectronicalContractService {
    //通过登陆者的id来获得签合同的对方
    public Map<String,Object> getStateZeroOppositor(String id);
    //签约情况
    public boolean signState(Map<String,Object> reqs);
    //通过时间排序
    public Page<Map<String,Object>> orderByTime();
    //通过oppositor排序
    public Page<Map<String,Object>> orderByOppositor();
    //通过state拍讯
    public Page<Map<String,Object>> orderByState();
    //通过关键字排序
    public Page<Map<String,Object>> selectByKeyValue(String key);



}

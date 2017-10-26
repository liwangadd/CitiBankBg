package com.citibank.service;

import com.citibank.dao.Page;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by zjm on 2015/7/16.
 */

public interface MessageService {

    //发送信息
    public String sendMessage(Map<String,Object> reqs,HttpSession session);

    //接收消息
    public List<Map<String,Object>> showMessage(Map<String,Object> reqs,HttpSession session);

    //查看消息
    public Map<String,Object> checkMessage(Map<String,Object> reqs,HttpSession session);

    //定向披露
    public String DirectionalDisclosure(Map<String,Object> reqs);

    //获取系统消息
    public Page<Map<String, Object>> getSystemMessage(int pageIndex, String queryContent);

}

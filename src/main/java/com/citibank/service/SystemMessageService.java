package com.citibank.service;

import com.citibank.dao.Page;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by mrtian on 2015/7/16.
 */
public interface SystemMessageService {
    public List<Map<String,Object>> getAllMessage();
    public Page<Map<String, Object>> getSystemMessage(Map<String, Object> reqs,int flag);
    public Page<Map<String, Object>> getMessageByTime(Map<String, Object> reqs,int flag);
    public Page<Map<String, Object>> getMessageByContent(Map<String, Object> reqs,int flag);

}

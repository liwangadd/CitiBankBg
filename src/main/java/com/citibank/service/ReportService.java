package com.citibank.service;

import com.citibank.dao.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by Nikolas on 2015/7/21.
 */
public interface ReportService {

    //获取公告
    public Page<Map<String,Object>> getReport(int pageIndex, String queryContent,int type);

    //获取政策资讯
    public List<Map<String, Object>> getInformation(int type);

    //获取公告文件
    public String getReportFile(String id);

    public List<Map<String,Object>> getReportById(int type, String userId);

}

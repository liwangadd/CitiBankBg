package com.citibank.controller;

import com.citibank.dao.Page;
import com.citibank.service.FinanceService;
import com.citibank.service.ReportService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Nikolas on 2015/7/21.
 */
@Controller
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @Autowired
    private FinanceService financeService;

    //获取信息披露信息
    @RequestMapping(value = "/getReport/{type}", method = RequestMethod.GET)
    public String getReport(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                            @PathVariable(value = "type") Integer type,
                            Map<String, Object> map) {
        Page<Map<String, Object>> result = reportService.getReport(pageIndex, "", type);
        map.put("pageIndex", pageIndex);
        map.put("totalPage", result.getpageCount());
        map.put("data", result.getList());
        map.put("flag1", type);
        return "investor/information-center-notice";
    }

    //根据查询内容获取信息披露信息
    @RequestMapping(value = "/getReport/{type}/{queryContent}", method = RequestMethod.GET)
    public String searchReport(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                               @PathVariable(value = "queryContent") String queryContent,
                               @PathVariable(value = "type") Integer type,
                               Map<String, Object> map) {
        Page<Map<String, Object>> result = reportService.getReport(pageIndex, queryContent, type);
        map.put("pageIndex", pageIndex);
        map.put("totalPage", result.getpageCount());
        map.put("data", result.getList());
        map.put("flag1", type);
        return "investor/information-center-notice";
    }

    @RequestMapping(value = "/getCReport/{type}", method = RequestMethod.GET)
    public String getCReport(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                             @PathVariable(value = "type") Integer type,
                             Map<String, Object> map) {
        type = type != 2 ? type : 6;
        Page<Map<String, Object>> result = reportService.getReport(pageIndex, "", type);
        map.put("pageIndex", pageIndex);
        map.put("totalPage", result.getpageCount());
        map.put("data", result.getList());
        map.put("flag1", type);
        return "company/logined-company-issue";
    }

    @RequestMapping(value = "/policy.htm", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> getPolicyReport(@RequestParam(value = "type", required = false, defaultValue = "0") int type,
                                        Map<String, Object> map) {
        List<Map<String, Object>> result = reportService.getInformation(type);
        map.put("data", result);
        return map;
    }

    //查看信息披露详情
    @RequestMapping(value = "/detail/{reportId}", method = RequestMethod.GET)
    public String getReportDetail(@PathVariable("reportId") String reportId) {
        String fileUrl = reportService.getReportFile(reportId);
//        map.put("url", fileUrl);
        return "uploads/" + fileUrl;
    }

    @RequestMapping("/companyInfo.htm")
    public String getCompanyInfo(@RequestParam("companyId") String companyId, HttpSession session,
                                 Map<String, Object> map) {
        String userId = (String) session.getAttribute("userId");
        List<Map<String, Object>> onTime = reportService.getReportById(6, companyId);
        List<Map<String, Object>> temporary = reportService.getReportById(7, companyId);
        Map<String, Object> finance = financeService.getFinance(userId);
        map.put("onTime", onTime);
        map.put("temporary", temporary);
        map.put("finance", finance);
        return "";
    }

}
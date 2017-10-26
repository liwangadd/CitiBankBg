package com.citibank.controller;

import com.citibank.dao.Page;
import com.citibank.service.AssetService;
import com.citibank.service.ReportService;
import com.citibank.service.impl.FinanceServiceImpl;
import org.aspectj.apache.bcel.classfile.SourceFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by liwang on 15-7-21.
 */
@Controller
@RequestMapping(value = "/asset")
public class AssetController {

    @Autowired
    private AssetService assetService;

    @Autowired
    private FinanceServiceImpl financeService;

    @Autowired
    private ReportService reportService;

    //公司模块的资产详情
    @RequestMapping(value = "/assetDetail.htm")
    public String getAssetDetailPage(Map<String, Object> map, String userId) {
        HashMap<String, Object> data = financeService.getFinance(userId);
        List<Map<String, Object>> regularReport = reportService.getReport(1, "", 4).getList();
        List<Map<String, Object>> tempReport = reportService.getReport(1, "", 5).getList();
        regularReport = regularReport.subList(0, 4);
        tempReport = tempReport.subList(0, 4);
        map.put("data", data);
        map.put("regularReport", regularReport);
        map.put("tempReport", tempReport);
        System.out.println(regularReport.toString());
        System.out.println(tempReport.toString());
        return "/company/assert-manager";
    }

    //投资者模式的资产详情
    @RequestMapping(value = "/getChooseStockList")
    public String getCompanyChooseList1(@RequestParam Map<String, Object> reqs, HttpServletRequest req) {

        int value = Integer.parseInt(req.getParameter("time"));
        List<Map<String, Object>> list = assetService.getCompanyStockManage(value);
        req.setAttribute("data", list);
        return "/company/logined-company-proprety";
    }

    @RequestMapping(value = "getChooseDebtList")
    public String getComanyChooseList2(@RequestParam Map<String, Object> reqs, HttpServletRequest req) {
        int value = Integer.parseInt(req.getParameter("time"));
        List<Map<String, Object>> list = assetService.getCompanyDebtManage(value);
        req.setAttribute("data", list);
        return "/company/logined-company-proprety-debat";
    }

    @RequestMapping(value = "/search/{type}")
    public String search(@PathVariable(value = "type") Integer type,
                         HttpServletRequest request) {
        String content = request.getParameter("content");

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        list = assetService.getSearchContent(type, content).getList();
        request.setAttribute("data", list);

        if (type == 0) {
            return "/company/logined-company-proprety";
        } else {
            return "/company/logined-company-proprety-debat";
        }
    }

    @RequestMapping(value = "/company/{type}")
    public String getCompanyStock(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                                  @RequestParam(value = "queryContent", required = false, defaultValue = "") String queryContent,
                                  @RequestParam(value = "duration", required = false, defaultValue = "1_month") String duration,
                                  @PathVariable(value = "type") Integer type,
                                  HttpSession session, Map<String, Object> map,
                                  HttpServletRequest request) {
        List<Map<String, Object>> list = assetService.getCompanyStockManage(-1);
        request.setAttribute("data", list);
        if (type == 0) {
            return "company/logined-company-proprety";
        } else {
            return "company/logined-company-proprety-debat";
        }
    }

    @RequestMapping(value = "/investor/{type}")
    public String getInvestorStock(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                                   @RequestParam(value = "queryContent", required = false, defaultValue = "") String queryContent,
                                   @RequestParam(value = "duration", required = false, defaultValue = "1_month") String duration,
                                   @PathVariable(value = "type") Integer type,
                                   HttpSession session, Map<String, Object> map) {

        String userId = (String) session.getAttribute("userId");
        Page<Map<String, Object>> stockPage = assetService.getInvestorStock(userId, pageIndex, queryContent, duration, type);
        map.put("totalPage", stockPage.getpageCount());
        map.put("pageIndex", pageIndex);
        map.put("data", stockPage.getList());

        if (type == 0) {
            return "investor/socket-manage";
        } else if (type == 1) {
            return "investor/logined_investorpatten_stock_equity_management";
        } else {
            return "investor/logined_investorpatten_stockright_manage";
        }
    }

    @RequestMapping(value = "/getChooseInventorList/{type}")
    public String Search1(@PathVariable(value = "type") Integer type,
                          HttpSession session, HttpServletRequest request) {
        String userId = session.getAttribute("userId").toString();
        int value = Integer.valueOf(request.getParameter("radio-group").toString());
        List<Map<String, Object>> list = assetService.getInventorCondition(type, value, userId).getList();
        request.setAttribute("data", list);
        if (type == 0) {
            return "investor/logined_investorpatten_survey_of_investment";
        } else if (type == 1) {
            return "investor/logined_investorpatten_stock_equity_management";
        } else {
            return "investor/logined_investorpatten_stockright_manage";
        }
    }

    @RequestMapping(value = "/inventor/search/{type}")
    public String getInventorSearchContent(@PathVariable(value = "type") int type,
                                           HttpServletRequest request, HttpSession session) {
        String userId = session.getAttribute("userId").toString();
        String content = request.getParameter("content").toString();
        List<Map<String, Object>> list = assetService.getInventorSearchContent(type, content, userId).getList();
        request.setAttribute("data", list);
        if(type==0) {
            return "investor/logined_investorpatten_survey_of_investment";
        }
        else if(type==1){
            return "investor/logined_investorpatten_stock_equity_management";
        }
        else{
            return "investor/logined_investorpatten_stockright_manage";
        }
    }

    //资产管理点击进入详情
    @RequestMapping(value = "/getDetailPage")
    public String getDetailPage() {
        return "/investor/assetdetail";
    }


}

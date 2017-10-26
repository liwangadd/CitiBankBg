package com.citibank.controller;
import com.citibank.dao.Page;
import com.citibank.service.*;
import com.citibank.service.impl.UploadFileService;
import com.citibank.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by zjm on 2015/7/13.
 */

@Controller("CompanyController")
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UploadFileService uploadFileService;

    @Autowired
    private FinanceService financeService;

    @Autowired
    private ReportService reportService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private AppointService appointService;

    @Autowired
    private AttentionService attentionService;

    private final static String IMG_DESC_PATH = Constant.uploadPath;

    //企业模式已登陆首页
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getIndexPage(Map<String, Object> map) {
        List<Map<String, Object>> policy = reportService.getInformation(7);
        List<Map<String, Object>> market = reportService.getInformation(8);
        map.put("policy", policy);
        map.put("market", market);
        return "company/logined-business-index";
    }

    //根据排序搜索我的关注
    @RequestMapping(value = "/ifollow/{column}", method = RequestMethod.GET)
    public String getIfollowPage(@PathVariable("column") String column,
                                 //@RequestParam(value = "queryContent", required = false, defaultValue = "") String queryContent,
                                 HttpSession session, Map<String, Object> map) {
        String userId = (String) session.getAttribute("userId");
        if (column.equals("time")) {
            column = "otherId";
        } else if (column.equals("credit")) {
            column = "attStockCreditorId";
        } else {
            column = "id";
        }
        Page results = attentionService.getMyAttentionByCompanyId(userId, 1, column, "");
        map.put("attention", results.getList());
        return "company/personal-attiontion";
    }

    //搜索我的关注
    @RequestMapping("/isFollow/{content}")
    public String getFollowByContent(@PathVariable("content") String content, HttpSession session, Map<String, Object> map) {
        String userId = (String) session.getAttribute("userId");
        Page results = attentionService.getMyAttentionByCompanyId(userId, 1, "id", content);
        map.put("attention", results.getList());
        return "company/personal-attiontion";
    }

    //查看更多投资人
    @RequestMapping(value = "/more_investor.htm", method = RequestMethod.GET)
    public String getMore_investorPage() {
        return "company/user-corporate-mode-finance-patch";
    }

    //系统信息
//    @RequestMapping(value = "/s_message", method = RequestMethod.GET)
//    public String getS_messagePage(Map<String, Object> map) {
//        Map<String, Object> map0 = new HashMap<String, Object>();
//        map0.put("companyId", "a");//公司id;
//        map0.put("pageIndex", 1);//数据起始位置
//        Page page = messageService.getSystemMessage(map0, 0);//0代表系统消息
//        List<Map<String, Object>> results = page.getList();
//        map.put("system_message", results);
//        return "company/private-center-my-news";
//    }

    //私信
    @RequestMapping(value = "/p_letter", method = RequestMethod.GET)
    public String getP_letterPage() {
        return "company/personal_center_my_message_privately_down";
    }

    //定向披露
    @RequestMapping(value = "/d_disclosure", method = RequestMethod.GET)
    public String getD_disclosurePage() {
        return "company/personal_center_my_message_direction_down";
    }

    //预约管理
    @RequestMapping(value = "/reservation.htm", method = RequestMethod.GET)
    public String getReservationPage(Map<String, Object> map) {
        map.put("companyId", "a"); //公司id
        map.put("pageIndex", 1);//数据起始位置
        map.put("flag", 0);//是否已读
        Page page = appointService.getAppoint(map);
        List<Map<String, Object>> results = page.getList();
        map.put("manage_message_current", results);
        return "company/reservation-management-current-reservation";
    }

    //当前预约
    @RequestMapping(value = "/reservation_current.htm", method = RequestMethod.GET)
    public String getReservation_currentPage(Map<String, Object> map) {
        map.put("companyId", "a"); //公司id
        map.put("pageIndex", 1);//数据起始位置
        map.put("flag", 0);//是否已读-未读
        Page page = appointService.getAppoint(map);
        List<Map<String, Object>> results = page.getList();
        map.put("manage_message_current", results);
        return "company/reservation-management-current-reservation";
    }

    //已完成预约
    @RequestMapping(value = "/reservation_finish.htm", method = RequestMethod.GET)
    public String getReservation_finishPage(Map<String, Object> map) {
        map.put("companyId", "a"); //公司id
        map.put("pageIndex", 1);//数据起始位置
        map.put("flag", 1);//是否已读-已读
        Page page = appointService.getAppoint(map);
        List<Map<String, Object>> results = page.getList();
        map.put("manage_message_finish", results);
        return "company/reservation-management-finished-reservation";
    }

    //资料管理
    @RequestMapping(value = "/isource.htm", method = RequestMethod.GET)
    public String getIsourcePage(HttpSession session, Map<String, Object> map) {
        String companyId = (String) session.getAttribute("userId");
        System.out.println("companyId is:" + companyId);
        Map<String, Object> userInfo = companyService.getCompanyInfo(companyId);
        userInfo.put("logo", "/uploads/" + userInfo.get("logo"));
        map.put("userInfo", userInfo);
        return "company/data_management-edit";
    }

    //退出按钮
    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String getLogoutPage(HttpServletResponse response,HttpSession session)
    {
        session.removeAttribute("userId");
        Cookie cookie=new Cookie("username","");
        cookie.setPath("/customer");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "visitor/login";
    }



   /* //融资板块-撮合配对
    @RequestMapping(value = "/management.htm", method = RequestMethod.GET)
    public String getMacthing() {
        return "company/user-corporate-mode-finance-patch";
    }*/


    //跳转到公司信息发布的界面-中心公告
    @RequestMapping(value = "/invest.htm", method = RequestMethod.GET)
    public String getInformationPage() {
        return "company/logined-company-issue";
    }

    //信息发布-私募债列表
//    @RequestMapping(value = "/private-list.htm", method = RequestMethod.GET)
//    public String getPrivateList() {
//        return "company/message-publish-private-list";
//    }

    //信息发布-我要发布


    @RequestMapping(value = "/message-publish.htm", method = RequestMethod.GET)
    public String getMessagePublishPage(HttpSession session, Map<String, Object> map) {
        String userId = (String) session.getAttribute("userId");
        Map<String, Object> companyInfo = companyService.getCompanyInfo(userId);
        map.put("companyInfo", companyInfo);
        return "company/message-publish-my-publish";
    }

    //跳转到公司融资板块的界面
    @RequestMapping(value = "/finance.htm", method = RequestMethod.GET)
    public String getFinancePage() {
        return "company/user-corporate-mode-finance-patch";
    }


    //意向发布 私募股权
    @RequestMapping(value = "/esignature.htm", method = RequestMethod.GET)
    public String getInventionPage(HttpSession session, Map<String, Object> map) {
        String userId = (String) session.getAttribute("userId");
        Map<String, Object> userInfo = companyService.getCompanyInfo(userId);
      /*  userInfo.put("logo","/uploads/"+userInfo.get("logo"));*//*  userInfo.put("logo","/uploads/"+userInfo.get("logo"));*/
        map.put("userInfo", userInfo);
        return "company/financing-publish";
    }

    //意向发布 私募债
    @RequestMapping(value = "/simuzhai.htm", method = RequestMethod.GET)
    public String getInvention2Page(HttpSession session, Map<String, Object> map) {
        String id = (String) session.getAttribute("userId");
        Map<String, Object> userInfo = companyService.getCompanyInfo(id);
        map.put("userInfo", userInfo);
        return "/company/release_privately_raised_bonds";
    }

    //公司电子签约未完成
    @RequestMapping(value = "/invetfinane.htm", method = RequestMethod.GET)
    public String getSignPage() {
        return "company/undefined-financing-sign";
    }

    //二级目录 融资板块-电子签约-协议查询
    @RequestMapping(value = "/xieyichaxun.htm", method = RequestMethod.GET)
    public String getXieyichaxunPage() {
        return "company/inquiry-protocol-detail";
    }

    //电子签约-返回
    @RequestMapping(value = "/xieyifanhui.htm", method = RequestMethod.GET)
    public String getSign2Page() {
        return "company/undefined-financing-sign";
    }

    //信息发布-私募债列表
    @RequestMapping(value = "/private-list.htm", method = RequestMethod.GET)
    public String getPrivateList() {
        return "company/message-publish-private-list";
    }


    //信息发布-信用监管
    @RequestMapping(value = "/credit-takeover.htm", method = RequestMethod.GET)
    public String creditTakeover() {
        return "company/information_Credit_takeover";
    }

    //跳转到公司资产管理的界面-股权管理
    @RequestMapping(value = "/service.htm", method = RequestMethod.GET)
    public String getServicePage() {
        return "/company/logined-company-proprety";
    }

    //资产管理-债权管理

    @RequestMapping(value = "/stock-manag.htm", method = RequestMethod.GET)
    public String getServicedebatPage() {
        return "/company/logined-company-proprety-debat";
    }



    @RequestMapping(value = "/getCompanyInfo", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> getCompanyInfo(HttpSession session) {

        Map<String, Object> map = new HashMap<String, Object>();
        String userId = session.getAttribute("userId").toString();
        map = companyService.getCompanyInfo(userId);
        return map;
    }


    //验证验证码
    @RequestMapping(value = "/codeCheck", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> confirmCompanyCode(@RequestParam("code") String code) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("company_code", code);
        String result = companyService.confirmCompanyCode(map);
        map.clear();
        map.put("check", result);
        return map;
    }

    @RequestMapping(value = "confirmBussinessLisence", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> confirmBussinessLicense(@RequestParam Map<String, Object> reqs) {
        Map<String, Object> map = new HashMap<String, Object>();
        String result = companyService.confirmBussinessLisence(reqs);
        map.put("check", result);
        return map;
    }

    @RequestMapping(value = "/getUserInfo.htm", method = RequestMethod.GET)
    public String getUserInfo(HttpSession session, Map<String, Object> map) {
        String userId = (String) session.getAttribute("companyId");
        map.putAll(companyService.getCompanyInfo(userId));
        return "common/userInfo";
    }

    @RequestMapping(value = "/getUserInfo.html", method = RequestMethod.GET)
    public String getInfo(HttpSession session, Map<String, Object> map) {
        String userId = session.getAttribute("UserId").toString();
        map = companyService.getCompanyInfo(userId);
        return "company/financing-publish";
    }

    @RequestMapping(value = "/saveUserInfo", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, String> saveUserInfo(@RequestParam Map<String, Object> parms, HttpSession session,HttpServletRequest request) {
        String userId = (String) session.getAttribute("userId");
       // System.out.println("save-userid:" + userId + "____parms:" + parms.get("guarantor") + "____req:" + request.getAttribute("guarantor"));
        int result = companyService.saveCompanyInfo(parms, userId);
        System.out.println(parms);
        System.out.println("hell"+userId);
        Map<String, String> status = new HashMap<String, String>();
        if (result == 0) {
            status.put("result", "failed");
        } else {
            status.put("result", "success");
        }
        return status;
    }

    @RequestMapping(value = "/saveFinance", method = RequestMethod.POST)
    public Map<String, Object> saveFinance(@RequestParam Map<String, Object> params,
                                           HttpSession session) {
        String userId = (String) session.getAttribute("companyId");
        params.put("companyId", userId);
        Map<String, Object> result = financeService.saveFinance(params);
        return result;
    }

    @RequestMapping(value = "/nextstep", method = RequestMethod.POST)
    public String saveInfo(@RequestParam("logo") CommonsMultipartFile multipartFile, @RequestParam Map<String, Object> reqs, HttpSession session,
                           HttpServletRequest request) {
        String id = (String) session.getAttribute("userId");
        String phoneNum = reqs.remove("firstNum").toString() + reqs.remove("secondNum").toString();
        reqs.put("consultPhone", phoneNum);
        String path = request.getSession().getServletContext().getRealPath("") + IMG_DESC_PATH;
        try {
            reqs.put("logo", uploadFileService.uploadFile(multipartFile, path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        companyService.saveCompanyInfo(reqs, id);
        return "/visitor/finsh-reg";
    }
    //我的消息
    @RequestMapping(value = "/inews.htm", method = RequestMethod.GET)
    public String getInewsPage(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                               @RequestParam(value = "queryContent", required = false, defaultValue = "") String queryContent,
                               Map<String, Object> map) {
        //返回系统消息,首先得获取公司id.
        Page page = messageService.getSystemMessage(1, queryContent);//1代表投资者
        List<Map<String, Object>> results = page.getList();
        map.put("system_message", results);
        return "company/private_center_my_news_directional";
    }
    //公司的定向披露
    @RequestMapping(value = "/release")
    public String Relase()
    {
        return "company/inews-message-direction-down";
    }

    //私信

    @RequestMapping(value = "/privateNews")
    public String privateNews()
    {
        return "company/private-news";
    }

    @RequestMapping(value="/directionDown")
    public String getDirectionDown() {
        return "company/inews-message-direction-down";
    }

    @RequestMapping(value = "/productDebt")
    public String getProductDebt()
    {
        return "company/product-debt";
    }

    @RequestMapping(value = "isource")
    public String getIsource(HttpServletRequest req, Map<String, Object> map) {
        HttpSession session = req.getSession();
        String companyId = (String) session.getAttribute("userId");
        System.out.println("companyId is:" + companyId);
        Map<String, Object> userInfo = companyService.getCompanyInfo(companyId);
        System.out.print("companyinfo"+userInfo);
        userInfo.put("logo", "/uploads/" + userInfo.get("logo"));
        map.put("userInfo", userInfo);
        return "company/personal-center-information-management";
    }

}

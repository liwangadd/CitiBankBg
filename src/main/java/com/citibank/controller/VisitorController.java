package com.citibank.controller;

import com.citibank.service.ReportService;
import com.citibank.service.VisitorService;
import com.citibank.service.impl.CompanyServiceImpl;
import com.citibank.service.impl.InvestorServiceImp;
import com.google.code.kaptcha.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zjm on 2015/7/22.
 */

@Controller("InformationController")
@RequestMapping("/customer")
public class VisitorController {

    @Autowired
    private InvestorServiceImp investorService;
    @Autowired
    private CompanyServiceImpl companyService;
    @Autowired
    private VisitorService visitorService;
    @Autowired
    private ReportService reportService;

    //游客模式下查看政策咨询和市场咨询
    @RequestMapping(value = "/policy.htm", method = RequestMethod.GET)
    public String getPolicyPage() {
        return "visitor/policy";
    }

    //市场咨询
    @RequestMapping(value = "/market.htm", method = RequestMethod.POST)
    public String getMarketPage() {
        return "visitor/market";
    }

    @RequestMapping(value = "/echeck", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> confirmEmail(@RequestParam("data") String email) {
        Map<String, Object> map = new HashMap<String, Object>();
        String result = visitorService.confirmEmail(email);
        map.put("check", result);
        return map;
    }

    @RequestMapping(value = "/nameCheck", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> confirmName(@RequestParam("data") String name) {
        Map<String, Object> map = new HashMap<String, Object>();
        String result = visitorService.confirmName(name);
        map.put("check", result);
        return map;
    }

    @RequestMapping(value = "/nextstep", method = RequestMethod.POST)
    public String register(@RequestParam Map<String, Object> reqs, HttpSession session) {
        String flag = (String) reqs.get("userType");
        System.out.println(flag);
        reqs.remove("userType");
        reqs.remove("auth");
        reqs.remove("iagree");
        reqs.remove("re-password");
        session.setAttribute("userType", flag);

        if (flag.equals("投资者")) {

            investorService.registerInvestor(reqs);
            String id = (String) reqs.get("investorId");
            session.setAttribute("userId", id);
            return "investor/complete-reg";
        } else {
            companyService.userRegister(reqs);
            String id = (String) reqs.get("companyId");
            session.setAttribute("userId", id);
            return "company/complete-company-reg";
        }

    }

    @RequestMapping(value = "/financeCom", method = RequestMethod.GET)
    public String getFinancingCom() {
        return "visitor/finacing-company";
    }

    @RequestMapping("/financing_more/{num}")
    public String getComDetail(@PathVariable("num") int num) {
        return "visitor/customer_financing_more" + num;
    }

    //主界面
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getIndexPage(Map<String, Object> map) {
        return "visitor/customer-index";
    }

    //
    @RequestMapping(value = "/sign.htm", method = RequestMethod.GET)
    public String getSinaturePage() {
        return "visitor/customer-service-signature";
    }

    @RequestMapping(value = "/consulting.htm", method = RequestMethod.GET)
    public String getDetailsPage() {
        return "visitor/customer-consulting";
    }

    @RequestMapping(value = "/infoPolicy.htm", method = RequestMethod.GET)
    public String getInfoPolicyPage() {
        return "visitor/customer-information-policy";
    }

    @RequestMapping(value = "/invesStock.htm", method = RequestMethod.GET)
    public String getInvesStock() {
        return "visitor/customer-investment-stock";
    }

    @RequestMapping(value = "/marketNews.htm", method = RequestMethod.GET)
    public String getMarketNewsPage() {
        return "visitor/customer-market-news";
    }

    @RequestMapping(value = "/serviceAsset.htm", method = RequestMethod.GET)
    public String getserviceAssetPage() {
        return "visitor/customer-service-asset";
    }

    //验证验证码
    @RequestMapping(value = "/codeCheck", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> confirmCode(@RequestParam("data") String code) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("check", "success");
        return map;
    }

    //导航栏跳转请求响应，首页
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getIndexPageAgain(
            @CookieValue(value = "username", required = false) String username,
            @CookieValue(value = "password", required = false) String password,
            HttpSession session, HttpServletRequest request,
            Map<String, Object> map) {
        List<Map<String, Object>> policy = reportService.getInformation(7);
        List<Map<String, Object>> market = reportService.getInformation(8);
        map.put("policy", policy);
        map.put("market", market);
        if (username == null || password == null) {
            return "visitor/customer-index";
        }
        Map<String, Object> result = visitorService.login(username, password);
        if (result == null) {
            return "visitor/customer-index";
        }
        session.setAttribute("userType", result.get("userType"));
        if (Integer.valueOf(result.get("userType").toString()) == 0) {
            session.setAttribute("userId", result.get("userId"));
            return "redirect:/company/index";
        } else {
            session.setAttribute("userId", result.get("userId"));
            return "redirect:/investor/index";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password,
                          @RequestParam(value = "nologin", required = false, defaultValue = "0") int rememberMe,
                          @RequestParam("auth") String auth,
                          HttpSession session, HttpServletResponse response, Map<String, Object> map) {
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println(username + password);
        if (!code.equals(auth)) {
            map.put("auth", "failed");
            return "visitor/login";
        }
        Map<String, Object> result = visitorService.login(username, password);
        if (result == null) {
            map.put("check", "failed");
            return "visitor/login";
        }
        if (rememberMe == 1) {
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(7 * 24 * 3600);
            response.addCookie(cookie);
            cookie = new Cookie("password", password);
            cookie.setMaxAge(7 * 24 * 3600);
            response.addCookie(cookie);
        }
        session.setAttribute("userId", result.get("userId"));
        session.setAttribute("userType", result.get("userType"));
        if (result.get("userType").toString().equals("1")) {
            return "redirect:/investor/index";
        } else {
            return "redirect:/company/index";
        }
    }

    //首页-更多政策咨询
    @RequestMapping(value = "/report_more/{type}", method = RequestMethod.GET)
    public String getPolicy_morePage(@PathVariable("type") int type, Map<String, Object> map) {
        map.put("flag", type);
        List<Map<String, Object>> result = reportService.getInformation(type);
        map.put("information", result);
        return "visitor/customer-information-policy";
    }

    //首页-更多市场咨询
    @RequestMapping(value = "/mark_more", method = RequestMethod.GET)
    public String getMark_morePage(Map<String, Object> map) {
        map.put("flag", 0);
        return "visitor/customer-market-news";
    }

    //导航栏跳转请求响应，融资企业
    @RequestMapping(value = "/finance", method = RequestMethod.GET)
    public String getFinancePage(Map<String, Object> map) {
        map.put("flag", 1);
        return "visitor/finacing-company";
    }

    //导航栏跳转请求响应，投资中心
    @RequestMapping(value = "/invest", method = RequestMethod.GET)
    public String getInvestPage(Map<String, Object> map) {
        map.put("flag", 2);
        return "visitor/customer_investment_hall";
    }

    //投资中心-私募股权详情
    @RequestMapping(value = "/invest_more", method = RequestMethod.GET)
    public String getInvest_morePage(Map<String, Object> map) {
        map.put("flag", 2);
        return "visitor/customer-investment-stock";
    }

    //投资中心-私募债详情
    @RequestMapping(value = "/debt_more", method = RequestMethod.GET)
    public String getDebt_morePage(Map<String, Object> map) {
        map.put("flag", 2);
        return "visitor/customer_investment_debt";
    }

    //导航栏跳转请求响应，企业服务-主
    @RequestMapping(value = "/service", method = RequestMethod.GET)
    public String getServicePage(Map<String, Object> map) {
        map.put("flag", 3);
        return "visitor/customer-business-service";
    }

    //导航栏跳转请求响应，企业服务-资产管理
    @RequestMapping(value = "/management", method = RequestMethod.GET)
    public String getService_01Page(Map<String, Object> map) {
        map.put("flag", 3);
        return "visitor/customer-service-asset";
    }

    //导航栏跳转请求响应，企业服务-电子签约
    @RequestMapping(value = "/esignature", method = RequestMethod.GET)
    public String getService_02Page(Map<String, Object> map) {
        map.put("flag", 3);
        return "visitor/customer-service-signature";
    }

    //导航栏跳转请求响应，企业服务-投融资
    @RequestMapping(value = "/invetfinane", method = RequestMethod.GET)
    public String getService_03Page(Map<String, Object> map) {
        map.put("flag", 2);
        return "visitor/customer_investment_hall";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String getLoginPage() {
        return "visitor/login";
    }

    //导航栏跳转请求响应，注册按钮
    @RequestMapping(value = "/register.htm", method = RequestMethod.GET)
    public String getRegPage() {
        return "visitor/reg";
    }

    @RequestMapping(value = "/assess")
    public String getAssess()
    {
        return "visitor/level-assess";
    }
    @RequestMapping(value = "assess_1")
    public String getAsseeOne()
    {
        return "visitor/assess1";
    }
    @RequestMapping(value = "assess_2")
    public String getAssessTwo()
    {
        return "visitor/assess2";
    }
}

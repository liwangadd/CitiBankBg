package com.citibank.controller;

import com.citibank.service.FinancingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2015/7/21.
 */
//撮合配对的页面
@Controller
@RequestMapping(value = "/financing")
public class FinancingController {

    @Autowired
    private FinancingService financingService;

    //撮合配对的页面,也是投资板块的首页
    @RequestMapping(value = "/Matching.htm")
    public String getMatchingPage(@RequestParam(value = "investArea", required = false) String[] areas, @RequestParam(value = "investIndustry", required = false) String[] industrys,
                                  Map<String, Object> map, HttpSession session) {
        Map<String, Object> params = new HashMap<String, Object>();
        String userId = (String) session.getAttribute("userId");
        params.put("user_id", userId);
        int flag = 0;
        if (areas != null) {
            ++flag;
            params.put("investArea", areas[0]);
        }
        if (industrys != null) {
            ++flag;
            params.put("investIndustry", industrys[0]);
        }
        if (flag != 0)
            map.put("data", financingService.getMatching(params).getList());
        else
            map.put("data", financingService.getDefault(userId).getList());
        System.out.println(map.get("data"));
        return "investor/company-corporate-mode-finance-patch";
    }


    //投资者的撮合配对
    @RequestMapping(value = "/investor/matching")
    public String getMatchingCompanyPage(@RequestParam Map<String, Object> reqs,
                                         @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
                                         HttpSession session, Map<String, Object> map) {
        map.put("data", financingService.getMatchingCompany(reqs, pageIndex).getList());
        //System.out.println(map);

        return "investor/company-corporate-mode-finance-patch";
    }

    //跳到公司撮合配对界面
    @RequestMapping(value = "/company/Matching.htm")
    public String getcMatchingPage(@RequestParam(value = "investArea", required = false) String[] areas,
                                   @RequestParam(value = "investIndustry", required = false) String[] industrys,
                                   HttpSession session, Map<String, Object> map) {
        Map<String, Object> params = new HashMap<String, Object>();
        String userId = (String) session.getAttribute("userId");
        params.put("user_id", userId);
        int flag = 0;
        if (areas != null) {
            ++flag;
            params.put("investArea", areas[0]);
        }
        if (industrys != null) {
            ++flag;
            params.put("investIndustry", industrys[0]);
        }
        if (flag != 0)
            map.put("data", financingService.getMatching(params).getList());
        else
            map.put("data", financingService.getDefault(userId).getList());
        return "company/user-corporate-mode-finance-patch";
    }
//
//    //公司的撮合配对根据选择条件
//    @RequestMapping(value = "/company/matching", method = RequestMethod.POST)
//    public String getMatching(@RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
//                              @RequestParam(value = "investArea", required = false, defaultValue = "") String investArea,
//                              @RequestParam(value = "investIndustry", required = false, defaultValue = "") String investIndustry,
//                              @RequestParam(value = "fundBody", required = false, defaultValue = "-1") int fundBody,
//                              @RequestParam(value = "lowMoney", required = false, defaultValue = "-1") int lowMoney,
//                              @RequestParam(value = "highMoney", required = false, defaultValue = "-1") int highMoney,
//                              @RequestParam(value = "leastDemand", required = false, defaultValue = "-1") double leastDemand,
//                              @RequestParam(value = "highestDemand", required = false, defaultValue = "-1") double highestDemand,
//
//                              HttpSession session, Map<String, Object> map) {
//        String userId = session.getAttribute("userId").toString();
//        int userType = (Integer) session.getAttribute("userType");
//        Page<Map<String, Object>> page = financingService.
//                getMatching(userId,
//                        userType,
//                        pageIndex,
//                        investArea,
//                        investIndustry,
//                        fundBody,
//                        lowMoney,
//                        highMoney,
//                        leastDemand,
//                        highestDemand);
//        map.put("totalPage", page.getpageCount());
//        map.put("data", page.getList());
//        System.out.println(page.getList());
//        return "/company/itemcuohepeidui";
//    }

    //公司撮合配对根据搜索条件
    @RequestMapping(value = "/byKey", method = RequestMethod.POST)
    public String companyByKey(@RequestParam Map<String, Object> reqs,
                               Map<String, Object> map)

    {
        System.out.print(reqs);
        if (reqs.get("productType").toString().equals("全部")) {
            reqs.remove("productType");
            map.put("data", financingService.getProductByName(reqs).getList());
        } else {
            map.put("data", financingService.getProductByNameAndType(reqs).getList());
        }
        return "investor/company-corporate-mode-finance-patch";


    }

    //撮合配对的点击详细界面
    @RequestMapping(value = "/getDetail/{id}")
    public String getDetail(@PathVariable String id, Map<String, Object> map) {
        Map<String, Object> map1 = new HashMap<String, Object>();
        map1.put("id", id);
        map.put("data", financingService.getProductById(map1).getList());
        System.out.print(map1);
        System.out.println(map);
        return "/investor/detail";
    }
}

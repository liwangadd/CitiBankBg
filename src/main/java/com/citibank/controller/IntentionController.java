package com.citibank.controller;

import com.citibank.common.IdUtil;
import com.citibank.service.impl.IntentionServiceImpl;
import com.citibank.service.impl.InvestorServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liuhao on 15-7-21.
 */
@Controller
@RequestMapping("/intention")
public class IntentionController {

    @Autowired
    private IntentionServiceImpl intentionService;
    @Autowired
    private InvestorServiceImp investorServiceImp;
    //投资者
    //意向发布的页面默认返回股权的页面
    @RequestMapping(value = "/getIntentionPage")
    public ModelAndView getIntentionPage(HttpSession session)
    {
        String userId=session.getAttribute("userId").toString();

        return new ModelAndView("investor/release_tender_offers","data",
                investorServiceImp.getInvestorInfo(userId));
    }


    //意向发布的债权页面
    @RequestMapping(value = "/getDebtPage")
    public ModelAndView getDebtPage(HttpSession session)
    {
        String userId=(String)session.getAttribute("userId");

        return new ModelAndView("investor/release_debt_purchase","data",
                investorServiceImp.getInvestorInfo(userId));
    }


   /* @RequestMapping("/intention.htm")
    public Map<String, Object> investorInfo(HttpSession session) {
        String investorid = (String) session.getAttribute("investorId");
        Map<String, Object> result = intentionService.getInvestorinfoById(investorid);
        return result;

    }
*/
    //意向发布的按钮
    @RequestMapping(value = "/intentionPublish", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> intentionPublish(@RequestParam Map<String, Object> reqs,
                                              /*@PathVariable int post,*/
                                               HttpSession session
                                              ) {
        Map<String, String> map = new HashMap<String, String>();
        String userId=session.getAttribute("userId").toString();
        reqs.put("userId", userId);
        String id= IdUtil.uuid();
        reqs.put("id",id);
        System.out.println(reqs);
        reqs.put("productName", id);


        if (intentionService.publishIntention(reqs)) {

            map.put("result", "suceess");
        } else {
            map.put("result", "fail");
        }

        System.out.println(map);
        return map;
    }

}

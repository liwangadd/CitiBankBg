package com.citibank.controller;

import com.citibank.service.impl.ElectronicalContractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liuhao on 15-7-22.
 */
@Controller("ElectronicalContractController")
@RequestMapping(value = "/electronical")
public class ElectronicalContractController {

    @Autowired
    private ElectronicalContractServiceImpl electronicalContractService;
    //点击电子签约出现的界面
    @RequestMapping("/getElectronicalPage")
    public String getElectronicalPage() {
        return "investor/check-investment-sign";
    }

    //跳转到签合同页面,"协议签约" 没给
    @RequestMapping("/signContract.htm")
    public ModelAndView getSignContractPage() {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("oppositors", electronicalContractService.getOppositorList());
        return new ModelAndView("investor/check-investment-sign", "oppositors", result);
    }


    //单选公司然后出现合同内容
    @RequestMapping("/getContractContent")
    public Map<String, Object> getContractContent(HttpSession session) {
        String id = (String) session.getAttribute("investorId");
        return electronicalContractService.getStateZeroOppositor(id);
    }

  /*  //点击协议查询返回默认按时间排序
    @RequestMapping("/checkContract")
    public ModelAndView checkContract()
    {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("result",electronicalContractService.orderByTime());
        return new ModelAndView("checkContract","result",map);
    }*/
  @RequestMapping("/checkContract")
  public String checkContract() {

      return "/investor/eletronic-contrating-inquiry-protocol";
  }

    //按对方排序
    @RequestMapping(value = "/orderByOppositor")
    public ModelAndView orderByOpp()
    {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("result",electronicalContractService.orderByOppositor());
        return new ModelAndView("checkContract","result",map);
    }
    //按状态排
    @RequestMapping(value = "/orderByState")
    public ModelAndView orderByState()
    {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("result",electronicalContractService.orderByState());
        return new ModelAndView("checkContract","result",map);
    }
    @RequestMapping(value = "/orderByKeyValue")
    public ModelAndView orderByState(@RequestParam Map<String,Object> reqs)
    {
        String key= (String) reqs.get("keyValue");
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("result",electronicalContractService.selectByKeyValue(key));
        return new ModelAndView("checkContract","result",map);
    }
    @RequestMapping(value = "/protolResign")
    public String getProtolRe()
    {
        return "investor/search-protocol";
    }

    @RequestMapping(value = "/protolDetail")
    public String getProtolDetail()
    {
        return "company/inquiry-protocol-protocol-detail";
    }





}

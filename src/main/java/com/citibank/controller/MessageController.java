package com.citibank.controller;

import com.citibank.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zjm on 2015/7/16.
 */
@Controller("MessageController")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/privateLetter.htm", method = RequestMethod.GET)
    public String getPrivateLetterPage() {
        return "";
    }

    @RequestMapping(value = "/DirectionalDisclosure.htm", method = RequestMethod.GET)
    public String getDirectionalDisclosurePage() {
        return "";
    }


    @RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> sendMessage(@RequestParam Map<String, Object> reqs, HttpSession session) {
        String id = session.getAttribute("userId").toString();
        String result = messageService.sendMessage(reqs, session);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", result);
        return map;
    }

    @RequestMapping(value = "/showMessage", method = RequestMethod.POST)
    public List<Map<String, Object>> showMessage(@RequestParam Map<String, Object> reqs, HttpSession session) {
        List<Map<String, Object>> list = messageService.showMessage(reqs, session);
        return list;
    }

    //查看私信
    @RequestMapping(value = "/checkMessage", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> checkMessage(@RequestParam Map<String, Object> reqs, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        map = messageService.checkMessage(reqs, session);
        return map;
    }

    //定向披露
    @RequestMapping(value = "/DirectionalDisclosure", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> DirectionalDisclosure
    (@RequestParam Map<String, Object> reqs, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();

        if (Integer.parseInt(session.getAttribute("userType").toString()) == 1) {
            String result = messageService.DirectionalDisclosure(reqs);

            map.put("result", result);
        } else {
            map.put("result", "error");
        }
        return map;
    }


}

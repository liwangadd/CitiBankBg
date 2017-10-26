package com.citibank.controller;

import com.citibank.dao.Page;
import com.citibank.service.AppointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Nikolas on 2015/7/16.
 */
@Controller
@RequestMapping("/appoint")
public class AppointController {

    @Autowired
    private AppointService appointService;

    //预约排序
    @RequestMapping("/reservation/{type}/{column}")
    public String getAppoint(@PathVariable(value = "column") String columnName,
                             @PathVariable(value = "type") int type,
                             HttpSession session, Map<String, Object> map) {
        map.put("user_id", session.getAttribute("userId")); //公司id
        map.put("pageIndex", 1);//数据起始位置
        map.put("flag", type);//是否已读
        map.put("column",columnName);
        Page page = appointService.getAppoint(map);
        List<Map<String, Object>> results = page.getList();
        map.put("manage_message_current", results);
        return "company/reservation-management-current-reservation";
    }

    @RequestMapping("/reservation/{type}/{column}/{queryContent}")
    public String getAppointByQuery(@PathVariable(value = "queryContent") String queryContent,
                             @PathVariable(value = "column") String columnName,
                             @PathVariable(value = "type") int type,
                             HttpSession session, Map<String, Object> map) {
        map.put("user_id", session.getAttribute("userId")); //公司id
        map.put("pageIndex", 1);//数据起始位置
        map.put("flag", type);//是否已读
        map.put("column",columnName);
        map.put("queryContent", queryContent);
        Page page = appointService.getAppoint(map);
        List<Map<String, Object>> results = page.getList();
        map.put("manage_message_current", results);
        return "company/reservation-management-current-reservation";
    }

    @RequestMapping(value = "/compReser/{reserId}/{type}", method = RequestMethod.GET)
    public String completeReservation(@PathVariable(value = "reserId") String reserId,
                                      @PathVariable(value = "type") int type,
                                      HttpSession session, Map<String, Object> map) {
        appointService.completeReservation(reserId);
        map.put("user_id", session.getAttribute("userId")); //公司id
        map.put("pageIndex", 1);//数据起始位置
        map.put("flag", type);//是否已读
        Page page = appointService.getAppoint(map);
        List<Map<String, Object>> results = page.getList();
        map.put("manage_message_current", results);
        return "company/reservation-management-current-reservation";
    }


}

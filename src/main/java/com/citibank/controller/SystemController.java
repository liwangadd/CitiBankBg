package com.citibank.controller;

import com.citibank.common.IdUtil;
import com.citibank.dao.impl.MySQLSimpleDaoImpl;
import com.citibank.service.AssetService;
import com.citibank.service.VisitorService;
import com.citibank.service.impl.FinancingServiceImpl;
import com.citibank.service.impl.UploadFileService;
import com.citibank.utils.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by zjm on 2015/7/12.
 */

@Controller("SystemController")
public class SystemController {

    @Autowired
    private MySQLSimpleDaoImpl mySQLSimpleDao;

    @Autowired
    private UploadFileService uploadFile;
    @Autowired
    private FinancingServiceImpl financingService;


    private final static String IMG_DESC_PATH = Constant.uploadPath;

    @RequestMapping("/index")
    public String index() {
//        return "investor/network-service-protocol";
        return "main/index";
    }

    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public
    @ResponseBody
    String uploadFile(@RequestParam("fileUpload") CommonsMultipartFile multipartFile,
                      @RequestParam("type") int type, HttpServletRequest request) {

        String fileName = multipartFile.getOriginalFilename();
        String extName = fileName.substring(fileName.lastIndexOf("."));
        String newName = IdUtil.uuid() + extName;
        File file = new File("D:\\files\\" + newName);
        try {
            multipartFile.transferTo(file);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", IdUtil.uuid());
        map.put("flag", type);
        map.put("fileName", multipartFile.getOriginalFilename());
        map.put("path", newName);

        mySQLSimpleDao.create("information", map);

        return "success";
    }

    @RequestMapping("/")
    public String homePage(HttpServletRequest request, HttpSession session) {
        return "redirect:/customer/index";
    }

    //去首页看看的跳转（分为投资者和企业）
    @RequestMapping("/goIndex.htm")
    public String goIndex(HttpServletRequest request, HttpSession session) {
        String flag = (String) session.getAttribute("userType");
        if ("投资者".equals(flag)) {
            return "investor/logined-invest-index";
        } else if ("企业".equals(flag)) {
            return "company/logined-business-index";
        } else {
            System.out.println("error");
        }
        return null;
    }

    //去完善信息的跳转（分为投资者和企业）
    @RequestMapping("/completeInformation.htm")
    public String completeInformation(HttpServletRequest request, HttpSession session) {
        String flag = (String) session.getAttribute("userType");
        if ("投资者".equals(flag)) {
            return "redirect:/investor/isource";
        } else if ("企业".equals(flag)) {
            return "redirect:/company/isource";
        } else {
            System.out.println("error");
        }
        return null;
    }

    @RequestMapping(value = "/protopl")
    public String getNet() {
        return "/investor/network-service-protocol";
    }


}


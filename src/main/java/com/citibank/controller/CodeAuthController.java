package com.citibank.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liwang on 15-7-24.
 */
@Controller
public class CodeAuthController {

    @Autowired
    private Producer captchaProducer;

    @RequestMapping("/getCode/**")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setDateHeader("Expires", 0);
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            response.setHeader("Cache-Control", "post-check=0,pre-check=0");
            response.setHeader("Pragma", "no-cache");
            response.setContentType("image/jpeg");
            String captText = captchaProducer.createText();
            request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, captText);
            BufferedImage image = captchaProducer.createImage(captText);
            ServletOutputStream outputStream = response.getOutputStream();
            ImageIO.write(image, "jpeg", outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "authCheck/*", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> authCheck(@RequestParam("data") String code,
                                  HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        String auth = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println(session.getAttribute(Constants.KAPTCHA_SESSION_KEY) + "---" + code);
        if (code.equals(auth)) {
            map.put("check", "success");
        } else {
            map.put("check", "failed");
        }
        return map;
    }

}
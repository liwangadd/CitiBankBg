package com.citibank.service.impl;

import com.citibank.common.IdUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URL;
import java.util.Map;
import java.util.UUID;

@Service("uploadFileService")
public class UploadFileService {
    private final static String IMG_DESC_PATH =File.separator+"uploads"+File.separator;

    public String uploadFile(CommonsMultipartFile multipartFile, String path) throws IOException {
        String fileName = createUri(multipartFile, path);
        File file = new File(path+fileName);
        try{
            multipartFile.transferTo(file);
        }catch(Exception e){
            e.printStackTrace();
        }
        return fileName;
    }
    /**
     * 为图片产生uri 返回给前端
     * @param file
     * @return
     */

    public static String createUri(MultipartFile file,String path){
//        String imgPath = request.getSession().getServletContext().getRealPath("")+IMG_DESC_PATH;
        String fileName = file.getOriginalFilename();
        String extName = fileName.substring(fileName.lastIndexOf("."));
        String newName = IdUtil.uuid()+extName;
        return newName;

    }
}

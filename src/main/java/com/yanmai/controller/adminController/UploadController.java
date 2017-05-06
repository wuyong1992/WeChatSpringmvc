package com.yanmai.controller.adminController;

import com.google.gson.Gson;
import com.yanmai.util.UploadUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * Created by admin on 2017/5/2.
 */
@Controller
public class UploadController {


    @RequestMapping("uploader")
    public void upload(HttpServletRequest request, HttpServletResponse response){

        String upaloadUrl = "C:\\upload\\";//文件存放位置

        UploadUtil.uploadImg(request,upaloadUrl);
    }

    @RequestMapping(value = "goUpload")
    public String gotoUpload(){

        return "test/webupload";
    }

    @RequestMapping(value = "testUpload")
    public String testUpload(){

        System.out.println("跳转");
        return "test/webupload2";
    }

    @RequestMapping("uploader2")
    public String uploads(@RequestParam("file")MultipartFile sortPicImg, HttpServletRequest request, HttpServletResponse response) {

        System.out.println("hahah");
        String upaloadUrl = "C:\\apache-tomcat-8.0.14\\webapps\\articleUpload\\";//文件存放位置

        UploadUtil.uploadImg(request,upaloadUrl);

        //String path = SysConstants.PIC_SERVER_FILE_ROOT_DIR +SysConstants.PIC_PTYPE_DIR ;
        String fileName = System.currentTimeMillis()+"_"+sortPicImg.getOriginalFilename();
        File targetFile = new File(upaloadUrl, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        JSONObject json = new JSONObject();
        Gson gson = new Gson();
        //保存
        try {
            sortPicImg.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String,String> map = new HashMap<String,String>();
            //json.put("msg","error");
            map.put("msg","error");
            return gson.toJson(map);
            //return json.toJSONString();
        }
        json.put("msg","success");
        //json.put("filePath",request.getContextPath() + "/upload/" + fileName);
        File retfile = new File(upaloadUrl, fileName);
        Map<String,String> map = new HashMap<String,String>();
        json.put("filePath",retfile.getPath());
        //System.out.println("json="+json.toJSONString());
        //return  json.toJSONString();
        map.put("filePath",retfile.getPath());
        return gson.toJson(map);
    }


}

package com.yanmai.controller.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * 系统设置入口
 * Created by admin on 2017/5/3.
 */

@Controller
@RequestMapping("admin")
public class SystemSetController {

    //理解开通页面VIP背景图
    @RequestMapping(value = "system-vipBGI")
    public String systemVipBGI(){
        return "admin/system-vipBGI";
    }

    //背景图片上传
    @RequestMapping("vipBGIUploader")
    public String vipBGIUploader(HttpServletRequest request, HttpServletResponse response){

        Integer count = 0;
        System.out.println("收到图片2!");
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        String upaloadUrl = "C:\\upload\\";//文件存放位置
        File dir = new File(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            count++;
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(upaloadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("接收完毕");

        return "admin/main";      //TODO 改成提交完了回显
    }


    //年费价格（优惠前）
    @RequestMapping(value = "system-price")
    public String systemPrice(){
        return "admin/system-price";
    }

    //年费价格（优惠前）处理
    @RequestMapping(value = "priceHandler")
    public String priceHandler(){
        System.out.println("收到原价");
        return "admin/main";
    }

    //免费体验天数
    @RequestMapping(value = "system-freeDay")
    public String systemFreeDay(){
        return "admin/system-freeDay";
    }

    //免费体验天数处理
    @RequestMapping(value = "freeDayHandler")
    public String freeDayHandler(){
        System.out.println("收到原价");
        return "admin/main";
    }

    //无极玄推广
    @RequestMapping(value = "system-promotion")
    public String systemPromotion(){
        return "admin/system-promotion";
    }

    //推广处理
    @RequestMapping(value = "promotionHandler")
    public String promotionHandler(){
        return "admin/main";
    }


    //无极玄推广头像
    @RequestMapping(value = "system-avatar")
    public String systemAvatar(){
        return "admin/system-avatar";
    }



    //无极玄推广头像上传
    @RequestMapping("avatarUploader")
    public String avatarUpload(HttpServletRequest request, HttpServletResponse response){

        Integer count = 0;
        System.out.println("收到图片2!");
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        String upaloadUrl = "C:\\upload\\";//文件存放位置
        File dir = new File(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            count++;
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(upaloadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("接收完毕");

        return "admin/main";      //TODO 改成提交完了回显
    }


    //无极玄推广二维码
    @RequestMapping(value = "system-QRcode")
    public String systemQRcode(){
        return "admin/system-QRcode";
    }

    //无极玄推广二维码上传
    @RequestMapping("QRcodeUploader")
    public String QRcodeUploader(HttpServletRequest request, HttpServletResponse response){

        Integer count = 0;
        System.out.println("收到图片2!");
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        String upaloadUrl = "C:\\upload\\";//文件存放位置
        File dir = new File(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            count++;
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(upaloadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("接收完毕");

        return "admin/main";      //TODO 改成提交完了回显
    }


    //无极玄推广海报
    @RequestMapping(value = "system-placard")
    public String systemPlacard(){
        return "admin/system-QRcode";
    }

    //无极玄推广海报上传
    @RequestMapping("placardUploader")
    public String placardUploader(HttpServletRequest request, HttpServletResponse response){

        Integer count = 0;
        System.out.println("收到图片2!");
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象

        String upaloadUrl = "C:\\upload\\";//文件存放位置
        File dir = new File(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            count++;
            String fileName=file.getOriginalFilename();
            //使用随机字符串生产新的文件名
            String newFileName = UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
            File tagetFile = new File(upaloadUrl+newFileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        System.out.println("接收完毕");

        return "admin/main";      //TODO 改成提交完了回显
    }


}

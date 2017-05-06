package com.yanmai.controller.adminController;

import com.yanmai.util.UploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 系统设置入口
 * Created by admin on 2017/5/3.
 */

@Controller
@RequestMapping("admin")
public class SystemSetController {

    //系统设置中的文件上传地址
    String upaloadUrl = "C:\\apache-tomcat-8.0.14\\webapps\\systemSetUpload\\";

    //理解开通页面VIP背景图
    @RequestMapping(value = "system-vipBGI")
    public String systemVipBGI(){
        return "admin/system-vipBGI";
    }

    //背景图片上传
    @RequestMapping("vipBGIUploader")
    public String vipBGIUploader(HttpServletRequest request, HttpServletResponse response){

        //String upaloadUrl = "C:\\upload\\";//文件存放位置

        UploadUtil.uploadImg(request,upaloadUrl);

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

        //String upaloadUrl = "C:\\upload\\";//文件存放位置

        UploadUtil.uploadImg(request,upaloadUrl);

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

        //String upaloadUrl = "C:\\upload\\";//文件存放位置

        UploadUtil.uploadImg(request,upaloadUrl);

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

        //String upaloadUrl = "C:\\upload\\";//文件存放位置

        UploadUtil.uploadImg(request,upaloadUrl);

        return "admin/main";      //TODO 改成提交完了回显
    }


}

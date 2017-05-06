package com.yanmai.controller.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台控制器
 *
 * Created by admin on 2017/5/2.
 */
@Controller
@RequestMapping("admin")
public class AdminMainController {

    //后台登陆
    @RequestMapping("")
    public String login(){
        return "admin/login";
    }

    //后台主框架首页
    @RequestMapping("main")
    public String main(){
        return "admin/main";
    }

    //用户列表
    @RequestMapping(value = "userList")
    public String userList(){
        return "admin/user-list";
    }

    //显示某个用户的详细信息
    @RequestMapping(value = "user-show")
    public String userShow(){
        return "admin/user-show";
    }




    //财务列表
    @RequestMapping(value = "bill-list")
    public String billList(){
        return "admin/bill-list";
    }

    //管理员列表
    @RequestMapping(value = "admin-list")
    public String adminList(){
        return "admin/admin-list";
    }

    //添加管理员
    @RequestMapping(value = "admin-add")
    public String adminAdd(){
        return "admin/admin-add";
    }

     //添加管理员处理
    @RequestMapping(value = "adminAddHandle")
    public String adminAddHandle(){
        return "redirect:/admin/admin-list";
    }





    //banner图列表
    @RequestMapping(value = "banner-list")
    public String bannerList(){
        System.out.println("banner列表");
        return "admin/banner-list";
    }

    //添加banner图
    @RequestMapping(value = "banner-add")
    public String bannerAdd(){
        return "admin/banner-add";
    }

    //编辑banner图
    @RequestMapping(value = "banner-editor")
    public String bannerEditor(){
        return "admin/banner-editor";
    }

    //添加文章处理controller
    @RequestMapping(value = "bannerHandle")
    public String bannerHandle(){
        System.out.println("banner图已收到");
        return "redirect:/admin/banner-list";
    }




}

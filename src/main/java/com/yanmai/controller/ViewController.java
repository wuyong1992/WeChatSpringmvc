package com.yanmai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by admin on 2017/4/5.
 */
@Controller
public class ViewController extends GenericController {

    @RequestMapping(value = "userInfo")
    public String goUserInfo(){

        return "userInfo";
    }

    @RequestMapping(value = "main")
    public String goIndex(){

        return "index";
    }

    @RequestMapping(value = "changePortrait")
    public String goChangePortrait(){

        return "changePortrait";
    }



}

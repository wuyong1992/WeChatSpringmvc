package com.yanmai.controller;

import com.yanmai.model.User;
import com.yanmai.service.CoreService;
import lombok.Getter;
import lombok.Setter;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by admin on 2017/4/5.
 */
@Controller@Getter@Setter
//@SessionAttributes("user")
public class ViewController extends GenericController {

    @Autowired
    private CoreService coreService;
    @Autowired
    private WxMpService wxMpService;
    @Autowired
    private User user;



    @RequestMapping(value = "userInfo")
    public String goUserInfo(HttpServletRequest request) throws WxErrorException {
        //获取code
        String code = request.getParameter("code");

        //TODO 刷新AccessToken！！！
        WxMpOAuth2AccessToken wxMpOAuth2AccessToken = wxMpService.oauth2getAccessToken(code);
        logger.info("wxMpOAuth2AccessToken:"+wxMpOAuth2AccessToken);
        if (wxMpService.oauth2validateAccessToken(wxMpOAuth2AccessToken)){
            wxMpOAuth2AccessToken = wxMpService.oauth2refreshAccessToken(wxMpOAuth2AccessToken.getRefreshToken());
        }

        String openId = wxMpOAuth2AccessToken.getOpenId();

        //获取用户信息
        WxMpUser wxMpUser = wxMpService.oauth2getUserInfo(wxMpOAuth2AccessToken,null);
        user.setUsername(wxMpUser.getNickname());
        user.setUserPortrait(wxMpUser.getHeadImgUrl());

        //logger.info("username:"+user.getUsername());

        /*ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.setViewName("userInfo");*/

        //返回modelAndView,不能放在request域中，这样会导致刷新无效
        //放在session中
        request.getSession().setAttribute("user",user);

        //跳转到userinfo页面
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

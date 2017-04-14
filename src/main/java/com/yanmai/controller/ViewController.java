package com.yanmai.controller;

import com.yanmai.model.User;
import com.yanmai.service.CoreService;
import com.yanmai.service.UserService;
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
 * TODO 项目中controller名称和jsp名称需要最终修改
 * Created by admin on 2017/4/5.
 */
@Controller
@Getter
@Setter
//@SessionAttributes("user")
public class ViewController extends GenericController {

    @Autowired
    private CoreService coreService;
    @Autowired
    private WxMpService wxMpService;
    @Autowired
    private UserService userService;
    @Autowired
    private User user;


    @RequestMapping(value = "userInfo")
    public String goUserInfo(HttpServletRequest request) throws WxErrorException {
        //获取code
        String code = request.getParameter("code");
        logger.info("code：" + code);

        //获取AccessToken！！！
        WxMpOAuth2AccessToken wxMpOAuth2AccessToken = wxMpService.oauth2getAccessToken(code);
        logger.info("wxMpOAuth2AccessToken:" + wxMpOAuth2AccessToken);
        if (wxMpService.oauth2validateAccessToken(wxMpOAuth2AccessToken)) {
            wxMpOAuth2AccessToken = wxMpService.oauth2refreshAccessToken(wxMpOAuth2AccessToken.getRefreshToken());
        }

        //TODO openId放入session中会不会更好？
        String openId = wxMpOAuth2AccessToken.getOpenId();

        request.getSession().setAttribute("openId", openId);
        //获取用户信息
        //WxMpUser wxMpUser = wxMpService.oauth2getUserInfo(wxMpOAuth2AccessToken,null);

        //跳转到controller
        return "redirect:/user";
    }

    @RequestMapping(value = "user")
    public String goUser(HttpServletRequest request) {

        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        if (user != null) {
            request.getSession().setAttribute("user", user);
        } else {
            return "请关注该公众号";
        }


        return "userInfo";
    }


    //主页controller
    @RequestMapping(value = "getMainAccessToken")
    public String getMainAccessToken(HttpServletRequest request) throws WxErrorException {
        String code = request.getParameter("code");
        logger.info("code：" + code);

        //获取AccessToken！！！
        WxMpOAuth2AccessToken wxMpOAuth2AccessToken = wxMpService.oauth2getAccessToken(code);
        logger.info("wxMpOAuth2AccessToken:" + wxMpOAuth2AccessToken);
        if (wxMpService.oauth2validateAccessToken(wxMpOAuth2AccessToken)) {
            wxMpOAuth2AccessToken = wxMpService.oauth2refreshAccessToken(wxMpOAuth2AccessToken.getRefreshToken());
        }

        String openId = wxMpOAuth2AccessToken.getOpenId();
        request.getSession().setAttribute("openId", openId);

        return "redirect:/main";
    }

    @RequestMapping(value = "main")
    public String goIndex(HttpServletRequest request) {
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        if (user != null) {
            request.getSession().setAttribute("user", user);
        } else {
            return "请关注该公众号";
        }
        return "index";
    }

    @RequestMapping(value = "changePortrait")
    public String goChangePortrait() {

        return "changePortrait";
    }


}

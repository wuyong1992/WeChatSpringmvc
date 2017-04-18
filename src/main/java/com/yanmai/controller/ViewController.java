package com.yanmai.controller;

import com.yanmai.model.User;
import com.yanmai.service.CoreService;
import com.yanmai.service.UserService;
import lombok.Getter;
import lombok.Setter;
import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * TODO 项目中controller名称和jsp名称需要最终修改
 * Created by admin on 2017/4/5.
 */
@Controller
@Getter
@Setter
@SessionAttributes("user")
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

        //openId放入session
        String openId = wxMpOAuth2AccessToken.getOpenId();
        request.getSession().setAttribute("openId", openId);

        //跳转到controller
        return "redirect:/user";
    }

    @RequestMapping(value = "user")
    public ModelAndView goUser(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        if (user != null) {
            modelAndView.addObject("user", user);
            modelAndView.setViewName("userInfo");
        } else {
            return null;
        }

        return modelAndView;
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


    //更改头像
    @RequestMapping(value = "changePortrait")
    public ModelAndView goChangePortrait(HttpServletRequest request) throws WxErrorException {
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);

        modelAndView.addObject("user", user);
        modelAndView.setViewName("changePortrait");

        logger.info("=================================");

        WxJsapiSignature wxJsapiSignature = wxMpService.createJsapiSignature("http://b.wujixuanyi.com/changePortrait");
        logger.info("wxJsapiSignature======================>"+wxJsapiSignature);
        modelAndView.addObject("wxJsapiSignature",wxJsapiSignature);

        return modelAndView;
    }

    //下载用户上传图片
    @RequestMapping(value = "downloadImage")
    public String downloadImage(HttpServletRequest request){
        String serverId = request.getParameter("serverIds");

        //TODO 处理下载图片的逻辑
        System.out.print("下载ing==========================serverIds："+serverId);
        return "";
    }




    @RequestMapping(value = "goUserinfoByChangeImg")
    public ModelAndView goUserinfoByChangeImg() {
        ModelAndView modelAndView = new ModelAndView();


        return modelAndView;
    }

    //修改个人信息页面
    @RequestMapping(value = "changeUserinfo")
    public ModelAndView changeUserinfo(HttpServletRequest request) throws WxErrorException {
        ModelAndView modelAndView = new ModelAndView();
        user = (User) request.getSession().getAttribute("user");
        modelAndView.addObject("user", user);
        modelAndView.setViewName("changeUserinfo");

        return modelAndView;
    }







    //连接数据库更新用户
    @RequestMapping(value = "updateUserinfo")
    public String updateUserinfo(HttpServletRequest request) {
        String username = request.getParameter("username");
        logger.info("username======================" + username);
        String city = request.getParameter("city");
        logger.info("city======================" + city);
        String phone = request.getParameter("phoneNum");
        logger.info("phoneNum======================" + phone);


        if (!"".equals(username)) {
            user.setUsername(username);
        }
        if (!"".equals(city.trim())) {
            user.setCity(city);
        }
        if (!"".equals(phone.trim())) {
            Long phoneNum = Long.parseLong(phone);
            user.setPhoneNum(phoneNum);
        }
        userService.updateUser(user);

        return "redirect:/user";
    }



}

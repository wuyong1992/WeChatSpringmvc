package com.yanmai.controller;

import com.yanmai.model.Item;
import com.yanmai.model.Placard;
import com.yanmai.model.User;
import com.yanmai.service.ItemService;
import com.yanmai.service.PlacardService;
import com.yanmai.service.UserService;
import com.yanmai.util.DateUtils;
import lombok.Getter;
import lombok.Setter;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by admin on 2017/4/25.
 */
@Controller
@Getter
@Setter
@SessionAttributes("user")
public class PlacardController extends GenericController{

    @Autowired
    private WxMpService wxMpService;
    @Autowired
    private UserService userService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private PlacardService placardService;
    @Autowired
    private User user;
    @Autowired
    private Item item;
    @Autowired
    private Placard placard;

    @RequestMapping(value = "goPlacard")
    public String goPlacard(HttpServletRequest request) throws WxErrorException {
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
        return "redirect:/ToPlacard";

        //重定向到其他controller时，注意后面的名称不能和jsp页面名称相同，否则解析成jsp页面结尾处多到"/"从而出错404
    }

    @RequestMapping(value = "ToPlacard")
    public ModelAndView ToPlacard(HttpServletRequest request) {
        logger.info("==============================================");
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        item = itemService.getItemInfo(1);
        if (user != null) {
            if (user.getIsMember() == 1) {
                Date endTime = user.getVipEndTime();
                //计算VIP剩余时间
                Integer betweenTime = DateUtils.diffDate(new Date(), endTime);
                modelAndView.addObject("betweenTime", betweenTime);
            } else {
                modelAndView.addObject("betweenTime", 0);
            }
            modelAndView.addObject("user", user);
            modelAndView.addObject("item", item);
        } else {
            return null;
        }

        List<Placard> placards = placardService.getAllPlacard();

        modelAndView.addObject("placards",placards);
        modelAndView.setViewName("placard");
        return modelAndView;
    }


}

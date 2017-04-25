package com.yanmai.controller;

import com.yanmai.model.Item;
import com.yanmai.model.User;
import com.yanmai.service.CoreService;
import com.yanmai.service.ItemService;
import com.yanmai.service.UserService;
import com.yanmai.util.DateUtils;
import com.yanmai.util.FileUtil;
import com.yanmai.util.StringUtil;
import lombok.Getter;
import lombok.Setter;
import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

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
    private ItemService itemService;
    @Autowired
    private User user;
    @Autowired
    private Item item;


    //个人信息controller
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

    //个人信息
    @RequestMapping(value = "user")
    public ModelAndView goUser(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        item = itemService.getItemInfo(1);
        if (user != null) {
            if (user.getIsMember() == 1) {
                Date endTime = user.getVipEndTime();
                String vipEndTime = DateUtils.format(endTime, "YYYY-MM-dd");
                //计算VIP剩余时间
                Integer betweenTime = DateUtils.diffDate(new Date(), endTime);
                modelAndView.addObject("betweenTime", betweenTime);
                modelAndView.addObject("vipEndTime", vipEndTime);
            } else {
                modelAndView.addObject("betweenTime", 0);
            }
            modelAndView.addObject("user", user);
            modelAndView.addObject("item", item);
        } else {
            return null;
        }
        modelAndView.setViewName("userInfo");
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

    //主页
    @RequestMapping(value = "main")
    public ModelAndView goIndex(HttpServletRequest request) {
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
        }
        modelAndView.setViewName("index");
        return modelAndView;
    }

    //联系我们controller 菜单进入，获取授权code
    @RequestMapping(value = "goContactUs")
    public String goContactUs(HttpServletRequest request) throws WxErrorException {
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

        return "contactUs";
    }

    //联系我们 直接进入页面，在别的controller中已经获得了code
    @RequestMapping(value = "contactUs")
    public String contactUs(HttpServletRequest request) throws WxErrorException {

        return "contactUs";
    }

    //联系我们controller 菜单进入，获取授权code
    @RequestMapping(value = "goOpen")
    public String goOpen(HttpServletRequest request) throws WxErrorException {
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

        return "redirect:/open";
    }


    //进入开通页面
    @RequestMapping(value = "open")
    public ModelAndView open(HttpServletRequest request) throws WxErrorException {
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        if (user != null) {
            modelAndView.addObject("user", user);
            modelAndView.setViewName("open");
        } else {
            return null;
        }

        return modelAndView;
    }

    //vip服务价值
    @RequestMapping(value = "goVipServeValue")
    public String goVipServeValue() {
        return "vipServeValue";
    }

    //上传二维码
    @RequestMapping(value = "uploadQRcode")
    public ModelAndView goUploadQRcode(HttpServletRequest request) throws WxErrorException {
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);

        modelAndView.addObject("user", user);
        modelAndView.setViewName("uploadQRcode");

        WxJsapiSignature wxJsapiSignature = wxMpService.createJsapiSignature("http://b.wujixuanyi.com/uploadQRcode");
        modelAndView.addObject("wxJsapiSignature", wxJsapiSignature);
        return modelAndView;

    }

    //保存二维码
    @RequestMapping(value = "downloadQRcode")
    public ModelAndView downloadQRcode(HttpServletRequest request) throws WxErrorException, IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userInfo");

        String serverId = request.getParameter("serverIds");
        if ("".equals(serverId)) {
            return modelAndView;
        }

        //下载二维码并保存到临时文件，默认为：tomcat安装目录下的temp文件
        File file = wxMpService.getMaterialService().mediaDownload(serverId);
        //二维码名称
        String fileName = file.getName();

        //将二维码放到复制到webapp目录下的img文件，方便访问
        //目标位置
        String destPath = "C:\\apache-tomcat-8.0.14\\webapps\\QRcode";

        //调用util
        FileUtil.copyFileAndDelSrcFile(file, destPath);

        //获取原来的二维码地址，并删除原二维码
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        String oldQRcodePath = user.getQRcode();

        if (oldQRcodePath != null) {
            //如果有则删除
            String QRcodeName = StringUtil.getImgName(oldQRcodePath);
            File file1 = new File("C:\\apache-tomcat-8.0.14\\webapps\\QRcode\\" + QRcodeName);
            FileUtils.deleteQuietly(file1);
        }

        //更新数据库中的头像地址
        user.setQRcode("http://b.wujixuanyi.com/QRcode/" + fileName);
        userService.updateUser(user);

        modelAndView.addObject("user", user);

        return modelAndView;
    }


    //如何上传二维码
    @RequestMapping(value = "goHowTOUploadQRcode")
    public String goHowTOUploadQRcode() {

        return "howToUploadQRcode";
    }


    //更改头像
    @RequestMapping(value = "changePortrait")
    public ModelAndView goChangePortrait(HttpServletRequest request) throws WxErrorException {
        ModelAndView modelAndView = new ModelAndView();
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);

        modelAndView.addObject("user", user);
        modelAndView.setViewName("changePortrait");

        WxJsapiSignature wxJsapiSignature = wxMpService.createJsapiSignature("http://b.wujixuanyi.com/changePortrait");
        logger.info("wxJsapiSignature======================>" + wxJsapiSignature);
        modelAndView.addObject("wxJsapiSignature", wxJsapiSignature);

        return modelAndView;
    }


    //接收页面传递的serverId即media_id下载用户上传的图片
    @RequestMapping(value = "downloadImage")
    public ModelAndView downloadImage(HttpServletRequest request) throws WxErrorException, IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userInfo");

        String serverId = request.getParameter("serverIds");
        logger.info("serverId===================>" + serverId);

        if ("".equals(serverId)) {
            return modelAndView;
        }

        //下载图片并保存到临时文件，默认为：tomcat安装目录下的temp文件
        File file = wxMpService.getMaterialService().mediaDownload(serverId);

        //图片名称
        String fileName = file.getName();


        //将图片放到复制到webapp目录下的img文件，方便访问
        //目标位置
        String destPath = "C:\\apache-tomcat-8.0.14\\webapps\\img";

        //调用util
        FileUtil.copyFileAndDelSrcFile(file, destPath);

        //获取原来的头像地址，并删除头像
        String openId = (String) request.getSession().getAttribute("openId");
        user = userService.getUserinfo(openId);
        String oldPortraitPath = user.getUserPortrait();
        //如果改路径的字符串结果是数字，则说明是微信自动获取的头像，是存放在微信服务器的，不予处理
        //如果不是以数字结尾，则是用户自定义的头像，可以更新并删除
        if (!StringUtil.endWithNum(oldPortraitPath)) {
            //取反，表示不是以数字结尾,分割字符串，取出文件名称
            String imgName = StringUtil.getImgName(oldPortraitPath);
            File file1 = new File("C:\\apache-tomcat-8.0.14\\webapps\\img\\" + imgName);
            FileUtils.deleteQuietly(file1);
        }

        //更新数据库中的头像地址
        user.setUserPortrait("http://b.wujixuanyi.com/img/" + fileName);
        userService.updateUser(user);

        modelAndView.addObject("user", user);

        return modelAndView;
    }

    //
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


    //连接数据库更新用户信息
    @RequestMapping(value = "updateUserinfo")
    public String updateUserinfo(HttpServletRequest request) {
        String username = request.getParameter("username");
        String wechatID = request.getParameter("wechatID");
        String city = request.getParameter("city");
        String phone = request.getParameter("phoneNum");

        if (!"".equals(username)) {
            user.setUsername(username);
        }
        if (!"".equals(wechatID)) {
            user.setWechatID(wechatID);
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


    //支付成功跳转的页面
    @RequestMapping(value = "paySucceed")
    public String paySucceed() {

        return "paySucceed";
    }



}

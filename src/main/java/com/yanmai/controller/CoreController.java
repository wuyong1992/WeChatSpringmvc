package com.yanmai.controller;

import com.yanmai.service.CoreService;
import com.yanmai.util.ReturnModel;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class CoreController extends GenericController {

    @Autowired
    private WxMpConfigStorage configStorage;
    @Autowired
    private WxMpService wxMpService;
    @Autowired
    private CoreService coreService;

    @RequestMapping(value = "index")
    public String index() {
        return "index";
    }

    /**
     * 微信公众号webservice主服务接口，提供与微信服务器的信息交互
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "core")
    public String wechatCore(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        response.setStatus(HttpServletResponse.SC_OK);

        String signature = request.getParameter("signature");
        String nonce = request.getParameter("nonce");
        String timestamp = request.getParameter("timestamp");

        if (!this.wxMpService.checkSignature(timestamp, nonce, signature)) {
            // 消息签名不正确，说明不是公众平台发过来的消息

            return "非法请求";
        }

        String echoStr = request.getParameter("echostr");
        if (StringUtils.isNotBlank(echoStr)) {
            // 说明是一个仅仅用来验证的请求，回显echostr
            String echoStrOut = String.copyValueOf(echoStr.toCharArray());
            return echoStrOut;
        }

        //如果传递的参数没有encrypt_type这个值，说明是明文传输
        String encryptType = StringUtils.isBlank(request.getParameter("encrypt_type"))
            ? "raw"
            : request.getParameter("encrypt_type");

        if ("raw".equals(encryptType)) {
            // 明文传输的消息
            WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(request.getInputStream());
            WxMpXmlOutMessage outMessage = this.coreService.route(inMessage);
            return outMessage.toXml();
        }

        if ("aes".equals(encryptType)) {
            // 是aes加密的消息
            String msgSignature = request.getParameter("msg_signature");
            WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(
                request.getInputStream(), this.configStorage, timestamp, nonce,
                msgSignature);
            this.logger.debug("\n消息解密后内容为：\n{} ", inMessage.toString());
            WxMpXmlOutMessage outMessage = this.coreService.route(inMessage);
            this.logger.info(response.toString());

            return outMessage.toEncryptedXml(this.configStorage);
        }

        response.getWriter().println("不可识别的加密类型");
        return "不可识别的加密类型";
    }

    @RequestMapping(value = "myMiniWeb")
    public String goMyMiniWeb(){

        System.out.println("正在访问");
        return "myMiniWeb";
    }









    /**
     * 通过openid获得基本用户信息
     * 详情请见: http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html
     *
     * @param response
     * @param openid   openid
     * @param lang     zh_CN, zh_TW, en
     */
    @RequestMapping(value = "getUserInfo")
    public WxMpUser getUserInfo(HttpServletResponse response, @RequestParam(value = "openid") String openid, @RequestParam(value = "lang") String lang) {
        ReturnModel returnModel = new ReturnModel();
        WxMpUser wxMpUser = null;
        try {
            wxMpUser = this.wxMpService.getUserService().userInfo(openid, lang);
            returnModel.setResult(true);
            returnModel.setDatum(wxMpUser);
            renderString(response, returnModel);
        } catch (WxErrorException e) {
            returnModel.setResult(false);
            returnModel.setReason(e.getError().toString());
            renderString(response, returnModel);
            this.logger.error(e.getError().toString());
        }
        return wxMpUser;
    }

    /**
     * 通过code获得基本用户信息
     * 详情请见: http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html
     *
     * @param response
     * @param code     code
     * @param lang     zh_CN, zh_TW, en
     */
    @RequestMapping(value = "getOAuth2UserInfo")
    public void getOAuth2UserInfo(HttpServletResponse response, @RequestParam(value = "code") String code, @RequestParam(value = "lang") String lang) {
        ReturnModel returnModel = new ReturnModel();
        WxMpOAuth2AccessToken accessToken;
        WxMpUser wxMpUser;
        try {
            accessToken = this.wxMpService.oauth2getAccessToken(code);
            wxMpUser = this.wxMpService.getUserService()
                .userInfo(accessToken.getOpenId(), lang);
            returnModel.setResult(true);
            returnModel.setDatum(wxMpUser);
            renderString(response, returnModel);
        } catch (WxErrorException e) {
            returnModel.setResult(false);
            returnModel.setReason(e.getError().toString());
            renderString(response, returnModel);
            this.logger.error(e.getError().toString());
        }
    }

    /**
     * 用code换取oauth2的openid
     * 详情请见: http://mp.weixin.qq.com/wiki/1/8a5ce6257f1d3b2afb20f83e72b72ce9.html
     *
     * @param response
     * @param code     code
     */
    @RequestMapping(value = "getOpenid")
    public void getOpenid(HttpServletResponse response, @RequestParam(value = "code") String code) {
        ReturnModel returnModel = new ReturnModel();
        WxMpOAuth2AccessToken accessToken;
        try {
            accessToken = this.wxMpService.oauth2getAccessToken(code);
            returnModel.setResult(true);
            returnModel.setDatum(accessToken.getOpenId());
            renderString(response, returnModel);
        } catch (WxErrorException e) {
            returnModel.setResult(false);
            returnModel.setReason(e.getError().toString());
            renderString(response, returnModel);
            this.logger.error(e.getError().toString());
        }
    }



}

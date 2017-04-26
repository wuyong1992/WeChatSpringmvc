package com.yanmai.handler;


import com.yanmai.model.User;
import com.yanmai.service.CoreService;
import com.yanmai.service.UserService;
import com.yanmai.util.FileUtil;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutTextMessage;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * 用户关注公众号Handler
 * <p>
 * Created by FirenzesEagle on 2016/7/27 0027.
 * Email:liumingbo2008@gmail.com
 */
@Component
public class SubscribeHandler extends AbstractHandler {

    @Autowired
    protected WxMpConfigStorage configStorage;
    @Autowired
    protected WxMpService wxMpService;
    @Autowired
    protected CoreService coreService;
    @Autowired
    private UserService userService;
    @Autowired
    private User user;

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService, WxSessionManager sessionManager) throws WxErrorException {

        //通过分享二维码扫码关注的
        if (!"".equals(wxMessage.getEventKey())) {
            try {
                this.scanHandle(wxMessage);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            //非扫码关注的
            WxMpUser wxMpUser = coreService.getUserInfo(wxMessage.getFromUser(), "zh_CN");
            user = new User();
            user.setOpenId(wxMpUser.getOpenId());

            if (!userService.isUser(user.getOpenId())) {
                user.setUnionId(wxMpUser.getUnionId());     // 值为null
                user.setSex(wxMpUser.getSexId());
                user.setLanguage(wxMpUser.getLanguage());
                user.setUsername(wxMpUser.getNickname());
                user.setCity(wxMpUser.getProvince() + wxMpUser.getCity());           //获取省份和城市后，拼接成所在地信息
                user.setCountry(wxMpUser.getCountry());
                user.setIsSubscribe(1);     //设这为关注用户
                user.setRegisterTime(new Date(wxMpUser.getSubscribeTime() * 1000));// 创建时间单位秒，需转换成毫秒
                user.setUserPortrait(wxMpUser.getHeadImgUrl());
                //设置该用户的分享二维码
                try {
                    String shareQRcodePath = this.getShareQRcodePath(user.getOpenId());
                    user.setShareQRcode(shareQRcodePath);
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }else {
                user.setIsSubscribe(1);
            }

            //先判断该用户是否已经存在，例如取消关注后再管注的
            userService.updateOrAddUser(user.getOpenId(), user);
        }
            WxMpXmlOutTextMessage m
                    = WxMpXmlOutMessage.TEXT()
                    .content("您好！为了您可以享受更全面的服务，请先去个人中心完善您的资料！")
                    .fromUser(wxMessage.getToUser())
                    .toUser(wxMessage.getFromUser())
                    .build();

           /* //获取时间参数,单位秒
            Long createTime = wxMessage.getCreateTime();
            //装换成Date类，转换单位毫秒
            Date date = new Date(createTime * 1000);
            //格式化改时间
            String formatCreateTime = DateUtils.formatDateTime(date);
            logger.info("subscribeMessageHandler" + "用户名为：" + wxMpUser.getNickname()
                    + "，openid:" + wxMessage.getFromUser() + "，的用户在" + formatCreateTime + "关注了该公众号");*/
            return m;



    }


    //用户通过分享人的二维码进行扫码关注
    private void scanHandle(WxMpXmlMessage wxMessage) throws Exception {

        User userSelf = new User(); //扫码关注的用户

        //获取被扫描二维码的参数，也就是分享人的openid
        String eventKey = wxMessage.getEventKey();
        String promoterOpenid = eventKey.replace("qrscene_", "");
        User promoter = userService.getUserinfo(promoterOpenid);

        //更新分享人的积分，暂定为10
        if (promoter.getPoints() != 0) {
            promoter.setPoints(10 + promoter.getPoints());
        } else {
            promoter.setPoints(10);
        }
        userService.updateUser(promoter);

        //扫码关注者的信息
        WxMpUser wxMpUser = coreService.getUserInfo(wxMessage.getFromUser(), "zh_CN");

        userSelf.setOpenId(wxMpUser.getOpenId());

        //判断是否第一次关注该公众号
        if (!userService.isUser(userSelf.getOpenId())) {
            userSelf.setSex(wxMpUser.getSexId());
            userSelf.setLanguage(wxMpUser.getLanguage());
            userSelf.setUsername(wxMpUser.getNickname());
            userSelf.setCity(wxMpUser.getProvince() + wxMpUser.getCity());           //获取省份和城市后，拼接成所在地信息
            userSelf.setCountry(wxMpUser.getCountry());
            userSelf.setIsSubscribe(1);     //设这为关注用户
            userSelf.setPoints(10);         //因为是扫码关注该公众号，所以第一次关注时赠送积分10
            userSelf.setSuperior(promoterOpenid);       //设置父级用户的openid
            userSelf.setRegisterTime(new Date(wxMpUser.getSubscribeTime() * 1000));// 创建时间单位秒，需转换成毫秒
            userSelf.setUserPortrait(wxMpUser.getHeadImgUrl());         //用户头像
            //设置该用户的分享二维码路径
            String shareQRcodePath = this.getShareQRcodePath(userSelf.getOpenId());
            userSelf.setShareQRcode(shareQRcodePath);
        }else {
            userSelf.setIsSubscribe(1);
        }

        //先判断该用户是否已经存在，例如取消关注后再管注的
        userService.updateOrAddUser(userSelf.getOpenId(), userSelf);

       /* WxMpXmlOutTextMessage m
                = WxMpXmlOutMessage.TEXT()
                .content("尊敬的" + wxMpUser.getNickname() + "，您好！为了您可以享受更全面的服务，请先去个人中心完善您的资料！")
                .fromUser(wxMessage.getToUser())
                .toUser(wxMessage.getFromUser())
                .build();

        //获取时间参数,单位秒
        Long createTime = wxMessage.getCreateTime();
        //装换成Date类，转换单位毫秒
        Date date = new Date(createTime * 1000);
        //格式化改时间
        String formatCreateTime = DateUtils.formatDateTime(date);
        logger.info("subscribeMessageHandler" + "用户名为：" + wxMpUser.getNickname()
                + "，openid:" + wxMessage.getFromUser() + "，的用户在" + formatCreateTime + "扫码关注了该公众号");

        return m;*/
    }


    //设置用户分享二维码路径
    private String getShareQRcodePath(String openid) throws WxErrorException, IOException {
        WxMpQrCodeTicket ticket = wxMpService.getQrcodeService().qrCodeCreateLastTicket(openid);
        //下载带参二维码并保存到临时文件，默认为：tomcat安装目录下的temp文件
        File file = wxMpService.getQrcodeService().qrCodePicture(ticket);

        //二维码名称
        String fileName = file.getName();

        //将二维码放到复制到webapp目录下的QRcode文件，方便访问
        //目标位置
        String destPath = "C:\\apache-tomcat-8.0.14\\webapps\\shareQRcode";

        //调用util改变文件路劲
        FileUtil.copyFileAndDelSrcFile(file, destPath);

        //拼接路径

        return "http://b.wujixuanyi.com/shareQRcode/" + fileName;
    }

};

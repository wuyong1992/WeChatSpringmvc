package com.yanmai.handler;


import com.yanmai.service.CoreService;
import com.yanmai.service.UserService;
import com.yanmai.util.DateUtils;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutTextMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import com.yanmai.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

    private User user;

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService, WxSessionManager sessionManager) throws WxErrorException {
        WxMpUser wxMpUser = coreService.getUserInfo(wxMessage.getFromUser(), "zh_CN");
        /*List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("openId", wxMpUser.getOpenId()));
        params.add(new BasicNameValuePair("nickname", wxMpUser.getNickname()));
        params.add(new BasicNameValuePair("headImgUrl", wxMpUser.getHeadImgUrl()));*/

        //TODO(user) 在这里可以进行用户关注时对业务系统的相关操作（比如新增用户）

        user = new User();

        user.setOpenId(wxMpUser.getOpenId());
        user.setUnionId(wxMpUser.getUnionId());
        user.setSex(wxMpUser.getSexId());
        user.setLanguage(wxMpUser.getLanguage());
        user.setUsername(wxMpUser.getNickname());
        user.setCity(wxMpUser.getCity());
        user.setProvince(wxMpUser.getProvince());
        user.setCountry(wxMpUser.getCountry());
        user.setIsSubscribe(1);     //设这为关注用户
        user.setRegisterTime(new Date(wxMpUser.getSubscribeTime()));//TODO 时间可以存储，但是数据不对
        user.setUserPortrait(wxMpUser.getHeadImgUrl());


        //先判断该用户是否已经存在，例如取消关注后再管注的
        userService.updateOrAddUser(user.getOpenId(),user);

        WxMpXmlOutTextMessage m
            = WxMpXmlOutMessage.TEXT()
            .content("尊敬的" + wxMpUser.getNickname() + "，您好！")
            .fromUser(wxMessage.getToUser())
            .toUser(wxMessage.getFromUser())
            .build();

        //获取时间参数
        Long createTime = wxMessage.getCreateTime();
        //装换成Date类
        Date date = new Date(createTime);
        //格式化改时间
        String formatCreateTime = DateUtils.formatDateTime(date);
        logger.info("subscribeMessageHandler" +"用户名为："+wxMpUser.getNickname()
                +"，openid:"+wxMessage.getFromUser()+"，的用户在"+formatCreateTime+"关注了该公众号");
        return m;
    }
};

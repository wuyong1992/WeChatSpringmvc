package com.yanmai.handler;

import com.yanmai.model.User;
import com.yanmai.service.CoreService;
import com.yanmai.service.UserService;
import com.yanmai.util.DateUtils;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutTextMessage;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

/**
 * 取消关注事件
 * Created by admin on 2017/3/31.
 */
@Component
public class UnsubscribeHandler extends AbstractHandler {

    @Autowired
    protected CoreService coreService;
    @Autowired
    private UserService userService;

    private User user;


    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMpXmlMessage, Map<String, Object> map, WxMpService wxMpService, WxSessionManager wxSessionManager) throws WxErrorException {

        //TODO 这里可以写取消关注后的业务逻辑，比如更新该用户在数据库中的状态

        //用户取消关注后，将该用户的关注状态改为0；其它信息不动，并非删除该用户
        String openId =  wxMpXmlMessage.getFromUser();

        user = new User();
        user.setOpenId(openId);
        user.setIsSubscribe(0);
        userService.updateUser(user);



        WxMpUser wxMpUser = coreService.getUserInfo(wxMpXmlMessage.getFromUser(),"zh_CN");
        //FromUser即为openid
        String openid = wxMpXmlMessage.getFromUser();
        //获取时间参数
        Long createTime = wxMpXmlMessage.getCreateTime();
        //装换成Date类
        Date date = new Date(createTime*1000);
        //格式化改时间
        String formatCreateTime = DateUtils.formatDateTime(date);

        //取消关注后该该内容并不会发送到用户手机上，此处只是防止空指针
        WxMpXmlOutTextMessage m
                = WxMpXmlOutMessage.TEXT()
                .content("谢谢你的关注，再会！")
                .fromUser(wxMpXmlMessage.getToUser())
                .toUser(wxMpXmlMessage.getFromUser())
                .build();

        //日志记录
        //由于用户取消关注，返回的json数据中没有用户昵称
        logger.info("用户openid为："+openid+"在"+formatCreateTime+"时间点取消关注");

        return m;
    }
}

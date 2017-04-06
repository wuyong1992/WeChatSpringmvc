package com.yanmai.handler;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutImageMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * 菜单事件
 *
 * Created by admin on 2017/3/31.
 */
@Component
public class MenuHandler extends AbstractHandler{
    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMpXmlMessage, Map<String, Object> map, WxMpService wxMpService, WxSessionManager wxSessionManager) throws WxErrorException {

        //获取菜单事件的类型
        String event = wxMpXmlMessage.getEvent();
        //点击事件的key值
        String key = wxMpXmlMessage.getEventKey();

        //根据菜单事件的类型做相应处理
        if (WxConsts.EVT_CLICK.equals(event)){
            //说明是点击事件，在判断key值
            if("key4_4".equals(key)){
                WxMpXmlOutImageMessage m = WxMpXmlOutMessage.IMAGE()
                        .mediaId("j2mOy_JXN0FgvhJgdCkqpX0IJppgXlLvrFzZJy0aEj0")
                        .fromUser(wxMpXmlMessage.getToUser())
                        .toUser(wxMpXmlMessage.getFromUser())
                        .build();
                return m;
            }
        }


        return null;
    }
}

package com.yanmai.util;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;

/**
 * Created by admin on 2017/4/26.
 */
public class ShareQRcodeUtil {

    @Autowired
    private WxMpService wxMpService;

    public String getShareQRcodePath(String openid) throws WxErrorException {
        WxMpQrCodeTicket ticket = wxMpService.getQrcodeService().qrCodeCreateLastTicket(openid);
        File file = wxMpService.getQrcodeService().qrCodePicture(ticket);



        return null;
    }

}

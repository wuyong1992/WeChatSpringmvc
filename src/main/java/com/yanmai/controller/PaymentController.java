package com.yanmai.controller;

import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.util.SignUtils;
import com.google.gson.Gson;
import com.yanmai.model.Item;
import com.yanmai.model.User;
import com.yanmai.service.ItemService;
import com.yanmai.service.UserService;
import com.yanmai.util.DateUtils;
import com.yanmai.util.ReturnModel;
import com.yanmai.util.XMLUtil;
import me.chanjar.weixin.common.exception.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.Map;

/**
 * 微信支付Controller
 */
@Controller
@RequestMapping(value = "wxPay")
public class PaymentController extends GenericController {
    //企业向个人转账微信API路径
    private static final String ENTERPRISE_PAY_URL = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
    //apiclient_cert.p12证书存放路径
    private static final String CERTIFICATE_LOCATION = "";

    @Autowired
    protected WxPayConfig payConfig;
    @Autowired
    protected WxPayService payService;
    @Autowired
    private UserService userService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private User user;
    @Autowired
    private Item item;


    /**
     * 返回前台H5调用JS支付所需要的参数，公众号支付调用此接口
     * 参数可以由数据库传入
     *
     * @param response
     * @param request
     */
    @ResponseBody
    @RequestMapping(value = "getJSSDKPayInfo")
    public String getJSSDKPayInfo(HttpServletResponse response, HttpServletRequest request) throws UnknownHostException {
        logger.info("=================支付接口进入================");
        ReturnModel returnModel = new ReturnModel();
        WxPayUnifiedOrderRequest prepayInfo = new WxPayUnifiedOrderRequest();
        //获取order类
        item = itemService.getItemInfo(1);

        logger.info("item.toString()============>>>>>>>>>>>>>" + item.toString());
        //填入需要的信息
        String openId = (String) request.getSession().getAttribute("openId");
        logger.info("openId==============>>>>>>>>>>>>>>>>>>>" + openId);
        prepayInfo.setOpenid(openId);
        prepayInfo.setOutTradeNo(DateUtils.getShortYMD() + (int) ((Math.random() * 9 + 1) * 100000));     //商户订单号
        prepayInfo.setTotalFee((int) (item.getTotalFee() * 100));     //标价金额,由于标价单位为分，，数据库中金额单位是元，所以乘以100，将元转成分
        prepayInfo.setBody(item.getBody());                    //商品描述
        prepayInfo.setTradeType("JSAPI");        //交易类型
        //终端ip
        InetAddress addr = InetAddress.getLocalHost();
        String IP = addr.getHostAddress();
        prepayInfo.setSpbillCreateIp(IP);
        //TODO(user) 填写通知回调地址
        prepayInfo.setNotifyURL("http://b.wujixuanyi.com/wxPay/getJSSDKCallbackData");

        //将需要的信息更新进数据库

        try {
            Map<String, String> payInfo = this.payService.getPayInfo(prepayInfo);       //这里是关键！！！

            logger.info(payInfo.get("package"));

            Gson gson = new Gson();
            String temp = gson.toJson(payInfo);
            logger.info("temp=========>>>>>>>>>" + temp);
            return temp;
            /*returnModel.setResult(true);
            returnModel.setDatum(payInfo);
            renderString(response, returnModel);*/            // 返回前端的是个json类型的字符串，前段是否可以el表达式拿值？
        } catch (WxErrorException e) {
            returnModel.setResult(false);
            returnModel.setReason(e.getError().toString());
            renderString(response, returnModel);
            this.logger.error(e.getError().toString());
        }
        return null;
    }

    /**
     * 微信通知支付结果的回调地址，notify_url
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = "getJSSDKCallbackData")
    public void getJSSDKCallbackData(HttpServletRequest request,
                                     HttpServletResponse response) {
        try {
            synchronized (this) {
                Map<String, String> kvm = XMLUtil.parseRequestXmlToMap(request);

                if (SignUtils.checkSign(kvm, this.payConfig.getMchKey())) {
                    if (kvm.get("result_code").equals("SUCCESS")) {
                        // 微信服务器通知此回调接口支付成功后，通知给业务系统做处理
                        String openid = kvm.get("openid");
                        user = userService.getUserinfo(openid);     //获取user类
                        //判断是否为会员，如果该用户已经是会员，在其会员到期时间上再加上一年,如果不是会员，则成为会员，并有一年的期限
                        if (user.getIsMember() == 1) {
                            //获取到期时间,并延期一年
                            Date oldVipEndTime = user.getVipEndTime();
                            Date newVipEndTime = DateUtils.addDate(oldVipEndTime, 365);
                            user.setVipEndTime(newVipEndTime);
                            userService.updateUser(user);
                        } else {
                            user.setIsMember(1);                         //将该用户设置为会员

                            String time_end = kvm.get("time_end");      //支付完成时间，格式为yyyyMMddHHmmss
                            Date vipTime = DateUtils.smartFormat(time_end);
                            user.setVipTime(vipTime);   //将支付完成时间设置为用户VIP注册时间
                            Date vipEndTime = DateUtils.addDate(vipTime, 365);   //有效期365天
                            user.setVipEndTime(vipEndTime);             //VIP到期时间

                            user.setTransaction_id(kvm.get("transaction_id"));  //微信支付订单号
                            user.setTotal_fee(Float.parseFloat(kvm.get("total_fee")));      //支付金额

                            userService.updateUser(user);           //更新该用户
                        }

                        logger.info("out_trade_no: " + kvm.get("out_trade_no") + " pay SUCCESS!");
                        response.getWriter().write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[ok]]></return_msg></xml>");
                    } else {
                        this.logger.error("out_trade_no: " + kvm.get("out_trade_no") + " result_code is FAIL");
                        response.getWriter().write(
                                "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[result_code is FAIL]]></return_msg></xml>");
                    }
                } else {
                    response.getWriter().write("<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[check signature FAIL]]></return_msg></xml>");
                    this.logger.error("out_trade_no: " + kvm.get("out_trade_no") + " check signature FAIL");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}


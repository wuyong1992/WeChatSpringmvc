package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 用户类
 * Created by admin on 2017/4/5.
 */
@Component
@Getter@Setter
public class User {

    private String id;              //用户id
    private String openId;          //用户关注公众号后的openid
    private String unionId;         //用户会议unionId
    private Integer sex;             //性别，1表示男，2表示女，0表示未知
    private String language;        //语言，默认zh_CN
    private String username;        //用户姓名
    private String wechatID;      //用户微信号
    private Long phoneNum;          //手机号
    private String city;             //拼接所在城市
    private String country;         //国家
    private int isSubscribe;        //是否关注
    private int isMember;           //是否为会员，1表示是，0表示否
    private int points;             //积分
    private Date registerTime;      //注册时间
    private float total_fee;          //充值总金额
    private Date vipTime;           //VIP充值时间
    private Date vipEndTime;        //VIP到期时间
//    TODO 将流水号去除，放到订单类里面
    private String transaction_id;  //微信订单流水号
    private String userPortrait;   //用户头像地址
    private String QRcode;          //用户二维码地址
    private String superior;        //父级推广人，占时不涉及
    private String shareQRcode;     //用户用来分享宣传的二维码

}

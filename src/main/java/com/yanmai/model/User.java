package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
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
    //private String password;        //用户密码，由于只对微信开放，不需要
    private Long phoneNum;          //手机号
    //private Long yanMaiNum;         //雁脉号
    //private String superior;        //父级推广人，占时不涉及
    private String city;             //拼接所在城市
//    private String province;        //省份
//    private String location;        //用户自定义所在地
    private String country;         //国家
    private int isSubscribe;        //是否关注
    private int isMember;           //是否为会员，1表示是，0表示否
    private Date registerTime;      //注册时间
    private Date vipTime;           //VIP充值时间
    private String userPortrait;   //用户头像地址


}

package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by admin on 2017/4/21.
 */
@Component
@Getter@Setter
public class Order {

    private String openId;      //用户的openid
    private String username;      //用户微信名
    private Long phoneNum;          //手机号
    private String transaction_id;  //微信订单流水号
    private String body;            //商品信息
    private float total_fee;            //标价金额
    private Date creatTime;       //充值创建时间
    private Date vipEndTime;        //vip到期时间


}

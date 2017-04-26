package com.yanmai.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by admin on 2017/4/26.
 */
@Component
@Getter
@Setter
public class Ordre {

    private Integer id;
    private String openId;
    private String username;        //用户姓名
    private String wechatID;      //用户微信号
    private Long phoneNum;          //手机号
    private String transaction_id;  //微信订单流水号
    private float total_fee;          //充值金额
    private Date vipTime;           //VIP充值时间
    private Date vipEndTime;        //VIP到期时间

    //TODO 订单类，编写mapper和xml，以及MySQL数据

}

package com.yanmai.service;

import com.yanmai.model.Order;

import java.util.List;

/**
 * Created by wuyong on 2017/4/26.
 */
public interface OrderService {

    //添加订单
    public void addOrder(Order order);

    //按照openid查找订单
    public Order getOrdreByOpenId(String openId);

    //找找所有订单
    public List<Order> getAllOrder();

}

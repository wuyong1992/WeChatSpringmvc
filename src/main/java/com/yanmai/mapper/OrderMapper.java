package com.yanmai.mapper;

import com.yanmai.model.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wuyong on 2017/4/26.
 */
@Repository
public interface OrderMapper {

    //添加订单
    public void addOrder(Order order);

    //按照openid查找订单
    public List<Order> selectOrdreByOpenId(String openId);

    //找找所有订单
    public List<Order> selectAllOrder();


}

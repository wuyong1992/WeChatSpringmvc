package com.yanmai.service.impl;

import com.yanmai.mapper.OrderMapper;
import com.yanmai.model.Order;
import com.yanmai.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wuyong on 2017/4/26.
 */
@Transactional
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public void addOrder(Order order) {

        orderMapper.addOrder(order);
    }

    @Override
    public List<Order> getOrdreByOpenId(String openId) {
        return orderMapper.selectOrdreByOpenId(openId);
    }

    @Override
    public List<Order> getAllOrder() {
        return orderMapper.selectAllOrder();
    }
}

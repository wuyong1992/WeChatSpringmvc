package com.yanmai.controller.adminController;

import com.yanmai.model.Order;
import com.yanmai.model.User;
import com.yanmai.service.OrderService;
import com.yanmai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 用户的表
 * Created by admin on 2017/5/10.
 */
@Controller
@RequestMapping(value = "admin")
public class UserController {

    @Autowired
    private User user;
    @Autowired
    private Order order;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    //用户列表
    @RequestMapping(value = "userList")
    public ModelAndView userList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/user-list");

        List<User> users =  userService.selectALLUser();
        modelAndView.addObject("users",users);
        return modelAndView;
    }

    //显示某个用户的详细信息
    @RequestMapping(value = "userShow/{id}")
    public ModelAndView userShow(@PathVariable("id") Integer id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/user-show");
        user = userService.selectUserById(id);

        modelAndView.addObject("user",user);

        List<Order> orders = orderService.getOrdreByOpenId(user.getOpenId());
        modelAndView.addObject("orders",orders);

        return modelAndView;
    }

}

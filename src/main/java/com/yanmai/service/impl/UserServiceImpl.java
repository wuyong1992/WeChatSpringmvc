package com.yanmai.service.impl;

import com.yanmai.mapper.UserMapper;
import com.yanmai.service.UserService;
import com.yanmai.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by wuyong on 2017/4/5.
 */

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 通过openid获取用户信息
     *
     * @param openid
     * @return
     */
    @Override
    public User getUserinfo(String openid) {
        User user = userMapper.selectUserByOpenId(openid);
        return user;
    }

    //判断是否是一个用户
    @Override
    public Boolean isUser(String openid) {
        User user = this.getUserinfo(openid);
        if (user != null) {
            return true;
        }
        return false;
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void updateOrAddUser(String openid, User user) {
        if (isUser(openid)) {
            //更新用户
            userMapper.updateUser(user);
        } else {
            this.addUser(user);
        }
    }

    //更新用户信息
    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void updateSubscribe(String openId) {

        userMapper.updateSubscribe(openId);

    }


}

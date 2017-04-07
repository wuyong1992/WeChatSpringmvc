package com.yanmai.service;


import com.yanmai.model.User;

/**
 * Created by wuyong on 2017/4/5.
 */

public interface UserService {

    public User getUserinfo(String openid);

    public Boolean isUser(String openid);

    public void addUser(User user);

    public void updateOrAddUser(String openid, User user);

    public void updateUser(User user);

    public void updateSubscribe (String openId);

}

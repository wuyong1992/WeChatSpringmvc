package com.yanmai.mapper;

import com.yanmai.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wuyong on 2017/4/5.
 */
@Repository
public interface UserMapper {

    //根据openid查询用户
    public User selectUserByOpenId(String openId);

    //根据id查询用户
    public User selectUserById(Integer id);
    //添加用户
    public void addUser(User user);
    //修改用户信息
    public void updateUser(User user);

    //更改用户关注状态
    public void updateSubscribe(String openId);

    //查询所有用户
    public List<User> selectALLUser();
}

package com.yanmai.mapper;

import com.yanmai.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by wuyong on 2017/4/5.
 */
@Repository
public interface UserMapper {

    //根据openid查询用户
    public User selectUserByOpenId(String openId);
    //添加用户
    public void addUser(User user);
    //修改用户关注状态
    public void updateUser(User user);


}

package com.yanmai.mapper;

import com.yanmai.model.Item;
import org.springframework.stereotype.Repository;

/**
 * Created by admin on 2017/4/24.
 */
@Repository
public interface ItemMapper {

    //根据id查询商品
    public Item selectItemById(Integer id);

    //修改商品信息
    public void updateItem(Item item);
}

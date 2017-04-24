package com.yanmai.service;

import com.yanmai.model.Item;

/**
 * Created by admin on 2017/4/24.
 */

public interface ItemService {

    public Item getItemInfo(Integer id);

    public void updateItem(Item item);
}

package com.yanmai.service.impl;

import com.yanmai.mapper.ItemMapper;
import com.yanmai.model.Item;
import com.yanmai.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by admin on 2017/4/24.
 */
@Transactional
@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemMapper itemMapper;

    @Override
    public Item getItemInfo(Integer id) {
        Item item = itemMapper.selectItemById(id);
        return item;
    }

    @Override
    public void updateItem(Item item) {
        itemMapper.updateItem(item);
    }
}

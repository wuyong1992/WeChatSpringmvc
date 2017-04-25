package com.yanmai.service.impl;

import com.yanmai.mapper.PlacardMapper;
import com.yanmai.model.Placard;
import com.yanmai.service.PlacardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by admin on 2017/4/25.
 */
@Transactional
@Service
public class PlacardServiceImpl implements PlacardService {

    @Autowired
    private PlacardMapper placardMapper;


    @Override
    public Placard getPlacardById(Integer id) {
        return placardMapper.selectPlacardById(id);
    }

    @Override
    public List<Placard> getAllPlacard() {
        return placardMapper.selectAllPlacard();
    }

    @Override
    public void updatePlacard(Integer id) {
        placardMapper.updatePlacard(id);
    }

    @Override
    public void addPlacard(Placard placard) {
        placardMapper.addPlacard(placard);
    }
}

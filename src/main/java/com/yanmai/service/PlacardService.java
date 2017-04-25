package com.yanmai.service;

import com.yanmai.model.Placard;

import java.util.List;

/**
 * Created by admin on 2017/4/25.
 */

public interface PlacardService {

    public Placard getPlacardById(Integer id);

    public List<Placard> getAllPlacard();

    public void updatePlacard(Integer id);

    public void addPlacard(Placard placard);

}

package com.yanmai.mapper;

import com.yanmai.model.Placard;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admin on 2017/4/25.
 */
@Repository
public interface PlacardMapper {

    //找出单个海报
    public Placard selectPlacardById(Integer id);

    //找出所有海报
    public List<Placard> selectAllPlacard();

    //更新海报
    public void updatePlacard(Integer id);

    //添加海报
    public void addPlacard(Placard placard);

}

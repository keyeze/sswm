package com.chan.dao;

import com.chan.model.Testbank;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/4/28.
 */

@Repository
public interface TestSelectDao {


    public List<Testbank> queryTests(Map<String, Object> params);

    public int totalTestbank(Map<String, Object> params);

    public List<Testbank> randomTests(@Param("num") Integer num);
}

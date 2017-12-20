package com.chan.service;

import com.chan.model.TestItem;
import com.chan.model.Testbank;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/4/28.
 */
@Service
public interface ITestService {
    public void saveTest(Testbank testbank, List<Integer> knowIds);

    Map<String, Object> queryTest(Map<String, Object> params);

    void delTest(Integer testId);

    void updateTest(Testbank testbank, List<Integer> knowIds);

    List<TestItem> randomTest(Integer num);

    List<Map<String, Object>> dealTest(Map<String, Object> params) throws Exception;
}

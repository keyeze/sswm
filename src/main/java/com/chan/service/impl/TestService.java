package com.chan.service.impl;

import com.chan.dao.*;
import com.chan.model.*;
import com.chan.service.ITestService;
import com.chan.util.BaseService;
import org.testng.annotations.Test;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by keyez on 2017/4/28.
 */
@Service
public class TestService extends BaseService implements ITestService {

    private TestbankMapper baseDao;
    private TestKnowrelationMapper relationDao;
    private MsgBaseMapper knowDao;
    private MsgSelectDao msgSelectDao;
    private TestSelectDao selectDao;
    private UsersMapper usersDao;

    @Resource
    public void setMsgSelectDao(MsgSelectDao msgSelectDao) {
        this.msgSelectDao = msgSelectDao;
    }

    @Resource
    public void setUsersDao(UsersMapper usersDao) {
        this.usersDao = usersDao;
    }

    @Resource
    public void setSelectDao(TestSelectDao selectDao) {
        this.selectDao = selectDao;
    }

    @Resource
    public void setBaseDao(TestbankMapper baseDao) {
        this.baseDao = baseDao;
    }


    @Resource
    public void setRelationDao(TestKnowrelationMapper relationDao) {
        this.relationDao = relationDao;
    }

    @Resource
    public void setKnowDao(MsgBaseMapper knowDao) {
        this.knowDao = knowDao;
    }

    @Override
    public void saveTest(Testbank testbank, List<Integer> knowIds) {
        testbank.setCreateDate(new Date());
        this.baseDao.insertSelective(testbank);
        Integer testId = testbank.getTestId();
        MsgBase msgBase = new MsgBase();
        msgBase.setMsgTitle("试题扩展");
        msgBase.setCreateDate(new Date());
        msgBase.setMsgTypeId(Testbank.MSG_TYPE_ID);
        msgBase.setSendor(testId);
        this.knowDao.insertSelective(msgBase);
        if (knowIds == null) return;
        for (Integer knowId : knowIds) {
            TestKnowrelation relation = new TestKnowrelation();
            relation.setMsgId(knowId);
            relation.setTestId(testId);
            this.relationDao.insertSelective(relation);
        }
    }

    @Override
    public Map<String, Object> queryTest(Map<String, Object> params) {
        Map<String, Object> maps = new HashMap<>();
        int total = this.selectDao.totalTestbank(params);
        List<Testbank> msgs = this.selectDao.queryTests(params);
        List<Testbank> result = this.pInfoInto(msgs);
        maps.put("rows", result);
        maps.put("total", total);
        return maps;
    }

    @Override
    public void delTest(Integer testId) {
        this.baseDao.deleteByPrimaryKey(testId);
    }

    @Override
    public void updateTest(Testbank testbank, List<Integer> knowIds) {
        testbank.setCreateDate(new Date());
        this.baseDao.updateByPrimaryKeySelective(testbank);
        Integer testId = testbank.getTestId();
        if (knowIds == null) return;
/*        for (Integer knowId : knowIds) {
            TestKnowrelation relation = new TestKnowrelation();
            relation.setMsgId(knowId);
            relation.setTestId(testId);
            this.relationDao.insertSelective(relation);
        }*/
    }

    @Override
    public List<TestItem> randomTest(Integer num) {
        List<Testbank> tests = this.selectDao.randomTests(num);
        List<TestItem> results = new ArrayList<>();
        for (Testbank test : tests) results.add(new TestItem(test));
        return results;
    }

    @Override
    public List<Map<String, Object>> dealTest(Map<String, Object> params) throws Exception {

        Integer questNum = Integer.parseInt((String) params.get("questNum"));
        List<Testbank> testbanks = new ArrayList<>();
        for (int i = 0; i < questNum; i++) {
            Integer testId = Integer.parseInt((String) params.get("testId_" + i));
            Testbank testbank = this.baseDao.selectByPrimaryKey(testId);
            //存入选项
            String selected = null;
            if (params.get("selected_" + i) != null) {
                selected = new String(params.get("selected_" + i).toString().getBytes("iso-8859-1"), "utf-8");
            }
            testbank.setSelected(selected);
            testbanks.add(testbank);
        }
        List<Map<String, Object>> results = new ArrayList<>();
        for (Testbank testbank : testbanks) {
            Map<String, Object> result = new HashMap<>();
            result.put("testId", testbank.getTestId());
            result.put("isRight", testbank.getIsRight());
            result.put("p_msgId", testbank.getP_msgId());
            results.add(result);
        }
        return results;
    }

    private List<Testbank> pInfoInto(List<Testbank> result) {
        for (Testbank test : result) {
            Map<String, Object> some = new HashMap();
            some.put("SENDOR", test.getTestId());
            some.put("MSG_TYPE_ID", Testbank.MSG_TYPE_ID);
            List<MsgBase> testcong = this.msgSelectDao.queryMsgInfo(some);
            test.setP_msgId(testcong.get(0).getMsgId());
            Users sendor = this.usersDao.selectByPrimaryKey(test.getSendor());
            String p_sendor = sendor.getName();

            if ("".equals(p_sendor)) {
                p_sendor = sendor.getUsername();
            }
            test.setP_sendor(p_sendor);
        }
        return result;
    }


}

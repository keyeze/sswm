package com.chan.dao;

import com.chan.model.MsgBase;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/4/20.
 */

@Repository
public interface MsgSelectDao {

    public List<MsgBase> queryMsgInfo(Map params);

    public int totalMsgInfo(Map<String, Object> params);

    List<MsgBase> queryAnswer(@Param("msgId") Integer msgId);

    int totalAnswerInfo(Map<String, Object> params);

    List<MsgBase> queryAnswerInfo(Map<String, Object> params);
}

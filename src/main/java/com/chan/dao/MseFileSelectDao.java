package com.chan.dao;

import com.chan.model.MsgFile;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * Created by keyez on 2017/4/22.
 */
@Repository
public interface MseFileSelectDao {

    @ResultMap("BaseResultMap")
    public MsgFile queryFileByMsgID(Integer msgId);
}

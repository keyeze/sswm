package com.chan.dao;

import com.chan.model.MsgBase;
import com.chan.model.MsgBaseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MsgBaseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int countByExample(MsgBaseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int deleteByExample(MsgBaseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer msgId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int insert(MsgBase record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int insertSelective(MsgBase record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    List<MsgBase> selectByExample(MsgBaseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    MsgBase selectByPrimaryKey(Integer msgId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") MsgBase record, @Param("example") MsgBaseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") MsgBase record, @Param("example") MsgBaseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(MsgBase record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(MsgBase record);
}
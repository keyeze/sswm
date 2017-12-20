package com.chan.dao;

import com.chan.model.MsgType;
import com.chan.model.MsgTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MsgTypeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int countByExample(MsgTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int deleteByExample(MsgTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int insert(MsgType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int insertSelective(MsgType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    List<MsgType> selectByExample(MsgTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    MsgType selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") MsgType record, @Param("example") MsgTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") MsgType record, @Param("example") MsgTypeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(MsgType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(MsgType record);
}
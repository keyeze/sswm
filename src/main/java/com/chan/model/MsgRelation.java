package com.chan.model;

import com.chan.util.BaseModel;
import org.springframework.stereotype.Component;

@Component
public class MsgRelation extends BaseModel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_relation.RELATION_ID
     *
     * @mbggenerated
     */
    private Integer relationId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_relation.MSG_ID
     *
     * @mbggenerated
     */
    private Integer msgId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_relation.RECEIVOR
     *
     * @mbggenerated
     */
    private Integer receivor;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_relation.STATUS
     *
     * @mbggenerated
     */
    private Byte status;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_relation
     *
     * @mbggenerated
     */
    public MsgRelation(Integer relationId, Integer msgId, Integer receivor, Byte status) {
        this.relationId = relationId;
        this.msgId = msgId;
        this.receivor = receivor;
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_relation.RELATION_ID
     *
     * @return the value of msg_relation.RELATION_ID
     * @mbggenerated
     */
    public Integer getRelationId() {
        return relationId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_relation.MSG_ID
     *
     * @return the value of msg_relation.MSG_ID
     * @mbggenerated
     */
    public Integer getMsgId() {
        return msgId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_relation.RECEIVOR
     *
     * @return the value of msg_relation.RECEIVOR
     * @mbggenerated
     */
    public Integer getReceivor() {
        return receivor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_relation.STATUS
     *
     * @return the value of msg_relation.STATUS
     * @mbggenerated
     */
    public Byte getStatus() {
        return status;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public void setReceivor(Integer receivor) {
        this.receivor = receivor;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public MsgRelation() {
    }
}
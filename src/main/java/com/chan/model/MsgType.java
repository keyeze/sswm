package com.chan.model;

import com.chan.util.BaseModel;
import org.springframework.stereotype.Component;

@Component
public class MsgType extends BaseModel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.ID
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.TYPE_NAME
     *
     * @mbggenerated
     */
    private String typeName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_MSG_ID
     *
     * @mbggenerated
     */
    private String tMsgId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_MSG_TITLE
     *
     * @mbggenerated
     */
    private String tMsgTitle;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_MSG_TYPE_ID
     *
     * @mbggenerated
     */
    private String tMsgTypeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_CONTENT
     *
     * @mbggenerated
     */
    private String tContent;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_FILE_ID
     *
     * @mbggenerated
     */
    private String tFileId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_CREATE_DATE
     *
     * @mbggenerated
     */
    private String tCreateDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_SENDOR
     *
     * @mbggenerated
     */
    private String tSendor;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_STATUS
     *
     * @mbggenerated
     */
    private String tStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_type.T_IS_RECEIVOR
     *
     * @mbggenerated
     */
    private String tIsReceivor;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_type
     *
     * @mbggenerated
     */
    public MsgType(Integer id, String typeName, String tMsgId, String tMsgTitle, String tMsgTypeId, String tContent, String tFileId, String tCreateDate, String tSendor, String tStatus, String tIsReceivor) {
        this.id = id;
        this.typeName = typeName;
        this.tMsgId = tMsgId;
        this.tMsgTitle = tMsgTitle;
        this.tMsgTypeId = tMsgTypeId;
        this.tContent = tContent;
        this.tFileId = tFileId;
        this.tCreateDate = tCreateDate;
        this.tSendor = tSendor;
        this.tStatus = tStatus;
        this.tIsReceivor = tIsReceivor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.ID
     *
     * @return the value of msg_type.ID
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.TYPE_NAME
     *
     * @return the value of msg_type.TYPE_NAME
     * @mbggenerated
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_MSG_ID
     *
     * @return the value of msg_type.T_MSG_ID
     * @mbggenerated
     */
    public String gettMsgId() {
        return tMsgId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_MSG_TITLE
     *
     * @return the value of msg_type.T_MSG_TITLE
     * @mbggenerated
     */
    public String gettMsgTitle() {
        return tMsgTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_MSG_TYPE_ID
     *
     * @return the value of msg_type.T_MSG_TYPE_ID
     * @mbggenerated
     */
    public String gettMsgTypeId() {
        return tMsgTypeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_CONTENT
     *
     * @return the value of msg_type.T_CONTENT
     * @mbggenerated
     */
    public String gettContent() {
        return tContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_FILE_ID
     *
     * @return the value of msg_type.T_FILE_ID
     * @mbggenerated
     */
    public String gettFileId() {
        return tFileId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_CREATE_DATE
     *
     * @return the value of msg_type.T_CREATE_DATE
     * @mbggenerated
     */
    public String gettCreateDate() {
        return tCreateDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_SENDOR
     *
     * @return the value of msg_type.T_SENDOR
     * @mbggenerated
     */
    public String gettSendor() {
        return tSendor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_STATUS
     *
     * @return the value of msg_type.T_STATUS
     * @mbggenerated
     */
    public String gettStatus() {
        return tStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_type.T_IS_RECEIVOR
     *
     * @return the value of msg_type.T_IS_RECEIVOR
     * @mbggenerated
     */
    public String gettIsReceivor() {
        return tIsReceivor;
    }

    public MsgType() {
    }
}
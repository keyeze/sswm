package com.chan.model;

import com.chan.util.BaseModel;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class MsgBase extends BaseModel {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.MSG_ID
     *
     * @mbggenerated
     */
    private Integer msgId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.MSG_TITLE
     *
     * @mbggenerated
     */
    private String msgTitle;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.MSG_TYPE_ID
     *
     * @mbggenerated
     */
    private Integer msgTypeId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.CONTENT
     *
     * @mbggenerated
     */
    private String content;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.CREATE_DATE
     *
     * @mbggenerated
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.SENDOR
     *
     * @mbggenerated
     */
    private Integer sendor;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.STATUS
     *
     * @mbggenerated
     */
    private Byte status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column msg_base.IS_RECERVOR
     *
     * @mbggenerated
     */
    private Byte isRecervor;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_base
     *
     * @mbggenerated
     */
    public MsgBase(Integer msgId, String msgTitle, Integer msgTypeId, String content, Date createDate, Integer sendor, Byte status, Byte isRecervor) {
        this.msgId = msgId;
        this.msgTitle = msgTitle;
        this.msgTypeId = msgTypeId;
        this.content = content;
        this.createDate = createDate;
        this.sendor = sendor;
        this.status = status;
        this.isRecervor = isRecervor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.MSG_ID
     *
     * @return the value of msg_base.MSG_ID
     * @mbggenerated
     */
    public Integer getMsgId() {
        return msgId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.MSG_TITLE
     *
     * @return the value of msg_base.MSG_TITLE
     * @mbggenerated
     */
    public String getMsgTitle() {
        return msgTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.MSG_TYPE_ID
     *
     * @return the value of msg_base.MSG_TYPE_ID
     * @mbggenerated
     */
    public Integer getMsgTypeId() {
        return msgTypeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.CONTENT
     *
     * @return the value of msg_base.CONTENT
     * @mbggenerated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.CREATE_DATE
     *
     * @return the value of msg_base.CREATE_DATE
     * @mbggenerated
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.SENDOR
     *
     * @return the value of msg_base.SENDOR
     * @mbggenerated
     */
    public Integer getSendor() {
        return sendor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.STATUS
     *
     * @return the value of msg_base.STATUS
     * @mbggenerated
     */
    public Byte getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column msg_base.IS_RECERVOR
     *
     * @return the value of msg_base.IS_RECERVOR
     * @mbggenerated
     */
    public Byte getIsRecervor() {
        return isRecervor;
    }

    public MsgBase() {
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public void setMsgTitle(String msgTitle) {
        try {
            this.msgTitle = new String(msgTitle.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public void setMsgTypeId(Integer msgTypeId) {
        this.msgTypeId = msgTypeId;
    }

    public void setContent(String content) {
        try {
            this.content = new String(content.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setSendor(Integer sendor) {
        this.sendor = sendor;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public void setIsRecervor(Byte isRecervor) {
        this.isRecervor = isRecervor;
    }


    private String p_msgTypeId;
    private String p_sendor;


    private String p_status;
    private String p_file;
    private String p_headImg;

    public String getP_createDate() {
        SimpleDateFormat format = new SimpleDateFormat("YYYY年MM月dd日 HH:mm");
        return format.format(this.createDate);
    }

    public String getP_headImg() {
        return p_headImg;
    }

    public void setP_headImg(String p_headImg) {
        this.p_headImg = p_headImg;
    }

    public String getP_msgTypeId() {
        return p_msgTypeId;
    }

    public void setP_msgTypeId(String p_msgTypeId) {
        this.p_msgTypeId = p_msgTypeId;
    }

    public String getP_sendor() {
        return p_sendor;
    }

    public void setP_sendor(String p_sendor) {
        this.p_sendor = p_sendor;
    }

    public String getP_file() {
        return p_file;
    }

    public void setP_file(String p_file) {
        this.p_file = p_file;
    }

    public String getP_status() {
        return p_status;
    }

    public void setP_status(String p_status) {
        this.p_status = p_status;
    }
}
package com.chan.model;

import com.chan.util.BaseModel;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Component
public class TestItem extends BaseModel {
    private Integer testId;

    private String title;

    private Integer sendor;

    private Date createDate;

    private List<String> answers;

    private Byte status;

    public TestItem(Testbank testbank) {
        this.testId = testbank.getTestId();
        this.sendor = testbank.getSendor();
        this.createDate = testbank.getCreateDate();
        this.p_sendor = testbank.getP_sendor();
        this.title = testbank.getTitle();
        answers = new ArrayList<>();
        List<String> strs = new ArrayList<>();
        strs.add(testbank.getRightselect());
        strs.add(testbank.getErrorselect1());
        strs.add(testbank.getErrorselect2());
        strs.add(testbank.getErrorselect3());
        Random rand = new Random();
        for (int i = 0; i < 4; i++) {
            String answer = strs.remove(rand.nextInt(strs.size()));
            answers.add(answer);
        }

    }

    public Integer getTestId() {
        return testId;
    }

    public String getTitle() {
        return title;
    }

    public Integer getSendor() {
        return sendor;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Byte getStatus() {
        return status;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSendor(Integer sendor) {
        this.sendor = sendor;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    private String p_sendor;

    public String getP_sendor() {
        return p_sendor;
    }

    public void setP_sendor(String p_sendor) {
        this.p_sendor = p_sendor;
    }

    public String getP_createDate() {
        SimpleDateFormat format = new SimpleDateFormat("YYYY年MM月dd日 HH:mm");
        return format.format(this.createDate);
    }

    public List<String> getAnswers() {
        return answers;
    }

    public void setAnswers(List<String> answers) {
        this.answers = answers;
    }

    public TestItem() {
    }
}
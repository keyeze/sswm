package com.chan.service;

import com.chan.model.MsgBase;
import com.chan.model.MsgFile;
import com.chan.model.MsgType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/4/6.
 */
public interface IMsgService {

    public Map<String, Object> queryMsg(Map<String, Object> params) throws Exception;

    void saveMsg(MsgBase msgBase, MsgFile msgFile, MultipartFile file) throws Exception;

    MsgType queryMsgTitle(Integer msg_type_id);

    ResponseEntity<byte[]> download(Integer fileId) throws IOException;

    public void delete(Integer msgId);

    void updateMsg(MsgBase msgBase, MsgFile msgFile, MultipartFile file) throws IOException;

    public Map<String, Object> queryAnswerInfo(Map<String, Object> params);

    public List<MsgBase> queryAnswer(Integer msgId) throws Exception;

    void saveAnswer(MsgBase msgBase, Integer receivor) throws Exception;

    public MsgBase queryMsgInfo(Integer msgId) throws Exception;
}

package com.chan.service.impl;

import com.chan.dao.*;
import com.chan.model.*;
import com.chan.mr.tool.exception.UserErrorException;
import com.chan.service.IMsgService;
import com.chan.util.BaseService;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/4/6.
 */
@Service
public class MsgService extends BaseService implements IMsgService {

    private MsgBaseMapper baseDao;
    private MsgSelectDao selectDao;
    private MsgFileMapper fileDao;
    private MsgTypeMapper typeDao;
    private UsersMapper userDao;
    private MseFileSelectDao fileSelectDao;
    private MsgRelationMapper relationDao;

    @Resource
    public void setRelationDao(MsgRelationMapper relationDao) {
        this.relationDao = relationDao;
    }

    @Resource
    public void setFileSelectDao(MseFileSelectDao fileSelectDao) {
        this.fileSelectDao = fileSelectDao;
    }

    @Resource
    public void setFileDao(MsgFileMapper fileDao) {
        this.fileDao = fileDao;
    }

    @Resource
    public void setTypeDao(MsgTypeMapper typeDao) {
        this.typeDao = typeDao;
    }

    public MsgBaseMapper getBaseDao() {
        return baseDao;
    }

    @Resource
    public void setBaseDao(MsgBaseMapper baseDao) {
        this.baseDao = baseDao;
    }

    public MsgSelectDao getSelectDao() {
        return selectDao;
    }

    @Resource
    public void setSelectDao(MsgSelectDao selectDao) {
        this.selectDao = selectDao;
    }

    @Resource
    public void setUserDao(UsersMapper userDao) {
        this.userDao = userDao;
    }

    @Override
    public Map<String, Object> queryMsg(Map<String, Object> params) throws Exception {
        Map<String, Object> maps = new HashMap<>();
        int total = this.selectDao.totalMsgInfo(params);
        List<MsgBase> msgs = this.selectDao.queryMsgInfo(params);
        List<MsgBase> result = this.pInfoInto(msgs);
        maps.put("rows", result);
        maps.put("total", total);
        return maps;

    }

    @Override
    public void saveMsg(MsgBase msgBase, MsgFile msgFile, MultipartFile file) throws Exception {
        msgBase.setCreateDate(new Date());
        this.baseDao.insertSelective(msgBase);
        if (file == null) return;
        //存放file
            if ("".equals(msgFile.getFileName())) return;

        String fileName = msgFile.getFileName();
        byte[] array = fileName.getBytes();
        File data = new File("file/" + array[0] + "/" + array[1] + "/" + new Date().getTime());
        if (!data.getParentFile().exists()) {
            data.getParentFile().mkdirs();
        }
        FileOutputStream outputStream = new FileOutputStream(data);
        InputStream inputStream = file.getInputStream();
        MyUtil.writeTo(inputStream, outputStream);
        inputStream.close();
        outputStream.close();
        String fileOriginalFilename = new String(file.getOriginalFilename().getBytes("iso-8859-1"), "utf-8");
        String[] strs = fileOriginalFilename.split("\\.");

        msgFile.setMsgId(msgBase.getMsgId());
        msgFile.setFilePath(data.getPath());
        msgFile.setFileType(strs[strs.length - 1]);
        msgFile.setUploadDate(new Date());
        this.fileDao.insertSelective(msgFile);

    }

    @Override
    public MsgType queryMsgTitle(Integer msg_type_id) {

        MsgType result = this.typeDao.selectByPrimaryKey(msg_type_id);

        return result;
    }

    @Override
    public ResponseEntity<byte[]> download(Integer msgId) throws IOException {
        MsgFile file = fileSelectDao.queryFileByMsgID(msgId);
        if (file == null) return null;
        String path = file.getFilePath();
        File result = new File(path);
        String fileName = /*new String(file.getFileName().getBytes("UTF-8"), "iso-8859-1")*/file.getFileName() + "\\." + file.getFileType();//为了解决中文名称乱码问题
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(result), headers, HttpStatus.CREATED);

    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public void delete(Integer msgId) {
        MsgFile msgFile = fileSelectDao.queryFileByMsgID(msgId);
        if (msgFile != null) {
            fileDao.deleteByPrimaryKey(msgFile.getId());
            File file = new File(msgFile.getFilePath());
            file.delete();
        }
        baseDao.deleteByPrimaryKey(msgId);
    }

    @Override
    public void updateMsg(MsgBase msgBase, MsgFile msgFile, MultipartFile file) throws IOException {
        this.baseDao.updateByPrimaryKeySelective(msgBase);
        MsgFile updateFile = this.fileSelectDao.queryFileByMsgID(msgBase.getMsgId());
        if (file == null) return;
        if (updateFile == null)
            updateFile = msgFile;
        //存放file
        String fileName = msgFile.getFileName();
        if ("".equals(fileName)) return;
        byte[] array = fileName.getBytes();
        File data = new File("file/" + array[0] + "/" + array[1] + "/" + new Date().getTime());
        System.out.println(data.getAbsolutePath());
        if (!data.getParentFile().exists()) {
            data.getParentFile().mkdirs();
        }
        FileOutputStream outputStream = new FileOutputStream(data);
        InputStream inputStream = file.getInputStream();
        MyUtil.writeTo(inputStream, outputStream);
        inputStream.close();
        outputStream.close();
        String fileOriginalFilename = new String(file.getOriginalFilename().getBytes("iso-8859-1"), "utf-8");
        String[] strs = fileOriginalFilename.split("\\.");

        updateFile.setFilePath(data.getPath());
        updateFile.setFileType(strs[strs.length - 1]);
        updateFile.setFileName(msgFile.getFileName());
        updateFile.setUploadDate(new Date());
        if (updateFile.getId() != null) {
            this.fileDao.updateByPrimaryKeySelective(updateFile);
        } else {
            updateFile.setMsgId(msgBase.getMsgId());
            this.fileDao.insertSelective(updateFile);
        }
    }

    @Override
    public MsgBase queryMsgInfo(Integer msgId) throws Exception {
        if (msgId == null) throw new UserErrorException("参数有误");
        MsgBase msgBase = this.baseDao.selectByPrimaryKey(msgId);
        String p_msgTypeId = this.typeDao.selectByPrimaryKey(msgBase.getMsgTypeId()).getTypeName();
        msgBase.setP_msgTypeId(p_msgTypeId);
        String p_sendor = this.userDao.selectByPrimaryKey(msgBase.getSendor()).getName();
        if ("".equals(p_sendor)) {
            p_sendor = this.userDao.selectByPrimaryKey(msgBase.getSendor()).getUsername();
        }
        msgBase.setP_sendor(p_sendor);
        String p_status = msgBase.getStatus() == 0 ? "已发布" : "已删除";
        msgBase.setP_status(p_status);
        MsgFile file = this.fileSelectDao.queryFileByMsgID(msgBase.getMsgId());
        String fileName = null;
        if (file != null) fileName = file.getFileName() + "." + file.getFileType();
        msgBase.setP_file(fileName);
        return msgBase;
    }

    @Override
    public Map<String, Object> queryAnswerInfo(Map<String, Object> params) {
        Map<String, Object> maps = new HashMap<>();
        int total = this.selectDao.totalAnswerInfo(params);
        List<MsgBase> msgs = this.selectDao.queryAnswerInfo(params);
        List<MsgBase> result = this.pInfoInto(msgs);
        maps.put("rows", result);
        maps.put("total", total);
        return maps;
    }

    @Override
    public List<MsgBase> queryAnswer(Integer msgId) throws Exception {
        if (msgId == null) throw new UserErrorException("参数有误");
        List<MsgBase> msgs = this.selectDao.queryAnswer(msgId);
        List<MsgBase> result = this.pInfoInto(msgs);
        return result;
    }

    @Override
    public void saveAnswer(MsgBase msgBase, Integer receivor) throws Exception {
        msgBase.setCreateDate(new Date());
        this.baseDao.insertSelective(msgBase);
        //存放file
        MsgRelation relation = new MsgRelation();
        relation.setMsgId(msgBase.getMsgId());
        relation.setReceivor(receivor);
        relationDao.insertSelective(relation);
        System.out.println(relation);
    }

    public List<MsgBase> pInfoInto(List<MsgBase> result) {
        for (MsgBase msgBase : result) {
            String p_msgTypeId = this.typeDao.selectByPrimaryKey(msgBase.getMsgTypeId()).getTypeName();
            msgBase.setP_msgTypeId(p_msgTypeId);
            Users sendor = this.userDao.selectByPrimaryKey(msgBase.getSendor());
            String p_sendor = sendor.getName();
            String p_headImg = sendor.getHeadSrc();
            if ("".equals(p_sendor)) {
                p_sendor = sendor.getUsername();
            }
            msgBase.setP_headImg(p_headImg);
            msgBase.setP_sendor(p_sendor);
            String p_status = msgBase.getStatus() == 0 ? "已发布" : "已删除";
            msgBase.setP_status(p_status);
            MsgFile file = this.fileSelectDao.queryFileByMsgID(msgBase.getMsgId());
            String fileName = null;
            if (file != null) fileName = file.getFileName() + "." + file.getFileType();
            msgBase.setP_file(fileName);
        }

        return result;
    }
}

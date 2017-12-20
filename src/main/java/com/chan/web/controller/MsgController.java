package com.chan.web.controller;

import com.chan.model.MsgBase;
import com.chan.model.MsgFile;
import com.chan.model.Users;
import com.chan.mr.tool.exception.UserErrorException;
import com.chan.service.IMsgService;
import com.chan.util.BaseController;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by keyez on 2017/4/6.
 */
@Controller
@RequestMapping("/msg")
public class MsgController extends BaseController {


    @ResponseBody
    @RequestMapping(value = "/queryMsg", method = {RequestMethod.POST, RequestMethod.GET})
    public Map<String, Object> queryMsg(HttpServletRequest request) throws Exception {
        Map<String, Object> map = this.getRequestMap(request);
        System.out.println(map);
        if (map.get("page") != null && map.get("rows") != null)
            map.put("start", (Integer.parseInt((String) map.get("page")) - 1) * Integer.parseInt((String) map.get("rows")));
        Map<String, Object> result = this.msgService.queryMsg(map);
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/saveMsg", method = {RequestMethod.POST, RequestMethod.GET})
    public Map<String, Object> saveMsg(MsgBase msgBase, MsgFile msgFile, HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        HttpSession session = request.getSession();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user == null) throw new UserErrorException("请重新登录");
            msgBase.setSendor(user.getUserId());
            this.msgService.saveMsg(msgBase, msgFile, file);
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/getTitle", method = {RequestMethod.GET})
    public Map<String, Object> getTitle(Integer msg_type_id) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try {
            result.put("data", this.msgService.queryMsgTitle(msg_type_id));
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @RequestMapping("/downFile")
    public ResponseEntity<byte[]> download(Integer msgId) throws IOException {
        return this.msgService.download(msgId);
    }


    @ResponseBody
    @RequestMapping("/delMsg")
    public Map<String, Object> delMsg(Integer msgId) {

        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        msgService.delete(msgId);
        result.put("success", true);
        return result;

    }

    @ResponseBody
    @RequestMapping("/updateMsg")
    public Map<String, Object> updateMsg(MsgBase msgBase, MsgFile msgFile, HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file) {
        System.out.println(request.getServletContext().getRealPath(""));
//        return null;
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        HttpSession session = request.getSession();
        System.out.println(msgBase);
        try {
            Users user = (Users) session.getAttribute("user");
            if (user == null) throw new UserErrorException("请重新登录");
            msgBase.setSendor(user.getUserId());
            if (msgBase.getMsgId() == null) throw new UserErrorException("未获取到更新的主键");
            this.msgService.updateMsg(msgBase, msgFile, file);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/queryMsgInfo")
    public Map<String, Object> queryMsgInfo(Integer msgId) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try {
            result.put("result", this.msgService.queryMsgInfo(msgId));
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/queryAnswer", method = {RequestMethod.GET})
    public Map<String, Object> queryAnswer(Integer msgId) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try {
            result.put("result", this.msgService.queryAnswer(msgId));
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/queryAnswerPage", method = {RequestMethod.GET})
    public Map<String, Object> queryAnswerPage(HttpServletRequest request) {
        Map<String, Object> map = this.getRequestMap(request);
        System.out.println(map);
        if (map.get("page") != null && map.get("rows") != null)
            map.put("start", (Integer.parseInt((String) map.get("page")) - 1) * Integer.parseInt((String) map.get("rows")));
        Map<String, Object> result = null;
        result = this.msgService.queryAnswerInfo(map);
        return result;
    }

    @ResponseBody
    @RequestMapping("/saveAnswer")
    public Map<String, Object> saveAnswer(MsgBase msgBase, Integer receivor, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        HttpSession session = request.getSession();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user == null) throw new UserErrorException("请重新登录");
            msgBase.setSendor(user.getUserId());
            this.msgService.saveAnswer(msgBase, receivor);
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @Override
    @Resource
    public void setMsgService(IMsgService msgService) {
        super.setMsgService(msgService);
    }


}

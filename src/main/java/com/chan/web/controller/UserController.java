package com.chan.web.controller;

import com.chan.model.Users;
import com.chan.service.IUserService;
import com.chan.util.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

/**
 * Created by keyez on 2017/2/17.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Override
    @Resource
    public void setUserService(IUserService userService) {
        super.setUserService(userService);
    }

    @RequestMapping("/test")
    @ResponseBody
    public Map<String, Object> test() {
        Map<String, Object> map = this.userService.doTest();
        return map;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request) {
        Random random = new Random();
        random.nextInt(12);
        Map<String, Object> params = this.getRequestMap(request);
        Map<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        result.put("success", false);
        try {
            session.setAttribute("user", this.userService.login(params));
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> register(Users newUser) {
        System.out.println(newUser);
        Map<String, Object> result = new HashMap<>();
        try {
            this.userService.register(newUser);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/savePinInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> savePinInfo(HttpServletRequest request, Users user) {
        Map<String, Object> result = new HashMap<>();
        try {
            Users users = this.userService.updatePinInfo(user);
            request.getSession().setAttribute("user", users);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("msg", "保存失败");
        }
        return result;
    }

    @RequestMapping(value = "/editPwd", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> editPwd(HttpServletRequest request, String oldPwd, String newPwd) {
        Map<String, Object> result = new HashMap<>();
        Users user = (Users) request.getSession().getAttribute("user");
        if (!oldPwd.equals(user.getPassword())) {
            result.put("success", false);
            result.put("msg", "原始密码不正确！");
            return result;
        }
        try {
            Users alterPwd = new Users();
            alterPwd.setPassword(newPwd);
            alterPwd.setUserId(user.getUserId());
            Users users = this.userService.updatePinInfo(alterPwd);
            request.getSession().setAttribute("user", users);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("msg", "保存失败");
        }
        return result;
    }

    @RequestMapping(value = "/uploadHeadFile")
    @ResponseBody
    public Map<String, Object> uploadHeadFile(HttpServletRequest request, @RequestParam(value = "upFile", required = false) MultipartFile upFile) {
        Map<String, Object> result = new HashMap<>();
        Users user = (Users) request.getSession().getAttribute("user");
        if (null == user) {
            result.put("success", false);
            result.put("msg", "用户登录过时！");
            return result;
        }
        String path = request.getServletContext().getRealPath("/upload");
        String upFileName = upFile.getOriginalFilename();
        String filename = UUID.randomUUID().toString() + upFileName.substring(upFileName.lastIndexOf("."));
        InputStream in = null;
        BufferedOutputStream bos = null;
        try {
            in = upFile.getInputStream();
            File newFileDir = new File(path);
            if (!newFileDir.exists()) {
                newFileDir.mkdirs();
            }
            File newFile = new File(path, filename);
            newFile.createNewFile();
            bos = new BufferedOutputStream(new FileOutputStream(newFile));
            int len = 0;
            byte[] bs = new byte[1024];
            while ((len = in.read(bs)) != -1) {
                bos.write(bs, 0, len);
            }
            String headUrl = "/upload/" + filename;
            user.setHeadSrc(headUrl);
            Users users = this.userService.updatePinInfo(user);
            request.getSession().setAttribute("user", users);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", false);
            result.put("msg", "上传失败！");
            return result;
        } finally {
            try {
                if (bos != null) {
                    bos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (in != null) {
                        in.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Map<String, Object> logout(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) return result;
        Users updateUser = new Users();
        user.setUserId(user.getUserId());
        user.setLastLoginDate(new Date());
        this.userService.updatePinInfo(user);
        session.removeAttribute("user");
        result.put("success", true);
        return result;
    }

    @RequestMapping("/queryUsers")
    @ResponseBody
    public Map<String, Object> queryUsers(HttpServletRequest request) {
        Map<String, Object> map = this.getRequestMap(request);
        if (map.get("page") != null && map.get("rows") != null)
            map.put("start", (Integer.parseInt((String) map.get("page")) - 1) * Integer.parseInt((String) map.get("rows")));
        Map<String, Object> result = this.userService.queryUsers(map);
        return result;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    @ResponseBody
    public Object login2(HttpServletRequest request) {
        return "login2";
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    @ResponseBody
    public Object login3(HttpServletRequest request) {
        return "login3";
    }

    @RequestMapping(value = "/login.do")
    @ResponseBody
    public Object login5(HttpServletRequest request) {
        return "login5";
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.PUT)
    @ResponseBody
    public Object login6() {
        System.out.println("PUT");
        return "PUT";
    }
}

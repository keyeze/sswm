package com.chan.util;

import com.chan.service.IMsgService;
import com.chan.service.ITestService;
import com.chan.service.IUserService;
import com.chan.service.impl.MsgService;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/2/16.
 */
@Component
public abstract class BaseController {
    protected IMsgService msgService;


    protected IUserService userService;

    protected ITestService testService;


    public void setTestService(ITestService testService) {
        this.testService = testService;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public void setMsgService(IMsgService msgService) {
        this.msgService = msgService;
    }

    public Map<String, Object> getRequestMap(HttpServletRequest request) {
        Map<String, Object> fieldValues = new HashMap<>();
        Map map = request.getParameterMap();
        Enumeration<String> enums = request.getParameterNames();
        while (enums.hasMoreElements()) {
            String name = enums.nextElement();
            if (!"".equals(request.getParameter(name)))
                fieldValues.put(name, request.getParameter(name));
            else
                fieldValues.put(name, null);
        }
        return fieldValues;
    }

    public Map<String, Object> toGridFormat(List rows) {
        if (rows == null) return null;
        Map<String, Object> result = new HashMap();
        result.put("total", rows.size());
        result.put("rows", rows);
        return result;
    }

    ;;
}

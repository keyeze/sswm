package com.chan.web.controller;

import com.chan.model.Testbank;
import com.chan.model.Users;
import com.chan.mr.tool.exception.UserErrorException;
import com.chan.service.ITestService;
import com.chan.service.IUserService;
import com.chan.util.BaseController;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

/**
 * Created by keyez on 2017/4/28.
 */
@Controller
@RequestMapping("/test")
public class TestController extends BaseController {

    @ResponseBody
    @RequestMapping(value = "/saveTest", method = {RequestMethod.POST, RequestMethod.GET})
    public Map<String, Object> saveTest(Testbank testbank, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        HttpSession session = request.getSession();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user == null) {
                {
                    throw new UserErrorException("请重新登录");
                }
            }
            testbank.setSendor(user.getUserId());
            this.testService.saveTest(testbank, null);
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/updateTest", method = {RequestMethod.POST, RequestMethod.GET})
    public Map<String, Object> updateTest(Testbank testbank) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try {
            this.testService.updateTest(testbank, null);
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/queryTest", method = {RequestMethod.GET, RequestMethod.POST})
    public Map<String, Object> queryTest(HttpServletRequest request) throws Exception {
        Map<String, Object> map = this.getRequestMap(request);
        if (map.get("page") != null && map.get("rows") != null) {
            map.put("start", (Integer.parseInt((String) map.get("page")) - 1) * Integer.parseInt((String) map.get("rows")));
        }
        Map<String, Object> result = this.testService.queryTest(map);
        return result;
    }

    @ResponseBody
    @RequestMapping("/delTest")
    public Map<String, Object> delTest(Integer testId) throws Exception {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try {
            this.testService.delTest(testId);
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/randomTest")
    public Map<String, Object> randomTest(Integer num) {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try {
            result.put("result", this.testService.randomTest(num));
            result.put("success", true);
        } catch (Exception e) {
            result.put("msg", e.getMessage());
            result.put("success", false);
        }
        return result;
    }

    @RequestMapping("/dealTest")
    public ModelAndView dealTest(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> params = this.getRequestMap(request);
        try {
            mv.addObject("data", this.testService.dealTest(params));
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("questNum", params.get("questNum"));
        //视图名
        mv.setViewName("Result_TestOnline");
        return mv;
    }

    @RequestMapping(value = "/downloadTestModel")
    public String downloadTestModel(HttpServletResponse response) throws Exception {
        Workbook workbook = new HSSFWorkbook();
        Sheet sheet = workbook.createSheet();
        Row row = sheet.createRow(0);
        Cell cell = row.createCell(0);
        cell.setCellValue("试题问题");
        cell = row.createCell(1);
        cell.setCellValue("正确的解释");
        cell = row.createCell(2);
        cell.setCellValue("正确答案");
        cell = row.createCell(3);
        cell.setCellValue("错误答案1");
        cell = row.createCell(4);
        cell.setCellValue("错误答案2");
        cell = row.createCell(5);
        cell.setCellValue("错误答案3");

        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(("导入试题.xls").getBytes(), "iso-8859-1"));
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            workbook.write(os);
            bis = new BufferedInputStream(new ByteArrayInputStream(os.toByteArray()));
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] bytes = new byte[1024];
            int len = 0;
            while ((len = bis.read(bytes)) != -1) {
                bos.write(bytes, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bis != null) {
                    bis.close();
                }
                if (bos != null) {
                    bos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @ResponseBody
    @RequestMapping("/importTest")
    public Map<String, Object> importTest(HttpServletRequest request, @RequestParam(value = "upFile") MultipartFile upFile) {
        Map<String, Object> result = new HashMap<>();
        Users user = (Users) request.getSession().getAttribute("user");
        if (null == user) {
            result.put("success", false);
            result.put("msg", "用户登录过时！");
            return result;
        }
        try {
            Workbook workbook = null;
            try {
                workbook = new HSSFWorkbook(upFile.getInputStream());
            } catch (OfficeXmlFileException e) {
                workbook = new XSSFWorkbook(upFile.getInputStream());
            }
            Sheet sheet = workbook.getSheetAt(0);
            List<Testbank> testbanks = new ArrayList<>();
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                Testbank testbank = null;
                for (int j = 0; j <= row.getLastCellNum(); j++) {
                    Cell cell = row.getCell(j);
                    if (cell == null) {
                        continue;
                    }
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    String cellValue = cell.getStringCellValue();
                    switch (j) {
                        case 0:if ("".equals(cellValue)) {
                            break;
                        }
                        testbank = new Testbank();testbank.setTitle(cellValue);break;
                        case 1:testbank.setAnswer(cellValue);break;
                        case 2:testbank.setRightselect(cellValue);break;
                        case 3:testbank.setErrorselect1(cellValue);break;
                        case 4:testbank.setErrorselect2(cellValue);break;
                        case 5:testbank.setErrorselect3(cellValue);break;
                    }
                }
                if (null != testbank) {
                    testbank.setCreateDate(new Date());
                    testbank.setSendor(user.getUserId());
                    testbanks.add(testbank);
                }
            }

            //一个个插入
            for (Testbank testbank : testbanks) {
                this.testService.saveTest(testbank, null);
            }
            result.put("msg", "导入成功,共导入了" + testbanks.size() + "条题目");
            result.put("success", true);
        } catch (IOException e) {
            result.put("msg", "对不起,您上传的文件格式不对,请上传Excel格式的文件");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", "导入失败");
            result.put("success", false);
        }
        return result;
    }

    @Override
    @Resource

    public void setTestService(ITestService testService) {
        super.setTestService(testService);
    }

    @Resource
    @Override
    public void setUserService(IUserService userService) {
        super.setUserService(userService);
    }
}

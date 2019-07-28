<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.bobo.helper.ExcelHelper;
import com.bobo.modal.ShitiModal;
import com.bobo.modal.XixiangModal;

public class ExportExcel extends HttpServlet {

    /**
     * The doGet method of the servlet. <br>
     * 
     * This method is called when a form has its tag value method equals to get.
     * 
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        process(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * 
     * This method is called when a form has its tag value method equals to
     * post.
     * 
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        process(request, response);
    }

    @SuppressWarnings("deprecation")
    private void process(HttpServletRequest request,
            HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        response.reset();
        response.setContentType("application/x-msexcel");

        String fileName = URLEncoder.encode("请假信息汇总", "utf-8");
        response.addHeader("Content-Disposition", "attachment; filename="
                + new String(fileName.getBytes("utf-8"), "ISO8859-1") + ".xls");
        HSSFWorkbook wb = new HSSFWorkbook();
        // 表头数足
        String[] title = { "序号", "请假单号", "班级编号", "班级名称", "学生姓名", "请假原因", "请假天数",
                "请假时间", "审核状态", "审核时间", "审核意见" };
        ArrayList<ShitiModal> content = new ArrayList<ShitiModal>();
        for (int i = 0; i < 6; i++) {
            ShitiModal shiti = new ShitiModal();
            shiti.setShitiCity("杭州");
            shiti.setShitiName("二龙路基站");
            shiti.setShitiNum("9405844939");
            shiti.setShitiPerson("张三");
            shiti.setShitiProvince("浙江");
            shiti.setShitiResult("不合格");
            shiti.setShitiTime("2015年4月28日");
            // 填充细分项
            ArrayList<XixiangModal> xixiangList = new ArrayList<XixiangModal>();
            for (int j = 0; j < 2; j++) {
                XixiangModal xixiang = new XixiangModal();
                xixiang.setXixiangMember("张三");
                xixiang.setXixiangName("开关电源");
                xixiang.setXixiangReason("管道线路井内余线没有靠墙");
                xixiang.setXixiangResult("不合格");
                xixiang.setXixiangTime("2015年4月28日");
                xixiangList.add(xixiang);
            }
            shiti.setXixiangList(xixiangList);
            content.add(shiti);
        }
        ExcelHelper eHelper = new ExcelHelper();
        // 生成excel中的一张表格
        HSSFSheet sheet = eHelper.export(wb, "sheet1", title, content);

        // 直接存到服务器端
        // FileOutputStream fileOut;
        // try {
        // fileOut = new FileOutputStream("workbook.xls");
        // wb.write(fileOut);
        // fileOut.close();
        // } catch (Exception e) {
        // // TODO Auto-generated catch block
        // e.printStackTrace();
        // }
        // 写入输出流
        try {
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
import java.util.ArrayList;

public class ShitiModal {
    private String shitiNum;
    private String shitiName;
    private String shitiProvince;
    private String shitiCity;
    private String shitiPerson;
    private String shitiTime;
    private String shitiResult;
    private ArrayList<XixiangModal> xixiangList;    
    public String getShitiPerson() {
        return shitiPerson;
    }

    public void setShitiPerson(String shitiPerson) {
        this.shitiPerson = shitiPerson;
    }

    public String getShitiTime() {
        return shitiTime;
    }

    public void setShitiTime(String shitiTime) {
        this.shitiTime = shitiTime;
    }

    public String getShitiResult() {
        return shitiResult;
    }

    public void setShitiResult(String shitiResult) {
        this.shitiResult = shitiResult;
    }



    public String getShitiNum() {
        return shitiNum;
    }

    public void setShitiNum(String shitiNum) {
        this.shitiNum = shitiNum;
    }

    public String getShitiName() {
        return shitiName;
    }

    public void setShitiName(String shitiName) {
        this.shitiName = shitiName;
    }

    public String getShitiProvince() {
        return shitiProvince;
    }

    public void setShitiProvince(String shitiProvince) {
        this.shitiProvince = shitiProvince;
    }

    public String getShitiCity() {
        return shitiCity;
    }

    public void setShitiCity(String shitiCity) {
        this.shitiCity = shitiCity;
    }

    public ArrayList<XixiangModal> getXixiangList() {
        return xixiangList;
    }

    public void setXixiangList(ArrayList<XixiangModal> xixiangList) {
        this.xixiangList = xixiangList;
    }

}
复制代码

复制代码
package com.bobo.modal;

public class XixiangModal {
    private String XixiangName;
    private String XixiangMember;
    private String XixiangResult;
    private String XixiangTime;
    private String XixiangReason;
    public String getXixiangName() {
        return XixiangName;
    }
    public void setXixiangName(String xixiangName) {
        XixiangName = xixiangName;
    }
    public String getXixiangMember() {
        return XixiangMember;
    }
    public void setXixiangMember(String xixiangMember) {
        XixiangMember = xixiangMember;
    }
    public String getXixiangResult() {
        return XixiangResult;
    }
    public void setXixiangResult(String xixiangResult) {
        XixiangResult = xixiangResult;
    }
    public String getXixiangTime() {
        return XixiangTime;
    }
    public void setXixiangTime(String xixiangTime) {
        XixiangTime = xixiangTime;
    }
    public String getXixiangReason() {
        return XixiangReason;
    }
    public void setXixiangReason(String xixiangReason) {
        XixiangReason = xixiangReason;
    }
    

}
复制代码
4,ExcelHelper类

复制代码
package com.bobo.helper;

import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.bobo.modal.ShitiModal;
import com.bobo.modal.XixiangModal;

public class ExcelHelper {

    public HSSFSheet export(HSSFWorkbook wb, String fileName, String[] title,
            ArrayList<ShitiModal> content) {
        // int cellNum = 5; //设置列数
        /**
         * 建立表格设置。
         */
        HSSFSheet sheet = null;
        try {
            sheet = wb.createSheet(fileName);

            int columnSize = title.length;
            HSSFRow row_one = sheet.createRow(0);
            for (int i = 0; i < columnSize; i++) {
                HSSFCell cell = row_one.createCell(i);
                cell.setCellValue(title[i]);
            }
            int curRow = 1;
            int endRow = 1;
            int temp = curRow;
            for (int i = 0; i < content.size(); i++) {
                temp = curRow;
                ShitiModal shiti = content.get(i);
                int xixiangNum = content.get(i).getXixiangList().size();
                endRow += xixiangNum;
                for (; curRow < endRow; curRow++) {
                    // 设置需要合并的单元格部分
                    for (int k = 0; k < 7; k++) {
                        CellRangeAddress cra = new CellRangeAddress(curRow,
                                endRow - 1, k, k);
                        sheet.addMergedRegion(cra);
                    }
                    HSSFRow row = sheet.createRow(curRow);
                    if (curRow == temp) {
                        row.createCell(0).setCellValue(shiti.getShitiNum());
                        row.createCell(1).setCellValue(shiti.getShitiName());
                        row.createCell(2)
                                .setCellValue(shiti.getShitiProvince());
                        row.createCell(3).setCellValue(shiti.getShitiCity());
                        row.createCell(4).setCellValue(shiti.getShitiPerson());
                        row.createCell(5).setCellValue(shiti.getShitiResult());
                        row.createCell(6).setCellValue(shiti.getShitiTime());
                    }
                    // 开始添加细分
                    XixiangModal xixiang = shiti.getXixiangList().get(
                            curRow - temp);
                    row.createCell(7).setCellValue(xixiang.getXixiangName());
                    row.createCell(8).setCellValue(xixiang.getXixiangMember());
                    row.createCell(9).setCellValue(xixiang.getXixiangResult());
                    row.createCell(10).setCellValue(xixiang.getXixiangTime());
                    row.createCell(11).setCellValue(xixiang.getXixiangReason());

                }
                curRow = endRow;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return sheet;
    } // end of export

}%>

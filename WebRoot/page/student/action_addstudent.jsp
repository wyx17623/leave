<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加二级学院过程--%>
<%
  //防止中文乱码处理
  request.setCharacterEncoding("utf-8");
  //1:接收参数
    String stuID=request.getParameter("stuID");//二级学院编号
    String classid=request.getParameter("classid");//二级学院编号
  String stuName=request.getParameter("stuName");//二级学院编号
  String sex =request.getParameter("sex");//二级学院名称
  String address =request.getParameter("address");//二级学院名称
  String stuTel =request.getParameter("stuTel");//二级学院名称
  String contact =request.getParameter("contact");//二级学院名称
  String contactTel =request.getParameter("contactTel");//二级学院名称
  //字符串转码depName=new String(depName.getBytes(),"gbk");
  //2:处理-保存到sys_department表
  //2.1获得连接对象
   Connection conn =getConn();

  //2.2定义含动态参数的SQL语句的字符串变量
  
  String sql="insert into sys_student(stuID,classid,stuName,sex,address,stuTel,contact,contactTel)values(?,?,?,?,?,?,?,?);";
  //2.3创建执行含动态参数的SQL的对象
   PreparedStatement pstmt=conn.prepareStatement(sql);
   
  //2.4 设置SQL中动态参数对应的值，注意索引从1开始
  int index=1;
  pstmt.setString(index++, stuID);
  pstmt.setString(index++, classid);
  pstmt.setString(index++, stuName);
  pstmt.setString(index++, sex);
  pstmt.setString(index++, address);
  pstmt.setString(index++, stuTel);
  pstmt.setString(index++, contact);
  pstmt.setString(index++, contactTel);
  //2.5 执行SQL并返回执行结果
  int count=pstmt.executeUpdate();
  //2.6 关闭数据库连接资源
  close(pstmt, conn);
  //3:跳转目标页面
  process(request, response, "student_list.jsp");

%>
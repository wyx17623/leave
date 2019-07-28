<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加二级学院过程--%>
<%
  //防止中文乱码处理
  request.setCharacterEncoding("utf-8");
  //1:接收参数
    String courseID=request.getParameter("courseID");//二级学院编号
    String classid=request.getParameter("classid");//二级学院编号
  String courseName=request.getParameter("courseName");//二级学院编号
  String year =request.getParameter("year");//二级学院名称
  String term =request.getParameter("term");//二级学院名称
  String hour =request.getParameter("hour");//二级学院名称
  
  //字符串转码depName=new String(depName.getBytes(),"gbk");
  //2:处理-保存到sys_department表
  //2.1获得连接对象
   Connection conn =getConn();

  //2.2定义含动态参数的SQL语句的字符串变量
  
  String sql="insert into sys_course(courseID,classid,courseName,year,term,hour)values(?,?,?,?,?,?);";
  //2.3创建执行含动态参数的SQL的对象
   PreparedStatement pstmt=conn.prepareStatement(sql);
   
  //2.4 设置SQL中动态参数对应的值，注意索引从1开始
  int index=1;
  pstmt.setString(index++, courseID);
  pstmt.setString(index++, classid);
  pstmt.setString(index++, courseName);
  pstmt.setString(index++, year);
  pstmt.setString(index++, term);
  pstmt.setString(index++, hour);
  //2.5 执行SQL并返回执行结果
  int count=pstmt.executeUpdate();
  //2.6 关闭数据库连接资源
  close(pstmt, conn);
  //3:跳转目标页面
  process(request, response, "course_list.jsp");

%>
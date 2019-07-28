<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加二级学院过程--%>
<%
  //防止中文乱码处理
  request.setCharacterEncoding("utf-8");
  //1:接收参数
    String instID=request.getParameter("instID");
    String instName=request.getParameter("instName");
  String depID=request.getParameter("depID");
  String telephone =request.getParameter("telephone");
  String email =request.getParameter("email");
  //字符串转码depName=new String(depName.getBytes(),"gbk");
  //2:处理-保存到sys_department表
  //2.1获得连接对象
   Connection conn =getConn();

  //2.2定义含动态参数的SQL语句的字符串变量
  
  String sql="insert into sys_instructor(instID,instName,depID,telephone,email)values(?,?,?,?,?);";
  //2.3创建执行含动态参数的SQL的对象
   PreparedStatement pstmt=conn.prepareStatement(sql);
   
  //2.4 设置SQL中动态参数对应的值，注意索引从1开始
  int index=1;
  pstmt.setString(index++, instID);
  pstmt.setString(index++, instName);
  pstmt.setString(index++, depID);
  pstmt.setString(index++, telephone);
  pstmt.setString(index, email);
  
  //2.5 执行SQL并返回执行结果
  int count=pstmt.executeUpdate();
  //2.6 关闭数据库连接资源
  close(pstmt, conn);
  //3:跳转目标页面
  process(request, response, "instructor_list.jsp");

%>
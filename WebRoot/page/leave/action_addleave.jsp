<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat, javax.servlet.http.HttpSession" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加二级学院过程--%>
<%
  //防止中文乱码处理
  request.setCharacterEncoding("utf-8");
  //1:接收参数
    String courseID=request.getParameter("courseID");//
    String reason=request.getParameter("reason");//
  String daynum=request.getParameter("daynum");//
 
  System.out.println(courseID);
   Connection conn =getConn();

  //2.2定义含动态参数的SQL语句的字符串变量
  java.util.Date date = new java.util.Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
  String leaveID = sdf.format(date)+courseID;
 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String applytime= sf.format(date);
  String status = "0"; 
  

  String  stuID =(String)session.getAttribute("userid");
   String audittime=null;
  String opinion="";
  String sql="insert into sys_leave(leaveID,courseID,reason,daynum,stuID,applytime,status,audittime,opinion)values(?,?,?,?,?,?,?,?,?);";
  //2.3创建执行含动态参数的SQL的对象
   PreparedStatement pstmt=conn.prepareStatement(sql);
   
  //2.4 设置SQL中动态参数对应的值，注意索引从1开始
  int index=1;
  pstmt.setString(index++, leaveID);
  pstmt.setString(index++, courseID);
  pstmt.setString(index++, reason);
  pstmt.setString(index++, daynum);
  pstmt.setString(index++, stuID);
  pstmt.setString(index++, applytime);
  pstmt.setString(index++, status);
  pstmt.setString(index++, audittime);
  pstmt.setString(index++, opinion);
  //2.5 执行SQL并返回执行结果
  int count=pstmt.executeUpdate();
  //2.6 关闭数据库连接资源
  close(pstmt, conn);
  //3:跳转目标页面
  process(request, response, "leave_list.jsp");

%>
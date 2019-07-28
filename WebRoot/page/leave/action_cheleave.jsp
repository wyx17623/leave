<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<!-- 使用include标记指令引入数据库连接模块jsp，使用获得连接对象的方法 -->
<%@ include file="/base/database.jsp" %>
<%--删除用户处理过程--%>
<%
 //参数传递方式:表单传值(form)和URL传值(<a href="url?param=xxx&param2=yyyy"></a>)
 //1:接收参数-request
  String leaveID=request.getParameter("leaveID");
  String status=request.getParameter("status");
  //status=new String(status.getBytes("iso-8859-1"),"utf-8");
 
  if(status.equals("同意")){
	  status="1";
  }else if(status.equals("不同意")){
	  status="2";
  }
  StringBuffer sqlBuff=new StringBuffer();
  sqlBuff.append("update sys_leave set status=? where leaveID=?");  
  String sql=sqlBuff.toString();
 //2.1连接数据库对象conn
   Connection conn=getConn();
 //2.2由给定的连接对象conn创建执带行动态参数的SQL语句的PrepareStatement对象pstmt
   PreparedStatement pstmt=conn.prepareStatement(sql);
 //2.3设定动态参数对应的值
  int parameterIndex=1;
  pstmt.setString(parameterIndex++, status);
  pstmt.setString(parameterIndex, leaveID);
  
 //2.4pstmt执行SQL语句并返回执行结果
   int c=pstmt.executeUpdate();
 //2.5 关闭数据库资源，非销毁对象,注意关闭顺序ResultSet<Statement<Connection
   close(pstmt, conn);
 //3:跳转页面-重定向或者转发
  process(request, response, "/page/leave/leave_check.jsp");

%>
<%=status%>
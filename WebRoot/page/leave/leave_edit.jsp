<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% 
   //接收参数
   request.setCharacterEncoding("utf-8");
    String leaveID=request.getParameter("leaveID");
  
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_leave where leaveID=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, leaveID);
   ResultSet rs=pstmt.executeQuery();
   String rs_leaveID ="";
   String rs_courseID ="";
   String rs_reason ="";
   String rs_daynum ="";
   if(rs.next()){
	       rs_leaveID =rs.getString("leaveID");
           rs_courseID  =rs.getString("courseID");
	       rs_reason =rs.getString("reason");
	       rs_daynum =rs.getString("daynum");
	      
   }
   //使用表达式显示
   //跳转，无
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
   <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>请假单列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

  </head>

<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改请假单信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/leave/action_editleave.jsp">  
      <div class="form-group">
        <div class="label">
          <label>请假单编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  readonly="readonly" value="<%=rs_leaveID %>"name="leaveID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>请假课程：</label>
        </div>
         <select name="courseID" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
        <%
        String userid =(String) session.getAttribute("userid");
        StringBuffer sqlBuff = new StringBuffer();
        sqlBuff.append("select courseID,courseName from sys_course, sys_student where sys_course.classid=sys_student.classid and sys_student.stuID=?");
        String sql1 = sqlBuff.toString();
        Connection conn1 = getConn();
         PreparedStatement pstmt1=conn1.prepareStatement(sql1);
         int parameterIndex=1;
         
         pstmt1.setString(parameterIndex, userid);
         ResultSet rs1 = pstmt1.executeQuery();
      
       while(rs1.next()){
    	   String courseID = rs1.getString("courseID");
    	   String courseName = rs1.getString("courseName");
        %>       
            <option value="<%=courseID%>"><%=courseName %></option>
      <%} %>
      </select></div>
       <div class="form-group">
        <div class="label">
          <label>请假原因：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_reason %>" name="reason" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>请假天数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_daynum %>" name="daynum" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">修改</button>
        </div>
      </div>
    </form>
  </div>
</div>
   
</body>
</html>

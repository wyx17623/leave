<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>填写请假单</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>
<%
String userid =(String)session.getAttribute("userid");
StringBuffer sqlBuff = new StringBuffer();

sqlBuff.append("select courseID,courseName from sys_course, sys_student where sys_course.classid=sys_student.classid and sys_student.stuID=?");


String sql = sqlBuff.toString();
Connection conn = getConn();
PreparedStatement pstmt = conn.prepareStatement(sql);
int parameterIndex=1;
  
   pstmt.setString(parameterIndex, userid);
ResultSet rs = pstmt.executeQuery();

   %>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>填写请假单</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/leave/action_addleave.jsp">  
      <div class="form-group">
        <div class="label">
          <label>请假课程号：</label>
        </div>
         <select name="courseID" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
        <%
   
       while(rs.next()){
    	   String courseID = rs.getString("courseID");
    	   String courseName = rs.getString("courseName");
        %>       
            <option value="<%=courseID%>"><%=courseName %></option>
      <%} %>
      </select></div>
       <div class="form-group">
        <div class="label">
          <label>请假事由：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="reason" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>请假天数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="daynum" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div> 
      </div>
    </form>
  </div>
</div>

</body>
</html>

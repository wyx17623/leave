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
<title>增加课程</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>


</head>

<body>
<%
String userid =(String)session.getAttribute("userid");
StringBuffer sqlBuff = new StringBuffer();

sqlBuff.append("select classid ,className from sys_classes, sys_instructor,sys_department where sys_classes.depID=sys_department.depID and sys_instructor.depID=sys_department.depID and sys_instructor.instID=?");


String sql = sqlBuff.toString();
Connection conn = getConn();
PreparedStatement pstmt = conn.prepareStatement(sql);
int parameterIndex=1;
  
   pstmt.setString(parameterIndex, userid);
ResultSet rs = pstmt.executeQuery();

   %>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加课程</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/course/action_addcourse.jsp">  
      <div class="form-group">
        <div class="label">
          <label>课程编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="courseID"   />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>班级编号：</label>
        </div>
         <select name="classid" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
        <%
      
       while(rs.next()){
    	   String classid = rs.getString("classid");
    	   String className = rs.getString("className");
        %>       
            <option value="<%=classid%>"><%=className %></option>
      <%} %>
      </select></div>
        <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="courseName" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>年份：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="year" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学期：</label>
        </div>
         <select name="term" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
            <option value="1">第一学期</option>
            <option value="2">第二学期</option>
      </select></div>
      <div class="form-group">
        <div class="label">
          <label>学时：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="hour" data-validate="required:数据必填项" />
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

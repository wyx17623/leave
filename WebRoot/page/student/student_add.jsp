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
<title>学生列表</title>
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

sqlBuff.append("select classid from sys_classes, sys_instructor,sys_department where sys_classes.depID=sys_department.depID and sys_instructor.depID=sys_department.depID and sys_instructor.instID=?");


String sql = sqlBuff.toString();
Connection conn = getConn();
PreparedStatement pstmt = conn.prepareStatement(sql);
int parameterIndex=1;
  
   pstmt.setString(parameterIndex, userid);
ResultSet rs = pstmt.executeQuery();

   %>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加学生</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/student/action_addstudent.jsp">  
      <div class="form-group">
        <div class="label">
          <label>学生编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuID"   />
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
        int i=1;
       while(rs.next()){
    	   String classid = rs.getString("classid");
        %>       
            <option value="<%=classid%>"><%=classid %></option>
      <%} %>
      </select></div>
        <div class="form-group">
        <div class="label">
          <label>学生名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuName" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
    <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
         <select name="sex" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
           
            <option value="男">男</option>
            <option value="女">女</option>
      </select></div>
     <div class="form-group">
        <div class="label">
          <label>家庭住址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="address" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuTel" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="contact" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>联系人电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="contactTel" data-validate="required:数据必填项" />
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

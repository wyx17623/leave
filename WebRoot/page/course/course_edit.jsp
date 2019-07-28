 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% 
   //接收参数
   request.setCharacterEncoding("utf-8");
    String courseID=request.getParameter("courseID");
  
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_course where courseID=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, courseID);
   ResultSet rs=pstmt.executeQuery();
   String rs_courseID ="";
   String rs_classid ="";
   String rs_courseName ="";  
   String rs_year ="";
   String rs_term ="";
   String rs_hour ="";
   if(rs.next()){
	       rs_courseID =rs.getString("courseID");
           rs_classid  =rs.getString("classid");
	       rs_courseName =rs.getString("courseName");
	       rs_year =rs.getString("year");
	       rs_term =rs.getString("term");
	       rs_hour =rs.getString("hour");
   }
  
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
<title>修改课程信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

  </head>

<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改课程信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/course/action_editcourse.jsp">  
      <div class="form-group">
        <div class="label">
          <label>课程编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  readonly="readonly" value="<%=rs_courseID %>"name="courseID" data-validate="required:" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属班级：</label>
        </div>
         <select name="classid" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
        <%
        Connection conn1 = getConn();
        String sql1="select classid ,className from sys_classes";
         PreparedStatement pstmt1=conn1.prepareStatement(sql1);
         ResultSet rs1 = pstmt1.executeQuery();
        
       
      
       while(rs1.next()){
    	   String classid = rs1.getString("classid");
    	   String className = rs1.getString("className");
        %>       
            <option value="<%=classid%>"><%=className %></option>
      <%} %>
      </select></div>
       <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_courseName %>" name="courseName" data-validate="required:请输入课程名称" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>年份：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_year %>" name="year" data-validate="required:请输入年份" />
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
          <input type="text" class="input w50" value="<%=rs_hour %>" name="hour" data-validate="required:请输入学时数" />
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

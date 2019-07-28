<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
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
<title>增加辅导员</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>


  </head>
  
  <body>
  <%
  Connection conn = getConn();
  String sql="select depID from sys_department";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
  
  %>
   <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加辅导员</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/instructor/action_addinstructor.jsp">  
      <div class="form-group">
        <div class="label">
          <label>辅导员编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="instID" data-validate="required:请输入辅导员编号" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>辅导员姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="instName" data-validate="required:请输入辅导员名称" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>二级学院编号：</label>
        </div>
         <select name="depID" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
        <%
  
       while(rs.next()){
    	   String rs_depID = rs.getString("depID");
        %>       
            <option value="<%=rs_depID%>"><%=rs_depID %></option>
      <%} %>
      </select></div>
       <div class="tips"></div>
       <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="telephone" data-validate="required:请输入辅导员联系电话" />
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>email：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="email" data-validate="required:请输入辅导员email" />
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
    </form>
  </div>
</div>
   
  </body>
</html>

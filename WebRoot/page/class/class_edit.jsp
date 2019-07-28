<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% 
   //接收参数
   request.setCharacterEncoding("utf-8");
    String classid=request.getParameter("classid");
  
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_classes where classid=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, classid);
   ResultSet rs=pstmt.executeQuery();
   String rs_classid ="";
   String rs_className ="";
   String rs_depID ="";
   String rs_major ="";
   String rs_grade ="";
   if(rs.next()){
	       rs_classid =rs.getString("classid");
           rs_className  =rs.getString("className");
	       rs_depID =rs.getString("depID");
	       rs_major =rs.getString("major");
	       rs_grade =rs.getString("grade");
	   
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
<title>修改班级信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

  </head>

<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改班级信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/class/action_editclass.jsp">  
      <div class="form-group">
        <div class="label">
          <label>班级编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"   value="<%=rs_classid %>"name="classid" data-validate="required:" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>班级名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_className %>" name="className" data-validate="required:请输入辅导员姓名" />
          <div class="tips"></div>
        </div>
      </div>
         <div class="form-group">
        <div class="label">
          <label>所属学院：</label>
        </div>
         <select name="depID" class="input w50" onchange="changesearch()" style="width:180px; line-height:17px; display:inline-block">
             <option value="">选择</option>
        <%
        Connection conn1 = getConn();
        String sql1="select depID ,depName from sys_department";
         PreparedStatement pstmt1=conn1.prepareStatement(sql1);
         ResultSet rs1 = pstmt1.executeQuery();
        
       
      
       while(rs1.next()){
    	   String depID = rs1.getString("depID");
    	   String depName = rs1.getString("depName");
        %>       
            <option value="<%=depID%>"><%=depName %></option>
      <%} %>
      </select></div>
       <div class="form-group">
        <div class="label">
          <label>所属专业：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_major %>" name="major" data-validate="required:请输入联系方式" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>所属年级：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_grade %>" name="grade" data-validate="required:请输入联系方式" />
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

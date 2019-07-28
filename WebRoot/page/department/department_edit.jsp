<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% 
   //接收参数
   request.setCharacterEncoding("utf-8");
    String depID=request.getParameter("depID");
  
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_department where depID=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, depID);
   ResultSet rs=pstmt.executeQuery();
   String rs_depID ="";
   String rs_depName ="";
   
   if(rs.next()){
	       rs_depID =rs.getString("depID");
	       rs_depName  =rs.getString("depName");
	      
	   
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
<title>修改二级学院信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

  </head>

<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改二级学院</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/department/action_editdepartment.jsp">  
      <div class="form-group">
        <div class="label">
          <label>二级学院编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"   value="<%=rs_depID %>"name="depID" data-validate="required:请输入二级学院编号" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>二级学院名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_depName %>" name="depName" data-validate="required:请输入二级学院名称" />
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

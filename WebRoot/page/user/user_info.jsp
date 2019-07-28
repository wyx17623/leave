<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% 
   //接收参数
    String userid=request.getParameter("userid");
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_user where userid=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, userid);
   ResultSet rs=pstmt.executeQuery();
   String rs_userid ="";
   String rs_fullname  ="";
   String rs_password  ="";
   String rs_telephone  ="";

   if(rs.next()){
	       rs_userid =rs.getString("userid");
	       rs_fullname  =rs.getString("fullname");
	       rs_password  =rs.getString("password");
	       rs_telephone    =rs.getString("telephone");
	   
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
<title>个人信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>编辑个人信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/user/action_infoUser.jsp" target="_parent">  
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" readonly="readonly" value="<%=rs_userid %>" name="userid" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" value="<%=rs_password %>" name="password" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_fullname %>" name="fullname" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
   
 	<div class="form-group">
        <div class="label">
          <label>手机号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_telephone %>" name="telephone" data-validate="required:数据必填项" />
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

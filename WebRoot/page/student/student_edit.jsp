<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% /**
   *
   */
   //接收参数
   request.setCharacterEncoding("utf-8");
//接受教师界面get传递的参数，
    String stuID=request.getParameter("stuID");
   String sign = "";
    //界面被学生、教师两类用户使用此处判断使用者，如果是学生参数为null则为学生用户
  if(stuID==null){
	  //从学生页面取值 
	  stuID=request.getParameter("userid");
	  sign ="readonly=&#34;readonly&#34;";//&#34; 转义字符相当于 "
  }
    
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_student where stuID=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, stuID);
   ResultSet rs=pstmt.executeQuery();
   String rs_stuID ="";
   String rs_classid ="";
   String rs_stuName ="";
   String rs_sex ="";
   String rs_address ="";
   String rs_stuTel ="";
   String rs_contact ="";
   String rs_contactTel ="";
   if(rs.next()){
	       rs_stuID =rs.getString("stuID");
           rs_classid  =rs.getString("classid");
	       rs_stuName =rs.getString("stuName");
	       rs_sex =rs.getString("sex");
	       rs_address =rs.getString("address");
	       rs_stuTel =rs.getString("stuTel");
	       rs_contact =rs.getString("contact");
	       rs_contactTel =rs.getString("contactTel");
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
<title>修改学生信息</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

  </head>

<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改学生信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/student/action_editstudent.jsp">  
      <div class="form-group">
        <div class="label">
          <label>学生编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  <%=sign %> value="<%=rs_stuID %>"name="stuID" data-validate="required:" />
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
          <label>学生姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_stuName %>" name="stuName" data-validate="required:请输入学生姓名" />
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
          <input type="text" class="input w50" value="<%=rs_address %>" name="address" data-validate="required:请输入家庭住址" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_stuTel %>" name="stuTel" data-validate="required:请输入联系电话" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_contact %>" name="contact" data-validate="required:请输入联系人" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>联系人电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_contactTel %>" name="contactTel" data-validate="required:请输入联系人电话" />
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

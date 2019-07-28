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
<title>增加班级</title>
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
    close(rs,pstmt,conn);
   %>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加班级</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/class/action_addclass.jsp">  
      <div class="form-group">
        <div class="label">
          <label>班级编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="classid"   />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>班级名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="className" data-validate="required:数据必填项" />
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
          <input type="text" class="input w50" value="" name="major" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>所属年级：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="grade" data-validate="required:数据必填项" />
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

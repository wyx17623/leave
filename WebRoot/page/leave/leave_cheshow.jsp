<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<% 
   //接收参数
   request.setCharacterEncoding("utf-8");
    String leaveID=request.getParameter("leaveID");
  
   //根据参数读取数据库响应记录
   Connection conn=getConn();
   String sql="select * from sys_leave where leaveID=?";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, leaveID);
   ResultSet rs=pstmt.executeQuery();
   String rs_leaveID ="";
   String rs_courseID ="";
   String rs_reason ="";
   String rs_daynum ="";
   if(rs.next()){
	       rs_leaveID =rs.getString("leaveID");
           rs_courseID  =rs.getString("courseID");
	       rs_reason =rs.getString("reason");
	       rs_daynum =rs.getString("daynum");
	      
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
<title>请假单信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

  </head>

<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>审核请假信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/leave/action_editcheshowleave.jsp?leaveID=<%=rs_leaveID%>">  
    
       <div class="form-group">
        <div class="label">
          <label>请假单号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=rs_leaveID %>" name="leaveID" readonly="readonly"   />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>课程编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" readonly="readonly" value="<%=rs_courseID %>" name="courseID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>请假原因：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" readonly="readonly" value="<%=rs_reason %>" name="reason" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>请假天数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" readonly="readonly" value="<%=rs_daynum %>" name="daynum" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>审核意见：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="opinion" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
          <div class="label">
            <label>审核状态：</label>
          </div>
          <div class="field" style="padding-top:8px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            同意   <input id="status"  type="radio" name="status" checked="checked" value="1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            不同意  <input id="status"  type="radio" name="status" value="2"/> 
         
          </div>
        </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
   
</body>
</html>

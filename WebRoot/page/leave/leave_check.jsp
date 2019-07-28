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
<title>请假单信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>


</head>

<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 请假单信息列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
       <li> <a class="button border-main icon-plus-square-o" href="page/leave/leave_check.jsp?sign1=1"> 已审核</a> </li> 
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>请假编号</th>
				<th>请假课程</th>
				<th>请假原因</th>
				<th>请假天数</th>
				<th>请假时间</th>
				<th>审核状态</th>
				<th>审核时间</th>
				<th>审核意见</th>
				<th>操作</th>
      </tr>
    
				
				
			
			<%  
			
			    //接收参数
			
				   String sign1=request.getParameter("sign1");
			    if(sign1==null){
			    sign1 = "";
			    }
				StringBuffer sqlBuff = new StringBuffer();
			    if(sign1.equals("1")){
			    	sqlBuff.append("select leaveID,courseName,reason,daynum,applytime,status,audittime,opinion from sys_leave,sys_course where sys_leave.courseID=sys_course.courseID and status='1' OR status='2'");
			    	
			    }else{
				sqlBuff.append("select leaveID,courseName,reason,daynum,applytime,status,audittime,opinion from sys_leave,sys_course where sys_leave.courseID=sys_course.courseID and status='0'");
				
			    }
				String sql = sqlBuff.toString();
				//2:查询数据库记录
				//2.1 加载驱动
				Connection conn = getConn();
				//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
				PreparedStatement pstmt = conn.prepareStatement(sql);

				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				ResultSet rs = pstmt.executeQuery();
				//定义int序号变量
				int index = 1;
				String sign;
				String signf;
				String handleupd;
				String handledel;
				while (rs.next()) {
				String leaveID=rs.getString("leaveID");
				 String courseName=rs.getString("courseName");
				String reason=rs.getString("reason");
				String daynum=rs.getString("daynum");
				String applytime=rs.getString("applytime");
				String status=rs.getString("status");
				String audittime=rs.getString("audittime");
				String opinion=rs.getString("opinion");
				if(status.equals("0")){
					status="未审核";
					audittime="";
					opinion="";
					sign="return true";
					signf="return true";
					handleupd="修改";
					handledel="撤销";
				}else if(status.equals("1")){
					status="同意";
					sign="return false";
					signf="return false";
					handleupd="不可修改";
					handledel="不可撤销";
				}else{
					status="不同意";
					sign="return true";
				    signf="return false";
					handleupd="修改";
					handledel="不可撤销";
				}
			%>
		

			<tr>
				 <td><%=index++ %></td>
				 <td><%=leaveID %></td>
				<td><%=courseName %></td>
				<td><%=reason %></td>
				<td><%=daynum %></td>
				<td><%=applytime %></td>
				<td><%=status %></td>
				<td><%=audittime %></td>
				<td><%=opinion %></td>
				<td>
				<div class="button-group">
				 <a class="button border-main" href="<%=path%>/page/leave/leave_cheshow.jsp?leaveID=<%=leaveID %>"  ><span class="icon-edit" ></span> 审核</a></div>
				</td>
			</tr>
			<%
				}
			%>
    </table>
  </div>
  <div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div>
</form>
</body>
</html>

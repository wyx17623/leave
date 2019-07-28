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
<title>请假信息统计</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>


</head>

<body>
<form method="post" action="page/leave/leave_statistics.jsp" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 请假信息统计列表</strong> </div>
    <div class="padding border-bottom">
        <ul class="search" style="padding-left:10px;">
       <li> <a class="button border-main icon-plus-square-o" href="'/WebTest/ExportExcel'"> 导出请假单</a> </li>
       
        <li>搜索：</li>
        <li>
        <input type="text" placeholder="请输入班级编号" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="submit" class="button border-main icon-search" onclick="changesearch()" value="搜索" > </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>请假编号</th>
				<th>班级编号</th>
				<th>班级名称</th>
				<th>学生姓名</th>
				<th>请假原因</th>
				<th>请假天数</th>
				<th>请假时间</th>
				<th>审核状态</th>
				<th>审核时间</th>
				<th>审核意见</th>
				
      </tr>
    
				
				
			
			<%  
			
			    //接收参数
			      request.setCharacterEncoding("utf-8");
			     String keyword="";
			     keyword=request.getParameter("keywords");
				StringBuffer sqlBuff = new StringBuffer();
				if(keyword!=null){
					
					sqlBuff.append("select DISTINCT a.leaveID,c.classid,c.className,b.stuName,reason,daynum,applytime,status,audittime,opinion from sys_leave a ,sys_student b ,sys_classes c ,sys_course d where a.stuID=b.stuID and c.classid=b.classid and b.classid=d.classid and c.classid=?");
				}else{
					sqlBuff.append("select DISTINCT a.leaveID,c.classid,c.className,b.stuName,reason,daynum,applytime,status,audittime,opinion from sys_leave a ,sys_student b ,sys_classes c ,sys_course d where a.stuID=b.stuID and c.classid=b.classid and b.classid=d.classid ");
				}
				String sql = sqlBuff.toString();
				//2:查询数据库记录
				//2.1 加载驱动
				Connection conn = getConn();
				//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
				PreparedStatement pstmt = conn.prepareStatement(sql);
				if(keyword!=null){
					
					
					  pstmt.setString(1, keyword);
					 
				}
				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				ResultSet rs = pstmt.executeQuery();
				//定义int序号变量
				int index = 1;
				String sign;
				String handleupd;
				String handledel;
				while (rs.next()) {
				String leaveID=rs.getString("leaveID");
				 String classid=rs.getString("classid");
				 String className=rs.getString("className");
				 String stuName=rs.getString("stuName");
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
					//sign="return true";
					//handleupd="同意";
					//handledel="不同意";
				}else if(status.equals("1")){
					status="同意";
					//sign="return false";
					//handleupd="不同意";
					//handledel="不可删除";
				}else{
					status="不同意";
					//sign="return false";
					//handleupd="同意";
				//	handledel="不可删除";
				}
			%>

			<tr>
				 <td><%=index++ %></td>
				 <td><%=leaveID %></td>
				<td><%=classid %></td>
				<td><%=className %></td>
				<td><%=stuName %></td>
				<td><%=reason %></td>
				<td><%=daynum %></td>
				<td><%=applytime %></td>
				<td><%=status %></td>
				<td><%=audittime %></td>
				<td><%=opinion %></td>
				<td>
				
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

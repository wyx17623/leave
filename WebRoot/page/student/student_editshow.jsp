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
<title>学生信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 学生列表</strong> </div>
    <div class="padding border-bottom">
      
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>学生编号</th>
				<th>班级编号</th>
				<th>学生名称</th>
				<th>性别</th>
				<th>家庭住址</th>
				<th>联系电话</th>
				<th>联系人</th>
				<th>联系人电话</th>
				
      </tr>
    
				
				
			
			<%  //设置编码方式
			    request.setCharacterEncoding("utf-8");
			
			
			
			String userid = (String) session.getAttribute("userid");
			
				StringBuffer sqlBuff = new StringBuffer();
			
					sqlBuff.append("select * from sys_student where stuID=?");
					
	
				
				String sql = sqlBuff.toString();
				//2:查询数据库记录
				//2.1 加载驱动
				Connection conn = getConn();
				//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
				PreparedStatement pstmt = conn.prepareStatement(sql);
		
					
					  pstmt.setString(1, userid);
					 
				
				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				ResultSet rs = pstmt.executeQuery();
				//定义int序号变量
				int index = 1;
				while (rs.next()) {
				String stuID=rs.getString("stuID");
				 String classid=rs.getString("classid");
				String stuName=rs.getString("stuName");
				String sex=rs.getString("sex");
				String address=rs.getString("address");
				String stuTel=rs.getString("stuTel");
				String contact=rs.getString("contact");
				String contactTel=rs.getString("contactTel");
			%>

			<tr>
				 <td><%=index++ %></td>
				 <td><%=stuID %></td>
				<td><%=classid %></td>
				<td><%=stuName %></td>
				<td><%=sex %></td>
				<td><%=address %></td>
				<td><%=stuTel %></td>
				<td><%=contact %></td>
				<td><%=contactTel %></td>
				
			</tr>
			<%
				}
			%>
    </table>
  </div>

</form>
</body>
</html>

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
<title>辅导员信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 班级列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
       <li> <a class="button border-main icon-plus-square-o" href="page/class/class_add.jsp"> 添加班级</a> </li>
        <li>搜索：</li>
        <li>
           <input type="text" placeholder="请输入搜索班级名称关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="submit" class="button border-main icon-search" onclick="changesearch()" value="搜索" > </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>班级编号</th>
				<th>班级名称</th>
				<th>所属学院</th>
				<th>所属专业</th>
				<th>所属年级</th>
				<th>操作</th>
      </tr>
    
				
				
			
			<%  //设置编码方式
			    request.setCharacterEncoding("utf-8");
			    //接收参数
			    String keyword="";
			      keyword=request.getParameter("keywords");
			
				StringBuffer sqlBuff = new StringBuffer();
				
				if(keyword!=null){
					sqlBuff.append("select classid,className,sys_classes.depID,depName,major,grade from sys_classes ,sys_department where sys_department.depID=sys_classes.depID and  className like ?");
					
				}else{
					sqlBuff.append("select classid,className,sys_classes.depID,depName,major,grade from sys_classes ,sys_department where sys_department.depID=sys_classes.depID ");
					
				}
				String sql = sqlBuff.toString();
				//2:查询数据库记录
				//2.1 加载驱动
				Connection conn = getConn();
				//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
				PreparedStatement pstmt = conn.prepareStatement(sql);
				if(keyword!=null){
					
					
					  pstmt.setString(1, "%"+keyword+"%");
					 
				}
				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				ResultSet rs = pstmt.executeQuery();
				//定义int序号变量
				int index = 1;
				while (rs.next()) {
				String classid=rs.getString("classid");
				 String className=rs.getString("className");
				String depID=rs.getString("depID");
				String depName = rs.getString("depName");
				String major=rs.getString("major");
				String grade=rs.getString("grade");
			%>

			<tr>
				 <td><%=index++ %></td>
				<td><%=classid %></td>
				<td><%=className %></td>
				<td><%=depName %></td>
				<td><%=major %></td>
				<td><%=grade %></td>
				<td>
				<div class="button-group">
				 <a class="button border-main" href="<%=path%>/page/class/class_edit.jsp?classid=<%=classid%>"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="<%=path%>/page/class/action_delclass.jsp?classid=<%=classid%>" ><span class="icon-trash-o"></span> 删除</a>  </div>
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

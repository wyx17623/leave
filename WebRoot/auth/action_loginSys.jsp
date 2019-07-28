<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp"%>
<%
 //1:接收参数
 String userid = request.getParameter("userid");
 String password =request.getParameter("password");
 String type =request.getParameter("type");
 //2:处理-Java程序段
 boolean flag=false;
 Connection conn=null;
 PreparedStatement pstmt=null;
 ResultSet rs =null;
 
 try{
 //2:身份认证
  	conn=getConn();
  	String sql="select * from sys_user where userid=? and password=? and type=?";
  	pstmt=conn.prepareStatement(sql);
 //设置动态参数对应的值
  	int index=1;
  	pstmt.setString(index++, userid);
  	pstmt.setString(index++, password);
  	pstmt.setString(index++, type);
 //执行查询
  	rs=pstmt.executeQuery();
  	flag=rs.next();
   }catch(SQLException e){
     e.printStackTrace();
   }finally{
     close(rs, pstmt, conn);
   }
 //3:跳转目标页面
  if(flag){
	//将用户编号绑定到session对象，方便功能菜单取值
	
	session.setAttribute("userid", userid);
	if(type.equals("0")){
		 process(request, response, "/user_index.jsp");
	}
	else if(type.equals("1")){
    process(request, response, "/stu_index.jsp");
	}
	else if(type.equals("2")){
	    process(request, response, "/inst_index.jsp");
		}
  }else{
    process(request, response, "/login.jsp");
  }
 

%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加用户过程--%>

<%
   //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
  //1:接收参数
   String  instID=request.getParameter("instID");
      String instName  =request.getParameter("instName");
      String  depID=request.getParameter("depID");
      String telephone  =request.getParameter("telephone");
      String email  =request.getParameter("email");
    
  //构造插入SQL
   StringBuffer sqlBuff=new StringBuffer();
   sqlBuff.append("update sys_instructor set instName=?,depID=?,telephone=? ,email=? where instID=?");   

   String sql=sqlBuff.toString();
  //2:保存到数据库
  //2.2:获得Connection 类型的连接对象conn
   Connection conn=getConn();
  //2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
    PreparedStatement pstmt=conn.prepareStatement(sql);
    //依次设置动态参数对应的值
       int parameterIndex=1;
      
       pstmt.setString(parameterIndex++, instName);
       pstmt.setString(parameterIndex++, depID);
       pstmt.setString(parameterIndex++, telephone);
       pstmt.setString(parameterIndex++, email);
       pstmt.setString(parameterIndex++, instID);
           
  //2.4:PrepareStatement类型的对象pstmt执行SQL语句并返回结果
       int c=pstmt.executeUpdate();
  //2.5:关闭数据资源,注意关闭的顺序pstmt<conn
       if(pstmt!=null){
         pstmt.close();
        }
       if(conn!=null){
         conn.close();
        }
  //3:跳转到用户列表页面(user_list.jsp)
	process(request, response, "/page/instructor/instructor_list.jsp");

%>
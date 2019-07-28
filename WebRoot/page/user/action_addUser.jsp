
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加用户过程--%>
<%
   //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
  //1:接收参数
      String userid =request.getParameter("userid");
      String pwd  =request.getParameter("pwd");
      String utype  =request.getParameter("utype");
      String sex    =request.getParameter("sex");
      String birthday =request.getParameter("birthday");
      String[] xqs     =request.getParameterValues("xq");
      String email  =request.getParameter("email");
      String remark =request.getParameter("remark");
      String fullname=request.getParameter("fullname");
      System.out.println("自我介绍:"+remark);
      System.out.println("提交方式:"+request.getMethod());
      System.out.println("编码方式:"+request.getCharacterEncoding());
      String xq="";
      if(xqs!=null){
         int i=0;
         for(String s:xqs){
             if(i==0){
               xq=s;
              }else{
               xq+="-"+s;
              }
            i++;
          }
       }
  //构造插入SQL
   StringBuffer sqlBuff=new StringBuffer();
   sqlBuff.append("insert into t_user(userid,pwd,utype,sex,birthday,xq,email,remark,fullname)");   
   sqlBuff.append("values(?,?,?,?,?,?,?,?,?)");
   String sql=sqlBuff.toString();
  //2:保存到数据库
  //2.1 加载驱动
   String db_url="jdbc:mysql://127.0.0.1:3306/userdb";
   String db_user="root";
   String db_pwd="root";
   Class.forName("com.mysql.jdbc.Driver");
  //2.2:DriverManager获得Connection 类型的连接对象conn
   Connection conn=DriverManager.getConnection(db_url, db_user, db_pwd);
  //2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
    PreparedStatement pstmt=conn.prepareStatement(sql);
    //依次设置动态参数对应的值
    int parameterIndex=1;
    pstmt.setString(parameterIndex++, userid);
       pstmt.setString(parameterIndex++, pwd);
       pstmt.setString(parameterIndex++, utype);
       pstmt.setString(parameterIndex++, sex);
       pstmt.setString(parameterIndex++, birthday);
       pstmt.setString(parameterIndex++, xq);
       pstmt.setString(parameterIndex++, email);
       pstmt.setString(parameterIndex++, remark);
       pstmt.setString(parameterIndex++, fullname);
       
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
	process(request, response, "/page/user/user_list.jsp");

%>
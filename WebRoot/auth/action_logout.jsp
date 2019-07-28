<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%--退出系统处理过程--%>
<%
 //1:接收参数，无
 //2:处理过程
 //2.1注销当前用户绑定session对象
   session.invalidate();
 //3:跳转至目标页面(login.jsp)
   response.sendRedirect(path+"/login.jsp");
%>
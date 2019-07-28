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
<title>用户信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加用户</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/user/action_addUser.jsp">  
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="userid"   />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="pwd" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="fullname" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
    
  
        <div class="form-group">
          <div class="label">
            <label>用户类型：</label>
          </div>
          <div class="field">
            <select name="utype" class="input w50">
              <option value="1">管理员</option>
              <option value="0">普通用户</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>用户类型：</label>
          </div>
          <div class="field">
           
        
        <label for="sex_f">女</label>
				<input type="radio" name="sex" id="sex_f" value="1" checked="checked"/>
				<label for="sex_m">男</label>
				<input type="radio" name="sex" id="sex_m" value="0"/>
            <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
        <div class="label">
          <label>出生年月：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="birthday" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>兴趣爱好：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
           阅读 <input id="xq_A"  type="checkbox" name="xq" value="A" checked="checked"/>
          音乐 <input id="xq_B"  type="checkbox" name="xq" value="B" checked="checked"/>
           运动 <input id="xq_C"  type="checkbox" name="xq" value="C" checked="checked"/> 
         
          </div>
        </div>
 <div class="form-group">
        <div class="label">
          <label>电子邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="amu_1115@126.com" name="email" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>自我介绍：</label>
        </div>
        <div class="field">
          <textarea class="input" name="remark" style=" height:90px;"></textarea>
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
    </form>
  </div>
</div>

</body>
</html>

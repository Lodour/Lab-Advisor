<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/28
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<s:form action="registerAction" method="POST" namespace="/user">
    <s:textfield name="model.username" label="用户名"/>
    <s:password name="model.password" label="密码"/>
    <s:textfield name="model.realName" label="真实姓名"/>
    <s:radio label="性别" name="model.gender" list="{0, 1, 2}"/>
    <s:submit value="注册"/>
</s:form>
</body>
</html>

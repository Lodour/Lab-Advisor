<%--
  Created by IntelliJ IDEA.
  User: xyfra
  Date: 2017/5/30
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="jap" uri="/struts-tags" %>
<jsp:useBean id="project" scope="page" class="org.gitshu.entity.ProjectEntity"></jsp:useBean>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <title>Project Settings</title>
</head>
<body>
<jap:include value="/components/banner.jsp"/>
<jap:include value="/components/user_menu_left.jsp"/>

<form action="<s:url namespace="/project" action="projectUpdate">" method="post">
    <div class="form-group">
        <span class="glyphicon glyphicon-title" aria-hidden="true"></span>
        <label>Title</label>
        <label class="form-control" id="perinfo_title">${project.title}</label>
    </div>
    <div class="form-group">
        <span class="glyphicon glyphicon-info" aria-hidden="true"></span>
        <label>Description</label>
        <label class="form-control" id="perinfo_info">${project.info}</label>
    </div>
    <button type="submit" class="btn btn-info">Update</button>

</form>

</body>
</html>

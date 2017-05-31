<%--
  Created by IntelliJ IDEA.
  User: xyfra
  Date: 2017/5/30
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="jap" uri="/struts-tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>GitSHU 用户注册</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script stc="js/npm.js"></script>

    <!--表单验证-->
    <link href="${pageContext.request.contextPath}/static/css/validationEngine.jquery.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validationEngine-zh_CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validationEngine.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>GitSHU 新增项目</title>
</head>
<body>
<jap:include value="/components/banner.jsp"/>
<jap:include value="/components/project_menu_left.jsp"/>
<div style="position: absolute;left: 35%;top: 15%;width: 53%;">
    <h1>创建项目</h1>
    <small>A repository contains all the files for your project, including the revision history.</small>

    <h3>
        <small>———————————————————————————————————————————</small>
    </h3>
    <form id="changepwd_form" action="<s:url namespace="/project" action="projectCreate"/>" method="post">
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>Repository name</label>
            <input type="text" class="form-control validate[required]" id="title" name="title"
                   placeholder=""/>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>Description(optional)</label>
            <textarea class="form-control" rows="3" id="info" name="info"
                      placeholder=""></textarea>
        </div>
        <button id="changepwd_submit" type="submit" class="btn btn-info">Create</button>
    </form>
</div>

</body>
</html>

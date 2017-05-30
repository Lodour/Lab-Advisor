<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="java.io.File" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="jap" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/30
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/npm.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>GitSHU Banner</title>
</head>

<s:action namespace="/repository" name="view"/>
<link href="http://cdn.bootcss.com/highlight.js/8.0/styles/default.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>


<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">${username}</h3>
    </div>
    <div class="panel-body">
        Panel content
    </div>
</div>

<%
    String pid = request.getParameter("pid");
    String pth = request.getParameter("pth");
    File[] files = (File[]) request.getAttribute("files");
    if (files == null) {
        out.println("Invalid path.");
        return;
    }
    if (files.length == 2 && files[0] == null) {
        // echo file
        File file = files[1];
        String content = FileUtils.readFileToString(file);
        out.println("<pre>Filename: " + StringEscapeUtils.escapeHtml4(file.getName()) + "</pre>");
        out.println("<pre><code>" + StringEscapeUtils.escapeHtml4(content) + "</code></pre>");
    } else {
        // echo dir
        for (File file : files) {
            String target = "/repository/view.jsp?pid=" + pid + "&pth=" + pth + file.getName();
            out.println("<a href='" + target + "'>" + file.getName() + "</a><br>");
        }
    }
%>
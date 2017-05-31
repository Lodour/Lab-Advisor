<%@ page import="org.apache.commons.io.FileUtils" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%--<%@ page import="org.markdown4j.Markdown4jProcessor" %>--%>
<%@ page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="jap" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/30
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GitSHU 代码仓库</title>
</head>
<body>
<jap:include value="/components/banner.jsp"/>
<s:action namespace="/repository" name="view"/>
<jsp:useBean id="project" scope="request" type="org.gitshu.entity.ProjectEntity"/>
<link href="${pageContext.request.contextPath}/static/css/default.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/highlight.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<%
    String pid = request.getParameter("pid");
    String pth = request.getParameter("pth");
    File[] files = (File[]) request.getAttribute("files");
    if (files == null) {
        out.println("<script>alert('Invalid path.');window.location.href='/index.jsp';</script>");
        return;
    }
%>
<div class="panel panel-default" style="position: fixed;width: 100%;height: 100%;margin-top: 4.5%;">
    <div class="panel-heading" style="padding-bottom: 0;">
        <div style="margin-bottom: 0;margin-left: 15%;">
            <div style="display: inline;">
                <span class="glyphicon glyphicon-user"></span>
                <label id="createUser">${project.userByCreateBy.realName}</label>
                <label>/</label>
            </div>
            <div style="display: inline;">
                <span class="glyphicon glyphicon-file"></span>
                <label id="profileName">${project.title}</label>
            </div>

            <ul class="nav nav-tabs" style="margin-bottom: 0;margin-top: 2%;">
                <li role="presentation" class="active"><a href=" ">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    Code</a></li>

            </ul>
        </div>
    </div>
    <div class="panel-body">
        <div class="panel panel-info" style="margin-left: 15%;width: 70%;">
            <div class="panel panel-heading">
                <div>
                    <span class="glyphicon glyphicon-map-marker"></span>
                    <lable id="roadName"><%=pth%>
                    </lable>
                </div>
            </div>
            <%
                if (files.length == 2 && files[0] == null) {
                    File file = files[1];
                    String content = StringEscapeUtils.escapeHtml4(FileUtils.readFileToString(file));
            %>
            <div class="panel panel-body">
                <pre><code><%=content%></code></pre>
            </div>
            <%
            } else {
            %>
            <table class="table table-striped  table-hover">
                <tr>
                    <th><strong>文件名</strong></th>
                    <th><strong>文件大小</strong></th>
                    <th><strong>修改时间</strong></th>
                        <%
                    for (File file : files) {
                        String target = "/repository/view.jsp?pid=" + pid + "&pth=" + pth + file.getName();
                %>
                <tr>
                    <td>
                        <a href="<%=target%>"><%=file.getName()%>
                        </a>
                    </td>
                    <td>
                        <%=file.length()%>
                    </td>
                    <td>
                        <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(file.lastModified()))%>
                    </td>
                </tr>
                <% } %>
            </table>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>

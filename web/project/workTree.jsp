<%@ taglib prefix="jap" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/30
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>GitSHU 项目工作流</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <!--表单验证-->
    <link href="${pageContext.request.contextPath}/static/css/validationEngine.jquery.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validationEngine-zh_CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validationEngine.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/js/worktree_validation.js"></script>

</head>
<body>
<jap:include value="/components/banner.jsp"/>
<div style="position: absolute;left: 10%;top: 15%;width: 80%;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <%
                String id = request.getParameter("id");
                out.println("<h3><span class=\"glyphicon glyphicon-calendar\" aria-hidden=\"true\"></span>  " + id + "</h3>");
            %>
        </div>
        <div class="panel-body">
            <div style="float: left;text-align: center;left: 30%;margin-left: 15%;">
                <div id="workTree" style="margin: 5% auto;">
                    <h3>
              <span class="label label-success label-lg" style="max-width: 300px;">
              <span class="glyphicon glyphicon-star" aria-hidden="true"></span> start</span></h3>
                </div>
                <form class="navbar-form" action="<s:url action="" namespace=""/> " method="post">
                    <%
                        out.println("<input type=\"text\" name=\"id\" id=\"profile_id\" style=\"display: none;\"value=\"" + id + "\"/>\n");

                    %>
                    <div class="form-group" style="margin-bottom: 5%;">
                        <input id="nodeNames" name="nodeNames" type="text" class="form-control" placeholder="新的结点">
                    </div>
                    <div style="margin-bottom: 5%;">
                        <textarea name="nodeInfo" class="form-control" rows="3" cols="23" placeholder="新的结点"></textarea>
                    </div>
                    <button type="submit" class="btn btn-success" id="addWorkNode">
                        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button>
                </form>
            </div>
            <div id="nodeinfo" class="panel panel-info" style="float: left;margin-left: 10%;width: 40%;margin-top: 3%;">
                <div class="panel-heading">
                    <h5 id="panel_nodeName">结点名称</h5>
                </div>
                <div class="panel-body">
                    <p id="panle_nodeInfo">节点内容</p>
                </div>
                <div class="panel-footer" style="text-align: center;">
                    <button id="nodeComplete" class="btn btn-success" style="width: 25%;margin:0 3%;">Complete</button>
                    <button id="nodeProgress" class="btn btn-warning" style="width: 25%;margin:0 3%;">Progress</button>
                    <button id="nodeDelete" class="btn btn-danger" style="width: 25%;margin:0 3%;">Delete</button>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>

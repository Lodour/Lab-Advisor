<%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/30
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.gitshu.entity.UserEntity" %>
<%@ page import="org.gitshu.entity.WorkflowEntity" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<s:include value="/components/banner.jsp"/>
<s:action name="WorkflowView" namespace="/workflow"/>
<s:action name="userEntitySet" namespace="/user"/>
<jsp:useBean id="projectEntity" scope="request" type="org.gitshu.entity.ProjectEntity"/>
<jsp:useBean id="userEntity" scope="request" type="org.gitshu.entity.UserEntity"/>
<s:action name="projectMembers" namespace="/project"/>
<div style="position: absolute;left: 10%;top: 15%;width: 80%;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <script>
                function repo() {
                    window.location.href = '/repository/view.jsp?pid=${projectEntity.id}&pth=/';
                }
            </script>
            <h3><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> ${projectEntity.title}
                <button type="button" class="btn btn-xs btn-success" onclick="repo()">代码仓库</button>
            </h3>
        </div>
        <div class="panel-body">
            <h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 管理员
            </h4>${projectEntity.userByCreateBy.username}
            <h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 项目简介</h4>${projectEntity.info}
            <h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 项目组成员</h4>
            <table class="table table-condensed table-bordered">
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>用户类型</th>
                </tr>
                <%
                    List<UserEntity> userEntities = (List<UserEntity>) session.getAttribute("members");
                    if (userEntities != null) {
                        for (UserEntity u : userEntities) {
                %>
                <tr>
                    <td><%=u.getId()%>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/user/profiles.jsp?username=<%=u.getUsername()%>"><%=u.getUsername()%>
                        </a></td>
                    <td><%=u.getRealName()%>
                    </td>
                    <td><%=new String[]{"女", "男", "保密"}[u.getGender()]%>
                    </td>
                    <td><%=new String[]{"管理员", "教师", "学生", "访客"}[u.getUserType()]%>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 项目工作流程图
            </h3>
            <%
                List<WorkflowEntity> workflow = (List<WorkflowEntity>) request.getAttribute("nodes");
                int cnt = 0;
                for (WorkflowEntity w : workflow) {
                    if (w.getStatus() == 2)
                        cnt++;
                }
                int rate = (int) (100.0 * cnt / workflow.size());
            %>
            <div class="progress">
                <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
                     aria-valuenow="<%=rate%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=rate%>%;"/>
                <%=rate%>%
            </div>
        </div>
        <div class="panel-body">
            <div style="float: left;text-align: center;left: 30%;margin-left: 10%;">
                <div id="workTree" style="margin: 5% auto;">
                    <h3>
              <span class="label label-success label-lg" style="max-width: 300px;">
              <span class="glyphicon glyphicon-star" aria-hidden="true"></span> start</span></h3>
                    <%
                        for (WorkflowEntity node : workflow) {
                            if (node.getStatus() == 0) {
                                out.println("<button type=\"button\" class=\"btn btn-warning\" style=\"max-width: 300px; margin-top:5%;\" id='" + node.getId() + "'>" + node.getTitle() + "</button></br>");
                            } else {
                                out.println("<button type=\"button\" class=\"btn btn-success\" style=\"max-width: 300px; margin-top:5%;\" id='" + node.getId() + "'>" + node.getTitle() + "</button></br>");
                            }
                            out.println("<input type=\"text\" style=\"display: none;\" id=\"" + node.getId() + 's' + "\" value=\"" + node.getInfo() + "\"/>\n");
                        }
                    %>
                </div>

            </div>
            <div id="nodeinfo" class="panel panel-info" style="float: left;margin-left: 30%;width: 40%;margin-top: 3%;">
                <div class="panel-heading">
                    <h5 id="panel_nodeName">结点名称</h5>
                </div>
                <div class="panel-body">
                    <p id="panle_nodeInfo">结点内容</p>
                </div>
                <% if (userEntity.getUserType() <= 1) { %>
                <div class="panel-footer" style="text-align: center;">
                    <button id="nodeComplete" class="btn btn-success" style="width: 25%;margin:0 3%;">Complete</button>
                    <button id="nodeProgress" class="btn btn-warning" style="width: 25%;margin:0 3%;">Progress</button>
                    <button id="nodeDelete" class="btn btn-danger" style="width: 25%;margin:0 3%;">Delete</button>
                </div>
                <div>
                    <form id="workflow_form" class="navbar-form"
                          action="<s:url action="WorkflowCreate" namespace="/workflow"/>"
                          method="post">
                        <input type="text" name="id" id="profile_id" style="display: none;"
                               value="${projectEntity.id}"/>
                        <div class="form-group" style="margin-bottom: 5%; width: 100%;">
                            <input id="nodeNames" name="nodeNames" type="text" class="form-control validate[required]"
                                   placeholder="新的工作流结点标题" style="width: 100%;">
                        </div>
                        <div style="margin-bottom: 5%;">
                            <textarea name="nodeInfo" class="form-control" rows="3" cols="23" placeholder="工作流结点内容"
                                      style="width: 100%;"></textarea>
                        </div>
                        <button type="submit" class="btn btn-Info" id="addWorkNode">
                            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button>
                    </form>
                </div>
                <% } %>
            </div>
        </div>
    </div>

</div>
</body>
</html>

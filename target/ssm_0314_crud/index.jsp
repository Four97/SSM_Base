<%--
  Created by IntelliJ IDEA.
  User: 4
  Date: 2020/4/13
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>

    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/static/js/jquery-3.1.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>


<body>
<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row" >
        <div class="col-md-4 col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--    表格--%>
    <div class="row">
        <table class="table table-hover" id = "emps_table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <%--    分页信息--%>
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">
            当前 页,总 页，总共 条记录
        </div>
        <!--分页条-->
        <div class="col-ma-6">

        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn=1",
                type:"GET",
                success:function (result) {
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        });

        function build_emps_table(result) {
            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item) {

                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");;

            })
        }

        //分页信息
        function build_page_info(result) {
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"条记录");



        }

        //分页条
        function build_page_nav(result) {




        }
    </script>
</div>

</body>
</html>

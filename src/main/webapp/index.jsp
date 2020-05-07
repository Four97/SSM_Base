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




<!-- 新增员工的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@163.com">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改员工的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@163.com">
                            <span  class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>


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
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--    表格--%>
    <div class="row">
        <table class="table table-hover" id = "emps_table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
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
        <div class="col-md-6" id="page_info_area"></div>
        <!--分页条-->
        <div class="col-ma-6" id="page_nav_area">

        </div>
    </div>
    <script type="text/javascript">

        var totalRecord,currentPage;
        $(function(){
            to_page(1);
        });

        function to_page(pn) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });

        }

        function build_emps_table(result) {

            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item) {


                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");

                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //添加自定义属性，表示当前id
                editBtn.attr("edit-id",item.empId);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("del-id",item.empId);
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");

            })
        }

        //分页信息
        function build_page_info(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum +"页,总"
                +result.extend.pageInfo.pages+"页，总共"
                +result.extend.pageInfo.total+"条记录");

            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;



        }

        //分页条
        function build_page_nav(result) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage==false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                firstPageLi.click(function () {
                    to_page(1);

                });
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum-1);

                });
            }



            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));

            if(result.extend.pageInfo.hasNextPage==false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum+1);
                });

                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                });
            }



            ul.append(firstPageLi).append(prePageLi);

            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {

               var numLi = $("<li></li>").append($("<a></a>").append(item));
               if(result.extend.pageInfo.pageNum == item){
                   numLi.addClass("active");
               }
               numLi.click(function () {
                   to_page(item);

               });
               ul.append(numLi);
            });

            ul.append(nextPageLi).append(lastPageLi);

            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");

        }

        function reset_form(ele){
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-success has-error");
            $(ele).find(".help-block").text("");
        }

        //新增按钮，弹出模态框
        $("#emp_add_modal_btn").click(function () {
            //查部门信息
            //alert("sample text");
            //表单重置
            reset_form("#empAddModal form" );
            getDepts("#dept_add_select");

            $("#empAddModal").modal({
                // 点击背景不删除
                backdrop:"static"
            });
        });

        //查出所有部门信息，显示在下拉列表
        function getDepts(ele) {
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function (result) {
                    //controller
                    //console.log(result);
                    //$("#dept_add_select").append("")
                    $("#dept_add_select").empty();
                    $.each(result.extend.depts,function () {
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele);
                    });

                }
            });
        }



        function validate_add_form(){
           var empName =  $("#empName_add_input").val();
           var regName =  /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;


            if(!regName.test(empName)){

                show_validate_msg("#empName_add_input","error","用户名错误");
                return false;
           }else {
                show_validate_msg("#empName_add_input","success","");
            }

           var email = $("#email_add_input").val();
           var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

           if(!regEmail.test(email)){
               show_validate_msg("#email_add_input","error","邮箱不正确");
               return false;
           }else{
               show_validate_msg("#email_add_input","success","");
           }

           return true;
        }

        function show_validate_msg(ele,status,msg){
            $(ele).parent().removeClass("has-error has-success");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //检验数据库是否已有该用户
        $("#empName_add_input").change(function () {
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkUser",
                data:"empName="+empName,
                type:"POST",
                success:function (result) {
                    if(result.code==200){
                        show_validate_msg(empName_add_input,"success","用户名可用");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        show_validate_msg(empName_add_input,"error",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va","error");
                    }

                }
            });
        });




        //保存按钮
        $("#emp_save_btn").click(function () {
            //将模态框中数据提交到数据库中
            //添加校验
            // if(!validate_add_form()){
            //     return false;
            // }

            //用户名校验
            if($(this).attr("ajax-va")=="error"){
                return  false;
            }
            //发送ajax
            //alert($("#empAddModal form").serialize());
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    //alert(result.msg);
                    if(result.code==200){
                        //关闭模态框
                        $("#empAddModal").modal('hide');
                        //来到最后一页
                        to_page(totalRecord);
                    }else{
                        //console.log(result);
                        if(undefined != result.extend.errorFields.email){
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                        }
                        if(undefined != result.extend.errorFields.empName){
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                        }
                    }


                }
            });
        });

        //单个删除按钮
        $(document).on("click",".delete_btn", function () {
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var empId = $(this).attr("del-id");
            if(confirm("确认删除【"+empName+"】吗？")){
                //确认就发送删除
                $.ajax({
                    url:"${APP_PATH}/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_page(currentPage);

                    }

                });
            }

        });

        // 修改按钮单击事件

        $(document).on("click",".edit_btn",function () {

            getDepts("#dept_update_select");

            getEmp($(this).attr("edit-id"));


            //员工id传给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));

            $("#empUpdateModal").modal({
                // 点击背景不删除
                backdrop:"static"
            });

        });

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var empDate = result.extend.emp;
                    $("#empName_update_static").text(empDate.empName);
                    $("#email_update_input").val(empDate.email);
                    $("#empUpdateModal input[name = gender]").val([empDate.gender]);
                    $("#empUpdateModal select").val([empDate.dId]);
                }
            });

        }

         $("#emp_update_btn").click(function () {
             //验证邮箱
             var email = $("#email_update_input").val();
             var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

             if(!regEmail.test(email)){
                 show_validate_msg("#email_add_input","error","邮箱不正确");
                 return false;
             }else{
                 show_validate_msg("#email_add_input","success","");
             }


             //发送更改请求
             //若要能直接发put则要加过滤器httpPutFormContentFilter
             // type:"POST",
             // data:$("#empUpdateModal form").serialize()+"&_method=put",

             $.ajax({
                 url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                 type:"PUT",
                 data:$("#empUpdateModal form").serialize(),
                 success:function (result) {
                     //alert(result.msg);
                     $("#empUpdateModal").modal("hide");
                     to_page(currentPage);
                 }
             });
         });


        //全选/全不选
        $("#check_all").click(function () {
            $(".check_item").prop("checked",$(this).prop("checked"));

        });
        $(document).on("click",".check_item",function () {
           var flag = $(".check_item:checked").length==$(".check_item").length;
            $("#check_all").prop("checked",flag);

        });
        <%--$("#emp_delete_all_btn").click(function(){--%>
        <%--    var empNames = "";--%>
        <%--    var del_idstr = "";--%>
        <%--    $.each($(".check_item:checked"),function(){--%>
        <%--        empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";--%>
        <%--        del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";--%>
        <%--    });--%>
        <%--    empNames = empNames.substring(0,empNames.length-1);--%>
        <%--    del_idstr = del_idstr.substring(0,del_idstr.length-1);--%>
        <%--    if(confirm("确认删除["+empNames+"]吗?")){--%>
        <%--        $.ajax({--%>
        <%--            url:"${APP_PATH}/emp/" + del_idstr,--%>
        <%--            type:"DELETE",--%>
        <%--            success:function(result){--%>
        <%--                alert(result.msg);--%>
        <%--                to_page(currentPage);--%>
        <%--            }--%>
        <%--        });--%>
        <%--    }--%>
        <%--});--%>
        $("#emp_delete_all_btn").click(function () {

            var empNames="";
            var del_idstr="";
            $.each($(".check_item:checked"),function () {
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                del_idstr+= $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            empNames =  empNames.substring(0,empNames.length-1);
            del_idstr = del_idstr.substring(0,del_idstr.length-1);

            if(confirm("确认删除【"+empNames+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/emp/"+del_idstr,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_page(currentPage);

                    }

                });
            }
        });


    </script>
</div>

</body>
</html>

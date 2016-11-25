<%-- 
    Document   : layout
    Created on : Oct 19, 2016, 1:01:57 AM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags/" %>

<%--<%= request.getAttribute("users").toString() %>--%>
<co:layout>

    <div id="wrapper">
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Admin manage</h1>
                    </div>
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info" style="margin-left: 18px; margin-bottom: 5px;" data-toggle="modal" data-target="#myModal">TẠO MỚI</button>

                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">TẠO QUẢN TRỊ VIÊN</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="http://localhost:8084/baitap/admin">
                                        <!--<textarea id="myTextarea" style="float: right;position: absolute;"></textarea>-->
                                        <div class="form-group">
                                            <label>Usermane</label>
                                            <input class="form-control" name="Username_create" placeholder="Enter Username">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control" type="email" name="email_create" placeholder="Enter Username">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control" name="Password_create" placeholder="Enter Password">
                                        </div>
                                        <div style="">
                                            <label>Role</label> : 
                                            <select name="Role">
                                                <option value="1">Admin</option>
                                                <option value="2">Support</option>
                                            </select><br>
                                        </div>
                                        <br><br>
                                        <input type="submit" value="Submit"/>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div>
                    <!--<input type="date"/>-->
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <!--                            <div class="panel-heading">
                                                            <h3>Users</h3>
                                                        </div>-->
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="align-content: center; margin-left: auto; margin-right: auto">
                                <!-- Nav tabs -->
                                <!--<ul class="nav nav-tabs">-->
                                <!--                                    <li class="active"><a href="#home" data-toggle="tab">User</a>
                                                                    </li>-->
                                <!--</ul>-->

                                <!-- Tab panes -->
                                <div class="tab-content" style="min-height: 600px; padding-top: 40px">
                                    <div class="tab-pane fade in active" id="home" style="min-width: 800px;">
                                        <div class="panel-body">
                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>User Name</th>
                                                        <th>Email</th>
                                                        <th>Password</th>
                                                        <th>Role</th>
                                                        <th>Id</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="content" class="page_body">

                                                    <c:forEach items="${requestScope.users}" var="user">
                                                        <tr id="<c:out value="${user.id}"/>" class="odd gradeX">
                                                            <td><c:out value="${user.name}"/></td>
                                                            <td><c:out value="${user.email}"/> </td>
                                                            <td><c:out value="${user.password}"/> </td>
                                                            <td><c:out value="${user.role}"/> </td>
                                                            <td><c:out value="${user.id}"/> </td>
                                                            <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${user.id}">EDIT</button></td>
                                                            <td><input class="deleteRow btn btn-danger" type="submit" data-id="${user.id}" value="DELETE"></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:forEach items="${requestScope.userList}" var="user">
                                                        <tr id="<c:out value="${user.id}"/>" class="odd gradeX">
                                                            <td><c:out value="${user.name}"/></td>
                                                            <td><c:out value="${user.password}"/> </td>
                                                            <td><c:out value="${user.role}"/> </td>
                                                            <td><c:out value="${user.id}"/> </td>
                                                            <!--<td class="center"><a href="User/<c:out value="${user.id}"/>">Edit</a></td>-->
                                                            <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${user.id}">EDIT</button></td>
                                                            <td><input class="deleteRow btn btn-danger" type="submit" data-id="${user.id}" value="DELETE"></td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                        <ul class="pagination">
                                            <c:forEach var="i" begin="1" end="${requestScope.sizeList}">
                                                <li class="page" data-page="${i}"><a href="#"><c:out value="${i}"></c:out></a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>

                                </div>

                            </div>
                            <!-- /.container-fluid -->

                        </div>
                        <!-- /#page-wrapper -->

                    </div>
                </div>
                <!-- /#wrapper -->
            </div>

        </div>
    </div>
</co:layout>
<div id="editModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">SỬA THÔNG TIN</h4>
            </div>
            <div class="editmodal-body">

            </div>
            <div class="modal-footer">

            </div>
        </div>

    </div>
</div>
<script>
    $(".deleteRow").click(function () {
        var id = $(this).attr("data-id");
        var confirmation = confirm("Bạn có chắc muốn tiếp tục xóa");
        if(confirmation) {
            $.ajax({
            url: "deleteAd",
            type: "post",
            data: {id: id},
            success: function (data) {
                $("#" + id).remove();
            }
        });
        }
    });
</script>

<script>
    $(".eitdRow").click(function () {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "User/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
                //                    $(".img-detail").html('<p>waitting......</p>')
            },
            success: function (html) {
                $(".editmodal-body").html(html);
            }
        });
    });
</script>

<script>
    $(".page").click(function () {
        var num_page = $(this).attr("data-page");
//        $(this).remove();
        $.ajax({
            url: "pagination",
            type: "get",
            data: {num_page: num_page},
            dataType: "html",
            beforSend: function () {
                //                    $(".img-detail").html('<p>waitting......</p>')
            },
            success: function (html) {
                $(".page_body").html(html);

            }
        });
    });
</script>

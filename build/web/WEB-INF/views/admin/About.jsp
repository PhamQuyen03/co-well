<%-- 
    Document   : layout
    Created on : Oct 19, 2016, 1:01:57 AM
    Author     : tuong
--%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags" %>
<co:layout>
    <div id="wrapper">
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">THÔNG TIN VỀ CÔNG TY</h1>
                    </div>
                    <button type="button" class="btn btn-info" style="margin-left: 18px;margin-bottom: 5px;" data-toggle="modal" data-target="#myModal">TẠO TIN TỨC</button>

                    <!-- Modal created -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">TẠO TIN TỨC MỚI</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="http://localhost:8084/baitap/support/about">
                                        <div class="form-group">
                                            <label style="font-size:  15pt; align-content: center;">Tiêu Đề</label>
                                            <input class="form-control" name="titleAbout" type="text" style="text-align: center;font-size: 15pt;width: 600px">
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Nội Dung</label><br>
                                            <textarea class="myTextarea" name="contentAbout"></textarea>
                                        </div><br>

                                        <div style="left: 650px; position: absolute;top: 120px; width: 300px">
                                            <div>
                                                <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_atAbout"/><br>
                                                <label>Ngày Sửa</label>: <input style="margin-left: 19px" type="date" name="update_atAbout"/><br><br>
                                                <label>Trạng Thái</label> : 
                                                <select style="margin-left: 10px" name="statusAbout">
                                                    <option value="2">Đợi</option>
                                                    <option value="1">Đăng</option>
                                                </select><br>
                                            </div>
                                            <br>
                                            <input style="margin-left: 95px" type="submit" value="Tạo Tin Tuyển Dụng"/>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="align-content: center; margin-left: auto; margin-right: auto">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">

                                    <li class="active"><a href="#profile" data-toggle="tab">TIN ĐÃ ĐẰNG</a>
                                    </li>
                                    <li><a href="#messages" data-toggle="tab">TIN CHỜ DUYỆT </a>
                                    </li>
                                    <li><a href="#settings" data-toggle="tab">Settings</a>
                                    </li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content" style="min-height: 600px; padding-top: 40px">

                                    <div class="tab-pane fade  in active" id="profile">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center">ID</th>
                                                            <th style="text-align: center">TITLE</th>
                                                            <th style="text-align: center">CONTENT</th>
                                                            <th style="text-align: center">CREATE_AT</th>
                                                            <th style="text-align: center">UPDATE_AT</th>
                                                            <th style="text-align: center">STATUS</th>
                                                            <th style="text-align: center" >EDIT</th>
                                                            <th style="text-align: center" >DELETE</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.abouts}" var="about">
                                                            <tr id="${about.id}" class="odd gradeX">
                                                                <td><c:out value="${about.id}"/></td>
                                                                <td><c:out value="${about.title}"/></td>
                                                                <td><c:out escapeXml="false" value="${about.contents}"/></td>
                                                                <td><c:out value="${about.create_at}"/></td>
                                                                <td><c:out value="${about.update_at}"/></td>
                                                                <td><c:out value="${about.status}"/></td>
                                                                <!--<td><a href="http://localhost:8084/baitap/support/about/<c:out value="${about.id}"/>">Edit</a></td>-->
                                                                <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${about.id}">EDIT</button></td>
                                                                <td><input class="deleteRow btn btn-danger" type="submit" data-id="${about.id}" value="DELETE"></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="messages">
                                        <div class="panel panel-default">
                                            <!--<div class="panel-body">-->
                                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center">ID</th>
                                                            <th style="text-align: center">TITLE</th>
                                                            <th style="text-align: center">CONTENT</th>
                                                            <th style="text-align: center">CREATE_AT</th>
                                                            <th style="text-align: center">UPDATE_AT</th>
                                                            <th style="text-align: center">STATUS</th>
                                                            <th style="text-align: center" >EDIT</th>
                                                            <th style="text-align: center" >DELETE</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.abouts}" var="about">
                                                            <tr id="${about.id}" class="odd gradeX">
                                                                <td><c:out value="${about.id}"/></td>
                                                                <td><c:out value="${about.title}"/></td>
                                                                <td><c:out escapeXml="false" value="${about.contents}"/></td>
                                                                <td><c:out value="${about.create_at}"/></td>
                                                                <td><c:out value="${about.update_at}"/></td>
                                                                <td><c:out value="${about.status}"/></td>
                                                                <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${about.id}">EDIT</button></td>
                                                                <td><input class="deleteRow btn btn-danger" type="submit" data-id="${about.id}" value="DELETE"></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
    <!-- /#wrapper -->

</co:layout>
<script>
    $(".deleteRow").click(function () {
        var id = $(this).attr("data-id");
        var confirmation = confirm("Bạn có chắc muốn tiếp tục xóa");
        if(confirmation) {
            $.ajax({
            url: "about/delete",
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
            url: "about/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
                //                    $(".img-detail").html('<p>waitting......</p>')
            },
            success: function (html) {
                $(".editmodal-body").html(html);
                //                    $(".img-detail").html(data)
            }
        });
    });
</script>
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
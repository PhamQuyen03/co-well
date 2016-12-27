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
                        <h1 class="page-header">TIN TỨC </h1>
                    </div>
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info" style="margin-left: 18px; margin-bottom: 5px;" data-toggle="modal" data-target="#myModal">TẠO TIN TỨC</button>

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
                                    <form method="post" action="http://localhost:8084/co-well/support">
                                        <div class="form-group">
                                            <label style="font-size:  15pt; align-content: center;">Tiêu Đề</label>
                                            <input class="form-control" name="title" type="text" style="text-align: center;font-size: 15pt;width: 600px">
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Mô Tả</label><br>
                                            <textarea class="form-control" name="description" rows="3" style="width: 600px"></textarea>
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Nội Dung</label><br>
                                            <textarea class="myTextarea" name="contents"></textarea>
                                        </div><br>
                                        <div class="form-group">
                                            <label style="font-size:  15pt; align-content: center;">ẢNH</label>
                                            <input class="form-control" name="img" type="text" style="text-align: center;font-size: 15pt;width: 400px">
                                        </div><br>
                                        <div class="form-group">
                                            <label style="font-size:  15pt; align-content: center;">TÁC GIẢ</label>
                                            <input class="form-control" name="author" value="<c:out value="${sessionScope.userSession.name}"></c:out>" type="text" style="text-align: center;font-size: 15pt;width: 200px">
                                        </div><br>
                                        <div style="left: 630px; position: absolute;top: 120px; width: 300px">
                                            <div style="">
                                                <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_at"/><br>
                                                <label>Ngày Sửa</label>: <input style="margin-left: 20px" type="date" name="update_at"/><br><br>
                                                <label>Thể Loại</label> : 
                                                <select style="margin-left: 22px" name="id_category">
                                                    <option value="1">Sự Kiện</option>
                                                    <option value="2">Thông Báo</option>
                                                </select><br>
                                                <label>Trạng Thái</label> : 
                                                <select style="margin-left: 10px" name="status">
                                                    <option value="2">Đợi</option>
                                                    <option value="1">Đăng</option>
                                                </select><br>
                                            </div>
                                            <br>
                                            <input style="margin-left: 95px" type="submit" value="Tạo Thông Báo"/>
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
                                    <li><a href="#profile" data-toggle="tab">TT ĐÃ ĐẰNG</a>
                                    </li>
                                    <li class="active"><a href="#messages" data-toggle="tab">TT CHỜ DUYỆT </a>
                                    </li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content" style="min-height: 600px; padding-top: 40px">

                                    <div class="tab-pane fade" id="profile">
                                        <!--<div class="panel panel-default">-->

                                        <div class="panel-body">
                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">ID</th>
                                                        <th style="text-align: center">TIÊU ĐỀ</th>
                                                        <th style="text-align: center">MÔ TẢ</th>
                                                        <th style="text-align: center">NỘI DUNG</th>
                                                        <th style="text-align: center" >SỬA</th>
                                                        <th style="text-align: center" >XÓA</th>

                                                    </tr>
                                                </thead>
                                                <tbody class="pagepost_body">
                                                    <c:forEach items="${requestScope.news}" var="ns">
                                                        <tr id="${ns.id}" class="odd gradeX">
                                                            <td><c:out value="${ns.id}"/></td>
                                                            <td><c:out value="${ns.title}"/></td>
                                                            <td><c:out value="${ns.description}"/></td>
                                                            <td><c:out escapeXml="false" value="${ns.contents}"/></td>
                                                            <!--<td><a href="support/<c:out value="${ns.id}"/>">Edit</a></td>-->
                                                            <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${ns.id}">SỬA</button></td>
                                                            <td><input class="deleteRow btn btn-danger" type="submit" data-id="${ns.id}" value="XÓA"></td>

                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                        <ul class="pagination">
                                            <c:forEach var="i" begin="1" end="${requestScope.numpagepost}">
                                                <li class="pagepost" data-page="${i}"><a href="#"><c:out value="${i}"></c:out></a></li>
                                                </c:forEach>
                                        </ul>
                                        <!--</div>-->
                                    </div>
                                    <div class="tab-pane fade in active" id="messages">
                                        <!--<div class="panel panel-default">-->

                                        <div class="panel-body">
                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">ID</th>
                                                        <th style="text-align: center">TIÊU ĐỀ</th>
                                                        <th style="text-align: center">MÔ TAT</th>
                                                        <th style="text-align: center">NỘI DUNG</th>
                                                        <th style="text-align: center" >SỬA</th>
                                                        <th style="text-align: center" >XÓA</th>

                                                    </tr>
                                                </thead>
                                                <tbody class="page_body">
                                                    <c:forEach items="${requestScope.news_wait}" var="ns">
                                                        <tr id="${ns.id}" class="odd gradeX">
                                                            <td><c:out value="${ns.id}"/></td>
                                                            <td><c:out value="${ns.title}"/></td>
                                                            <td><c:out escapeXml="false" value="${ns.description}"/></td>
                                                            <td><c:out escapeXml="false" value="${ns.contents}"/></td>
                                                            <!--<td><a href="support/<c:out value="${ns.id}"/>">Edit</a></td>-->
                                                            <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${ns.id}">SỬA</button></td>
                                                            <td><input class="deleteRow btn btn-danger" type="submit" data-id="${ns.id}" value="XÓA"></td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                        <ul class="pagination">
                                            <c:forEach var="i" begin="1" end="${requestScope.numpage}">
                                                <li class="page" data-page="${i}"><a href="#"><c:out value="${i}"></c:out></a></li>
                                                </c:forEach>
                                        </ul>
                                        <!--</div>-->
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
        if (confirmation)
        {
            $.ajax({
                url: "delete",
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
            url: "support/news/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
                $(".editmodal-body").html('<h4>bạn có thể chờ một chút</h4>');
            },
            success: function (html) {
                $(".editmodal-body").html(html);
            }
        });
    });
</script>

<script>
    $(".page").click(function () {
        var page = $(this).attr("data-page");
        $.ajax({
            url: "support/news",
            data: {page: page},
            type: "get",
            dataType: "html",
            success: function (html) {
                $(".page_body").html(html);
            }
        });
    });
</script>
<script>
    $(".pagepost").click(function () {
        var page = $(this).attr("data-page");
        $.ajax({
            url: "support/newspost",
            data: {page: page},
            type: "get",
            dataType: "html",
            success: function (html) {
                $(".pagepost_body").html(html);
            }
        });
    });
</script>
<!-- Modal edit-->
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
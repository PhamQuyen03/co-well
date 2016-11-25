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
                        <h1 class="page-header">TIN TỨC TUYỂN DỤNG</h1>
                    </div>
                    <button type="button" class="btn btn-info" style="margin-left: 18px; margin-bottom: 5px;" data-toggle="modal" data-target="#myModal">TẠO TIN TỨC</button>

                    <!-- Modal created -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">TẠO TIN TUYỂN DỤNG</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="http://localhost:8084/baitap/support/recruitment">
                                        <div class="form-group">
                                            <label style="font-size:  15pt; align-content: center;">Tên</label>
                                            <input class="form-control" name="nameRec" type="text" style="text-align: center;font-size: 15pt;width: 600px">
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Tóm Tắt</label><br>
                                            <textarea class="form-control" name="summary" rows="3" style="width: 600px"></textarea>
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Mô Tả</label><br>
                                            <textarea class="myTextarea" name="descriptionRec"></textarea>
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Yêu cầu</label><br>
                                            <textarea class="myTextarea" name="requirementRec"></textarea>
                                        </div><br>
                                        <div class="form-group">
                                            <label for="Header">Quyền lợi</label><br>
                                            <textarea class="myTextarea" name="interestRec"></textarea>
                                        </div><br>
                                        <div class="form-group">
                                            <label style="font-size:  15pt; align-content: center;">Địa Chỉ</label>
                                            <input class="form-control" name="addressRec" type="text" style="text-align: center;font-size: 15pt;width: 600px">
                                        </div><br>
                                        <div style="left: 630px; position: absolute;top: 120px; width: 300px">
                                            <div>
                                                <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_atRc"/><br>
                                                <label>Ngày Nhận</label>: <input style="margin-left: 13px" type="date" name="start_recruitmentRec"/><br>
                                                <label>Kết Thúc</label>: <input style="margin-left: 26px" type="date" name="end_recruitmentRec"/><br><br>
                                                <label>Trạng Thái</label> : 
                                                <select style="margin-left: 10px" name="statusRec">
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
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content" style="min-height: 600px; padding-top: 40px">

                                    <div class="tab-pane fade  in active" id="profile">
                                        <div class="panel panel-default">
                                            <!--<div class="panel-body">-->
                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">ID</th>
                                                        <th style="text-align: center">NAME</th>
                                                        <th style="text-align: center">SUMMARY</th>
                                                        <th style="text-align: center">REQUIREMENT</th>
                                                        <th style="text-align: center">INTEREST</th>
                                                        <th style="text-align: center" >EDIT</th>
                                                        <th style="text-align: center" >DELETE</th>

                                                    </tr>
                                                </thead>
                                                <tbody class="pagePost_body">
                                                    <c:forEach items="${requestScope.recsPost}" var="rec">
                                                        <tr id="${rec.id}" class="odd gradeX">
                                                            <td><c:out value="${rec.id}"/></td>
                                                            <td><c:out value="${rec.name}"/></td>
                                                            <td><c:out value="${rec.summary}"/></td>
                                                            <td><c:out escapeXml="false" value="${rec.requirement}"/></td>
                                                            <td><c:out escapeXml="false" value="${rec.interest}"/></td>
                                                            <!--<td><a href="recruitment/<c:out value="${rec.id}"/>">Edit</a></td>-->
                                                            <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${rec.id}">EDIT</button></td>
                                                            <td><input class="deleteRow btn btn-danger" type="submit" data-id="${rec.id}" value="DELETE"></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <ul class="pagination">
                                            <c:forEach var="i" begin="1" end="${requestScope.numPagePost}">
                                                <li class="pagepost" data-page="${i}"><a href="#"><c:out value="${i}"></c:out></a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="messages">
                                        <div class="panel panel-default">
                                            <!--<div class="panel-body">-->
                                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">ID</th>
                                                        <th style="text-align: center">NAME</th>
                                                        <th style="text-align: center">SUMMARY</th>
                                                        <th style="text-align: center">REQUIREMENT</th>
                                                        <th style="text-align: center">INTEREST</th>
                                                        <th style="text-align: center" >EDIT</th>
                                                        <th style="text-align: center" >DELETE</th>

                                                    </tr>
                                                </thead>
                                                <tbody class="page_body">
                                                    <c:forEach items="${requestScope.recs}" var="rec">
                                                        <tr id="${rec.id}" class="odd gradeX">
                                                            <td><c:out value="${rec.id}"/></td>
                                                            <td><c:out value="${rec.name}"/></td>
                                                            <td><c:out value="${rec.summary}"/></td>
                                                            <td><c:out escapeXml="false" value="${rec.requirement}"/></td>
                                                            <td><c:out escapeXml="false" value="${rec.interest}"/></td>
                                                            <!--<td><a href="recruitment/<c:out value="${rec.id}"/>">Edit</a></td>-->
                                                            <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${rec.id}">EDIT</button></td>
                                                            <td><input class="deleteRow btn btn-danger" type="submit" data-id="${rec.id}" value="DELETE"></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <ul class="pagination">
                                            <c:forEach var="i" begin="1" end="${requestScope.numPage}">
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
        if (confirmation) {
            $.ajax({
                url: "recruitment/deletRe",
                type: "post",
                data: {idRe: id},
                beforSend: function () {
                    //                    $(".img-detail").html('<p>waitting......</p>')
                },
                success: function (data) {
                    $("#" + id).remove();
                    //                    $(".img-detail").html(data)
                }
            });
        }
    });
</script>
<script>
    $(".eitdRow").click(function () {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "recruitment/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
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
            url: "recruitment/page",
            type: "get",
            data: {page: page},
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
<script>
    $(".pagepost").click(function () {
        var page = $(this).attr("data-page");
        $.ajax({
            url: "recruitment/pagePost",
            type: "get",
            data: {page: page},
            dataType: "html",
            beforSend: function () {
                //                    $(".img-detail").html('<p>waitting......</p>')
            },
            success: function (html) {
                $(".pagePost_body").html(html);
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
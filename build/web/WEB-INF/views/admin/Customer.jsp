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
                        <h1 class="page-header">Supporter</h1>
                    </div>
                    <button type="button" class="btn btn-info" style="margin-left: 18px;" data-toggle="modal" data-target="#myModal">TẠO TIN TỨC</button>

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
                                    <li><a href="#home" data-toggle="tab">TẠO TIN TUYỂN DỤNG</a>
                                    </li>
                                    <li class="active"><a href="#profile" data-toggle="tab">TIN ĐÃ ĐẰNG</a>
                                    </li>
                                    <li><a href="#messages" data-toggle="tab">TIN CHỜ DUYỆT </a>
                                    </li>
                                    <li><a href="#settings" data-toggle="tab">Settings</a>
                                    </li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content" style="min-height: 600px; padding-top: 40px">
                                    <div class="tab-pane fade" id="home" style="min-width: 800px;">
                                        <form method="post" action="http://localhost:8084/baitap/support/recruitment">
                                            <div class="form-group">
                                                <label style="font-size:  15pt; align-content: center;">Tên</label>
                                                <input class="form-control" name="nameCus" type="text" style="text-align: center;font-size: 15pt;width: 600px">
                                            </div><br>
                                            <div class="form-group">
                                                <label for="Header">Mô Tả</label><br>
                                                <textarea class="myTextarea" name="descriptionCus"></textarea>
                                            </div><br>
                                            <div class="form-group">
                                                <label for="Header">Nội Dung</label><br>
                                                <textarea class="myTextarea" name="requirementCus"></textarea>
                                            </div><br>
                                            <div class="form-group">
                                                <label style="font-size:  15pt; align-content: center;">Địa Chỉ</label>
                                                <input class="form-control" name="addressCus" type="text" style="text-align: center;font-size: 15pt;width: 600px">
                                            </div><br>
                                            <div style="left: 650px; position: absolute;top: 120px; width: 300px">
                                                <div>
                                                    <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_atCus"/><br>
                                                    <label>Ngày Sửa</label> : <input style="margin-left: 19px" type="date" name="create_atCus"/><br>
                                                </div>
                                                <br>
                                                <input style="margin-left: 95px" type="submit" value="Tạo Thông Tin Khách Hàng"/>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade  in active" id="profile">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
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
                                                    <tbody>
                                                        <%--<c:forEach items="${requestScope.recs}" var="rec">--%>
                                                            <!--<tr id="${rec.id}" class="odd gradeX">-->
                                                                <!--<td><c:out value="${rec.id}"/></td>-->
                                                                <!--<td><c:out value="${rec.name}"/></td>-->
                                                                <!--<td><c:out value="${rec.summary}"/></td>-->
                                                                <!--<td><c:out escapeXml="false" value="${rec.requirement}"/></td>-->
                                                                <!--<td><c:out escapeXml="false" value="${rec.interest}"/></td>-->
                                                                <!--<td><a href="recruitment/<c:out value="${rec.id}"/>">Edit</a></td>-->
                                                                <!--<td><input class="deleteRow" type="submit" data-id="${rec.id}" value="DELETE"></td>-->
                                                        <!--</tr>-->
                                                        <%--</c:forEach>--%>
                                                    </tbody>
                                                </table>
                                                <ul class="pagination">
                                                    <%--<c:forEach var="i" begin="1" end="${requestScope.numPage}">--%>
                                                        <!--<li><a href="http://localhost:8084/baitap/support/recruitment/page/<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a></li>-->
                                                    <%--</c:forEach>--%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="messages">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
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
                                                    <tbody>
                                                        <%--<c:forEach items="${requestScope.recs}" var="rec">--%>
                                                            <!--<tr id="${rec.id}" class="odd gradeX">-->
                                                                <!--<td><c:out value="${rec.id}"/></td>-->
                                                                <!--<td><c:out value="${rec.name}"/></td>-->
                                                                <!--<td><c:out value="${rec.summary}"/></td>-->
                                                                <!--<td><c:out escapeXml="false" value="${rec.requirement}"/></td>-->
                                                                <!--<td><c:out escapeXml="false" value="${rec.interest}"/></td>-->
                                                                <!--<td><a href="recruitment/<c:out value="${rec.id}"/>">Edit</a></td>-->
                                                                <!--<td><input class="deleteRow" type="submit" data-id="${rec.id}" value="DELETE"></td>-->
                                                        <!--</tr>-->
                                                        <%--</c:forEach>--%>
                                                    </tbody>
                                                </table>
                                                <ul class="pagination">
                                                    <%--<c:forEach var="i" begin="0" end="${requestScope.numPage}">--%>
                                                        <!--<li><a href="http://localhost:8084/baitap/support/recruitment/page/<c:out value="${i}"></c:out>"><c:out value="${i+1}"></c:out></a></li>-->
                                                    <%--</c:forEach>--%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="settings">
                                        <form method="post" action="http://localhost:8084/baitap/support">
                                            <div class="form-group">
                                                <label style="font-size:  15pt; align-content: center;">Tên</label>
                                                <input class="form-control" name="nameRec" type="text" style="text-align: center;font-size: 15pt;width: 600px">
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
                                            <div style="left: 650px; position: absolute;top: 120px; width: 300px">
                                                <div>
                                                    <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_atRc"/><br>
                                                    <label>Ngày Nhận</label>: <input style="margin-left: 22px" type="date" name="start_recruitmentRec"/><br><br>
                                                    <label>Kết Thúc</label>: <input style="margin-left: 22px" type="date" name="end_recruitmentRec"/><br><br>
                                                    <label>Trạng Thái</label> : 
                                                    <select style="margin-left: 10px" name="statusRec">
                                                        <option value="2">Đợi Duyệt</option>
                                                    </select><br>
                                                </div>
                                                <br>
                                                <input style="margin-left: 95px" type="submit" value="Tạo Tin Tuyển Dụng"/>
                                            </div>
                                        </form>
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
        $.ajax({
            url: "",
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
    });
</script>
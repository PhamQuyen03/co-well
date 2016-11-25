<%-- 
    Document   : layout
    Created on : Oct 19, 2016, 1:01:57 AM
    Author     : tuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags/" %>
<co:layout>

    <div id="wrapper">

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Edit News</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="panel-body">
                    <form method="post" action="http://localhost:8084/baitap/support/title=${requestScope.details.header}" class="form-inline">

                            <input class="form-control" type="hidden" name="edit_newsId" type="text" style="text-align: center;font-size: 15pt;width: 100px" value="${requestScope.details.id.toString()}" >

                        <div class="form-group">
                            <label for="Header">Header</label><br>
                            <textarea class="form-control" name="header_edit" rows="3" style="width: 600px">${requestScope.details.header}</textarea>
                        </div><br><br>
                        <textarea id="myTextarea" name="edit_textArea">${requestScope.details.content}</textarea>
                        <br><br>
                        <div class="form-group">
                            <label style="font-size:  15pt">Author</label>
                            <input class="form-control" name="edit_author" type="text" style="font-size: 15pt;width: 200px" value="${requestScope.details.author}">
                        </div><br><br>
                        <div style="">
                            <label>Ngay bat dau</label> : <input type="date" name="edit_dateStart" value="${requestScope.details.dateStart}"/><br><br>
                            <label>Ngay ket thuc</label>: <input type="date" name="edit_dateEnd" value="${requestScope.details.dateEnd}"/><br><br>
                            <label>Role</label> : 
                            <select name="edit_role" >
                                <option value="1">Communication</option>
                                <option value="2">Recruitment</option>
                                <option value="3">News</option>
                            </select><br>
                        </div>
                        <br><br>
                        <input type="submit" value="Update"/>
                    </form>
                </div>
                <!--<div id="froala-editor"></div>-->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</co:layout>

<%-- 
    Document   : layout
    Created on : Oct 19, 2016, 1:01:57 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags" %>
<co:layout>
    <div id="wrapper">
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <form style="width: 600px; margin-left: 150px; margin-top: 60px;" method="post" action="http://localhost:8084/co-well/profile/edit">

                    <div class="form-group" hidden="true">

                        <input class="form-control" name="userid" value="${sessionScope.userSession.id}" type="hidden">
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input class="form-control" name="Username_edit" placeholder="Enter Username" value="${sessionScope.userSession.name}">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="email" name="email_edit" placeholder="Enter Username" value="${sessionScope.userSession.email}">
                    </div>
                    <input  class="form-control" type="hidden" name="Password_edit" placeholder="Enter Password" value="${sessionScope.userSession.password}">
                    <div style="">
                        <label>Role</label> : 
                        <select name="Role_edit">
                            <c:if test="${sessionScope.userSession.role == 1}">
                                <option value="${sessionScope.userSession.role}">Admin</option>
                            </c:if>
                            <c:if test="${sessionScope.userSession.role == 2}">
                                <option value="${sessionScope.userSession.role}">Supporter</option>
                            </c:if>

                        </select><br>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label>NẾU BẠN MUỐN THAY MẬT KHẨU HÃY ĐIỀN VÀO FROM DƯỚI</label>
                        <input class="form-control" type="password" name="old" placeholder="Mật Khẩu Cũ">
                        <input class="form-control" type="password" name="new" placeholder="Mật Khẩu Mới">
                        <input class="form-control" type="password" name="confirm" placeholder="Nhập Lại Mật Khẩu Mới">
                    </div>
                    <input type="submit" value="Sửa thông tin"/>
                </form>
            </div>
        </div>

    </div>

</co:layout>
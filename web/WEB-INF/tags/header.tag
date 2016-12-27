<%-- 
    Document   : header
    Created on : Oct 20, 2016, 10:23:57 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="">QUẢN LÝ NỘI DUNG</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">

        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="http://localhost:8084/co-well/profile/<c:out value="${sessionScope.userSession.id}"></c:out>"><i class="fa fa-user fa-fw"></i> <c:out value="${sessionScope.userSession.name}"></c:out></a>
                    </li>
                    <li><a href="http://localhost:8084/co-well/setting/profile/<c:out value="${sessionScope.userSession.id}"></c:out>"><i class="fa fa-gear fa-fw"></i> Chỉnh Sửa</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="http://localhost:8084/co-well/logout"><i class="fa fa-sign-out fa-fw"></i> Đăng Xuất</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    
                    <li>
                        <a href="http://localhost:8084/co-well/index.html"><i class="fa fa-home"></i> Trang Chủ</a>
                    </li>
                <c:if test="${sessionScope.userSession.role == 1}">
                    <li>
                        <a href="http://localhost:8084/co-well/admin"><i class="fa fa-pencil-square-o"></i> Quản Trị</a>
                    </li>
                </c:if>
                
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i> Quản Trị 2<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="http://localhost:8084/co-well/support"><i class="fa fa-pencil-square-o"></i> Tin Tức Mới</a>
                            </li>
                            <li>
                                <a href="http://localhost:8084/co-well/support/recruitment"><i class="fa fa-pencil-square-o"></i> Tuyển Dụng</a>
                            </li>
                            <li>
                                <a href="http://localhost:8084/co-well/support/about"><i class="fa fa-pencil-square-o"></i> Về Công Ty</a>
                            </li>

                        </ul>
                    </li>
                


            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
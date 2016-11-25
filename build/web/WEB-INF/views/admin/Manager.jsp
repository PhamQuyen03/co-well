<%-- 
    Document   : layout
    Created on : Oct 19, 2016, 1:01:57 AM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags" %>
<co:layout>

    <div id="wrapper">


        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Manager</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="panel-body" style="align-content: center; margin-left: auto; margin-right: auto">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">Submit</a>
                            </li>
                            <li><a href="#profile" data-toggle="tab">Posted</a>
                            </li>
                            <li><a href="#messages" data-toggle="tab">Posts waited</a>
                            </li>
                            <li><a href="#settings" data-toggle="tab">Settings</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content" style="min-height: 600px; padding-top: 40px">
                            <div class="tab-pane fade in active" id="home" style="min-width: 800px;">

                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">ID</th>
                                                <th style="text-align: center">TITLE</th>
                                                <th style="text-align: center">DESCRIPTION</th>
                                                <th style="text-align: center">CONTENT</th>
                                                <th style="text-align: center" >EDIT</th>
                                                <th style="text-align: center" >DELETE</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.wait_newsMg}" var="ns">
                                                <tr class="odd gradeX">
                                                    <td><c:out value="${ns.id}"/></td>
                                                    <td><c:out value="${ns.title}"/></td>
                                                    <td><c:out escapeXml="false" value="${ns.description}"/></td>
                                                    <td><c:out escapeXml="false" value="${ns.contents}"/></td>
                                                    <td><a href="support/">Edit</a></td>
                                                    <td><input class="deleteRow" type="submit" data-id="${ns.id}" value="DELETE"></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="profile">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">Id</th>
                                                    <th style="text-align: center">Header</th>
                                                    <th style="text-align: center">Content</th>
                                                    <th style="text-align: center">Author</th>
                                                    <th style="text-align: center">DateStart</th>
                                                    <th style="text-align: center">DateEnd</th>
                                                    <th style="text-align: center">Status</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.newsMg}" var="ns">
                                                    <tr class="odd gradeX">
                                                        <td><c:out value="${ns.id}"/></td>
                                                        <td><c:out value="${ns.header}"/></td>
                                                        <td><c:out escapeXml="false" value="${ns.content}"/></td>
                                                        <td><c:out value="${ns.author}"/></td>
                                                        <td><c:out value="${ns.dateStart}"/></td>
                                                        <td><c:out value="${ns.dateEnd}"/></td>
                                                        <td><c:out value="${ns.status}"/></td>
                                                        <td><a href="support/title=<c:out value="${ns.header}"/>">Edit</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="messages">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>User Name</th>
                                                    <th>Password</th>
                                                    <th>Role</th>
                                                    <th>Detail</th>
                                                    <th>Edit</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="odd gradeX">
                                                    <td>Trident</td>
                                                    <td>Internet Explorer 4.0</td>
                                                    <td>Win 95+</td>
                                                    <td class="center">X</td>
                                                    <td class="center">X</td>
                                                    <td style="align-content: center;">X</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="settings">
                                <h4>Settings Tab</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</co:layout>

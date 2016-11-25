<%-- 
    Document   : layout
    Created on : Oct 8, 2016, 12:57:48 PM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags/" %>
<html>
    <head>
        <co:head></co:head>
        </head>
        <body>
        <co:header></co:header>
        <jsp:doBody></jsp:doBody>
            <!-- jQuery -->
        <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js" />"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="<c:url value="/resources/vendor/metisMenu/metisMenu.min.js" />"></script>

        <!-- Custom Theme JavaScript -->
        <!--<script src="resource/dist/js/sb-admin-2.js"></script>-->
        <script src="<c:url value="/resources/js/sb-admin-2.js" />"></script>

    </body>
</html>
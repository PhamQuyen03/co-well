<%-- 
    Document   : layout
    Created on : Oct 8, 2016, 12:57:48 PM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib  prefix="co-well" tagdir="/WEB-INF/tags/clients" %>
<html>
    <head>
        <co-well:head></co-well:head>
        </head>
        <body>
        <co-well:header></co-well:header>
        <jsp:doBody></jsp:doBody>
        <co-well:footer></co-well:footer>
            <a href="" class="backtotop" style="display: inline;"><img src="http://co-well.vn/asset/frontend/img/backtotop.png" alt="Back to top"></a>
            <script src="<c:url value="/resources/clients/js/jquery-1.11.2.min.js" />"></script>
        <script src="<c:url value="/resources/clients/js/css_browser_selector.js" />"></script>
        <script src="<c:url value="/resources/clients/js/slideall.js" />"></script>
        <script src="<c:url value="/resources/clients/js/swiper.jquery.min.js" />"></script>
        <script src="<c:url value="/resources/clients/js/owl.carousel.min.js" />"></script>
        <script src="<c:url value="/resources/clients/js/mediaelement-and-player.js" />"></script>
        <script src="<c:url value="/resources/clients/js/scripts.js" />"></script>
        <script src="<c:url value="/resources/clients/js/custom.js" />"></script>
        <script src="<c:url value="/resources/clients/js/slick.js" />"></script>
        <script src="<c:url value="/resources/clients/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/clients/js/jquery.jcarousel.min.js" />"></script>
        <script src="<c:url value="/resources/clients/js/jcarousel.responsive.js" />"></script>
        <script src="<c:url value="/resources/clients/js/jquery.validate.min.js" />"></script>
        <script type="text/javascript">
            var searchUrl = 'search'
        </script>
        <script src="<c:url value="/resources/clients/js/jquery.matchHeight.js" />"></script>
        <!--<script type="text/javascript" src="resources/clients/js/jquery.matchHeight.js"></script>-->
        <script type="text/javascript">
            $(function () {
                $('.swiper-wrapper li').matchHeight();
            });
        </script>

    </body>
</html>
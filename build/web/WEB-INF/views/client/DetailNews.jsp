<%-- 
    Document   : DetailNews
    Created on : Nov 8, 2016, 1:07:29 PM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co-well" tagdir="/WEB-INF/tags/clients" %>
<co-well:layout>
    <section class="newslist subpage region">
        <h2 class="textcenter fronttitle">Tin tức và sự kiện</h2>
        <div class="wauto">
            <div class="row boxsubpage">
                <!--Begin contents-->
                <article class="col col69 contents mcol100">
                    <!--Begin topnewsdetail-->
                    <div class="topnewsdetail">
                        <a class="hidesm"><img src="<c:out value="${requestScope.detailnews.img}"></c:out>" width="762" height="313" alt="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội"></a>
                        <a class="hidepc"><img src="<c:out value="${requestScope.detailnews.img}"></c:out>" width="572" height="408" alt="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội"></a>
                            <div class="subtitle">
                            <c:if test="${requestScope.detailnews.id_category == 1}">
                                <span style="background: #47b48d" class=" ebtn">
                                    Sự Kiện
                                </span>
                            </c:if>
                            <c:if test="${requestScope.detailnews.id_category == 2}">
                                <span style="background: #e04646" class=" ebtn">
                                    Thông báo
                                </span>
                            </c:if>
                            <span class="time"><c:out escapeXml="false" value="${requestScope.detailnews.create_at}"></c:out></span>
                            </div>
                            <div class="contentarticles">
                            <c:out escapeXml="false" value="${requestScope.detailnews.contents}"></c:out>
                            </div>
                        </div>
                        <!--End topnewsdetail-->
                        <!--Begin relatedarticles-->
                        <div class="relatedarticles">
                            <h3 class="newstitle">Các bài viết liên quan</h3>
                            <div class="contentnewslist">
                                <ul class="morenewslist">
                                <c:forEach items="${requestScope.listDetailNews}" var="news">
                                    <li>
                                        <div class="row">
                                            <div class="col col24 mcol100">
                                                <a class="hidesm" href="http://localhost:8084/co-well/news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                    <img class="mcol100 " src="<c:out value="${news.img}"></c:out>" width="157" height="112" alt="<c:out value="${news.title}"></c:out>">
                                                    </a>
                                                        <a class="hidepc" href="http://localhost:8084/co-well/news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                    <img class="mcol100 " src="" width="570" height="240" alt="<c:out value="${news.title}"></c:out>">
                                                    </a>
                                                </div>
                                                <div class="col col75 mcol100">
                                                    <div class="newsmedia">
                                                    <c:if test="${news.id_category == 1}">
                                                        <span style="background: #47b48d" class=" ebtn">
                                                            Sự Kiện
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${news.id_category == 2}">
                                                        <span style="background: #e04646" class=" ebtn">
                                                            Thông báo
                                                        </span>
                                                    </c:if>
                                                        <span class="time"><c:out value="${news.create_at}"></c:out> </span>
                                                    <h4><a href="http://localhost:8084/co-well/news/<c:out value="${news.id}"></c:out>" title="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">Thông báo về việc chính thức đổi tên thương mại sang "CO-WELL Châu Á"</a></h4>
                                                        <article class="hidesm">
                                                        <c:out value="${news.description}"></c:out>
                                                        </article>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!--End relatedarticles-->          
                </article>
                <!--End contents-->
                <!--Begin sidebar-->
                <aside class="col col30 sidebar mcol100">
                    <div class="sidebarbox">
                        <!--Begin latestnews-->
                        <div class="block latestnews">
                            <h3 class="newstitle">Tin tức Mới</h3>
                            <ul>
                                <c:forEach items="${requestScope.new_list}" var="news">
                                    <li><a href="http://localhost:8084/co-well/news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>"><c:out value="${news.title}"></c:out></a></li>
                                    </c:forEach>
                            </ul>
                            <a href="http://co-well.vn/news" title="" class="more fontbold">Xem thêm</a>
                        </div>
                        <!--End latestnews-->
                        <!--Begin sidebarrecruit-->
                        <div class="sidebarrecruit hidesm">
                            <a href="http://co-well.vn/recruitments">
                                <img src="http://co-well.vn/uploads/config/pc20160615_162014.jpg" alt="" width="303" height="336">
                            </a>
                        </div>
                        <!--End sidebarrecruit-->
                    </div>
                </aside>
                <!--End sidebar-->     

            </div>
        </div>
    </section>

</co-well:layout>
<%-- 
    Document   : News
    Created on : Nov 8, 2016, 2:32:46 PM
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
                    <!--Begin topnews-->
                    <div class="topnews" style="min-height: 76px;">
                        <a href="http://co-well.vn/news/detail/thong-bao-ve-viec-chinh-thuc-doi-ten-thuong-mai-sang" title="" class="hidesm"><img src="/baitap/resources/clients/images/full20160615_121650.jpg" width="762" height="313" alt="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;"></a>
                        <div class="bgnew">
                            <span class="datetime">30/06/2016</span>
                            <h3><a href="http://co-well.vn/news/detail/thong-bao-ve-viec-chinh-thuc-doi-ten-thuong-mai-sang" title="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">Thông báo về việc chính thức đổi tên thương mại sang "CO-WELL Châu Á"</a></h3>
                        </div>
                    </div>
                    <!--End topnews-->
                    <!--Begin contentnewslist-->
                    <div class="contentnewslist">
                        <ul class="morenewslist">
                            <c:forEach items="${requestScope.clientNews}" var="news">
                                <li>
                                    <div class="row">
                                        <div class="col col24 mcol100">
                                            <a class="hidesm" href="news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                <img class="mcol100 " src="<c:out value="${news.img}"></c:out>" width="157" height="112" alt="<c:out value="${news.title}"></c:out>">
                                                </a>
                                                    <a class="hidepc" href="news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                <img class="mcol100 " src="<c:out value="${news.img}"></c:out>" width="570" height="240" alt="<c:out value="${news.title}"></c:out>">
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
                                                <span class="time"><c:out value="${news.create_at}"></c:out></span>
                                                <h4><a href="news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                        <c:out value="${news.title}"></c:out>
                                                        </a>
                                                    </h4>
                                                    <article class="hidesm">
                                                    <c:out value="${news.description}"></c:out>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                            </c:forEach>
                            <c:forEach items="${requestScope.pageNews}" var="news">
                                <li>
                                    <div class="row">
                                        <div class="col col24 mcol100">
                                            <a class="hidesm" href="news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                <img class="mcol100 " src="<c:out value="${news.img}"></c:out>" width="157" height="112" alt="<c:out value="${news.title}"></c:out>">
                                                </a>
                                                    <a class="hidepc" href="news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                <img class="mcol100 " src="<c:out value="${news.img}"></c:out>" width="570" height="240" alt="<c:out value="${news.title}"></c:out>">
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
                                                <span class="time"><c:out value="${news.create_at}"></c:out></span>
                                                <h4><a href="http://localhost:8084/baitap/news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>">
                                                        <c:out value="${news.title}"></c:out>
                                                        </a>
                                                    </h4>
                                                    <article class="hidesm">
                                                    <c:out value="${news.description}"></c:out>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                            </c:forEach>
                        </ul>
                        <nav class="pagination">
                            <ul>
                                <c:forEach var="i" begin="1" end="${requestScope.numPage}">
                                    <li><a href="http://localhost:8084/baitap/news/page/<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a></li>
                                    </c:forEach>
                                <!--                                <li class="disabled aa"><a>Đầu</a></li>
                                                                <li class="disabled"><a class="back button"></a></li>
                                                                <li><a class="active">1</a></li>
                                                                <li><a href="http://co-well.vn/news?page=2">2</a></li>
                                                                <li><a href="http://co-well.vn/news?page=3">3</a></li>
                                                                <li><a href="http://co-well.vn/news?page=4">4</a></li>
                                                                <li><a href="http://co-well.vn/news?page=5">5</a></li>
                                                                <li><a href="http://co-well.vn/news?page=6">6</a></li>
                                                                <li><a href="http://co-well.vn/news?page=7">7</a></li>
                                                                <li><a href="http://co-well.vn/news?page=2" rel="next" class="next button"></a></li>
                                                                <li><a href="http://co-well.vn/news?page=7">Cuối</a></li>-->
                            </ul>
                        </nav>
                    </div>
                    <!--End contentnewslist-->
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
                                    <li><a href="http://localhost:8084/baitap/news/<c:out value="${news.id}"></c:out>" title="<c:out value="${news.title}"></c:out>"><c:out value="${news.title}"></c:out></a></li>
                                    </c:forEach>
                            </ul>
                            <a href="http://co-well.vn/news" title="" class="more fontbold">Xem thêm</a>
                        </div>
                        <!--End latestnews-->
                        <!--Begin sidebarrecruit-->
                        <div class="sidebarrecruit hidesm">
                            <a href="http://co-well.vn/recruitments">
                                <img src="/baitap/resources/clients/images/pc20160615_162014.jpg" alt="" width="303" height="336">
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
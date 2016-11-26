<%-- 
    Document   : DetailRecruitment
    Created on : Nov 10, 2016, 9:52:34 AM
    Author     : tuong
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co-well" tagdir="/WEB-INF/tags/clients" %>
<co-well:layout>
    <section class="recruitmentsdetail subpage region">
        <h2 class="textcenter fronttitle">Tuyển dụng</h2>
        <div class="wauto">
            <div class="boxsubpage">
                <div class="requirements">
                    <div class="main_recruit">
                        <div class="row recruit-content">
                            <div class="col col50 mcol100">
<!--                                <h3 class="title-hot">
                                    <a href="http://www.co-well.vn/recruitments/detail/lap-trinh-vien-perl" class="" title="Lập trình viên Perl">Lập trình viên Perl 
                                        <span class="hots">hot</span>
                                    </a></h3>-->
                                <!--<div class="fb-like fb_iframe_widget" data-href="http://www.co-well.vn/recruitments/detail/lap-trinh-vien-perl" data-layout="standard" data-action="like" data-size="small" data-show-faces="false" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=1464335853592075&amp;container_width=508&amp;href=http%3A%2F%2Fwww.co-well.vn%2Frecruitments%2Fdetail%2Flap-trinh-vien-perl&amp;layout=standard&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=false&amp;size=small"><span style="vertical-align: bottom; width: 450px; height: 20px;"><iframe name="f1dd07fc1e4fa34" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:like Facebook Social Plugin" src="./Lập trình viên Perl - CO-WELL Asia_files/like.html" style="border: none; visibility: visible; width: 450px; height: 20px;" class=""></iframe></span></div>-->
                                <div class="w100 dates">
                                    <span class="pleft since">Ngày đăng: <c:out value="${requestScope.clientRecDetail.start_recruitment}"></c:out></span>
                                    <span class="pleft exp">Hạn nộp: <c:out value="${requestScope.clientRecDetail.end_recruitment}"></c:out></span>
                                    </div>
                                    <div class="w100 check">
                                        <span class="num">Số lượng: 5</span>
                                        <span class="where">Nơi làm việc: <c:out value="${requestScope.clientRecDetail.address}"></c:out></span>
                                    </div>
                                    <div class="desc">
                                        <h3 class="rctitle">Mô tả công việc</h3>
                                        <ul>
                                        <c:out escapeXml="false" value="${requestScope.clientRecDetail.description}"></c:out>
                                        </ul>

                                    </div>
                                </div>
                                <div class="col col50 mcol100">
                                    <div class="fromsubmit textcenter">
                                        <a href="http://www.co-well.vn/recruitments/apply/49" class="btnsubmit" title="Ứng tuyển ngay">Ứng tuyển ngay</a>
                                        <a class="btnsubmit btn2" href="http://www.co-well.vn/recruitments" title="Xem tất cả">Xem tất cả</a>
                                    </div>
                                    <div class="joblist">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="more_recruit">
                            <div class="row">
                                <div class="col col50 mcol100">
                                    <div class="desc mrcontent">
                                        <h3 class="rctitle">Yêu cầu</h3>
                                        <ul>
                                        <c:out escapeXml="false" value="${requestScope.clientRecDetail.requirement}"></c:out>
                                        </ul>

                                    </div>
                                </div>
                                <div class="col col50 mcol100">
                                    <div class="desc mrcontent">
                                        <h3 class="rctitle">Quyền lợi và thu nhập</h3>
                                        <ul>
                                        <c:out escapeXml="false" value="${requestScope.clientRecDetail.interest}"></c:out>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="other_recruitment">
                        <div class="row">
                            <!--Begin contents-->
                            <article class="col col69 contents mcol100">
                                <h3 class="newstitle">Các tuyển dụng khác</h3>
                                <!--Begin contentnewslist-->
                                <div class="recruit-content">
                                    <ul>
                                    <c:forEach items="${requestScope.listRecDetail}" var="list">
                                        <li class="mcol100">
                                            <h3><a title="Lập trình viên Java" class="title-urgent" href="http://localhost:8084/co-well/recruitment/<c:out value="${list.id}"></c:out>"><c:out value="${list.name}"></c:out>
                                                    <span class="urgent">Urgent</span></a>
                                            </h3>
                                            <div class="w100 dates">
                                                <span class="pleft since ">Ngày đăng: <c:out value="${list.start_recruitment}"></c:out></span>
                                                <span class="pleft exp">Hạn nộp: <c:out value="${list.end_recruitment}"></c:out></span>
                                            </div>
                                            
                                            <c:out value="${list.summary}"></c:out>
                                            <div class="tags">
                                            </div>
                                        </li>
                                    </c:forEach>

                                </ul>
                                <a href="http://localhost:8084/co-well/recruitment" title="Xem tất cả" class="viewall textcenter">Xem tất cả</a>
                            </div>
                            <!--End contentnewslist-->
                        </article>
                        <!--End contents-->
                        <!--Begin sidebar-->
                        <aside class="col col30 sidebar hidesm">
                            <div class="sidebarbox">

                                <!--Begin sidebarrecruit-->
                                <div class="sidebarrecruit hidesm">
                                    <a href="http://co-well.vn/recruitments/apply">
                                        <img src="./Lập trình viên Perl - CO-WELL Asia_files/pc20160615_153235.jpg" alt="apply now" width="303" height="357">
                                    </a>
                                </div>      <!--End sidebarrecruit-->
                            </div>
                        </aside>
                        <!--End sidebar-->
                    </div>
                </div></div>
        </div>
    </section>
</co-well:layout>
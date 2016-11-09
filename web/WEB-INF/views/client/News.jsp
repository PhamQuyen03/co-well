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

                            <!--                            <li>
                                                            <div class="row">
                                                                <div class="col col24 mcol100">
                                                                    <a class="hidesm" href="http://co-well.vn/news/detail/thong-bao-hoan-thanh-viec-mo-rong-va-cai-tao-tang-6-trung-tam-phat-trien-tai-ha-noi" title="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội">
                                                                        <img class="mcol100 " src="http://co-well.vn/uploads/posts/intro20160812_152549-image(157x122-crop).JPG" width="157" height="112" alt="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội">
                                                                    </a>
                                                                    <a class="hidepc" href="http://co-well.vn/news/detail/thong-bao-hoan-thanh-viec-mo-rong-va-cai-tao-tang-6-trung-tam-phat-trien-tai-ha-noi" title="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội">
                                                                        <img class="mcol100 " src="http://co-well.vn/uploads/posts/mb20160812_152552-image(570x240-crop).JPG" width="570" height="240" alt="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội">
                                                                    </a>
                                                                </div>
                                                                <div class="col col75 mcol100">
                                                                    <div class="newsmedia">
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
                            <span class="time">12/08/2016 </span>
                            <h4><a href="http://co-well.vn/news/detail/thong-bao-hoan-thanh-viec-mo-rong-va-cai-tao-tang-6-trung-tam-phat-trien-tai-ha-noi" title="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội">
                                    Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội
                                </a>
                            </h4>
                            <article class="hidesm">
                                CO-WELL Asia chính thức đưa tầng 6 của tòa nhà 3D vào sử dụng, nâng tổng diện tích văn phòng tại Hà Nội lên tới 1800m2.
                            </article>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="row">
                    <div class="col col24 mcol100">
                        <a class="hidesm" href="http://co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                            <img class="mcol100 " src="http://co-well.vn/uploads/posts/intro20160812_102154-image(157x122-crop).jpg" width="157" height="112" alt="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                        </a>
                        <a class="hidepc" href="http://co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                            <img class="mcol100 " src="http://co-well.vn/uploads/posts/mb20160812_102154-image(570x240-crop).jpg" width="570" height="240" alt="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                        </a>
                    </div>
                    <div class="col col75 mcol100">
                        <div class="newsmedia">
                            <span style="background: #e04646" class=" ebtn">
                                Thông báo
                            </span>
                            <span class="time">08/08/2016 </span>
                            <h4><a href="http://co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                                    Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng
                                </a>
                            </h4>
                            <article class="hidesm">
                                Để đáp ứng nhu cầu mở rộng và phát triển, tăng quy mô nhân sự tại thành phố Đà Nẵng, CO-WELL Asia đã chính thức di chuyển văn phòng chi nhánh tại Đà Nẵng sang tòa nhà Vĩnh Trung Plaza.
                            </article>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="row">
                    <div class="col col24 mcol100">
                        <a class="hidesm" href="http://co-well.vn/news/detail/co-well-summer-holiday-2016-ky-nghi-soi-dong-cua-dai-gia-dinh-co-well-asia" title="CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia">
                            <img class="mcol100 " src="http://co-well.vn/uploads/posts/intro20160729_150833-image(157x122-crop).jpg" width="157" height="112" alt="CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia">
                        </a>
                        <a class="hidepc" href="http://co-well.vn/news/detail/co-well-summer-holiday-2016-ky-nghi-soi-dong-cua-dai-gia-dinh-co-well-asia" title="CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia">
                            <img class="mcol100 " src="http://co-well.vn/uploads/posts/mb20160729_150833-image(570x240-crop).jpg" width="570" height="240" alt="CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia">
                        </a>
                    </div>
                    <div class="col col75 mcol100">
                        <div class="newsmedia">
                            <span style="background: #47b48d" class=" ebtn">
                                Sự kiện
                            </span>
                            <span style="background: #eb9446" class=" ebtn">
                                Hoạt động
                            </span>
                            <span class="time">29/07/2016 </span>
                            <h4><a href="http://co-well.vn/news/detail/co-well-summer-holiday-2016-ky-nghi-soi-dong-cua-dai-gia-dinh-co-well-asia" title="CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia">
                                    CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia
                                </a>
                            </h4>
                            <article class="hidesm">
                                Summer Holiday là một trong những hoạt động được các CO-WELLers và người thân háo hứng mong đợi nhất trong năm. Đây là hoạt động được tổ chức định kỳ của CO-WELL thể hiện sự quan tâm của Công ty tới đời sống CBNV và gia đình. Thông qua chương...
                            </article>
                        </div>
                    </div>
                </div>
            </li>-->
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
                                <li><a href="http://co-well.vn/news/detail/thong-bao-hoan-thanh-viec-mo-rong-va-cai-tao-tang-6-trung-tam-phat-trien-tai-ha-noi" title="Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội">Thông báo hoàn thành việc mở rộng và cải tạo tầng 6 trung tâm phát triển tại Hà Nội</a></li>
                                <li><a href="http://co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng</a></li>
                                <li><a href="http://co-well.vn/news/detail/co-well-summer-holiday-2016-ky-nghi-soi-dong-cua-dai-gia-dinh-co-well-asia" title="CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia">CO-WELL Summer Holiday 2016 – Kỳ nghỉ sôi động của đại gia đình CO-WELL Asia</a></li>
                                <li><a href="http://co-well.vn/news/detail/division-2-dang-quang-chuc-vo-dich-co-well-divisions-cup-2016" title="Division 2  đăng quang chức vô địch CO-WELL Divisions Cup 2016">Division 2  đăng quang chức vô địch CO-WELL Divisions Cup 2016</a></li>
                                <li><a href="http://co-well.vn/news/detail/co-well-asia-khai-giang-khoa-dao-tao-dinh-huong-nghe-kiem-thu-phan-mem-qatester-he-2016" title="CO-WELL Asia khai giảng khóa đào tạo &quot;Định hướng nghề Kiểm thử phần mềm QA/Tester&quot; hè 2016">CO-WELL Asia khai giảng khóa đào tạo "Định hướng nghề Kiểm thử phần mềm QA/Tester" hè 2016</a></li>
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
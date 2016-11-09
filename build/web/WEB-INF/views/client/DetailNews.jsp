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
                                <span style="background: #e04646" class="ebtn">
                                    Thông báo
                                </span>
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
                                    <li>
                                        <div class="row">
                                            <div class="col col24 mcol100">
                                                <a class="hidesm" href="http://www.co-well.vn/news/detail/thong-bao-ve-viec-chinh-thuc-doi-ten-thuong-mai-sang" title="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">
                                                    <img class="mcol100 " src="" width="157" height="112" alt="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">
                                                </a>
                                                <a class="hidepc" href="http://www.co-well.vn/news/detail/thong-bao-ve-viec-chinh-thuc-doi-ten-thuong-mai-sang" title="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">
                                                    <img class="mcol100 " src="" width="570" height="240" alt="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">
                                                </a>
                                            </div>
                                            <div class="col col75 mcol100">
                                                <div class="newsmedia">
                                                    <span style="background: #e04646" class=" ebtn">
                                                        Thông báo
                                                    </span>
                                                    <span style="background: #47b48d" class=" ebtn">
                                                        Sự kiện
                                                    </span>
                                                    <span class="time">30/06/2016 </span>
                                                    <h4><a href="http://www.co-well.vn/news/detail/thong-bao-ve-viec-chinh-thuc-doi-ten-thuong-mai-sang" title="Thông báo về việc chính thức đổi tên thương mại sang &quot;CO-WELL Châu Á&quot;">Thông báo về việc chính thức đổi tên thương mại sang "CO-WELL Châu Á"</a></h4>
                                                    <article class="hidesm">
                                                        <p>CO-WELL&nbsp;Châu Á xin trân trọng thông báo đã chính thức hoàn tất quy trình&nbsp;đổi tên thương mại từ&nbsp;"SETA International Châu Á" sang "CO-WELL Châu Á".</p>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row">
                                            <div class="col col24 mcol100">
                                                <a class="hidesm" href="http://www.co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                                                    <img class="mcol100 " src="" width="157" height="112" alt="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                                                </a>
                                                <a class="hidepc" href="http://www.co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                                                    <img class="mcol100 " src="" width="570" height="240" alt="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">
                                                </a>
                                            </div>
                                            <div class="col col75 mcol100">
                                                <div class="newsmedia">
                                                    <span style="background: #e04646" class=" ebtn">
                                                        Thông báo
                                                    </span>
                                                    <span class="time">08/08/2016 </span>
                                                    <h4><a href="http://www.co-well.vn/news/detail/thong-bao-ve-viec-thay-doi-dia-chi-van-phong-chi-nhanh-da-nang" title="Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng">Thông báo về việc thay đổi địa chỉ văn phòng chi nhánh Đà Nẵng</a></h4>
                                                    <article class="hidesm">
                                                        <p>Để đáp ứng nhu cầu mở rộng và phát triển, tăng quy mô nhân sự tại thành phố Đà Nẵng, CO-WELL Asia đã chính thức di chuyển văn phòng chi nhánh tại Đà Nẵng sang tòa nhà Vĩnh Trung Plaza.</p>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
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
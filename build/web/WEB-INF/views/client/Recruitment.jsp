<%-- 
    Document   : Recruitment
    Created on : Nov 9, 2016, 5:34:19 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co-well" tagdir="/WEB-INF/tags/clients" %>
<co-well:layout>
    <section class="recruitmentslist subpage region">
        <h2 class="textcenter fronttitle">Tuyển dụng</h2>
        <div class="wauto">
            <div class="row boxsubpage">
                <!--Begin contents-->
                <article class="col col69 mcol100 contents">
                    <form class="recruitment_form">

                        <input type="text" id="job_title" name="job_title" class="select-position nobg ui-autocomplete-input" placeholder="Nhập vị trí ứng tuyển" value="" autocomplete="off">
                        <select class="select-time" name="job_time">
                            <option value="all">- Tất cả -</option>
                            <option value="1">1 tháng gần nhất</option>
                            <option value="2">3 tháng gần nhất</option>
                            <option value="3">6 tháng gần nhất</option>
                            <option value="4">1 năm gần nhất</option>
                        </select>
                        <button class="btnselect">Tìm kiếm</button>
                    </form>

                    <!--Begin contentnewslist-->
                    <div class="contentnewslist ">
                        <form class="">
                            <button name="refresh" value="job" class="btnsubmit btnurgent textcenter">Refresh</button>
                        </form>
                        <div class="recruit-content row ">
                            <ul class="col col100 ">
                                <c:forEach items="${requestScope.clientRec}" var="rec">
                                    <li class="col col100 mcol100">
                                        <div class="pleft col74 mcol100">
                                            <h3><a class="" title="Web Designer" href="http://localhost:8084/baitap/recruitment/<c:out value="${rec.id}"></c:out>">
                                                    <c:out value="${rec.name}"></c:out>
                                                        <i class="expired"></i>
                                                    </a></h3>
                                                <div class="w100 dates">
                                                    <span class="pleft since">Ngày đăng: <c:out value="${rec.start_recruitment}"></c:out></span>
                                                <span class="pleft exp">Hạn nộp: <c:out value="${rec.end_recruitment}"></c:out></span>
                                                </div>
                                                <p>
                                                <c:out value="${rec.summary}"></c:out>

                                                </p>
                                                <div class="tags">
                                                </div>
                                            </div>
                                            <div class="pright col25 hidesm avt">
                                            </div>
                                        </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <nav class="pagination">
                            <ul>
                                <c:forEach begin="1" end="${requestScope.numRec}" var="i">
                                    <li><a href="http://localhost:8084/baitap/recruitment/page/<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <!--End contentnewslist-->
                </article>
                <!--End contents-->
                <!--Begin sidebar-->
                <aside class="col col30 mcol100 sidebar">
                    <div class="sidebarbox">
                        <!--Begin latestnews-->
                        <div class="block latestnews">
                            <h3 class="newstitle">Tin tức Mới</h3>
                            <ul>
                                <li><a href="http://www.co-well.vn/news/detail/co-well-asia-chao-don-sinh-vien-khoa-ngon-ngu-va-van-hoa-nhat-ban-truong-dhnn-dhqghn-den-tham-quan-tru-so-cong-ty" title="CO-WELL ASIA chào đón sinh viên Khoa Ngôn ngữ và Văn hóa Nhật Bản – Trường ĐHNN – ĐHQGHN đến thăm quan trụ sở công ty">CO-WELL ASIA chào đón sinh viên Khoa Ngôn ngữ và Văn hóa Nhật Bản – Trường ĐHNN – ĐHQGHN đến thăm quan trụ sở công ty</a></li>
                                <li><a href="http://www.co-well.vn/news/detail/da-nang-sieu-bao-tuyen-sinh-thang-10-cho-khoa-hoc-qatester-orientation" title="[ĐÀ NẴNG] SIÊU BÃO TUYỂN SINH THÁNG 10 CHO KHOÁ HỌC QA/TESTER ORIENTATION  ">[ĐÀ NẴNG] SIÊU BÃO TUYỂN SINH THÁNG 10 CHO KHOÁ HỌC QA/TESTER ORIENTATION  </a></li>
                                <li><a href="http://www.co-well.vn/news/detail/co-well-hao-hung-tham-du-ngay-hoi-google-day-x-2016" title="CO-WELL  HÀO HỨNG THAM DỰ GOOGLE DAY X 2016">CO-WELL  HÀO HỨNG THAM DỰ GOOGLE DAY X 2016</a></li>
                                <li><a href="http://www.co-well.vn/news/detail/co-well-japan-tham-du-hoi-nghi-chuyen-de-gartner-itxpo-2016" title="CO-WELL JAPAN THAM DỰ HỘI NGHỊ CHUYÊN ĐỀ GARTNER ITXPO 2016">CO-WELL JAPAN THAM DỰ HỘI NGHỊ CHUYÊN ĐỀ GARTNER ITXPO 2016</a></li>
                                <li><a href="http://www.co-well.vn/news/detail/co-well-asia-to-chuc-ki-thi-lay-chung-chi-istqb-cho-cac-vi-tri-qatester-trong-va-ngoai-cong-ty" title="CO-WELL ASIA TỔ CHỨC KÌ THI LẤY CHỨNG CHỈ ISTQB.">CO-WELL ASIA TỔ CHỨC KÌ THI LẤY CHỨNG CHỈ ISTQB.</a></li>
                            </ul>
                            <a href="http://www.co-well.vn/news" title="" class="more fontbold">Xem thêm</a>
                        </div>
                        <!--End latestnews-->
                        <!--Begin sidebarrecruit-->
                        <div class="sidebarrecruit hidesm">
                            <a href="http://co-well.vn/recruitments/apply">
                                <img src="./Tuyển dụng - CO-WELL Asia_files/pc20160615_153235.jpg" alt="apply now" width="303" height="357">
                            </a>
                        </div>        <!--End sidebarrecruit-->
                    </div>
                </aside>
                <!--End sidebar-->      
            </div>
        </div>
    </section>
    <!-- End newslist -->
    <!-- Begin Footer -->
</co-well:layout>

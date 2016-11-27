<%-- 
    Document   : Contact
    Created on : Nov 25, 2016, 5:00:24 PM
    Author     : tuong
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co-well" tagdir="/WEB-INF/tags/clients" %>
<co-well:layout>
    <section class="subpage recruitform region">
        <h2 class="textcenter fronttitle">Liên Hệ</h2>
        <div class="wauto">
            <div class="boxsubpage sttpage">
                <div class="requirements">
                    <h3 class="recruittitle">Hãy gửi thông tin liên hệ cho chúng tôi:</h3>
                    <form class="contact-action formstt" method="post" action="http://localhost:8084/co-well/contact">
                        <input type="hidden" name="_token" value="73YCxeOpn92JrrDsWKprzRH1cLHrPoV8DWmECDvC">
<!--                        <ul class="row">
                            <li class="col col33 mcol100 ">
                                <div class="wpr active first">
                                    <b class="pleft">1</b>
                                    <span>Nhập thông tin</span>
                                </div>
                            </li>
                            <li class="col col33 mcol100">
                                <div class="wpr">
                                    <b class="pleft">2</b>
                                    <span>Xác nhận thông tin</span>
                                </div>
                            </li>
                            <li class="col col33 mcol100">
                                <div class="wpr">
                                    <b class="pleft">3</b>
                                    <span>Hoàn thành</span>
                                </div>
                            </li>
                        </ul>-->

                        <div class="form-group">
                            <div class="formlabel">
                                <label for="name">Họ và tên<span>*</span></label>
                                <input id="cname" name="name" minlength="3" type="text" required pattern=".{3,}" title="thông tin cần dài hơn 2 ki tự">
                            </div>

                            <div class="formlabel">
                                <label for="company">Công ty</label>
                                <input name="company" id="company" type="text" value="">
                            </div>

                            <div class="formlabel">
                                <label for="email">Email<span>*</span></label>
                                <input name="email" id="email" type="email" minlength="5" required pattern=".{5,}" title="thông tin cần dài hơn 4 ki tự">
                            </div>

                            <div class="formlabel">
                                <label for="phone">Số điện thoại<span>*</span></label>
                                <input name="phone" id="phone" minlength="10" type="text" required pattern="[a-zA-Z0-9\s]+" title="thông tin cần dài hơn 9 ki tự">
                            </div>
                            <div class="formlabel formselect">
                                <label for="position">Liên hệ tới</label>
                                <div class="groupselect">
                                    <div class="select">
                                        <!--span class="select">Chọn vị trí ứng tuyển</span-->
                                        <select name="position" id="position">
                                            <!--<option value="0" selected="">Chọn vị trí liên hệ</option>-->
                                            <option value="Bộ phận sales">Bộ phận sales</option>
                                            <option value="Bộ phận tuyển dụng">Bộ phận tuyển dụng</option>
                                            <option value="Bộ phận khác">Bộ phận khác</option>
                                        </select>

                                    </div>
                                </div>
                            </div>

                            <div class="formlabel formaria">
                                <label for="aboutme">Nội dung</label>
                                <textarea name="aboutme" id="aboutme"></textarea>
                            </div>

                        </div>

                        <!-- <input type="submit" class="btnsubmit" value="Xác nhận"> -->
                        <button class="btnsubmit">Xác nhận</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</co-well:layout>
<%-- 
    Document   : layout
    Created on : Oct 19, 2016, 1:01:57 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    tinymce.init({
        selector: '.myTextarea',
        theme: 'modern',
        width: 600,
        height: 300,
        plugins: [
            'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
            'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
            'save table contextmenu directionality emoticons template paste textcolor'
        ],
        toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons | fontsizeselect',
        fontsize_formats: '8pt 10pt 12pt 13pt 14pt 15pt 16pt 17pt 18pt 19pt 20pt 21pt 22pt 23pt 24pt 25pt 26pt 27pt 28pt 29pt 30pt 32pt 34pt 36pt'
    });
</script>
<div class="panel-body">
    <form method="post" action="http://localhost:8084/co-well/support/recruitment/edit">
        <input class="form-control" name="id" type="hidden" value="<c:out value="${requestScope.recEdit.id}"></c:out>">
            <div class="form-group">
                <label style="font-size:  15pt; align-content: center;">Tên</label>
                <input class="form-control" name="nameRec" type="text" value="<c:out value="${requestScope.recEdit.name}"></c:out>" style="text-align: center;font-size: 15pt;width: 600px">
            </div><br>
            <div class="form-group">
                <label for="Header">Tóm Tắt</label><br>
                <textarea class="form-control" name="summary" rows="3" style="width: 600px"><c:out value="${requestScope.recEdit.summary}"></c:out></textarea>
            </div><br>
            <div class="form-group">
                <label for="Header">Mô Tả</label><br>
                <textarea class="myTextarea" name="descriptionRec"><c:out value="${requestScope.recEdit.description}"></c:out></textarea>
            </div><br>
            <div class="form-group">
                <label for="Header">Yêu Cầu</label><br>
                <textarea class="myTextarea" name="requirementRec"><c:out value="${requestScope.recEdit.requirement}"></c:out></textarea>
            </div><br>
            <div class="form-group">
                <label for="Header">Quyền Lợi</label><br>
                <textarea class="myTextarea" name="interestRec"><c:out value="${requestScope.recEdit.interest}"></c:out></textarea>
            </div><br>
            <div class="form-group">
                <label style="font-size:  15pt; align-content: center;">Địa Chỉ</label>
                <input class="form-control" name="addressRec" value="<c:out value="${requestScope.recEdit.address}"></c:out>" type="text" style="text-align: center;font-size: 15pt;width: 600px">
            </div><br>
            <div style="left: 630px; position: absolute;top: 200px; width: 300px">
                <div>
                    <label>Thể Loại</label>  : 
                    <select style="margin-left: 24px" name="category">
                    <c:forEach items="${requestScope.categoryRec}" var="category">
                        <c:if test="${category.id == requestScope.recEdit.category}">
                            <option selected="selected" value="${category.id}">${category.name}</option>
                        </c:if>
                        <c:if test="${category.id != requestScope.recEdit.category}">
                            <option value="${category.id}">${category.name}</option>
                        </c:if>
                    </c:forEach>
                </select><br>
                <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_atRc" value="<c:out value="${requestScope.recEdit.create_at}"></c:out>"/><br>
                <label>Ngày Nhận</label>: <input style="margin-left: 13px" type="date" name="start_recruitmentRec" value="<c:out value="${requestScope.recEdit.start_recruitment}"></c:out>"/><br>
                <label>Kết Thúc</label>: <input style="margin-left: 26px" type="date" name="end_recruitmentRec" value="<c:out value="${requestScope.recEdit.end_recruitment}"></c:out>"/><br><br>
                    <label>Trạng Thái</label> : 
                    <select style="margin-left: 10px" name="statusRec">
                    <c:forEach items="${requestScope.status}" var="status">
                        <c:if test="${status.id == requestScope.recEdit.status}">
                            <option selected="selected" value="${status.id}">${status.name}</option>
                        </c:if>
                        <c:if test="${status.id != requestScope.recEdit.status}">
                            <option value="${status.id}">${status.name}</option>
                        </c:if>
                    </c:forEach>
                </select><br>
            </div>
            <br>
            <input style="margin-left: 95px" type="submit" value="Sửa Thông Tin"/>
        </div>
    </form>
</div>
<!--<div id="froala-editor"></div>-->
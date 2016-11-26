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
    <form method="post" action="http://localhost:8084/co-well/support/about/edit">
        <input class="form-control" name="id" value="${requestScope.aboutEdit.id}" type="hidden" >
        <div class="form-group">
            <label style="font-size:  15pt; align-content: center;">Tiêu Đề</label>
            <input class="form-control" name="titleAbout" value="${requestScope.aboutEdit.title}" type="text" style="text-align: center;font-size: 15pt;width: 600px">
        </div><br>
        <div class="form-group">
            <label for="Header">Nội Dung</label><br>
            <textarea class="myTextarea" name="contentAbout">${requestScope.aboutEdit.contents}</textarea>
        </div><br>

        <div style="left: 630px; position: absolute;top: 200px; width: 300px">
            <div>
                <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" value="${requestScope.aboutEdit.create_at}" name="create_atAbout"/><br>
                <label>Ngày Sửa</label>: <input style="margin-left: 22px" type="date" value="${requestScope.aboutEdit.update_at}" name="update_atAbout"/><br><br>
                <label>Trạng Thái</label> : 
                <select style="margin-left: 10px" name="statusAbout">
                    <c:forEach items="${requestScope.status}" var="status">
                        <c:if test="${status.id == requestScope.aboutEdit.status}">
                            <option selected="selected" value="${status.id}">${status.name}</option>
                        </c:if>
                        <c:if test="${status.id != requestScope.aboutEdit.status}">
                            <option value="${status.id}">${status.name}</option>
                        </c:if>
                    </c:forEach>
                </select><br>
            </div>
            <br>
            <input style="margin-left: 95px" type="submit" value="Sửa thông tin"/>
        </div>
    </form>
</div>




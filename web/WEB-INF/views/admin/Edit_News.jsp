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
    <form style="margin-left: 10px;" method="post" action="http://localhost:8084/baitap/support/news/edit">
        <input class="form-control" name="id" type="hidden" value="${requestScope.detail.id}" >
        <div class="form-group">
            <label style="font-size: 15pt; align-content: center;">Tiêu Đề</label>
            <input class="form-control" name="title" type="text" value="${requestScope.detail.title}" style="text-align: center;font-size: 15pt;width: 600px;">
        </div><br>
        <div class="form-group">
            <label for="Header">Mô Tả</label><br>
            <textarea class="form-control" name="description" rows="3" style="width: 600px">${requestScope.detail.description}</textarea>
        </div><br>
        <div class="form-group">
            <label for="Header">Nội Dung</label><br>
            <textarea class="myTextarea" name="contents">${requestScope.detail.contents}</textarea>
        </div><br>
        <div class="form-group">
            <label style="font-size:  15pt; align-content: center;">Image</label>
            <input class="form-control" name="img" value="${requestScope.detail.img}" type="text" style="text-align: center;font-size: 15pt;width: 400px">
        </div><br>
        <div class="form-group">
            <label style="font-size:  15pt; align-content: center;">Author</label>
            <input class="form-control" name="author" type="text" value="${requestScope.detail.author}" style="text-align: center;font-size: 15pt;width: 200px">
        </div><br>
        <div style="left: 630px; position: absolute;top: 200px; width: 300px">
            <div style="">
                <label>Ngày Tạo</label> : <input style="margin-left: 19px" type="date" name="create_at" value="${requestScope.detail.create_at}"/><br>
                <label>Ngày Sửa</label>: <input style="margin-left: 22px" type="date" name="update_at" value="${requestScope.detail.update_at}"/><br><br>
                <label>Thể Loại</label> : 
                <select style="margin-left: 22px" name="id_category">
                    <option value="1">Sự Kiện</option>
                    <option value="2">Thông Báo</option>
                </select><br>
                <label>Trạng Thái</label> : 
                <select style="margin-left: 10px" name="status">
                    <option value="2">Đợi</option>
                    <option value="1">Đăng</option>
                </select><br>
            </div>
            <br>
            <input style="margin-left: 95px" type="submit" value="Sửa thông tin"/>
        </div>
    </form>
</div>

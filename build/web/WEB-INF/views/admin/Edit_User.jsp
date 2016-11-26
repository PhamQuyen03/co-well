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

<form style="width: 600px; margin-left: 150px;" method="post" action="http://localhost:8084/co-well/User/edit">

    <!--<div class="form-group" hidden="true">-->

    <input class="form-control" name="userid" value="${requestScope.edit_user.id}" type="hidden">
    <!--</div>-->
    <div class="form-group">
        <label>TÊN NGƯỜI DÙNG</label>
        <input class="form-control" name="Username_edit" placeholder="Enter Username" value="${requestScope.edit_user.name}">
    </div>
    <div class="form-group">
        <label>Email</label>
        <input class="form-control" type="email" name="email_edit" placeholder="Enter Username" value="${requestScope.edit_user.email}">
    </div>
    <div class="form-group">
        <label>MẬT KHẨU</label>
        <input class="form-control" name="Password_edit" placeholder="Enter Password" value="${requestScope.edit_user.password}">
    </div>
    <div style="">
        <label>PHÂN QUYỀN</label> : 
        <select name="Role_edit">
            <option value="1">Admin</option>
            <option value="2">Support</option>
        </select><br>
    </div>
    <br><br>
    <input type="submit" value="Sửa thông tin"/>
</form>

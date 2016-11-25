<%-- 
    Document   : ContentAdmin
    Created on : Nov 23, 2016, 2:45:51 PM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach items="${requestScope.listUser}" var="user">
    <tr id="<c:out value="${user.id}"/>" class="odd gradeX">
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/> </td>
        <td><c:out value="${user.password}"/> </td>
        <td><c:out value="${user.role}"/> </td>
        <td><c:out value="${user.id}"/> </td>
        <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${user.id}">EDIT</button></td>
        <td><input class="deleteRow btn btn-danger" type="submit" data-id="${user.id}" value="DELETE"></td>
    </tr>
</c:forEach>

<script>
    $(".deleteRow").click(function () {
        var id = $(this).attr("data-id");
        var confirmation = confirm("Bạn có chắc muốn tiếp tục xóa");
        if(confirmation) {
            $.ajax({
            url: "deleteAd",
            type: "post",
            data: {id: id},
            success: function (data) {
                $("#" + id).remove();
            }
        });
        }
    });
</script>
</script>

<script>
    $(".eitdRow").click(function () {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "User/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
                //                    $(".img-detail").html('<p>waitting......</p>')
            },
            success: function (html) {
                $(".editmodal-body").html(html);
            }
        });
    });
</script>


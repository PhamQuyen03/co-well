<%-- 
    Document   : Content_Recruitment
    Created on : Nov 23, 2016, 9:06:54 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:forEach items="${requestScope.news}" var="ns">
    <tr id="${ns.id}" class="odd gradeX">
        <td><c:out value="${ns.id}"/></td>
        <td><c:out value="${ns.title}"/></td>
        <td><c:out value="${ns.description}"/></td>
        <td><c:out escapeXml="false" value="${ns.contents}"/></td>
        <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${ns.id}">SỬA</button></td>
        <td><input class="deleteRow btn btn-danger" type="submit" data-id="${ns.id}" value="XÓA"></td>

    </tr>
</c:forEach>
<script>
    $(".deleteRow").click(function () {
        var id = $(this).attr("data-id");
        var confirmation = confirm("Bạn có chắc muốn tiếp tục xóa");
        if(confirmation)
        {
            $.ajax({
            url: "delete",
            type: "post",
            data: {id: id},
            success: function (data) {
                $("#" + id).remove();
            }
        });
        }
        
    });
</script>
<script>
    $(".eitdRow").click(function () {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "support/news/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
                $(".editmodal-body").html('<h4>bạn có thể chờ một chút</h4>');
            },
            success: function (html) {
                $(".editmodal-body").html(html);
            }
        });
    });
</script>
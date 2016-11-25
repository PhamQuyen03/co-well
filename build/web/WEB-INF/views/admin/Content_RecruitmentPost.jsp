<%-- 
    Document   : Content_Recruitment
    Created on : Nov 23, 2016, 9:06:54 AM
    Author     : tuong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach items="${requestScope.recsPost}" var="rec">
    <tr id="${rec.id}" class="odd gradeX">
        <td><c:out value="${rec.id}"></c:out></td>
        <td><c:out value="${rec.name}"></c:out></td>
        <td><c:out value="${rec.summary}"></c:out></td>
        <td><c:out escapeXml="false" value="${rec.requirement}"></c:out></td>
        <td><c:out escapeXml="false" value="${rec.interest}"></c:out></td>
        <!--<td><a href="recruitment/<c:out value="${rec.id}"/>">Edit</a></td>-->
        <td><button type="button" class="eitdRow btn btn-info" data-toggle="modal" data-target="#editModal" data-id="${rec.id}">EDIT</button></td>
        <td><input class="deleteRow btn btn-danger" type="submit" data-id="${rec.id}" value="DELETE"></td>
    </tr>
</c:forEach>
<script>
    $(".eitdRow").click(function () {
        var id = $(this).attr("data-id");
        $.ajax({
            url: "recruitment/edit",
            type: "get",
            data: {id: id},
            dataType: "html",
            beforSend: function () {
            },
            success: function (html) {
                $(".editmodal-body").html(html);

            }
        });
    });
</script>
<script>
    $(".deleteRow").click(function () {
        var id = $(this).attr("data-id");
        var confirmation = confirm("Bạn có chắc muốn tiếp tục xóa");
        if (confirmation) {
            $.ajax({
                url: "recruitment/deletRe",
                type: "post",
                data: {idRe: id},
                beforSend: function () {
                    //                    $(".img-detail").html('<p>waitting......</p>')
                },
                success: function (data) {
                    $("#" + id).remove();
                    //                    $(".img-detail").html(data)
                }
            });
        }

    });
</script>

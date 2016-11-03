<%-- 
    Document   : LoadUserAjax
    Created on : Oct 26, 2016, 10:10:57 PM
    Author     : tuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="co" tagdir="/WEB-INF/tags/" %>

<c:forEach items="${requestScope.userList}" var="user">
    <tr id="<c:out value="${user.id}"/>" class="odd gradeX">
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.password}"/> </td>
        <td><c:out value="${user.role}"/> </td>
        <td><c:out value="${user.id}"/> </td>
        <td class="center">X</td>
        <td class="center"><a href="User/<c:out value="${user.id}"/>">Edit</a></td>
        <td><input class="deleteRow" type="submit" data-id="${user.id}" value="DELETE"></td>
    </tr>
</c:forEach>
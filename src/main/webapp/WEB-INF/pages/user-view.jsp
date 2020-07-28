<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Clinic</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
</head>
<body>
<c:import url="fragment/heder.jsp"/>
<div class="container border rounded border-dark bg-light p-5 mt-5">
    <div class="row">
        <div class="col-12 text-center">
            <h3>Users view</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-bordered mt-3">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <jsp:useBean id="user" type="org.elinext.task.model.User"/>
                    <tr>
                        <th scope="row">${user.userId}</th>
                        <td>${user.name}</td>
                        <td>${user.surname}</td>
                        <td>${user.userRole.name()}</td>
                        <td>
                            <div class="align-content-center">
                                <form name="createUserForm" action="${pageContext.request.contextPath}/save-user"
                                      method="GET" class="d-inline">
                                    <input type="hidden" name="userId" value="${user.userId}"/>
                                    <input type="hidden" name="name" value="${user.name}"/>
                                    <input type="hidden" name="surname" value="${user.surname}"/>
                                    <input type="hidden" name="userRole" value="${user.userRole}"/>
                                    <button type="submit" class="btn btn-primary">UPDATE</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/delete-user?userId=${user.userId}"
                                   class="btn btn-danger">DELETE</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<c:import url="fragment/footer.jsp"/>

<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"/>"></script>

</body>
</html>

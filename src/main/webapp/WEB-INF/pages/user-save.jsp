<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Clinic</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
</head>
<body>
<c:import url="fragment/heder.jsp"/>
<div class="container border rounded border-dark bg-light p-5 mt-5 min-vh-100">
    <div class="row">
        <div class="col-12 text-center">
            <h3>Save user</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <form:form name="createUserForm" action="${pageContext.request.contextPath}/save-user" method="POST" accept-charset="UTF-8" modelAttribute="user">
                <form:hidden path="userId" value=""/>
                <div class="form-group">
                    <form:label for="userName" path="name">User name:</form:label>
                    <form:input type="text" class="form-control" id="userName" placeholder="Enter name" path="name"/>
                </div>
                <div class="form-group">
                    <form:label for="userSurname" path="surname">User surname:</form:label>
                    <form:input type="text" class="form-control" id="userSurname" placeholder="Enter surname" path="surname"/>
                </div>
                <div class="form-group">
                    <form:label for="userRole" path="userRole">Choose user role:</form:label>
                    <form:select class="form-control" id="userRole" path="userRole">
                        <c:forEach items="${roles}" var="role">
                            <form:option value="${role}">${role.name()}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form:form>
        </div>
    </div>
</div>
<c:import url="fragment/footer.jsp"/>
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"/>"></script>
</body>
</html>

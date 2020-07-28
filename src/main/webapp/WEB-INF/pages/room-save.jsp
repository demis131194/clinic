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
            <h3>Save room</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <form:form name="createRoomForm" action="${pageContext.request.contextPath}/save-room" method="POST" accept-charset="UTF-8" modelAttribute="room">
                <form:hidden path="roomId" value=""/>
                <div class="form-group">
                    <form:label for="roomName" path="roomName">Room name:</form:label>
                    <form:input type="text" class="form-control" id="roomName" placeholder="Enter name" path="roomName"/>
                </div>
                <div class="form-group">
                    <form:label for="roomStatus" path="roomStatus">Room status</form:label>
                    <form:select class="form-control" id="roomStatus" path="roomStatus">
                        <c:choose>
                            <c:when test="${room.roomId != null}">
                                <c:forEach items="${statuses}" var="status">
                                    <form:option value="${status}">${status.name()}</form:option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <form:option value="${statuses[0]}">${statuses[0].name()}</form:option>
                            </c:otherwise>
                        </c:choose>
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

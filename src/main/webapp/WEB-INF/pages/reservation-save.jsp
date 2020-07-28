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
            <form:form name="saveReservationForm" action="${pageContext.request.contextPath}/save-reservation" method="POST" accept-charset="UTF-8" modelAttribute="reservation">
                <form:hidden path="reservationId"/>
                <div class="form-group">
                    <form:label for="operationName" path="operationName">Operation name:</form:label>
                    <form:input type="text" class="form-control" id="operationName" placeholder="Enter operatin name" path="operationName"/>
                </div>
                <div class="form-group">
                    <form:label for="description" path="description">Description:</form:label>
                    <form:textarea class="form-control" id="description" placeholder="Enter description" path="description"/>
                </div>
                <div class="form-group">
                    <form:label for="startDate" path="startTime">Start time (yyyy-MM-dd HH:mm):</form:label>
                    <form:input type="datetime" class="form-control" id="startDate" path="startTime"/>
                </div>
                <div class="form-group">
                    <form:label for="endTime" path="endTime">End time (yyyy-MM-dd HH:mm):</form:label>
                    <form:input type="datetime" class="form-control" id="endTime" path="endTime"/>
                </div>

                <div class="form-group">
                    <form:label for="reservationStatus" path="status">Reservation status:</form:label>
                    <form:select class="form-control" id="reservationStatus" path="status">
                        <c:choose>
                            <c:when test="${reservation.reservationId != null}">
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

                <div class="form-group">
                    <form:label for="user" path="user">Reservation status:</form:label>
                    <form:select class="form-control" id="reservationStatus" path="user.userId">
                        <c:forEach items="${users}" var="user">
                            <form:option value="${user.userId}">${user.name} ${user.surname} ${user.userRole.name()}</form:option>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="form-group">
                    <form:label for="room" path="room">Reservation status:</form:label>
                    <form:select class="form-control" id="room" path="room.roomId">
                        <c:forEach items="${rooms}" var="room">
                            <form:option value="${room.roomId}">${room.roomName}</form:option>
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

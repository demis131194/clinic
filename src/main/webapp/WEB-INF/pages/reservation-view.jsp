<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            <h3>Reservations view</h3>
        </div>
    </div>
    <c:if test="${error != null}">
        <div class="row">
            <div class="col-8 offset-2">
                <div class="bg-danger text-center">
                    <h4>${error}</h4>
                </div>
            </div>
        </div>
    </c:if>
    <div class="row">
        <div class="col-12">
            <table class="table table-bordered mt-3">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Operation name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Start time</th>
                    <th scope="col">End time</th>
                    <th scope="col">Status</th>
                    <th scope="col">User</th>
                    <th scope="col">Room</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${reservations}" var="reservation">
                    <jsp:useBean id="reservation" type="org.elinext.task.model.Reservation"/>
                    <tr>
                        <th scope="row">${reservation.reservationId}</th>
                        <td>${reservation.operationName}</td>
                        <td>${reservation.description}</td>
                        <td>${reservation.startTime}</td>
                        <td>${reservation.endTime}</td>
                        <td>${reservation.status.name()}</td>
                        <td>${reservation.user.userId} ${reservation.user.name} ${reservation.user.surname}</td>
                        <td>${reservation.room.roomId} ${reservation.room.roomName}</td>
                        <td>
                            <div class="align-content-center">
                                <form name="updateReservationForm" action="${pageContext.request.contextPath}/save-reservation"
                                      method="GET" class="d-inline">
                                    <input type="hidden" name="reservationId" value="${reservation.reservationId}"/>
                                    <button type="submit" class="btn btn-primary">UPDATE</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/delete-reservation?userId=${reservation.reservationId}"
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

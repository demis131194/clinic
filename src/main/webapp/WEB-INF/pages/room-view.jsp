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
            <h3>Rooms view</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-bordered mt-3">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Room name</th>
                    <th scope="col">Room status</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${rooms}" var="room">
                    <jsp:useBean id="room" type="org.elinext.task.model.Room"/>
                    <tr>
                        <th scope="row">${room.roomId}</th>
                        <td>${room.roomName}</td>
                        <td>${room.roomStatus}</td>
                        <td>
                            <div class="align-content-center">
                                <form name="updateRoomForm" action="${pageContext.request.contextPath}/save-room"
                                      method="GET" class="d-inline">
                                    <input type="hidden" name="roomId" value="${room.roomId}"/>
                                    <input type="hidden" name="roomName" value="${room.roomName}"/>
                                    <input type="hidden" name="roomStatus" value="${room.roomStatus}"/>
                                    <button type="submit" class="btn btn-primary">UPDATE</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/delete-room?userId=${room.roomId}"
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

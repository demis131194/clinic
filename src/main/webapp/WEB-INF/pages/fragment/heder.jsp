<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Clinic</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand pl-5" href="${pageContext.request.contextPath}">Clinic</a>

        <div class="collapse navbar-collapse ml-5" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="reservationsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Reservations
                    </a>
                    <div class="dropdown-menu" aria-labelledby="reservationsDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/reservations">Reservation view</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/save-reservation">Create reservation</a>
                    </div>
                </li>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="roomsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Rooms
                    </a>
                    <div class="dropdown-menu" aria-labelledby="roomsDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/rooms">Room view</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/save-room">Create room</a>
                    </div>
                </li>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="usersDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Users
                    </a>
                    <div class="dropdown-menu" aria-labelledby="usersDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/users">User view</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/save-user">Create user</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Main Page</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
</head>
<body>
<c:import url="WEB-INF/pages/fragment/heder.jsp"/>
<div class="container border rounded border-dark bg-light p-5 mt-5 h-75">
    <div class="row">
        <div class="col-4 offset-4 text-center">
            <h2>Welcome!</h2>
        </div>
    </div>
</div>
<c:import url="WEB-INF/pages/fragment/footer.jsp"/>

<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"/>"></script>
</body>
</html>
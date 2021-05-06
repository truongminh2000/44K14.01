<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<c:url value="${request.contextPath}/resources/admin" var="adminPath" scope="application"/>
<c:url value="${request.contextPath}/resources/uniroom"
	var="contextPath" scope="application" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UniRoom - Phòng trọ sinh viên</title>
<link rel="stylesheet" href="${contextPath}/Css/Home Page/style.css">
<link rel="stylesheet" href="${contextPath}/Css/Chia se/style.css">
<link rel="stylesheet" href="${contextPath}/Css/Chi tiet phong/style.css">
<link rel="preconnect" href="https://fonts.gstatic.com">

<link href="${adminPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- styles -->
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="${adminPath}/css/style1.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" />
<link rel="icon"
	href="https://icons.iconarchive.com/icons/paomedia/small-n-flat/1024/house-icon.png"
	type="image/gif" sizes="16x16">
<link
	href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="app">
		<div class="wrapper">
			<div id="header" style="background-color: #fff;">
				<tiles:insertAttribute name="header" />
			</div>

			<div style="background-color: #fff;">
				<tiles:insertAttribute name="content" />
			</div>
			<div id="footer" style="background-color: #fff;">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${adminPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${adminPath}/js/custom.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<c:url value="${request.contextPath}/resources/admin" var="contextPath"
	scope="application" />

<!-- header -->
<!DOCTYPE html>
<html>
<head>
<title>UniroomAdmin</title>
<link rel="shortcut icon" type="image/ico"
	href="${contextPath}/images/icon-180x180.png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="${contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="https://fonts.googleapis.com/css?family=Lobster"
	rel="stylesheet">
<link href="${contextPath}/css/style1.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<!-- Logo -->
					<div class="logo">
						<h1
							style="display: inline-block; margin-right: 20px; color: #c02d28;">
							<a style="color: red;"
								href="${pageContext.request.contextPath}/admin/index.html">Uniroom-Admin</a>
						</h1>
						<h1 style="display: inline-block;">
							<a href="${pageContext.request.contextPath}/user/index.html">Uniroom</a>
						</h1>
					</div>
				</div>
				<div class="col-md-5">
					<div class="row">
						<div class="col-lg-12"></div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="navbar navbar-inverse" role="banner">
						<nav
							class="collapse navbar-collapse bs-navbar-collapse navbar-right"
							role="navigation">
							<ul class="nav navbar-nav">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">My Account <b class="caret"></b></a>
									<ul class="dropdown-menu animated fadeInUp">
										<li><p>
												Xin chào <b>${userInf.fullname}</b>
											</p></li>
										<li><a
											href="${pageContext.request.contextPath}/user/profile/${userInf.username}-${userInf.id}.html">Quản
												lý tài khoản</a></li>
										<li><a
											href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.header -->

	<div class="page-content">
		<div class="row">
			<div class="col-md-2">
				<div class="sidebar content-box" style="display: block;">
					<!-- Nav-bar -->
					<ul class="nav">
						<!-- Main menu -->
						<li class="current"><a
							href="${pageContext.request.contextPath}/admin/indexuser"><i
								class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
						<li><a
							href="${pageContext.request.contextPath}/user/profile/${userInf.username}-${userInf.id}.html"><i
								class="glyphicon glyphicon-book"></i> Tài khoản</a></li>
						<li><a
							href="${pageContext.request.contextPath}/user/post/${userInf.username}/index.html"><i
								class="glyphicon glyphicon-book"></i> Bài đăng</a></li>
						<li><a
							href="${pageContext.request.contextPath}/user/post/add.html"><i
								class="glyphicon glyphicon-plus"></i> Đăng tin</a></li>
						<li><a href="${pageContext.request.contextPath}/index.html"><i
								class="glyphicon glyphicon-home"></i>Thoát</a></li>

						<!-- <li class="submenu"><a href="#"> <i
								class="glyphicon glyphicon-list"></i> Pages <span
								class="caret pull-right"></span>
						</a> Sub menu
							<ul>
								<li><a href="login.html">Login</a></li>
								<li><a href="javascript:void(0)">Signup</a></li>
							</ul></li> -->
					</ul>
					<!-- /.nav-bar -->
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="panel-heading">
						<div class="panel-title ">Quản lý bài đăng</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-8">
						<c:if test="${not empty msg}">
							<div class="alert alert-success" role="alert">${msg}</div>
						</c:if>
					</div>
					<div class="col-md-4"></div>
				</div>

				<div class="row">
					<div class="panel-body">
						<table class="table table-striped table-bordered" id="example">
							<thead>
								<tr>
									<th width="5%">ID</th>
									<th width="30%">Tên</th>
									<th width="10%">Trạng thái</th>
									<th width="30%">Hình ảnh</th>
									<th width="25%">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty postUserList}">
										<c:forEach items="${postUserList}" var="post">
											<tr class="odd gradeX">
												<td>${post.pid}</td>
												<td>${post.pname}</td>
												<td class="center">${post.status}</td>
												<td class="center text-center"><img src="" /> <c:choose>
														<c:when test="${not empty post.picture}">
															<img width="100px" height="70px"
																src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
														</c:when>
														<c:otherwise>
															<p>Không có hình ảnh!</p>
														</c:otherwise>
													</c:choose></td>
												<td class="center text-center"><a
													href="${pageContext.request.contextPath}/user/post/edit/${userInf.username}-${post.pid}.html"
													title="" class="btn btn-primary"> <span
														class="glyphicon glyphicon-pencil "></span> Sửa
												</a> <a
													href="${pageContext.request.contextPath}/user/post/delete/${userInf.username}-${post.pid}.html"
													title="" class="btn btn-danger"
													onclick="return confirm('Bạn có muốn xóa ${post.pname} không?')">
														<span class="glyphicon glyphicon-trash"></span> Xóa
												</a></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">Không có bài đăng nào!</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- /.col-md-10 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- Page content -->

	<!-- footer -->
	<footer>
		<div class="container">

			<div class="copy text-center">Copyright © 2021 UNIROOM All
				Rights Reserved - Design by PHINTEAM</div>
		</div>
	</footer>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/js/custom.js"></script>
</body>
</html>
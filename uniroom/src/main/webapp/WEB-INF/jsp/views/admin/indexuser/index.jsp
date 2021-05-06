<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<c:url value="${request.contextPath}/resources/admin" var="contextPath" scope="application"/>

<!-- header -->
<!DOCTYPE html>
<html>
  <head>
    <title>UniroomAdmin</title>
    <link rel="shortcut icon" type="image/ico" href="${contextPath}/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
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
						<h1 style="display: inline-block; margin-right: 20px; color: #c02d28;" >
							<a style="color: red;" href="${pageContext.request.contextPath}/admin/index.html">Uniroom-Admin</a> 
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
										<li><a href="${pageContext.request.contextPath}/user/profile/${userInf.username}-${userInf.id}.html">Quản lý tài khoản</a></li>
										<li><a href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
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
						<li class="current"><a href="${pageContext.request.contextPath}/admin/indexuser"><i
								class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
						<li><a href="${pageContext.request.contextPath}/user/profile/${userInf.username}-${userInf.id}.html"><i class="glyphicon glyphicon-book"></i>
								Tài khoản</a></li>
						<li><a href="${pageContext.request.contextPath}/user/post/${userInf.username}/index.html"><i class="glyphicon glyphicon-book"></i>
								Bài đăng</a></li>
						<li><a href="${pageContext.request.contextPath}/user/post/add.html"><i class="glyphicon glyphicon-plus"></i>
								Đăng tin</a></li>
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
					<div class="col-md-12 panel-warning">
						<div class="content-box-header panel-heading">
							<c:if test="${not empty msg}">
								<div class="alert alert-success" role="alert">${msg}</div>
							</c:if>
							<div class="panel-title ">Chào mừng bạn tới trang quản trị</div>
						</div>
						<div class="content-box-large box-with-header">
							<div class="row">
								<div class="col-md-4 col-sm-4 col-xs-4">
									<div class="panel panel-back noti-box">
										<span class="icon-box bg-color-green set-icon"> <span
											class="glyphicon glyphicon-th-list"></span>
										</span>
										<div class="text-box">
											<p class="main-text">
												<a class="fs-14" href="${pageContext.request.contextPath}/user/post/add.html" title="">Đăng tin</a>
											</p>
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-4">
									<div class="panel panel-back noti-box">
										<span class="icon-box bg-color-blue set-icon"> <span
											class="glyphicon glyphicon-book"></span>
										</span>
										<div class="text-box">
											<p class="main-text">
												<a class="fs-14" href="${pageContext.request.contextPath}/user/post/${userInf.username}/index.html" title="">Quản lý bài đăng</a>
											</p>
											<p class="text-muted">Có ${totalPost} bài đăng của bạn</p>
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-4">
									<div class="panel panel-back noti-box">
										<span class="icon-box bg-color-brown set-icon"> <span
											class="glyphicon glyphicon-user"></span>
										</span>
										<div class="text-box">
											<p class="main-text">
												<a class="fs-14" href="${pageContext.request.contextPath}/user/profile/${userInf.username}-${userInf.id}.html" title="">Quản lý tài khoản</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		  </div><!-- /.col-md-10 -->
		</div><!-- /.row -->
    </div><!-- Page content -->

   <!-- footer -->
<footer>
	<div class="container">

		<div class="copy text-center">
			Copyright © 2021 UNIROOM All Rights Reserved - Design by PHINTEAM
		</div>
	</div>
</footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/custom.js"></script>
  </body>
</html>
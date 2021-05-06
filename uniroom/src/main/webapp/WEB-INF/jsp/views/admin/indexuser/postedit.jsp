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
				<c:choose>
					<c:when test="${not empty post}">
						<form action="${pageContext.request.contextPath}/admin/indexuser/post/edit"
							method="post" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-12 panel-info">
									<div class="content-box-header panel-heading">
										<div class="panel-title ">Sửa bài đăng</div>
									</div>
									<div class="content-box-large box-with-header">
										<div>
											<c:if test="${not empty msg}">
												<div class="alert alert-danger" role="alert">${msg}</div>
											</c:if>
											<div class="row mb-10"></div>
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<div>
															<input type="hidden" name="pid" value="${post.pid}"></input>
														</div>
														<div>
															<label for="name">Tên</label> <input type="text"
																class="form-control" value="${post.pname}" name="pname"
																placeholder="Nhập tên bài đăng" >
															<form:errors path="post.pname" cssStyle="color:red"
																cssClass="error" />
														</div>
														<div>
															<input type="hidden" name="username"
																value="${post.username}" />
														</div>
														<div>
															<label for="name">Mô tả</label>
															<textarea rows="6" name="description"
																class="form-control" placeholder="Nhập mô tả">${post.description}</textarea>
															<form:errors path="post.description" cssStyle="color:red"
																cssClass="error" />
														</div>
														<div>
															<label for="name">Diện tích (Đơn vị: m2)</label> <input
																type="number" class="form-control" value="${post.area}"
																name="area" value="0" placeholder="Nhập diện tích">
															<form:errors path="post.area" cssStyle="color:red"
																cssClass="error" />
														</div>
														<div>
															<label for="name">Giá</label> <input type="number"
																class="form-control" value="${post.price}" name="price"
																placeholder="Nhập giá">
															<form:errors path="post.price" cssStyle="color:red"
																cssClass="error" />
														</div>
														<div>
															<label for="name">Địa chỉ</label> <input type="text"
																class="form-control" value="${post.addDetail}"
																name="addDetail" placeholder="Nhập địa chỉ">
															<form:errors path="post.addDetail" cssStyle="color:red"
																cssClass="error" />
														</div>
														<div>
															<label>Quận </label> <select class="form-control"
																onchange="return selectWard()" id="did"
																name="district.dname">
																<c:choose>
																	<c:when test="${not empty districtList}">
																		<option value="${post.district.did}">
																			${post.district.dname}</option>
																		<c:forEach items="${districtList}" var="district">
																			<c:if test="${district.did != post.district.did}">
																				<option value="${district.did}">${district.dname}</option>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<option class="areas--list__item hover--box__item">Không
																			có quận nào!</option>
																	</c:otherwise>
																</c:choose>
															</select>
														</div>
														<div>
															<label>Phường: </label>
															<div class="form-control">
																<select class="phuong--list" name="ward.wid">
																	<option class="form-control" value="${post.ward.wid}">${post.ward.wname}</option>
																</select>
															</div>
														</div>
														<div>
															<label for="name">Hình ảnh</label> <input type="file"
																class="form-control" name="file">
															<p class="help-block">
																<em>Định dạng: jpg, png, jpeg,...</em>
															</p>
															<c:choose>
																<c:when test="${not empty post.picture}">
																	<img width="100px" height="70px"
																		src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
																	<input type="hidden" name="picture"
																		value="${post.picture}"></input>
																</c:when>
																<c:otherwise>
																	<p>Không có hình ảnh!</p>
																</c:otherwise>
															</c:choose>
														</div>
														<br> <input type="submit" value="Sửa"
															class="btn btn-success" /> <input
															style="background-color: #3C6BF7; border: none; color: #fff; margin: 0 10px;"
															type="reset" value="Nhập lại" class="btn btn-default" />
														<a
															style="background-color: #DD5872; border: none; color: #fff;"
															class="btn btn-default"
															href="${pageContext.request.contextPath}/user/post/${userInf.username}/index.html">Hủy</a>
													</div>
												</div>
											</div>
											<hr>
										</div>
									</div>
								</div>
							</div>
							<!-- /.row col-size -->
						</form>
					</c:when>
					<c:otherwise>
						<h2>Không tồn tại!</h2>
						<a href="${pageContext.request.contextPath}/user/post/${userInf.username}/index.html">Quay
							lại trang chủ!</a>
					</c:otherwise>
				</c:choose>
				<script>
					function selectWard() {
						var did = $("#did").val();
						$.ajax({
							url : '/ward',
							type : 'POST',
							cache : false,
							data : {
								"did" : did
							},
							success : function(data) {
								if (data != '') {
									$(".phuong--list").html(data);
								} else {
									$("#Mua").html('Giỏ hàng rỗng!');
								}
							},
							error : function() {
								alert('Có lỗi xảy ra');
							}
						});
						return false;
					}
				</script>
				<script>
					function selectWard() {
						var did = $("#did").val();
						$.ajax({
							url : '/ward',
							type : 'POST',
							cache : false,
							data : {
								"did" : did
							},
							success : function(data) {
								if (data != '') {
									$(".phuong--list").html(data);
								} else {
									$("#Mua").html('Giỏ hàng rỗng!');
								}
							},
							error : function() {
								alert('Có lỗi xảy ra');
							}
						});
						return false;
					}
				</script>
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
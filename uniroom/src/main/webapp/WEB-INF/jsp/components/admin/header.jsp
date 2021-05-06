<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
								<li><a href="${pageContext.request.contextPath}/admin/user/edit/${userInf.id}">Quản lý tài khoản</a></li>
								<li><a href="${pageContext.request.contextPath}/auth/logout">Logout</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
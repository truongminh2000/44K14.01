<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>

<form action="${pageContext.request.contextPath}/admin/user/add" method="post">
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm người dùng</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
			<c:if test="${not empty msg}">
					<div class="alert alert-danger" role="alert">${msg}</div>
			</c:if>
				<div class="row mb-10"></div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
						<div>
							<label for="name">Họ và tên</label> 
							<input type="text" class="form-control" value="${user.fullname}" name="fullname" placeholder="Nhập tên">
							<form:errors path="user.fullname" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
						<div>
							<label for="name">Tên đăng nhập</label> 
							<input type="text" class="form-control" value="${user.username}" name="username" placeholder="Nhập tên đăng nhập" 
									pattern="[a-z0-9_]{4,}$" title="Tên đăng nhập chỉ chứa chữ thường không dấu, số và dấu _">
							<form:errors path="user.username" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
						<div>
							<label for="name">Mật khẩu</label> 
							<input type="password" class="form-control" value="${user.password}" name="password" placeholder="Nhập mật khẩu" 
									pattern="[a-z0-9_]{4,}$" title="Tên đăng nhập chỉ chứa chữ thường không dấu, số và dấu _">
							<form:errors path="user.password" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
							<input type="submit" value="Thêm" class="btn btn-success" /> 
							<input style="background-color: #3C6BF7; border: none; color: #fff; margin: 0 10px;" type="reset" value="Nhập lại" class="btn btn-default" />
							<a style="background-color: #DD5872; border: none; color: #fff;" class="btn btn-default" href="${pageContext.request.contextPath}/admin/user/index">Hủy</a>
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
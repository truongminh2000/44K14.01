<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>

<form action="${pageContext.request.contextPath}/admin/guide/add" method="post">
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm hướng dẫn</div>
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
								<label for="name">Tên</label> 
								<input type="text" class="form-control" value="${guide.gname}" name="gname" placeholder="Nhập tên bài hướng dẫn">
								<form:errors path="guide.gname" cssStyle="color:red" cssClass="error" />
							</div>
							<br>
							<div>
								<label for="name">Nội dung</label>
								<textarea rows="6" name="content" class="form-control" placeholder="Nhập nội dung">${guide.content}</textarea>
								<form:errors path="guide.content" cssStyle="color:red" cssClass="error" />
							</div>
							<br>
							<input type="submit" value="Thêm" class="btn btn-success" /> 
							<input style="background-color: #3C6BF7; border: none; color: #fff; margin: 0 10px;" type="reset" value="Nhập lại" class="btn btn-default" />
							<a style="background-color: #DD5872; border: none; color: #fff;" class="btn btn-default" href="${pageContext.request.contextPath}/admin/guide/index">Hủy</a>
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
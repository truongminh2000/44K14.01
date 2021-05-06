<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>

<form action="${pageContext.request.contextPath}/feedback" method="post">
<div class="row" style="margin-top: 94px; padding-top: 40px; justify-content: center;">
	<div class="col-md-3 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Liên hệ với Uniroom</div>
		</div>
		<div class="content-box-large box-with-header">
			<div>
			<c:if test="${not empty msg}">
					<div class="alert alert-danger" role="alert">${msg}</div>
			</c:if>
				<div class="row mb-12">
					<div class="col-md-12">
						<div class="form-group">
						<div>
							<label for="name">Họ và tên</label> 
							<input style="width: 100%;" type="text" class="form-control" value="${feedback.fullname}" name="fullname" placeholder="Nhập tên">
							<form:errors path="feedback.fullname" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
						<div>
							<label for="name">Email</label> 
							<input type="text" class="form-control" value="${feedback.email}" name="email" placeholder="Nhập email">
							<form:errors path="feedback.email" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
						<div>
							<label for="name">Chủ đề</label> 
							<input type="text" class="form-control" value="${feedback.subject}" name="subject" placeholder="Nhập tiêu đề">
							<form:errors path="feedback.subject" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
						<div>
							<label for="name">Nội dung</label> 
							<textarea rows="6" class="form-control" name="content" placeholder="Nhập nội dung">${feedback.content}</textarea>
							<form:errors path="feedback.content" cssStyle="color:red" cssClass="error" />
						</div>
						<br>
							<input type="submit" value="Thêm" class="btn btn-success" /> 
							<input style="background-color: #3C6BF7; border: none; color: #fff;" type="reset" value="Nhập lại" class="btn btn-default" />
							<a style="background-color: #DD5872; border: none; color: #fff;" class="btn btn-default" href="${pageContext.request.contextPath}/index">Hủy</a>
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
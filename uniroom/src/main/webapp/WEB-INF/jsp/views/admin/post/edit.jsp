<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>

<c:choose>
	<c:when test="${not empty post}">
		<form action="${pageContext.request.contextPath}/admin/post/edit" method="post" enctype="multipart/form-data">
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
											<label for="name">Tên</label>
											<input type="text" class="form-control" value="${post.pname}" name="pname" placeholder="Nhập tên bài đăng">
											<form:errors path="post.pname" cssStyle="color:red" cssClass="error" />
										</div>
										<div>
											<input type="hidden" name="username" value="${post.username}" />
										</div>
										<div>
											<label for="name">Mô tả</label> 
											<textarea rows="6" name="description" class="form-control" placeholder="Nhập mô tả">${post.description}</textarea>
											<form:errors path="post.description" cssStyle="color:red" cssClass="error" /> 
										</div>
										<div>
											<label for="name">Diện tích (Đơn vị: m2)</label> 
											<input type="number" class="form-control" value="${post.area}" name="area" value = "0" placeholder="Nhập diện tích">
											<form:errors path="post.area" cssStyle="color:red" cssClass="error" />
										</div>
										<div>
											<label for="name">Giá</label> 
											<input type="number" class="form-control" value="${post.price}" name="price" placeholder="Nhập giá">
											<form:errors path="post.price" cssStyle="color:red" cssClass="error" />
										</div>
										<div>
											<label for="name">Địa chỉ</label> 
											<input type="text" class="form-control" value="${post.addDetail}" name="addDetail" placeholder="Nhập địa chỉ">
											<form:errors path="post.addDetail" cssStyle="color:red" cssClass="error" />
										</div>
										<div>
											<label>Quận </label>
											<select class="form-control" onchange="return selectWard()" id="did" name="district.dname">
												<c:choose>
													<c:when test="${not empty districtList}">
														<option value="${post.district.did}">
															${post.district.dname}</option>
														<c:forEach items="${districtList}" var="district">
															<c:if test="${district.did != post.district.did}"><option value="${district.did}">${district.dname}</option></c:if>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<option class="areas--list__item hover--box__item">Không có quận nào!</option>
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
											<label for="name">Hình ảnh</label> 
											<input type="file" class="form-control" name="file">
											<p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
											<c:choose>
												<c:when test="${not empty post.picture}">
													<img width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
													<input type="hidden" name="picture" value="${post.picture}" ></input>
												</c:when>
												<c:otherwise>
													<p>Không có hình ảnh!</p>
												</c:otherwise>
											</c:choose>
										</div>
										<br>
										<input type="submit" value="Sửa" class="btn btn-success" /> 
										<input style="background-color: #3C6BF7; border: none; color: #fff; margin: 0 10px;" type="reset" value="Nhập lại" class="btn btn-default" />
										<a style="background-color: #DD5872; border: none; color: #fff;" class="btn btn-default" href="${pageContext.request.contextPath}/admin/post/index">Hủy</a>
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
		<a href="${pageContext.request.contextPath}/admin/cat/index">Quay lại trang chủ!</a>
	</c:otherwise>
</c:choose>
<script>
	function selectWard() {
		var did = $("#did").val();
		$.ajax({
			url: '/ward',
			type: 'POST',
			cache: false,
			data: {
				"did":did
			},
			success: function(data) {
				if (data!= '') {
					$(".phuong--list").html(data);
				} else {
					$("#Mua").html('Giỏ hàng rỗng!');
				}
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});
		return false;
	}
</script>
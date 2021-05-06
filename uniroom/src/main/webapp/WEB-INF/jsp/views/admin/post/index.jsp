<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="panel-heading">
		<div class="panel-title ">Quản lý bài đăng</div>
	</div>
</div>
<hr>
<div class="row">
	<div class="col-md-4">
		<a href="${pageContext.request.contextPath}/admin/post/add" class="btn btn-success"><span
			class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
				<c:if test="${not empty msg}">
					<div class="alert alert-success" role="alert">${msg}</div>
				</c:if>
	</div>
	<div class="col-md-8">
		<form class="input-group form" action="${pageContext.request.contextPath}/admin/post/statistic" method="post">
			<ul style="display: flex; list-style: none; padding: 0; margin-bottom: 30px; ">
				<li style="margin-right: 20px;">
					<label>Ngày bắt đầu: </label>
					<input type="date" value="${datebegin}" class="form-control" name="datebegin" />
				</li>
				<li>
					<label>Ngày kết thúc: </label>
					<input type="date" value="${dateend}" class="form-control" name="dateend" />
				</li>
				<li style="margin: 22px 30px 0; ">
					<span class="input-group-btn">
						<input  class="btn btn-primary" type="submit" value="Thống kê" />
					</span>	
				</li>
			</ul>
		</form>
	</div>
	<div class="col-md-12">
		<form class="input-group form" action="${pageContext.request.contextPath}/admin/post/search" method="post">
				<input type="text" class="form-control" name="search" value="${search}" placeholder="Search...">
			<span class="input-group-btn">
				<button  class="btn btn-primary" type="submit">Search</button>
			</span>
		</form>
	</div>
</div>

<div class="row">
	<div class="panel-body">
		<table class="table table-striped table-bordered" id="example">
			<thead>
				<tr>
					<th width="5%">ID</th>
					<th width="20%">Tên</th>
					<th width="20%">Người đăng</th>
					<th width="10%">Trạng thái</th>
					<th width="20%">Hình ảnh</th>
					<th width="25%">Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty postList}">
						<c:forEach items="${postList}" var="post">
							<tr class="odd gradeX">
								<td>${post.pid}</td>
								<td>${post.pname}</td>
								<td>${post.username}</td>
								<td class="center">${post.status}</td>
								<td class="center text-center"><img src="" />
									<c:choose>
										<c:when test="${not empty post.picture}">
											<img width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
										</c:when>
										<c:otherwise>
											<p>Không có hình ảnh!</p>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="center text-center">
									<a href="${pageContext.request.contextPath}/admin/post/edit/${post.pid}" title="" class="btn btn-primary">
										<span class="glyphicon glyphicon-pencil "></span> Sửa</a> 
									<a href="${pageContext.request.contextPath}/admin/post/del/${post.pid}" title="" class="btn btn-danger" 
										onclick="return confirm('Bạn có muốn xóa ${post.pname} không?')">
										<span class="glyphicon glyphicon-trash"></span> Xóa</a>
									<c:choose>
										<c:when test="${post.status == 0}">
											<a href="${pageContext.request.contextPath}/admin/post/up/${post.pid}" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Đăng</a>
										</c:when>
										<c:when test="${post.status == 1}">
											<a href="${pageContext.request.contextPath}/admin/post/cancel/${post.pid}" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Hủy</a>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${not empty postListSearch}">
						<c:forEach items="${postListSearch}" var="post">
							<tr class="odd gradeX">
								<td>${post.pid}</td>
								<td>${post.pname}</td>
								<td>${post.username}</td>
								<td class="center">${post.status}</td>
								<td class="center text-center"><img src="" />
									<c:choose>
										<c:when test="${not empty post.picture}">
											<img width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
										</c:when>
										<c:otherwise>
											<p>Không có hình ảnh!</p>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="center text-center">
									<a href="${pageContext.request.contextPath}/admin/post/edit/${post.pid}" title="" class="btn btn-primary">
										<span class="glyphicon glyphicon-pencil "></span> Sửa</a> 
									<a href="${pageContext.request.contextPath}/admin/post/del/${post.pid}" title="" class="btn btn-danger" 
										onclick="return confirm('Bạn có muốn xóa ${post.pname} không?')">
										<span class="glyphicon glyphicon-trash"></span> Xóa</a>
									<c:choose>
										<c:when test="${post.status == 0}">
											<a href="${pageContext.request.contextPath}/admin/post/up/${post.pid}" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Đăng</a>
										</c:when>
										<c:when test="${post.status == 1}">
											<a href="${pageContext.request.contextPath}/admin/post/cancel/${post.pid}" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Hủy</a>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${not empty postListStatistic}">
						<c:forEach items="${postListStatistic}" var="post">
							<tr class="odd gradeX">
								<td>${post.pid}</td>
								<td>${post.pname}</td>
								<td>${post.username}</td>
								<td class="center">${post.status}</td>
								<td class="center text-center"><img src="" />
									<c:choose>
										<c:when test="${not empty post.picture}">
											<img width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
										</c:when>
										<c:otherwise>
											<p>Không có hình ảnh!</p>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="center text-center">
									<a href="${pageContext.request.contextPath}/admin/post/edit/${post.pid}" title="" class="btn btn-primary">
										<span class="glyphicon glyphicon-pencil "></span> Sửa</a> 
									<a href="${pageContext.request.contextPath}/admin/post/del/${post.pid}" title="" class="btn btn-danger" 
										onclick="return confirm('Bạn có muốn xóa ${post.pname} không?')">
										<span class="glyphicon glyphicon-trash"></span> Xóa</a>
									<c:choose>
										<c:when test="${post.status == 0}">
											<a href="${pageContext.request.contextPath}/admin/post/up/${post.pid}" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Đăng</a>
										</c:when>
										<c:when test="${post.status == 1}">
											<a href="${pageContext.request.contextPath}/admin/post/cancel/${post.pid}" title="" class="btn btn-primary">
												<span class="glyphicon glyphicon-pencil "></span> Hủy</a>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="6">Không có bài đăng nào!</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
			<!-- Pagination -->
				<c:if test="${not empty totalPage}">
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					      <li class='<c:if test="${currentPage == 1}">disabled</c:if>' ><a href="${pageContext.request.contextPath}/admin/post/index/${currentPage-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					      <c:forEach begin="1" end="${totalPage}" var="i">
						  	<li class='<c:if test="${currentPage == i}">active</c:if>'><a href="${pageContext.request.contextPath}/admin/post/index/${i}">${i} <span class="sr-only">(current)</span></a></li>
						  </c:forEach>
					      <li class='<c:if test="${currentPage == totalPage}">disabled</c:if>'><a href="${pageContext.request.contextPath}/admin/post/index/${currentPage+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </ul>
					</nav>
				</c:if>
			<!-- /.pagination -->
	</div>
</div>
<!-- /.row -->
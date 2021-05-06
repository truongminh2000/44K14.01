<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="panel-heading">
		<div class="panel-title ">Quản lý bài hướng dẫn</div>
	</div>
</div>
<hr>
<div class="row">
	<div class="col-md-8">
		<a href="${pageContext.request.contextPath}/admin/guide/add" class="btn btn-success"><span
			class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
				<c:if test="${not empty msg}">
					<div class="alert alert-success" role="alert">${msg}</div>
				</c:if>
	</div>
	<div class="col-md-4">
		<form class="input-group form" action="${pageContext.request.contextPath}/admin/guide/search" method="post">
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
					<th width="10%">ID</th>
					<th width="20%">Tên</th>
					<th width="50%">Nội dung</th>
					<th width="20%">Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty guideList}">
						<c:forEach items="${guideList}" var="guide">
							<tr class="odd gradeX">
								<td>${guide.gid}</td>
								<td>${guide.gname}</td>
								<td>${guide.content}</td>
								<td class="center text-center">
									<a href="${pageContext.request.contextPath}/admin/guide/edit/${guide.gid}" title="" class="btn btn-primary">
										<span class="glyphicon glyphicon-pencil "></span> Sửa</a> 
									<a href="${pageContext.request.contextPath}/admin/guide/del/${guide.gid}" title="" class="btn btn-danger" 
										onclick="return confirm('Bạn có muốn xóa ${guide.gname} không?')">
										<span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${not empty guideListSearch}">
						<c:forEach items="${guideListSearch}" var="guide">
							<tr class="odd gradeX">
								<td>${guide.gid}</td>
								<td>${guide.gname}</td>
								<td>${guide.content}</td>
								<td class="center text-center">
									<a href="${pageContext.request.contextPath}/admin/guide/edit/${guide.gid}" title="" class="btn btn-primary">
										<span class="glyphicon glyphicon-pencil "></span> Sửa</a> 
									<a href="${pageContext.request.contextPath}/admin/guide/del/${guide.gid}" title="" class="btn btn-danger" 
										onclick="return confirm('Bạn có muốn xóa ${guide.gname} không?')">
										<span class="glyphicon glyphicon-trash"></span> Xóa</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="4">Không có bài hướng dẫn nào!</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
			<!-- Pagination -->
				<c:if test="${not empty totalPage}">
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					      <li class='<c:if test="${currentPage == 1}">disabled</c:if>' ><a href="${pageContext.request.contextPath}/admin/guide/index/${currentPage-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					      <c:forEach begin="1" end="${totalPage}" var="i">
						  	<li class='<c:if test="${currentPage == i}">active</c:if>'><a href="${pageContext.request.contextPath}/admin/guide/index/${i}">${i} <span class="sr-only">(current)</span></a></li>
						  </c:forEach>
					      <li class='<c:if test="${currentPage == totalPage}">disabled</c:if>'><a href="${pageContext.request.contextPath}/admin/guide/index/${currentPage+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </ul>
					</nav>
				</c:if>
			<!-- /.pagination -->
	</div>
</div>
<!-- /.row -->

<%@page import="phin.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<c:url value="${request.contextPath}/resources/uniroom" var="contextPath" scope="application"/>
<div class="container">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/index.html"><img class="logo-img" src="${contextPath}/Design/Logo.png"
			alt=""></a>
	</div>

	<nav class="navbar">
		<ul class="nav--list">
			<li class="nav--list__item"><a 
						href="${pageContext.request.contextPath}/index.html"><span>Trang chủ</span></a></li>
			<li class="nav--list__item "><span style="color: #428BCA;" class="areas"> Khu vực
					<div class="hover--box areas-chooses__box">
						<ul class="quan--list">
							<c:choose>
								<c:when test="${not empty districtList}">
									<c:forEach items="${districtList}" var="district">
										<li class="areas--list__item hover--box__item" value="${district.did}">
											<a href="${pageContext.request.contextPath}/district/${StringUtil.makeSlug(district.dname)}-${district.did}.html">${district.dname}</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="areas--list__item hover--box__item">Không có quận nào!</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
			</span></li>
			<li class="nav--list__item"><a target="_blank" 
						href="${pageContext.request.contextPath}/feedback.html"><span>Liên hệ</span></a></li>
			<li  class="nav--list__item"><a target="_blank" 
						href="${pageContext.request.contextPath}/signup.html"><span>Đăng ký</span></a> 
							<span style="color: #ccc;"> / </span> 
						<a target="_blank"  href="${pageContext.request.contextPath}/login.html"><span>Đăng nhập</span></a></li>
			<li class="nav--list__item">
				<a class="dang-tin-btn btn1" target="_blank" href="${pageContext.request.contextPath}/add.html"><span style="color: #fff;" >Đăng Tin</span></a>
			</li>
		</ul>
	</nav>
</div>

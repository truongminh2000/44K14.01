<%@page import="phin.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<c:url value="${request.contextPath}/resources/uniroom"
	var="ctPath" scope="application" />
<script type="text/javascript" src="${ctPath}/jquery-2.1.1.min.js"></script>
<!-- Banner -->
<div id="banner"
	style="background-image: url(${ctPath}/Img/Banner.jpg);">
	<div class="banner-wrapper" >
		<div class="container">
			<div class="banner-wrap">
				<div class="explore">
					<div class="explore--img">
						<img src="${ctPath}/Img/Explore.jpg" alt=""
							class="explore--img__detail">
					</div>

					<a style="text-decoration: none;" class="explore-btn btn1" target="_blank" href="${pageContext.request.contextPath}/guide.html"><span>Chia sẻ</span></a>
				</div>
				<c:if test="${not empty msg}">
					<div style="position: absolute; top: 5vh; left: 50%; transform: translateX(-50%); transform: translateY(-50%);" class="alert alert-danger" role="alert">${msg}</div>
				</c:if>
				<div class="search">
					<div class="search--bar">
						<form class="chooses-list" action="${pageContext.request.contextPath}/search" method="post">
							<div>
								<label>Quận: </label>
								<select class="district--list" onchange="return selectWard()" id="did" name="district">
									<c:choose>
										<c:when test="${not empty districtList}">
											<option class="areas--list__item hover--box__item" value="0">
												Chọn quận</option>
											<c:forEach items="${districtList}" var="district">
												<option class="areas--list__item hover--box__item" value="${district.did}">
												${district.dname}</option>
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
								<select class="phuong--list" name="wid">
									<option class="areas--list__item hover--box__item" value="0">Chưa có phường!</option>
								</select>
							</div>
							<div>
								<label>Giá: </label>
								<select class="price--list" name="priceId">
									<option class="areas--list__item hover--box__item" value="0"> Chọn giá</option>
									<option class="areas--list__item hover--box__item" value="1"> Lớn hơn 3 triệu</option>
									<option class="areas--list__item hover--box__item" value="2"> 2 triệu - 3 triệu</option>
									<option class="areas--list__item hover--box__item" value="3"> 1 triệu rưỡi - 2 triệu</option>
									<option class="areas--list__item hover--box__item" value="4"> Nhỏ hơn 1 triệu</option>
								</select>
							</div>
							<input class="search--btn btn1" style="margin-left: 20px; height: 60px " type="submit" value="Tìm kiếm...">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- contents -->
<div id="contents">
	<div class="contents--wrap" style="background-color: #fff;">
		<div class="container">
			<div class="row">
				<div class="col col-sixth">
				<c:choose>
					<c:when test="${not empty district}"><button class="new-btn">Quận ${district.dname}</button></c:when>
					<c:when test="${not empty uni}"><button class="new-btn">Khu vực ${uni.name}</button></c:when>
					<c:otherwise><button class="new-btn">Mới nhất</button></c:otherwise>
				</c:choose>
					<div class="room">
						<c:choose>
							<c:when test="${not empty postList}">
								<c:forEach items="${postList}" var="post">
									<a target="_blank" href="${pageContext.request.contextPath}/detail/${StringUtil.makeSlug(post.pname)}-${post.pid}.html">
									<ul class="room--list">
										<div class="room--list__item">
											<div class="row">
												<div class="col col-third">
													<div class="room--list__item-img">
														<c:choose>
															<c:when test="${not empty post.picture}">
																<img class="room--list__item-img" width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
															</c:when>
															<c:otherwise>
																<p>Không có hình ảnh!</p>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="col col-sixth">
													<div class="room-info">
														<div class="row">
															<div class="room-info-tittle">${post.pname}</div>
														</div>
														<ul class="row room-info-detail__list">
															<div class="col-full">
																<li class="room-detail__item ">Giá: <span
																	class="room-detail--price"> ${post.price}</span>
																</li>
																<li class="room-detail__item ">Diện tích: <span
																	class="room-detail--area">${post.area}m<sup>2</sup></span>
																</li>
																<li class="room-detail__item ">Địa chỉ: <span
																	class="room-detail--address">${post.addDetail}, ${post.ward.wname}, ${post.district.dname}</span>
																</li>
															</div>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</ul>
									</a>
								</c:forEach>
							</c:when>
							<c:when test="${not empty postDistrictList}">
								<c:forEach items="${postDistrictList}" var="post">
									<a target="_blank" href="${pageContext.request.contextPath}/detail/${StringUtil.makeSlug(post.pname)}-${post.pid}.html">
									<ul class="room--list">
										<div class="room--list__item">
											<div class="row">
												<div class="col col-third">
													<div class="room--list__item-img">
														<c:choose>
															<c:when test="${not empty post.picture}">
																<img class="room--list__item-img" width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
															</c:when>
															<c:otherwise>
																<p>Không có hình ảnh!</p>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="col col-sixth">
													<div class="room-info">
														<div class="row">
															<div class="room-info-tittle">${post.pname}</div>
														</div>
														<ul class="row room-info-detail__list">
															<div class="col-full">
																<li class="room-detail__item ">Giá: <span
																	class="room-detail--price"> ${post.price}</span>
																</li>
																<li class="room-detail__item ">Diện tích: <span
																	class="room-detail--area">${post.area}m<sup>2</sup></span>
																</li>
																<li class="room-detail__item ">Địa chỉ: <span
																	class="room-detail--address">${post.addDetail}, ${post.ward.wname}, ${post.district.dname}</span>
																</li>
															</div>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</ul>
									</a>
								</c:forEach>
							</c:when>
							<c:when test="${not empty postListSearch}">
								<c:forEach items="${postListSearch}" var="post">
									<a target="_blank" href="${pageContext.request.contextPath}/detail/${StringUtil.makeSlug(post.pname)}-${post.pid}.html">
									<ul class="room--list">
										<div class="room--list__item">
											<div class="row">
												<div class="col col-third">
													<div class="room--list__item-img">
														<c:choose>
															<c:when test="${not empty post.picture}">
																<img class="room--list__item-img" width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
															</c:when>
															<c:otherwise>
																<p>Không có hình ảnh!</p>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="col col-sixth">
													<div class="room-info">
														<div class="row">
															<div class="room-info-tittle">${post.pname}</div>
														</div>
														<ul class="row room-info-detail__list">
															<div class="col-full">
																<li class="room-detail__item ">Giá: <span
																	class="room-detail--price"> ${post.price}</span>
																</li>
																<li class="room-detail__item ">Diện tích: <span
																	class="room-detail--area">${post.area}m<sup>2</sup></span>
																</li>
																<li class="room-detail__item ">Địa chỉ: <span
																	class="room-detail--address">${post.addDetail}, ${post.ward.wname}, ${post.district.dname}</span>
																</li>
															</div>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</ul>
									</a>
								</c:forEach>
							</c:when>
							<c:when test="${not empty postUniversityList}">
								<c:forEach items="${postUniversityList}" var="post">
									<a target="_blank" href="${pageContext.request.contextPath}/detail/${StringUtil.makeSlug(post.pname)}-${post.pid}.html">
									<ul class="room--list">
										<div class="room--list__item">
											<div class="row">
												<div class="col col-third">
													<div class="room--list__item-img">
														<c:choose>
															<c:when test="${not empty post.picture}">
																<img class="room--list__item-img" width="100px" height="70px" src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
															</c:when>
															<c:otherwise>
																<p>Không có hình ảnh!</p>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="col col-sixth">
													<div class="room-info">
														<div class="row">
															<div class="room-info-tittle">${post.pname}</div>
														</div>
														<ul class="row room-info-detail__list">
															<div class="col-full">
																<li class="room-detail__item ">Giá: <span
																	class="room-detail--price"> ${post.price}</span>
																</li>
																<li class="room-detail__item ">Diện tích: <span
																	class="room-detail--area">${post.area}m<sup>2</sup></span>
																</li>
																<li class="room-detail__item ">Địa chỉ: <span
																	class="room-detail--address">${post.addDetail}, ${post.ward.wname}, ${post.district.dname}</span>
																</li>
															</div>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</ul>
									</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>Không có bài đăng nào!</p>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty postList}">
								<!-- Pagination -->
								<c:if test="${not empty totalPage && totalPage > 0}">
									<nav class="text-center" aria-label="...">
									   <ul class="pagination">
									      <li class='<c:if test="${currentPage == 1}">disabled</c:if>' ><a href="${pageContext.request.contextPath}/index-${currentPage-1}.html" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									      <c:forEach begin="1" end="${totalPage}" var="i">
										  	<li class='<c:if test="${currentPage == i}">active</c:if>'><a href="${pageContext.request.contextPath}/index-${i}.html">${i} <span class="sr-only">(current)</span></a></li>
										  </c:forEach>
									      <li class='<c:if test="${currentPage == totalPage}">disabled</c:if>'><a href="${pageContext.request.contextPath}/index-${currentPage+1}.html" aria-label="Next"><span aria-hidden="true">»</span></a></li>
									   </ul>
									</nav>
								</c:if>
								<!-- /.pagination -->
							</c:when>
							<c:when test="${not empty postDistrictList}">
								<!-- Pagination -->
								<c:if test="${not empty totalPage && totalPage > 0}">
									<nav class="text-center" aria-label="...">
									   <ul class="pagination">
									      <li class='<c:if test="${currentPage == 1}">disabled</c:if>' ><a href="${pageContext.request.contextPath}/district/${StringUtil.makeSlug(district.dname)}-${district.did}-${currentPage-1}.html" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									      <c:forEach begin="1" end="${totalPage}" var="i">
										  	<li class='<c:if test="${currentPage == i}">active</c:if>'><a href="${pageContext.request.contextPath}/district/${StringUtil.makeSlug(district.dname)}-${district.did}-${i}.html">${i} <span class="sr-only">(current)</span></a></li>
										  </c:forEach>
									      <li class='<c:if test="${currentPage == totalPage}">disabled</c:if>'><a href="${pageContext.request.contextPath}/district/${StringUtil.makeSlug(district.dname)}-${district.did}-${currentPage+1}.html" aria-label="Next"><span aria-hidden="true">»</span></a></li>
									   </ul>
									</nav>
								</c:if>
								<!-- /.pagination -->
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="sidebar col col-third">
					<div class="areas--under-layer">
						<div class="areas--upper-layer">Trường</div>
					</div>

					<div class=" schools-chooses__box">
						<ul class="areas--list">
							<c:choose>
								<c:when test="${not empty uniList}">
									<c:forEach items="${uniList}" var="uni">
										<li class="areas--list__item hover--box__item" value="${uni.uid}"><a
											href="${pageContext.request.contextPath}/university/${StringUtil.makeSlug(uni.name)}-${uni.uid}.html">${uni.name}</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="areas--list__item hover--box__item">Không có trường nào!</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

					<div class="areas--under-layer">
						<div class="areas--upper-layer">Khu vực</div>
					</div>
					<div class=" areas-chooses__box" style="margin-bottom: 20px;">
						<ul class="areas--list">
							<c:choose>
								<c:when test="${not empty districtList}">
									<c:forEach items="${districtList}" var="district">
										<li class="areas--list__item hover--box__item" value="${district.did}"><a
											href="${pageContext.request.contextPath}/district/${StringUtil.makeSlug(district.dname)}-${district.did}.html">${district.dname}</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="areas--list__item hover--box__item">Không có quận nào!</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

					<div class="areas--under-layer">
						<div class="areas--upper-layer">Đăng ký nhận tin</div>
					</div>

					<div class="register">
						<p class="register--text">Trang web chuyên cung cấp thông tin
							về phòng trọ uy tín chất lượng cho sinh viên tại Đà Nẵng. Ngoài
							ra đây cũng là nơi các chủ nhà trọ có thể đăng tin về phòng trọ
							cho thuê</p>
						<c:if test="${not empty msg1}">
							<div class="alert alert-success" role="alert">${msg1}</div>
						</c:if>
						<form action="${pageContext.request.contextPath}/mail/add" method="post">
							<input style="padding: 10px 12px; width: 100%; border: 1px solid #ccc; font-size: 16px;" type="email" name="email" placeholder="Nhập email..." />
							<form:errors path="mail.email" cssStyle="color:red" cssClass="error" /> 
							<select style="padding: 10px 12px; width: 100%; margin: 20px 0; border: 1px solid #ccc; font-size: 16px;" name="did">
								<c:choose>
									<c:when test="${not empty districtList}">
										<option class="areas--list__item hover--box__item" value="0">
											Chọn quận</option>
										<c:forEach items="${districtList}" var="district">
											<option class="areas--list__item hover--box__item" value="${district.did}">
											${district.dname}</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option  class="district--list areas--list__item hover--box__item">Không có quận nào!</option>
									</c:otherwise>
								</c:choose>
							</select>
							<form:errors path="mail.did" cssStyle="color:red" cssClass="error" /> 
							<input type="submit"  class="register-btn btn1" value="Đăng ký ngay"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<div class="room-detail">
	<div class="room-detail--wrap">
		<div class="container">
			<div class="room-detail--contents">
				<div class="row">
					<c:choose>
						<c:when test="${not empty post}">
							<div class="col col-sixth" style="margin-right: 30px;">
								<h1 class="room-heading">Hình ảnh thực tế</h1>
								<div class="room--img">
									<c:choose>
										<c:when test="${not empty post.picture}">
											<img class="room--img__item" width="100px" height="70px"
												src="${pageContext.request.contextPath}/resources/uploads/${post.picture}" />
										</c:when>
										<c:otherwise>
											<p>Không có hình ảnh!</p>
										</c:otherwise>
									</c:choose>
								</div>
								<h2 class="room--title">${post.pname}</h2>
								<h4 class="room-address-detail">${post.addDetail}</h4>
								<h6 class="room-price">${post.price}</h6>

								<h1 class="room-heading">Thông tin chi tiết</h1>

								<div class="content-box">
									<div class="row">
										<div class="col col-full">
											<p class="room-info--detail">${post.description}</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col col-third">
								<h1 class="room-heading">Thông tin chính</h1>

								<div class="content-box">
									<ul class="infomation--list">
										<li class="infomation--list__item"><label for="">Diện
												tích: </label> <span class="room-infomation--price">${post.area}<span>m<sup>2</sup></span></span>
										</li>
										<li class="infomation--list__item"><label for="">Quận:
										</label> <span class="room-infomation--price">${post.district.dname}</span></li>
										<li class="infomation--list__item"><label for="">Giá
												thuê: </label> <span class="room-infomation--price">${post.price}</span></li>
										<li class="infomation--list__item"><label for="">Phường:
										</label> <span class="room-infomation--price">${post.ward.wname}</span></li>
										<!-- <li class="infomation--list__item"><label for="">Số
										điện thoại</label> <span class="room-infomation--phone-num">0916685091</span>
								</li> -->
										<li class="infomation--list__item"><label for="">Ngày
												đăng: </label> <span class="room-infomation--date"> <fmt:formatDate
													value="${post.dateCreate}" pattern="dd-MM-yyyy" />
										</span></li>
									</ul>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<p>Không có bài đăng này!</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
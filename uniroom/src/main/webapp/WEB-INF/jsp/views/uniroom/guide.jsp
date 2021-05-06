<%@page import="phin.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp"%>
<!-- Banner -->
<div id="banner" style="height: auto;">
	<div class="banner-wrapper">
		<div class=" " style="">
			<img style="width: 100%; height: auto;" src="${pageContext.request.contextPath}/resources/uniroom/Img/SHARE.png">
		</div>
	</div>
</div>
<!-- contents -->
<div id="contents" style="padding: 50px 0 100px 0; background-color: #fff;">
	<div class="container">
		<div class="row">
			<div class="col col-full" style=" ">
				<ul class="news-box--list">
					<c:choose>
						<c:when test="${not empty guideList}">
							<c:forEach items="${guideList}" var="guide">
								<li class="news-box--item">
									<div class="row">
										<div class="col col-full"
											style="display: flex; flex-direction: column; justify-content: space-between;">
											<h3 style="font-weight: 600;  margin-bottom: 20px;" class="news--heading">${guide.gname}</h3>
											<div class="btn1" style="width: 150px; text-align: center; padding: 10px 0;">
												<a style="text-decoration: none; color: #fff;" href="${pageContext.request.contextPath}/guide/${StringUtil.makeSlug(guide.gname)}-${guide.gid}.html">Xem thêm</a></div>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:when test="${not empty guide}">
							<li class="news-box--item">
									<div class="row">
										<div class="col col-full"
											style="display: flex; flex-direction: column; justify-content: space-between; ">
											<h3 style="font-weight: 600; margin-bottom: 0px; padding-left: 30px; padding-right: 30px; color: #FB937C; font-size: 2rem;"  class="news--heading">${guide.gname}</h3>
											<br><br>
											<p style="padding-left: 30px; padding-right: 30px; line-height: 1.6;" class="new--text-contents">${guide.content}</p>
										</div>
									</div>
								</li>
						</c:when>
						<c:otherwise>
							<li>Không có chia sẻ nào!</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>
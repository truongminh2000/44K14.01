<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<c:url value="${request.contextPath}/resources/uniroom" var="contextPath" scope="application"/>

<div class="container">
	<div class="footer-wrap" >
		<div class="row">
			<div class="col col-third">
				<a href="${pageContext.request.contextPath}/index.html"><img src="${contextPath}/Design/Logo.png" alt="" class="footer-logo--img"></a>
				<p class="footer-intro--text">
					Trang web chuyên cung cấp thông tin về phòng trọ uy tín chất lượng
					cho sinh viên tại Đà Nẵng. <br> <br> Ngoài ra đây cũng là
					nơi các chủ nhà trọ có thể đăng tin về phòng trọ cho thuê
				</p>
			</div>
			<div class="col col-third">
				<div class="footer--heading">Thông tin liên hệ</div>
				<ul class="social-list">
					<div class="social-list__item">
						<i style="color: #0077FF;" class="fab fa-facebook-square"></i> <a 
							class="social-list__link">facebook.com/phinteam.uniroom</a>
					</div>
					<div class="social-list__item">
						<i style="color: #FB4E4E;" class="fab fa-firefox"></i> <a href="http://phinuniroom.j.layershift.co.uk"
							class="social-list__link">phinuniroom.j.layershift.co.uk</a>
					</div>
					<div class="social-list__item">
						<i style="color: #EC00E4;" class="fas fa-at"></i> <a
							class="social-list__link">uniroom.phinteam@gmail.com</a>
					</div>
					<div class="social-list__item">
						<i style="color: #0DC500;" class="fas fa-map-marked-alt"></i> <a
							class="social-list__link">14 Doãn Uẩn, Đà Nẵng</a>
					</div>
				</ul>
			</div>
			<div class="col col-third">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.5943020211957!2d108.24099905055941!3d16.034621144568803!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142175ea5d8d99d%3A0x2e7e2969e5e69555!2zMTQgRG_Do24gVeG6qW4sIEtodcOqIE3hu7ksIE5nxakgSMOgbmggU8ahbiwgxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1617447246871!5m2!1svi!2s"
					width="100%" height="200px"
					style="border: 1px solid rgb(0, 0, 0, 0.1); margin-top: 40px; border-radius: 5px;"
					allowfullscreen="" loading="lazy">
				</iframe>
			</div>
		</div>
	</div>
</div>
<div class="copyright">
	<p style="margin-top: 0; margin-bottom: 0;" class="copyright--text">Copyright © 2021 UNIROOM All Rights
		Reserved - Design by PHINTEAM</p>

</div>

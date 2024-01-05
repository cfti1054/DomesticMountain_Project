<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 삭제 해야함 */
}

.maps-container {
	margin: 30px auto;
	max-width: 1200px;
	padding-top: 120px;
}
</style>


<section class="features-1">
	<div class="maps-container">
	<div class="test">
		<div class="maps-sub-title">

			<div class="mountain-img">
			<c:choose>
				<c:when test="${not empty dto.mountain_img}">
					<img src="${dto.mountain_img}">
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/resources/images/mountain/default_mountain.png">
				</c:otherwise>
			</c:choose>
				
			</div>
			<div class="mountain-title">
				<button type="button" class="btn btn-light" style="color: white; background-color: #6e91b4; float: right;" 
					onclick="location.href='${pageContext.request.contextPath}/echartsMap/main'">뒤로가기</button>
				
				<div class="name-kor">
					<h2>${dto.mountain_name}</h2>
				</div>

				<div class="name-chi">
					<h6>&#91; ${dto.mountain_chinese} &#93;</h6>
					<p>${dto.mountain_subtitle}</p>
				</div>

				<div class="mountain_height">
					<p>${dto.height} (m)</p>
				</div>
				
			</div>
		</div>

		<div class="mountain-sub">
			<div class="mountain_details">
				<h3 class="mountain_location">지역</h3>
				<p>${dto.mountain_location}</p>
				
				<h3 class="mountain_manage">관리</h3>
				<p>${dto.mountain_manage != null ? dto.mountain_manage : '관리 정보가 없습니다.'}</p>
			</div>
			<div class="main_content">
				<h3>상세 설명</h3>
				<p>${dto.main_content}</p>
			</div>
			
			<div class="sub_content">
				<h3>부가 설명</h3>
				<p>${dto.sub_content != null ? dto.sub_content : '부가 설명이 등록되어 있지 않습니다.'}</p>
			</div>
		</div>
</div>
	</div>
</section>


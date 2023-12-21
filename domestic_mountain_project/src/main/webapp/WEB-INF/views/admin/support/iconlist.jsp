<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- tab -->




<%-- <h6 class="text-muted">검색결과 : ${dataCount}개(${page}/${total_page} 페이지)</h6> --%>
<div class="row" style="height: 50px;">
	<div class="d-flex justify-content-start mx-auto gap-3 float-end">


		<div class="col-1">
			<select name="schType" id="ProductStatus"
				class="form-select text-capitalize">
				<option value="all" ${schType=="all"?"selected":""}>All</option>
				<option value="dog" ${schType=="dog"?"selected":""}>Dog</option>
				<option value="cat" ${schType=="cat"?"selected":""}>Cat</option>
				<option value="etc" ${schType=="etc"?"selected":""}>etc</option>
			</select>
		</div>
		<div class="col-2">
			<input class="form-control" type="text" name="kwd" value="${kwd =='undfined'?'kwd':''}"
				placeholder="이름">
		</div>
		<div class="col">
			<button class="btn btn-secondary" onclick="searchIcon();">검색</button>
			<label class="text-muted"
				style="padding-left: 15px; font-size: 19px;">검색결과(${dataCount}개)</label>

		</div>
		<div class="col text-end">
			<button class="btn btn-secondary" data-bs-toggle="modal"
				data-bs-target="#editUser">+ 아이콘 추가</button>
		</div>

	</div>
</div>
<div class="card " style="background-color: white;">

	<div class="card-datable ">

		<div class="tab-pane fade active show" id="navs-top-home"
			role="tabpanel">

			<!-- iconlist -->
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="d-flex flex-wrap mt-4 ms-3 me-2 " id="icons-container"
					style="border: none; float: left;">
					<div
						class="card icon-card cursor-pointer text-center mb-4 mx-2 pe-3 p-3"
						style="background-color: white; border: 0;">
						<!-- 	<input type="checkbox" style="align-self: flex-end;">  -->
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#modalCenter" 
							data-icon-name="${dto.iconName}"
							data-icon-price="${dto.iconPrice}"
							data-icon-category="${dto.iconCategory}"
							data-icon-num="${dto.iconNum}"
							data-icon-iconimage="${dto.iconImage}">


							<img style="border: none; width: 70px; height: 70px;"
								src="${pageContext.request.contextPath}/uploads/photo/${dto.iconImage}"
								class="img-fluid"
								data-app-light-img="illustrations/sitting-girl-with-laptop-light.png"
								data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">

							<div id="iconName" style="display: none;">${dto.iconName}</div>
							<div id="iconPrice" style="display: none;">${dto.iconPrice}</div>
							<div id="iconCategory" style="display: none;">${dto.iconCategory}</div>

						</button>
						<p style="padding-bottom: 0; margin-bottom: 0;"></p>
					</div>
				</div>
			</c:forEach>
			<!--  -->

		</div>
	</div>
</div>


<!-- modal -->
<div class="modal fade" id="modalCenter" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalCenterTitle">아이콘 자세히 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body img-icon row justify-content-center"></div>

		</div>
	</div>
</div>

<script type="text/javascript">
	$('#modalCenter').on( 'show.bs.modal',
					function(event) {
						// 모달을 트리거한 버튼을 가져오기
						let button = $(event.relatedTarget);

						let iconName = button.data('icon-name');
						let iconPrice = button.data('icon-price');
						let iconCategory = button.data('icon-category');
						let iconNum = button.data('icon-num');
						let iconImage = button.data('icon-iconimage');

						// 버튼의 데이터 속성에서 이미지 소스 가져오기
						let imageSrc = button.find('img').attr('src');

						let result = '<img style="max-width: 100%;" src="'
								+ imageSrc + '">';

						result += '<div class="text-center">'
						result += '<div> 이름 : ' + iconName + '</div>';
						result += '<div> 가격 : ' + iconPrice + '</div>';
						if (iconCategory === 1) {
							result += '<div> 카테고리 : 강아지 </div>';
						} else if (iconCategory === 2) {
							result += '<div> 카테고리 : 고양이 </div>';
						} else {
							result += '<div> 카테고리 : 기타 </div>';
						}
						result += '<button class="btn btn-danger deleteIcon" data-num="'+ iconNum +'" data-iconImage="'+ iconImage +'" >아이콘 삭제</button>'

						result += '<div>'
						// modal-body 내의 img의 src 속성 업데이트
						$('#modalCenter .img-icon').html(result);
			});
</script>
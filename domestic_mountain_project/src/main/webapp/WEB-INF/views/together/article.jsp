<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/together.css"
	type="text/css">

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
	    margin-bottom: 200px;
}

.body-container {
	padding-top: 120px;
	max-width: 1400px;
	display: flex;
	margin: auto;
	background: none;
}

.body-main {
	max-width: 900px;
}

.table-article img {
	max-width: 650px;
}


.file-item {
	padding: 7px;
	margin-bottom: 3px;
	border: 1px solid #ced4da;
	color: #777777;
}

.table {
	margin: 3rem auto;
	width: 900px; 
	--bs-table-bg: none;
}

.notice-container .table tbody tr td p {
	word-break:break-all !important;
	background-color: unset !important;
}

</style>

<script type="text/javascript">
	function deleteOk() {
		let query = 'post_num=${dto.post_num}&${query}';
		let url = '${pageContext.request.contextPath}/together/delete?' + query;

		if (confirm('위 자료를 삭제 하시 겠습니까 ? ')) {
			location.href = url;
		}
	}
</script>
<section class="features-1">
	<div class="body-container">
		<div class="aside-box">
			<div class="aside" id="scroll">
				<div class="aside-wi">
					<h1 class="submenu-main">Community</h1>
					<h3>
						<a>Community</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/recommend/list">&gt;
								추천 코스</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/createcourse/list">&gt; 유저가
								만든 코스</a></li>
						<li class=""><a href="#">&nbsp;</a></li>
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/together/list">&gt;
								동행 산행 신청</a></li>
					</ul>

					<h3>
						<a>Share Tips</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/share/list">&gt; 유용한
								정보</a></li>
					</ul>

					<h3>
						<a>Walk &amp; Climbing</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/appearance/list">&gt;
								회원들의 모습</a></li>
					</ul>

					<h3>
						<a>Look &amp; Style</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/ootd/list">&gt; 스트릿
								스냅 (OOTD)</a></li>
					</ul>

				</div>
			</div>
		</div>


		<div class="contentWrap">

			<div class="amain">
				<h1 class="amain-main">
					<a>동행 산행 신청<span>| An application for a hike Together</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 동행 산행 신청</span>
				</h1>
			</div>
 
			<div class="notice-container">

				<table class="table table-border table-article">
					<thead>
						<tr>
							<td colspan="2" align="center"
								style="font-weight: 900; color: #c4676e;">${dto.post_title}</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td width="50%" align="left">작성자 : ${dto.user_name}</td>
							<td width="50%" align="right">작성 일자 : ${dto.post_reg_date} |
								조회 ${dto.post_hit_count}</td>
						</tr>

						<tr>
							<td width="50%" align="left">동행 기간 : ${dto.start_date} ~
								${dto.end_date}</td>
							<td width="50%" align="right">응모한 인원 :
								<span class="count_max">${dto.participantCount} / ${dto.gather_max}</span></td>
						</tr>
 
						<tr>
							<td width="50%" align="left">모집 종료 일자 :
								${dto.gather_expire_date}</td>
							<td width="50%" align="right">모집 장소 : ${dto.location_addr}</td>
						</tr>

						<tr style="border-bottom: none;" class="content-img-center">
							<td colspan="2" valign="top" height="200"
								style="border-bottom-width: 0;">${dto.post_content}</td>
						</tr>

						<tr>
							<td colspan="2" class="text-center p-3"	style="border-bottom: none;">
								<c:choose>
									<c:when	test="${userParticipantCount==true}">
										<button type="button" class="btn btn-outline-secondary btnSendParticipantCount"	title="신청222">
											
											<i class="${userParticipantCount ? 'fa-solid fa-circle-check' : 'fa-regular fa-circle-check'}"></i>&nbsp;
											<span id="participantCount">신청취소</span>
										</button>
									</c:when>
									<c:when	test="${dto.participantCount==dto.gather_max}">
										<button type="button" class="btn btn-outline-secondary btnSendParticipantCount"	title="신청222" disabled>
										
											<i class="bi"></i>
											<span id="participantCount">인원이 가득참</span>
										</button>
									</c:when>
									
									<c:otherwise>
										<button type="button" class="btn btn-outline-secondary btnSendParticipantCount"	title="신청222">
											
											<i class="${userParticipantCount ? 'fa-solid fa-circle-check' : 'fa-regular fa-circle-check'}"></i>&nbsp;
											<span id="participantCount">신청하기</span>
										</button>
									</c:otherwise>
								</c:choose>	
							</td>
						</tr>
						
						<tr>
							<td colspan="2"><c:forEach var="vo" items="${listFile}" varStatus="status">
									<p class="file-item">

										<i class="fa-regular fa-folder-open"></i> <a
											href="${pageContext.request.contextPath}/together/download?post_num=${vo.post_num}">${vo.originalFilename}</a>

									</p>
								</c:forEach></td>
						</tr>




						<tr class="prev-next">
							<td colspan="2">&nbsp;<c:if test="${not empty prevDto}">
									<a class="font-array"
										href="${pageContext.request.contextPath}/together/article?${query}&post_num=${prevDto.post_num}"><span class="a-span">이전글 : </span>${prevDto.post_title}</a>
								</c:if>
							</td>
						</tr>

						<tr class="prev-next">
							<td colspan="2">&nbsp;<c:if test="${not empty nextDto}">
									<a class="font-array"
										href="${pageContext.request.contextPath}/together/article?${query}&post_num=${nextDto.post_num}"><span class="a-span">다음글 : </span>${nextDto.post_title}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>

				<table class="table">
					<tr>
						<td width="50%" align="left">
							<c:choose>
								<c:when
									test="${sessionScope.loginUser.userid==dto.user_id}">
									<button type="button" class="btn btn-light"
										onclick="location.href='${pageContext.request.contextPath}/together/update?post_num=${dto.post_num}&page=${page}';">수정</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled>수정</button>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when
									test="${sessionScope.loginUser.userid==dto.user_id || sessionScope.loginUser.usership>50}">
									<button type="button" class="btn btn-light"
										onclick="deleteOk();">삭제</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled>삭제</button>
								</c:otherwise>
							</c:choose>
							
							
						</td>
						<td align="right">
							<button type="button" class="btn btn-light"
								onclick="location.href='${pageContext.request.contextPath}/together/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>

			</div>
		</div>



	</div>
</section>


<script>
	$(document).ready(function() {
		var currentPosition = parseInt($("#scroll").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#scroll").stop().animate({
				"top" : position + currentPosition + "px"
			}, 500);
		});
	});
	
	
	function login() {
		location.href = '${pageContext.request.contextPath}/user/login';
	}

	function ajaxFun(url, method, formData, dataType, fn, file = false) {
		const settings = {
				type: method, 
				data: formData,
				success:function(data) {
					fn(data);
					
				},
				beforeSend: function(jqXHR) {
					jqXHR.setRequestHeader('AJAX', true);
				},
				complete: function () {
				},
				error: function(jqXHR) {
					console.log(formData);
					if(jqXHR.status === 403) {
						login();
						return false;
					} else if(jqXHR.status === 400) {
						alert('요청 처리가 실패 했습니다.');
						return false;
			    	}
			    	
					console.log(jqXHR.responseText);
				}
		};
		
		if(file) {
			settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
			settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
		}
		
		$.ajax(url, settings);
	}
	

// 신청하기
$(function(){
	$('.btnSendParticipantCount').click(function(){
		const $i = $(this).find('i');
		let userApply = $i.hasClass('fa-solid fa-circle-check');
		let msg = userApply ? '신청을 취소하시겠습니까 ? ' : '신청을 하시겠습니까 ? ';
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/together/insertParticipant';
		let num = '${dto.post_num}';
		let query = 'post_num=' + num + '&userApply=' + userApply;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userApply ) {
					$i.removeClass('fa-solid fa-circle-check').addClass('fa-regular fa-circle-check');
					$('#participantCount').text('신청하기');
				} else {
					$i.removeClass('fa-regular fa-circle-check').addClass('fa-solid fa-circle-check');
					$('#participantCount').text('신청취소');
				}
			
				let count = data.participantCount;
				let s = count + " / ${dto.gather_max}";
				$(".count_max").html(s);
				
			} else if(state === 'apply') {
				alert('동행 신청은 한번만 가능합니다. !!!');
			} else if(state === "false") {
				alert('동행 신청 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

	
	
</script>


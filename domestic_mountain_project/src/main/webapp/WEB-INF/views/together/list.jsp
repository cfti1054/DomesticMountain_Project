<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/*=============== body (area) ===============*/
.features-1 {
	height: 2000px; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	padding-top: 120px;
	max-width: 1400px;
	display: flex;
	margin: auto;
}

</style>


<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
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
							href="${pageContext.request.contextPath}/made/list">&gt; 유저가
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
				<ul class="article-movie-sub">
					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~ </a>
								</div>

								<div class="con_bottom">
									<div class="user_info">
										<div class="pers_nick_area">
											<table role="presentation">
												<tbody>
													<tr>
														<td class="p-nick"><a class="m-tcol-c" onclick="">관리자</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="date_num">
											<span class="date">2021.12.31</span> <span class="num">조회수
												2,509</span> <span class="comment_ico">댓글</span> <em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/resources/images/hiking.png"
								width="200" height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>


					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~ </a>
								</div>

								<div class="con_bottom">
									<div class="user_info">
										<div class="pers_nick_area">
											<table role="presentation">
												<tbody>
													<tr>
														<td class="p-nick"><a class="m-tcol-c" onclick="">관리자</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="date_num">
											<span class="date">2021.12.31</span> <span class="num">조회수
												2,509</span> <span class="comment_ico">댓글</span> <em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</li>

					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~ </a>
								</div>

								<div class="con_bottom">
									<div class="user_info">
										<div class="pers_nick_area">
											<table role="presentation">
												<tbody>
													<tr>
														<td class="p-nick"><a class="m-tcol-c" onclick="">관리자</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="date_num">
											<span class="date">2021.12.31</span> <span class="num">조회수
												2,509</span> <span class="comment_ico">댓글</span> <em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/resources/images/hiking.png"
								width="200" height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>

					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~ </a>
								</div>

								<div class="con_bottom">
									<div class="user_info">
										<div class="pers_nick_area">
											<table role="presentation">
												<tbody>
													<tr>
														<td class="p-nick"><a class="m-tcol-c" onclick="">관리자</a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="date_num">
											<span class="date">2021.12.31</span> <span class="num">조회수
												2,509</span> <span class="comment_ico">댓글</span> <em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img
								src="${pageContext.request.contextPath}/resources/images/hiking.png"
								width="200" height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>
				</ul>
				<div class="page-navigation">1 2 3</div>


				<div class="row board-list-footer">
							<div class="col">
								<button type="button" class="btn btn-light" onclick="#"
									title="새로고침">
									<i class="bi bi-arrow-counterclockwise"></i>
								</button>
							</div>
							<div class="col text-center">&nbsp;</div>
							

							<div class="col-6 text-end">
								<form class="row text-end-row" name="searchForm" action="#"
									method="post">
									<div class="col-auto p-1">
										<select name="schType" class="form-select">
											<!-- 예시 : <option value="all" ${schType=="all"?"selected":""}>제목+내용</option> -->
											<option value="all">제목+내용</option>
											<option value="reg_date">등록일</option>
											<option value="subject">제목</option>
											<option value="writer">작성자</option>
											<option value="content">내용</option>
										</select>
									</div>
									<div class="col-auto p-1">
										<input type="text" name="kwd" value="${kwd}"
											class="form-control">
									</div>
									<div class="col-auto p-1">
										<button type="button" class="btn btn-light"
											onclick="searchList()">
											<i class="bi bi-search"></i>
										</button>

										<button type="button" class="btn btn-light"
											onclick="searchList()">글올리기</button>
									</div>
								</form>
							</div>
						</div>

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
</script>
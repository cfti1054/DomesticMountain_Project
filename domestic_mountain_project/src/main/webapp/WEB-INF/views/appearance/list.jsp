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
						<li class=""><a
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
						<li class="eq1"><a
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
					<a>회원들의 모습<span>| Members' Appearance</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 회원들의 모습</span>
				</h1>
			</div>




			<div class="notice-container">
				<div class="col-auto me-auto">
						${dataCount}개(${page}/${total_page} 페이지)</div>
				<div class="section">
					<div class="article-album-sub">
						<c:forEach var="dto" items="${list}" varStatus="status">
							<ul>


								<li class="show-2-li"><a href="#" class="album-img"> <img
										width="200" height="200"
										src="${pageContext.request.contextPath}/uploads/appearance/${dto.saveFilename}"
										alt="">
								</a>

									<dl>
										<dt>
											<c:url var="url" value="/appearance/article">
												<c:param name="post_num" value="${dto.post_num}"/>
												<c:param name="page" value="${page}"/>
												<c:if test="${not empty kwd}">
													<c:param name="schType" value="${schType}"/>
													<c:param name="kwd" value="${kwd}"/>
												</c:if>	
											</c:url>
										
											<a href="${url}" class="tit"> <span class="inner"> <span
													class="ellipsis">${dto.post_title}</span>
											</span>
											</a> <a href="#" class="m-tcol-p"> <span class="num">[${dto.replyCount}]</span>
											</a>
										</dt>

										<dd class="p-nick">
											<div class="pers_nick_area">
												<span>${dto.user_name}</span>
											</div>
										</dd>

										<dd class="date_num">
											<span class="date">${dto.post_reg_date}</span> <span
												class="num">조회: ${dto.post_hit_count}</span>
										</dd>
									</dl></li>

							</ul>

						</c:forEach>

						<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}</div>

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
											onclick="location.href='${pageContext.request.contextPath}/appearance/write';">글올리기</button>
									</div>
								</form>
							</div>
						</div>


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
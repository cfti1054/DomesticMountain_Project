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
						<li class="eq1"><a
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
					<a>유저가 만든 코스<span>| Course created by the User</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 유저가 만든 코스</span>
				</h1>
			</div>

			<div class="show1">
				<div class="output-type">

					<div class="sort_form">
						<a href="#" onclick="" class="sort_card "><span class="blind"><i
								class="fa-solid fa-server fa-2x sort-color show-1"></i></span></a> <a
							href="#" onclick="" class="sort_album "><span class="blind"><i
								class="fa-solid fa-border-all fa-2x show-2"></i></span></a> <a href="#"
							onclick="" class="sort_list "><span class="blind"><i
								class="fa-solid fa-list-ul fa-2x show-3"></i></span></a>
					</div>
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
										<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부
											설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
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
										<a href="#" class="txt"></a>
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



			<div class="show2">
				<div class="output-type">

					<div class="sort_form">

						<a href="#" onclick="" class="sort_card "><span class="blind"><i
								class="fa-solid fa-server fa-2x show-1"></i></span></a> <a href="#"
							onclick="" class="sort_album "><span class="blind"><i
								class="fa-solid fa-border-all fa-2x sort-color show-2"></i></span></a> <a
							href="#" onclick="" class="sort_list "><span class="blind"><i
								class="fa-solid fa-list-ul fa-2x show-3"></i></span></a>
					</div>
				</div>


				<div class="notice-container">

					<div class="section">
						<div class="article-album-sub">
							<ul>
								<li class="show-2-li"><a href="#" class="album-img"> <img width="200"
										height="200"
										src="${pageContext.request.contextPath}/resources/images/hiking.png"
										alt="">
								</a>

									<dl>
										<dt>
											<a href="#" class="tit"> <span class="inner"> <span
													class="ellipsis">데일리룩</span>
											</span>
											</a> <a href="#" class="m-tcol-p"> <span class="num">[7]</span>
											</a>
										</dt>

										<dd class="p-nick">
											<div class="pers_nick_area">
												<span>작성자</span>
											</div>
										</dd>

										<dd class="date_num">
											<span class="date">2023-11-11</span> <span class="num">조회:
												8</span>
										</dd>
									</dl></li>
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
			</div>


			<div class="show3">
				<div class="output-type">

					<div class="sort_form">
						<a href="#" onclick="" class="sort_card "><span class="blind"><i
								class="fa-solid fa-server fa-2x show-1"></i></span></a> <a href="#"
							onclick="" class="sort_album "><span class="blind"><i
								class="fa-solid fa-border-all fa-2x show-2"></i></span></a> <a href="#"
							onclick="" class="sort_list "><span class="blind"><i
								class="fa-solid fa-list-ul fa-2x sort-color show-3"></i></span></a>
					</div>
				</div>



				<div class="notice-container">
					<div class="notice-body">
						<div class="body-main">
							<div class="row board-list-header">
								<div class="col-auto me-auto">10개(1/2 페이지)</div>
								<div class="col-auto">&nbsp;</div>
							</div>

							<table class="table table-hover board-list">
								<thead class="table-light">
									<tr>
										<th width="60">번호</th>
										<th>제목</th>
										<th width="100">작성자</th>
										<th width="100">작성일</th>
										<th width="70">조회수</th>
									</tr>
								</thead>
								<tbody>


									<tr>
										<td>234</td>
										<td class="left"><a href="#" class="text-reset">내용입니다.</a>
											<span class="badge text-bg-info">New</span></td>
										<td>관리자</td>
										<td>2023-11-11</td>
										<td>11</td>
									</tr>
								</tbody>
							</table>

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
	
	
	$(document).ready(function() {
		$('.show1').show(); //페이지를 로드할 때 표시할 요소
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.show3').hide(); //페이지를 로드할 때 숨길 요소
		
		$('.show-1').click(function(){
			$ ('.show2').hide(); //클릭 시 두 번째 요소 숨김
			$ ('.show3').hide(); //클릭 시 세 번째 요소 숨김
			$ ('.show1').show(); //클릭 시 첫 번째 요소 표시
			return false;
		});
		
		$('.show-2').click(function(){
			$ ('.show3').hide(); //클릭 시 세 번째 요소 숨김
			$ ('.show1').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.show2').show(); //클릭 시 두 번째 요소 표시
			return false;
			});
		
		$('.show-3').click(function(){
			$ ('.show1').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.show2').hide(); //클릭 시 두 번째 요소 숨김
			$ ('.show3').show(); //클릭 시 세 번째 요소 표시
			return false;
			});
	});
</script>
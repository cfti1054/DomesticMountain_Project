<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
}


.board-article img {
	max-width: 650px;
}

.notice-container {
	margin: 3rem;
}

.mb-0 {
--bs-table-bg: none;
}

.notice-container .table tbody tr td p {
	word-break:break-all !important;
	background-color: unset !important;
}

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<c:if
	test="${sessionScope.loginUser.userid==dto.user_id||sessionScope.loginUser.usership>50}">
	<script type="text/javascript">
		function deleteBoard() {
		    if(confirm('게시글을 삭제 하시 겠습니까 ? ')) {
			    let query = 'post_num=${dto.post_num}&${query}';
			    let url = '${pageContext.request.contextPath}/appearance/delete?' + query;
		    	location.href = url;
		    }
		}
	</script>
</c:if>

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

				<table class="table mt-5 mb-0 board-article">
					<thead>
						<tr>
							<td colspan="2" align="center" style="font-weight: 900; color: #c4676e;">${dto.post_title}</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td width="50%">이름 : ${dto.user_name}</td>
							<td align="right">${dto.post_reg_date} | 조회
								${dto.post_hit_count}</td>
						</tr>

						<tr>
							<td colspan="2" valign="top" height="200"
								style="border-bottom: none;">${dto.post_content }</td>
						</tr>

						<tr>
							<td colspan="2" class="text-center p-3"
								style="border-bottom: none;">
								<button type="button"
									class="btn btn-outline-secondary btnSendBoardLike" title="좋아요">
									<i
										class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span
										id="boardLikeCount">${dto.boardLikeCount}</span>
								</button>
							</td>
						</tr>


						<tr>
							<td colspan="2"><c:if test="${not empty dto.saveFilename}">
									<p class="border text-secondary my-1 p-2">
										<i class="bi bi-folder2-open"></i> <a
											href="${pageContext.request.contextPath}/appearance/download?post_num=${dto.post_num}">${dto.originalFilename}</a>
									</p>
								</c:if></td>
						</tr>

						<tr>
							<td colspan="2">&nbsp;<c:if test="${not empty prevDto}">
									<a class="font-array"
										href="${pageContext.request.contextPath}/appearance/article?${query}&post_num=${prevDto.post_num}"><span class="a-span">이전글 : </span>${prevDto.post_title}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;<c:if test="${not empty nextDto}">
									<a class="font-array"
										href="${pageContext.request.contextPath}/appearance/article?${query}&post_num=${nextDto.post_num}"><span class="a-span">다음글 : </span>${nextDto.post_title}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>

				<table class="table table-borderless mb-2">
					<tr>
						<td width="50%"><c:choose>
								<c:when test="${sessionScope.loginUser.userid==dto.user_id}">
									<button type="button" class="btn btn-light"
										onclick="location.href='${pageContext.request.contextPath}/appearance/update?post_num=${dto.post_num}&page=${page}';">수정</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled>수정</button>
								</c:otherwise>
							</c:choose> <!--  --> <c:choose>
								<c:when
									test="${sessionScope.loginUser.userid==dto.user_id || sessionScope.loginUser.usership>50}">
									<button type="button" class="btn btn-light"
										onclick="deleteBoard();">삭제</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-light" disabled>삭제</button>
								</c:otherwise>
							</c:choose></td>
						<td class="text-end">
							<button type="button" class="btn btn-light"
								onclick="location.href='${pageContext.request.contextPath}/appearance/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>

				<div class="reply">
					<form name="replyForm" method="post">
						<div class='form-header'>
							<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는
								글의 게시를 삼가해 주세요.</span>
						</div>

						<table class="table table-borderless reply-form">
							<tr>
								<td><textarea class='form-control' name="content"></textarea>
								</td>
							</tr>
							<tr>
								<td align='right'>
									<button type='button' class='btn btn-light btnSendReply'>댓글
										등록</button>
								</td>
							</tr>
						</table>
					</form>

					<div id="listReply"></div>
				</div>
			</div>

		</div>
	</div>
</section>


<script type="text/javascript">

// 스크롤 따라다니기
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
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.11');
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

// 게시글 공감 여부
$(function(){
	$('.btnSendBoardLike').click(function(){
		const $i = $(this).find('i');
		let userLiked = $i.hasClass('bi-hand-thumbs-up-fill');
		let msg = userLiked ? '게시글 공감을 취소하시겠습니까 ? ' : '게시글에 공감하십니까 ? ';
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/appearance/insertBoardLike';
		let num = '${dto.post_num}';
		let query = 'post_num=' + num + '&userLiked=' + userLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userLiked ) {
					$i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
				} else {
					$i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
				}
				
				let count = data.boardLikeCount;
				$('#boardLikeCount').text(count);
			} else if(state === 'liked') {
				alert('게시글 공감은 한번만 가능합니다. !!!');
			} else if(state === "false") {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

//페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = '${pageContext.request.contextPath}/appearance/listReply';
	let query = 'post_num=${dto.post_num}&pageNo=' + page;
	let selector = '#listReply';
	
	const fn = function(data){
		$(selector).html(data);
	};
	// ajaxFun(url, 'get', query, 'html', fn);
	ajaxFun(url, 'get', query, 'text', fn);
}

// 리플 등록
$(function(){
	$('.btnSendReply').click(function(){
		let post_num = '${dto.post_num}';
		const $tb = $(this).closest('table');

		let reply_content = $tb.find('textarea').val().trim();
		if(! reply_content) {
			$tb.find('textarea').focus();
			return false;
		}
		reply_content = encodeURIComponent(reply_content);
		
		let url = '${pageContext.request.contextPath}/appearance/insertReply';
		let query = 'post_num=' + post_num + '&reply_content=' + reply_content + '&reply_answer=0';
		
		const fn = function(data){
			$tb.find('textarea').val('');
			
			let state = data.state;
			if(state === 'true') {
				listPage(1);
			} else if(state === 'false') {
				alert('댓글을 추가 하지 못했습니다.');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 삭제, 신고 메뉴
$(function(){
	$('.reply').on('click', '.reply-dropdown', function(){
		const $menu = $(this).next('.reply-menu');
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$('.reply-menu').hide();
			$menu.fadeIn(100);

			let pos = $(this).offset(); // 선택한 요소 집합의 첫 번째 요소의 위치를 HTML 문서를 기준으로 반환
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	
	$('.reply').on('click', function() {
		if($(event.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let reply_num = $(this).attr('data-replyNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/appearance/deleteReply';
		let query = 'reply_num=' + reply_num + '&mode=reply';
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 댓글 좋아요 / 싫어요
$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$('.reply').on('click', '.btnSendReplyLike', function(){
		let reply_num = $(this).attr('data-replyNum');
		let replylike = $(this).attr('data-replyLike');
		const $btn = $(this);
		
		let msg = '게시물이 마음에 들지 않으십니까 ?';
		if(replylike === '1') {
			msg = '게시물에 공감하십니까 ?';
		}
		
		if(! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/appearance/insertReplyLike';
		let query = 'reply_num=' + reply_num + '&replylike=' + replylike;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				let likeCount = data.likeCount;
				let disLikeCount = data.disLikeCount;
				
				$btn.parent('td').children().eq(0).find('span').html(likeCount);
				$btn.parent('td').children().eq(1).find('span').html(disLikeCount);
			} else if(state === 'liked') {
				alert('게시물 공감 여부는 한번만 가능합니다. !!!');
			} else {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 댓글별 답글 리스트
function listReplyAnswer(reply_answer) {
	let url = '${pageContext.request.contextPath}/appearance/listReplyAnswer';
	let query = 'reply_answer=' + reply_answer;
	let selector = '#listReplyAnswer' + reply_answer;
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, 'get', query, 'text', fn);
}

// 댓글별 답글 개수
function countReplyAnswer(reply_answer) {
	let url = '${pageContext.request.contextPath}/appearance/countReplyAnswer';
	let query = 'reply_answer=' + reply_answer;
	
	const fn = function(data){
		let count = data.count;
		let selector = '#answerCount' + reply_answer;
		$(selector).html(count);
	};
	
	ajaxFun(url, 'post', query, 'json', fn);
}

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$('.reply').on('click', '.btnReplyAnswerLayout', function(){
		const $trReplyAnswer = $(this).closest('tr').next();
		
		let isVisible = $trReplyAnswer.is(':visible');
		let reply_num = $(this).attr('data-replyNum');
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(reply_num);
			
			// 답글 개수
			countReplyAnswer(reply_num);
		}
	});
	
});

// 댓글별 답글 등록
$(function(){
	$('.reply').on('click', '.btnSendReplyAnswer', function(){
		let post_num = '${dto.post_num}';
		let reply_num = $(this).attr('data-replyNum');
		const $td = $(this).closest('td');
		
		let reply_content = $td.find('textarea').val().trim();
		if(! reply_content) {
			$td.find('textarea').focus();
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/appearance/insertReply';
		// let formData = 'num=' + num + '&content=' + encodeURIComponent(content) + '&answer=' + replyNum;
		let formData = {post_num:post_num, reply_content:reply_content, reply_answer:reply_num}; // formData를 객체로 전송하면 인코딩하면 안됨
		
		const fn = function(data){
			$td.find('textarea').val('');
			
			var state = data.state;
			if(state === 'true') {
				listReplyAnswer(reply_num);
				countReplyAnswer(reply_num);
			}
		};
		
		ajaxFun(url, 'post', formData, 'json', fn);
	});
}); 

// 댓글별 답글 삭제
$(function(){
	$('.reply').on('click', '.deleteReplyAnswer', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let reply_num = $(this).attr('data-replyNum');
		let answer = $(this).attr('data-answer');
		
		let url = '${pageContext.request.contextPath}/appearance/deleteReply';
		let query = 'reply_num=' + reply_num + '&mode=answer';
		
		const fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 댓글 숨김기능
$(function(){
	$('.reply').on('click', '.hideReply', function(){
		let $menu = $(this);
		
		let reply_num = $(this).attr('data-replyNum');
		let reply_visible = $(this).attr('data-showReply');
		let msg = '댓글을 숨김 하시겠습니까 ? ';
		if(reply_visible === '0') {
			msg = '댓글 숨김을 해제 하시겠습니까 ? ';
		}
		if(! confirm(msg)) {
			return false;
		}
		
		reply_visible = reply_visible === '1' ? '0' : '1';
		
		let url = '${pageContext.request.contextPath}/appearance/replyShowHide';
		let query = 'reply_num=' + reply_num + '&reply_visible=' + reply_visible;
		
		const fn = function(data){
			if(data.state === 'true') {
				let $item = $($menu).closest('tr').next('tr').find('td');
				if(reply_visible === "1") {
					$item.removeClass('text-primary').removeClass('text-opacity-50');
					$menu.attr('data-showReply', '1');
					$menu.html('숨김');
				} else {
					$item.addClass('text-primary').addClass('text-opacity-50');
					$menu.attr('data-showReply', '0');
					$menu.html('표시');
				}
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


// 답글 숨김기능
$(function(){
	$('.reply').on('click', '.hideReplyAnswer', function(){
		let $menu = $(this);
		
		let reply_num = $(this).attr('data-replyNum');
		let reply_visible = $(this).attr('data-showReply');
		
		let msg = '댓글을 숨김 하시겠습니까 ? ';
		if(reply_visible === '0') {
			msg = '댓글 숨김을 해제 하시겠습니까 ? ';
		}
		if(! confirm(msg)) {
			return false;
		}
		
		reply_visible = reply_visible === '1' ? '0' : '1';
		
		let url = '${pageContext.request.contextPath}/appearance/replyShowHide';
		let query = 'reply_num=' + reply_num + '&reply_visible='+reply_visible;
		
		const fn = function(data){
			if(data.state === 'true') {
				let $item = $($menu).closest('.row').next('div');
				if(reply_visible === '1') {
					$item.removeClass('text-primary').removeClass('text-opacity-50');
					$menu.attr('data-showReply', '1');
					$menu.html('숨김');
				} else {
					$item.addClass('text-primary').addClass('text-opacity-50');
					$menu.attr('data-showReply', '0');
					$menu.html('표시');
				}
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});
</script>

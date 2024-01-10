<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='row reply-writer' >
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col ms-2 align-self-center'>
						<div class='name'>${vo.user_name}</div>
						<div class='date'>${vo.reply_reg_date}</div>
					</div>
				</div>
			</div>
			<div class='col align-self-center text-end'>
				<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
				<div class='reply-menu'>
					<c:choose>
						<c:when test="${sessionScope.loginUser.useridx==vo.useridx}">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.reply_num}' data-answer='${vo.reply_answer}'>삭제</div>
							<div class='hideReplyAnswer reply-menu-item' data-replyNum='${vo.reply_num}' data-showReply='${vo.reply_visible}'>${vo.reply_visible == 1 ? "숨김":"표시"}</div>
						</c:when>
						<c:when test="${sessionScope.loginUser.usership > 50 }">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.reply_num}' data-answer='${vo.reply_answer}'>삭제</div>
							<div class='blockReplyAnswer reply-menu-item'>차단</div>
						</c:when>
						<c:otherwise>
							<div class='notifyReplyAnswer reply-menu-item'>신고1</div>
							<div class='blockReplyAnswer reply-menu-item'>차단1</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class='p-2 ${vo.reply_visible == 0 ? "text-primary text-opacity-50":""}'  style="magin:0px">
			${vo.reply_content}
		</div>
	</div>
</c:forEach>

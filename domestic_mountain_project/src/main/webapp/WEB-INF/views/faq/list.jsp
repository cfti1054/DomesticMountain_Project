<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-2" id="accordionFlush">
		<c:forEach var="faq" items="${list}">
			<div class="faq" data-category="${faq.faq_category_num}">
				<h3 class="faq-title">${faq.faq_question}</h3>
				<div class="faq-text">${faq.faq_content}</div>
				<button class="faq-toggle">
					<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
				</button>
			</div>
		</c:forEach>
	</div>
</c:if>
 
<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>


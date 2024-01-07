<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div class="accordion"> 
<%-- 		<c:forEach var="dto" items="${list}"> --%>
			<h3 class="question">
				<span class="q">Q.</span> <span class="subject">{dto.subject}</span>
				<div id="chart-container"></div>
			</h3>
			<div class="answer">
			
				<div class="category">분류 : {dto.category}</div>
				<div class="content">
					
  
				</div>

			</div>
<%-- 		</c:forEach> --%>
	</div>
 
 
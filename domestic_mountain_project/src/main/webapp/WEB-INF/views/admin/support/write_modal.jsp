<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> FAQ 카테고리 </h3>
<table class="table td-border mx-auto my-10" style="width: 99%;">
	
		<tr>
			<td width="15%" class="text-center bg-light">카테고리 번호</td>
			<td width="35%" class="ps-5">${dto.faq_category_num}</td>
			<td width="15%" class="text-center bg-light">카테고리 이름</td>
			<td width="35%" class="ps-5">${dto.category_name}</td>
		</tr>
		
		<!-- forEach로 선택한 개수만큼 생성 -->
		<tr>
			<td class="text-center bg-light">등록인</td>
			<td class="ps-5">${dto.category_reg_id}</td>
			<td class="text-center bg-light">등록일자</td>
			<td class="ps-5">${dto.category_reg_date}</td>
			<td class="text-center bg-light"> 보이기 </td>
			<td class="ps-5">${dto.visible}</td>
		</tr>
	
</table>

<%-- <form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
	<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 회원 상태 변경</h3>
	
	<table class="table td-border mx-auto my-5">
		<tr>
			<td width="15%" class="text-center bg-light">계정상태</td>
			<td class="ps-5">
				<select class="form-select" name="is_blocked" id="is_blocked" onchange="selectStateChange()">
					<option value="">::상태코드::</option>
					<c:if test="${dto.enabled==0}">
						<option value="0">잠금 해제</option>
					</c:if>
					<option value="2">불법적인 방법으로 로그인</option>
					<option value="3">불건전 게시물 등록</option>
					<option value="4">다른 유저 비방</option>
					<option value="5">타계정 도용</option>
					<option value="6">기타 약관 위반</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pe-7 text-center bg-light">차단 사유</td>
			<td class="ps-5">
				<input type="text" name="blocked_reason" id="blocked_reason" class="form-control" style="width: 95%;">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="useridx" value="${dto.useridx}">
	<input type="hidden" name="registerId" value="${sessionScope.userall.useridx}">

</form> 

<div id="memberStateDetaile" style="display: none;">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr class="bg-light border-top2">
				<th>내용</th>
				<th width="200">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listState}">
				<tr>
					<td class="ps-5">${vo.blocked_reason} (${vo.is_blocked})</td>
					<td class="text-center">${vo.blocked_date}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listState.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>  
			</c:if>
		</tbody>
	</table>  
</div>
--%>
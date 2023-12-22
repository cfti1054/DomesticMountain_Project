<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 회원 정보</h3>
<table class="table td-border mx-auto my-10" style="width: 99%;">
	<tr>
		<td width="15%" class="text-center bg-light">회원등급</td>
		<td width="35%" class="ps-5">${dto.rank1}</td>
		<td width="15%" class="text-center bg-light">회원번호</td>
		<td width="35%" class="ps-5">${dto.useridx}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">이 름</td>
		<td class="ps-5">${dto.user_name}</td>
		<td class="text-center bg-light">생년월일</td>
		<td class="ps-5">${dto.birth}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">전화번호</td>
		<td class="ps-5">${dto.tel}</td>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.email}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">회원가입일</td>
		<td class="ps-5">${dto.reg_date}</td>
		<td class="text-center bg-light">회원구분</td>
		<td class="ps-5">${dto.usership==1?"일반회원":(dto.usership==51?"직원":"관리자")}</td>
	</tr>
	
	<tr>
		<td class="text-center bg-light">계정상태</td>
		<td colspan="1" class="ps-5">
			${dto.enabled==1?"활성":"잠금"}
			<c:if test="${dto.enabled==0 && not empty user_block}">, ${user_block.blocked_reason}</c:if>
			&nbsp;<span class="btn" onclick="memberStateDetaileView();" style="cursor: pointer; border-color: black;">자세히</span>
		</td>
		<td class="text-center bg-light">회원등급</td>
		<td colspan="1" class="ps-5">
			${dto.rank1}
			<c:if test="${dto.rank1==null && not empty user_rank}">, ${user_rank.rank1}</c:if>
			&nbsp;<span class="btn" onclick="memberRankDetaileView();" style="cursor: pointer; border-color: black;">등급</span>
		</td>
	</tr>
</table>

<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
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

<div id="memberRankDetaile" style="display: none;">
	<form name="memberRankForm" method="post">
		<table class="table table-border mx-auto my-10" style="text-align: center;">
			<thead>
				<tr class="bg-light border-top2">
					<th>내용</th>
					<th width="300">등급설정</th>
				</tr>
			</thead>
			
			<tbody>
			<tr>
				<td width="15%" class="text-center bg-light">회원등급</td>
				<td class="ps-5">
					<select class="form-select" name="rank_num" id="rank_num">
	
						<c:forEach var="vo" items="${listRank}">
						
							<option value="${vo.rank_num}" ${dto.rank_num == vo.rank_num ? "selected":""}>${vo.rank1}</option>
	
						</c:forEach>
					</select>
				</td>
				<td>
					<input type="hidden" name="useridx" value="${dto.useridx}">
		  			<button type="button" class="btn" style="border-color: black;"
		  				onclick="updateRankOk()">변경하기</button>
				</td>
			</tbody>
		</table> 
	</form>
</div>

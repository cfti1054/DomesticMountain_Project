<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> FAQ 카테고리 </h3>

<c:choose>
	<c:when test="${mode == 'write' && type =='category' }">
		<form name="categoryWriteForm" method="post" id="categoryWriteForm">
			<table class="table td-border mx-auto my-10" style="width: 99%;">
				<tr>
					<td width="35%" class="text-center bg-light">카테고리 이름</td>
					<td width="35%" class="ps-5"><input type="text" class="form-control" name="category_name"  id="category_name" value="${dto.category_name}"></td>
				</tr>
				<tr>
					<td colspan="3" class="text-center bg-light"> 보이기 </td>
					<td colspan="1" class="ps-5">
						<select id="category_visible" class="form-select">
							<option value="">:보이기 상태:</option>
							<option value="0">안보이기</option>
							<option value="1">보이기</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</c:when>
	
	<c:when test="${mode == 'write' && type =='board' }">
		<form name="boardWriteForm" method="post" id="boardWriteForm">
			<table class="table td-border mx-auto my-10" style="width: 99%;">
				<tr>
					<td width="35%" class="text-center bg-light">카테고리 선택</td>
					<td width="35%" class="ps-5">
						<select id="category_list" class="form-select">
							<option value="">::카테고리 선택::</option>
							<c:forEach var="dto" items="${list}" varStatus="status">
								
								<option value="${dto.faq_category_num}">${dto.category_name}</option>
							</c:forEach>
						</select>					
					</td>
				</tr>
				<tr>
					<td colspan="3" class="text-center bg-light"> 질문 </td>
					<td colspan="1" class="ps-5">
						<input type="text" class="input" name="faq_question" id="faq_question" value="${dto.faq_question}">
					</td>
				</tr>
				<tr>
					<td colspan="3" class="text-center bg-light"> 내용 </td>
					<td colspan="1" class="ps-5">
						<input type="text" class="input" name="faq_content" id="faq_content" value="${dto.faq_content}">
					</td>
				</tr>
			</table>
		</form>
	</c:when>
	
	<c:when test="${mode=='update' && type=='category' }">
		<form name="categoryUpdateForm" method="post" id="categoryUpdateForm">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<table class="table td-border mx-auto my-10" style="width: 99%;">
					<tr>
						<td width="15%" class="text-center bg-light">카테고리 번호</td>
						<td width="15%" class="ps-5"><input type="text" class="input" id="faq_category_num" value="${dto.faq_category_num}" readonly></td>
						<td width="35%" class="text-center bg-light">카테고리 이름</td>
						<td width="35%" class="ps-5"><input type="text" class="input" name="category_name"  id="category_name" value="${dto.category_name}"></td>
					</tr>
					<tr>
						<td class="text-center bg-light">등록인</td>
						<td class="ps-5">${dto.category_reg_id}</td>
						<td class="text-center bg-light">등록일자</td>
						<td class="ps-5">${dto.category_reg_date}</td>
					</tr>
					<tr>
						<td colspan="3" class="text-center bg-light"> 보이기 </td>
						<td colspan="1" class="ps-5">
							<input type="number" class="input" name="category_visible" id="category_visible" value="${dto.category_visible}"
								>
						</td>
					</tr>
				</table>
			</c:forEach>
		</form>
	</c:when>
	
	<c:when test="${mode=='update' && type=='board' }">
		<form name="boardUpdateForm" method="post" id="boardUpdateForm">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<table class="table td-border mx-auto my-10" style="width: 99%;">
					<tr>
						<td width="15%" class="text-center bg-light">카테고리 번호</td>
						<td width="15%" class="ps-5"><input type="text" class="input" id="faq_category_num" value="${dto.faq_category_num}" readonly></td>
						<td width="35%" class="text-center bg-light">카테고리 이름</td>
						<td width="35%" class="ps-5"><input type="text" class="input" name="category_name"  id="category_name" value="${dto.category_name}"></td>
					</tr>
					<tr>
						<td class="text-center bg-light">등록인</td>
						<td class="ps-5">${dto.category_reg_id}</td>
						<td class="text-center bg-light">등록일자</td>
						<td class="ps-5">${dto.category_reg_date}</td>
					</tr>
					<tr>
						<td colspan="3" class="text-center bg-light"> 보이기 </td>
						<td colspan="1" class="ps-5">
							<input type="number" class="input" name="category_visible" id="category_visible" value="${dto.category_visible}"
							 min="0" max="1" placeholder="유저에게 보이려면 1을 안보이게 하려면 0">
						</td>
					</tr>
				</table>
			</c:forEach>
		</form>
		
		
		
		
		
	</c:when>
	
</c:choose>

<script>
		$(document).on("change", "input[name^=category_visible]", function() {
		    var val= $(this).val();

		    
		    if(val < 0 || val > 1) {
		        alert("0~1 범위로 입력해 주십시오.");
		        $(this).val('');
		    }
		});
</script>
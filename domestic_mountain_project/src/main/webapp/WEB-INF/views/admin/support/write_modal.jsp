<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> FAQ 추가 / 수정 </h3>
<style>
        .custom-div {
            height: 100%; /* Set the height to the desired number of rows */
            overflow: auto; /* Add a scrollbar if content exceeds the height */
            border: 0.5px solid #ccc; /* Optional: Add a border for visual separation */
            padding: 5px; /* Optional: Add padding for better appearance */
        }
    </style>
<c:choose>
	<c:when test="${mode == 'write' && type =='category' }">
		<form name="categoryWriteForm" method="post" id="categoryWriteForm">
			<table class="table td-border mx-auto my-10" style="width: 99%; vertical-align: middle;">
				<tr>
					<td width="25%" class="text-center bg-light">카테고리 이름</td>
					<td width="75%" class="ps-5"><input type="text" class="form-control" name="category_name"  id="category_name" value="${dto.category_name}"></td>
				</tr>
				<tr>
					<td class="text-center bg-light"> 보이기 </td>
					<td class="ps-5">
						<select id="category_visible" class="form-select">
							<option value=""> :: 보이기 상태 :: </option>
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
			<table class="table td-border mx-auto my-10" style="width: 99%; vertical-align: middle;">
				<tr>
					<td width="35%" class="text-center bg-light">카테고리 선택</td>
					<td width="65%" class="ps-5">
						<select style="text-align: center;" id="category_list" class="form-select" style=" width: 100%;">
							<option value=""> :: 카테고리 선택 :: </option>
							<c:forEach var="dto" items="${list}" varStatus="status">
								
								<option value="${dto.faq_category_num}">${dto.category_name}</option>
							</c:forEach>
						</select>					
					</td>
				</tr>
				<tr>
					<td colspan="1" class="text-center bg-light">질문</td>
					<td colspan="3" class="ps-5">
						<textarea name="faq_question" id="faq_question" value="${dto.faq_question}" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="1" class="text-center bg-light"> 내용 </td>
					<td colspan="3" class="ps-5">
						<textarea name="faq_content" id="faq_content" value="${dto.faq_content}" cols="50" rows="7"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</c:when>
	
	<c:when test="${mode=='update' && type=='category' }">
		<form name="categoryUpdateForm" method="post" id="categoryUpdateForm">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<table class="table td-border mx-auto my-10" style="width: 99%; vertical-align: middle;">
					<tr>
						<td width="15%" class="text-center bg-light">번호</td>
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
							<input type="number" class="input" name="category_visible" id="category_visible" value="${dto.category_visible}">
						</td>
					</tr>
				</table>
			</c:forEach>
		</form>
	</c:when>
	
	<c:when test="${mode=='update' && type=='board' }">
		<form name="boardUpdateForm" method="post" id="boardUpdateForm">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<table class="table td-border mx-auto my-10" style="width: 99%; vertical-align: middle;">
					<tr>
						<td width="10%" class="text-center bg-light">FAQ 번호</td>
						<td width="10%" class="ps-5"><input type="text" class="input"  id="faq_num" value="${dto.faq_num}" readonly></td>
						<td width="30%" class="text-center bg-light">FAQ 질문</td>
						<td width="50%" class="ps-5"><textarea class="input" name="faq_question" id="faq_question" cols="35" rows="3" required>${dto.faq_question}</textarea></td>
						
					</tr>
					<tr>
						<td class="text-center bg-light">FAQ 답변</td>
						<td colspan="3" class="ps-5"><textarea class="input" name="faq_content" id="faq_content" cols="70" rows="5" required>${dto.faq_content}</textarea></td>
						<!-- <input style="width:100%;" type="text" class="input" name="faq_content"  id="faq_content" value="${dto.faq_content}"> -->
						
					</tr>
					<tr>
						<td colspan="3" class="text-center bg-light"> 보이기 </td>
						<td colspan="1" class="ps-5">
							<input type="number" class="input" name="visible" id="visible" value="${dto.visible}"
							 min="0" max="1" placeholder="유저에게 보이려면 1을 안보이게 하려면 0">
						</td>
					</tr>
				</table>
			</c:forEach>
		</form>
		
		
		
		
		
	</c:when>
	
	<c:when test="${mode=='show'}">
		<table class="table td-border mx-auto my-10" style="vertical-align: middle; width: 99%; height: 100%;">
			<tr>
				<td width="30%" class="text-center bg-light">FAQ 질문</td>
				<td width="70%" class="ps-3"><div class="custom-div">${dto.faq_question}</div></td>
			</tr>
			<tr>
				<td class="text-center bg-light">FAQ 답변</td>
				<td colspan="3" class="ps-3"><div class="custom-div">${dto.faq_content}</div></td>
				<%-- <textarea class="input" name="faq_content" id="faq_content" cols="70" rows="7" readonly>${dto.faq_content}</textarea> --%>	
			</tr>
			
		</table>
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
		
		$(document).on("change", "input[name^=visible]", function() {
		    var val= $(this).val();

		    
		    if(val < 0 || val > 1) {
		        alert("0~1 범위로 입력해 주십시오.");
		        $(this).val('');
		    }
		});
		
		
</script>
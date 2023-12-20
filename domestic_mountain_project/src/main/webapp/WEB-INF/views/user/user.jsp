<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
	display: flex;
	justify-content: center;
}

.body-container {
	padding: 130px 0 60px 0;
	max-width: 800px;
}

.row {
	width: auto;
}

.row>* {
	padding-left: 0px;
}

.row-tel {
	display: flex;
}

.row-mail {
	display: flex;
}

.div-email {
	margin-right: 5px;
}
.justify-content-md-center {
    background-color: var(--container-color);
    padding: 2rem;
    border-radius: 0.8rem;
    box-shadow: 0 8px 32px hsla(230, 75%, 15%, .2);
}
.body-title h3 {
	display: flex;
	justify-content: center;
	padding-bottom: 20px;
}
</style>

<script type="text/javascript">
	function userOk() {
		const f = document.userForm;
		let str;

		str = f.user_id.value;
		if (!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) {
			alert("아이디를 다시 입력 하세요. ");
			f.user_id.focus();
			return;
		}

		let mode = "${mode}";
		if (mode === "user" && f.user_idValid.value === "false") {
			str = "아이디 중복 검사가 실행되지 않았습니다.";
			$("#user_id").parent().find(".help-block").html(str);
			f.user_id.focus();
			return;
		}

		str = f.user_pwd.value;
		if (!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) {
			alert("패스워드를 다시 입력 하세요. ");
			f.user_pwd.focus();
			return;
		}

		if (str !== f.user_pwd2.value) {
			alert("패스워드가 일치하지 않습니다. ");
			f.user_pwd.focus();
			return;
		}

		str = f.user_name.value;
		if (!/^[가-힣]{2,5}$/.test(str)) {
			alert("이름을 다시 입력하세요. ");
			f.user_name.focus();
			return;
		}

		str = f.email1.value.trim();
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.email1.focus();
			return;
		}

		str = f.email2.value.trim();
		if (!str) {
			alert("이메일을 입력하세요. ");
			f.email2.focus();
			return;
		}
		
		str = f.birth.value;
		if (!str) {
			alert("생년월일를 입력하세요. ");
			f.birth.focus();
			return;
		}
		
		str = f.tel1.value;
		if (!str) {
			alert("전화번호를 입력하세요. ");
			f.tel1.focus();
			return;
		}

		str = f.tel2.value;
		if (!/^\d{3,4}$/.test(str)) {
			alert("숫자만 가능합니다. ");
			f.tel2.focus();
			return;
		}

		str = f.tel3.value;
		if (!/^\d{4}$/.test(str)) {
			alert("숫자만 가능합니다. ");
			f.tel3.focus();
			return;
		}


		f.action = "${pageContext.request.contextPath}/user/${mode}";
		f.submit();
	}

	function changeEmail() {
		const f = document.userForm;

		let str = f.selectEmail.value;
		if (str !== "direct") {
			f.email2.value = str;
			f.email2.readOnly = true;
			f.email1.focus();
		} else {
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
	}


	function user_idCheck() {
		// 아이디 중복 검사
		let user_id = $("#user_id").val();

		if (!/^[a-z][a-z0-9_]{4,9}$/i.test(user_id)) {
			let str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
			$("#user_id").focus();
			$("#user_id").parent().find(".help-block").html(str);
			return;
		}

		let url = "${pageContext.request.contextPath}/user/user_idCheck";
		// AJAX - POST : JSON 응답 받기
		$.post(url, {
			user_id : user_id
		}, function(data) {
			let p = data.passed;
			if (p === "true") {
				let str = '<span style="color:blue; font-weight:bold;">'
						+ user_id + '</span> 아이디는 사용 가능합니다.';
				$('.user_id-box').find('.help-block').html(str);
				$('#user_idValid').val('true');
			} else {
				let str = '<span style="color:red; font-weight:bold;">'
						+ user_id + '</span> 아이디는 사용할 수 없습니다.';
				$('.user_id-box').find('.help-block').html(str);
				$('#user_idValid').val('false');
				$("#user_id").focus();
			}
		}, "json");

	}
</script>

<div class="features-1">
	<div class="body-container">
		<div class="justify-content-md-center">
			<div class="body-title">
				<h3>${mode=="user"?"회원가입":"정보수정"}</h3>
			</div>


			<div class="body-main">

				<form name="userForm" method="post">
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="user_id">아이디</label>
						<div class="col-sm-10 user_id-box">
							<div class="row">
								<div class="col-5 pe-1">
									<input type="text" name="user_id" id="user_id"
										class="form-control" value="${dto.user_id}"
										${mode=="update" ? "readonly ":""} placeholder="아이디">
								</div>
								<div class="col-3 ps-1">
									<c:if test="${mode=='user'}">
										<button type="button" class="btn btn-light"
											onclick="user_idCheck();">아이디중복검사</button>
									</c:if>
								</div>
							</div>
							<c:if test="${mode=='user'}">
								<small class="form-control-plaintext help-block">아이디는
									5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</small>
							</c:if>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="user_pwd">패스워드</label>
						<div class="col-sm-10">
							<input type="password" name="user_pwd" id="user_pwd"
								class="form-control" autocomplete="off" placeholder="패스워드">
							<small class="form-control-plaintext">패스워드는 5~10자이며 하나
								이상의 숫자나 특수문자가 포함되어야 합니다.</small>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="user_pwd2">패스워드
							확인</label>
						<div class="col-sm-10">
							<input type="password" name="user_pwd2" id="user_pwd2"
								class="form-control" autocomplete="off" placeholder="패스워드 확인">
							<small class="form-control-plaintext">패스워드를 한번 더 입력해주세요.</small>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="user_name">이름</label>
						<div class="col-sm-10">
							<input type="text" name=user_name id="user_name"
								class="form-control" value="${dto.user_name}"
								${mode=="update" ? "readonly ":""} placeholder="이름">
						</div>
					</div>


					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="selectEmail">이메일</label>
						<div class="col-sm-10 row-mail">
							<div class="col-3 pe-0 div-email">
								<select name="selectEmail" id="selectEmail" class="form-select"
									onchange="changeEmail();">
									<option value="">선 택</option>
									<option value="naver.com"
										${dto.email2=="naver.com" ? "selected" : ""}>네이버 메일</option>
									<option value="gmail.com"
										${dto.email2=="gmail.com" ? "selected" : ""}>지 메일</option>
									<option value="hanmail.net"
										${dto.email2=="hanmail.net" ? "selected" : ""}>한 메일</option>
									<option value="hotmail.com"
										${dto.email2=="hotmail.com" ? "selected" : ""}>핫 메일</option>
									<option value="direct">직접입력</option>
								</select>
							</div>

							<div class="col input-group">
								<input type="text" name="email1" class="form-control"
									maxlength="30" value="${dto.email1}"> <span
									class="input-group-text p-1"
									style="border: none; background: none;">@</span> <input
									type="text" name="email2" class="form-control" maxlength="30"
									value="${dto.email2}" readonly>
							</div>

						</div>
					</div>
					
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="birth">생년월일</label>
						<div class="col-sm-10">
							<input type="date" name="birth" id="birth" class="form-control"
								value="${dto.birth}" placeholder="생년월일"> <small
								class="form-control-plaintext">생년월일은 2000-01-01 형식으로 입력
								합니다.</small>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
						<div class="col-sm-10 row-tel">
							<div class="col-sm-3 pe-1">
								<input type="text" name="tel1" id="tel1" class="form-control"
									value="${dto.tel1}" maxlength="3">
							</div>
							<div class="col-sm-1 px-1" style="width: 2%;">
								<p class="form-control-plaintext text-center">-</p>
							</div>
							<div class="col-sm-3 px-1">
								<input type="text" name="tel2" id="tel2" class="form-control"
									value="${dto.tel2}" maxlength="4">
							</div>
							<div class="col-sm-1 px-1" style="width: 2%;">
								<p class="form-control-plaintext text-center">-</p>
							</div>
							<div class="col-sm-3 ps-1">
								<input type="text" name="tel3" id="tel3" class="form-control"
									value="${dto.tel3}" maxlength="4">
							</div>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="zip">우편번호</label>
						<div class="col-sm-5">
							<div class="input-group">
								<input type="text" name="zip" id="zip" class="form-control"
									placeholder="우편번호" value="${dto.zip}" readonly>
								<button class="btn btn-light" type="button"
									style="margin-left: 3px;" onclick="daumPostcode();">우편번호
									검색</button>
							</div>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="addr1">주소</label>
						<div class="col-sm-10">
							<div>
								<input type="text" name="addr1" id="addr1" class="form-control"
									placeholder="기본 주소" value="${dto.addr1}" readonly>
							</div>
							<div style="margin-top: 5px;">
								<input type="text" name="addr2" id="addr2" class="form-control"
									placeholder="상세 주소" value="${dto.addr2}">
							</div>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" for="agree">약관 동의</label>
						<div class="col-sm-8" style="padding-top: 5px;">
							<input type="checkbox" id="agree" name="agree"
								class="form-check-input" checked style="margin-left: 0;"
								onchange="form.sendButton.disabled = !checked"> <label
								class="form-check-label"> <a href="#"
								class="text-decoration-none">이용약관</a>에 동의합니다.
							</label>
						</div>
					</div>

					<div class="row mb-3">
						<div class="text-center">
							<button type="button" name="sendButton" class="btn btn-primary"
								onclick="userOk();">
								${mode=="user"?"회원가입":"정보수정"} <i class="bi bi-check2"></i>
							</button>
							<button type="button" class="btn btn-danger"
								onclick="location.href='${pageContext.request.contextPath}/';">
								${mode=="user"?"가입취소":"수정취소"} <i class="bi bi-x"></i>
							</button>
							<input type="hidden" name="user_idValid" id="user_idValid"
								value="false">
						</div>
					</div>

					<div class="row">
						<p class="form-control-plaintext text-center">${message}</p>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
</script>
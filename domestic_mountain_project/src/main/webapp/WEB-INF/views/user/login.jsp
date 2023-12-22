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
	width: 400px;
}

.sub-login {
    background-color: var(--container-color);
    padding: 2rem;
    border-radius: 0.8rem;
    box-shadow: 0 8px 32px hsla(230, 75%, 15%, .2);
}

.login__signup,
.login__title {
	margin-top: 20px;
}

.login__title,
.login__signup,
.login__forgot {
	display: flex;
	justify-content: center;
}

.sub-login .d-grid .text-primary {
	color: red !important;
}
</style>

<script type="text/javascript">
	function sendLogin() {
		const f = document.loginForm;
		let str;

		str = f.user_id.value.trim();
		if (!str) {
			f.user_id.focus();
			return;
		}

		str = f.user_pwd.value.trim();
		if (!str) {
			f.user_pwd.focus();
			return;
		}

		f.action = "${pageContext.request.contextPath}/user/login";
		f.submit();
	}
</script>

<div class="features-1">
	<div class="body-container">
		<div class="sub-login">
			<h2 class="login__title">로그인</h2>

			<div class="login__group">
					<form name="loginForm" method="post">
					<div>
						<label for="user_id" class="login__label">ID</label> <input
							type="text" placeholder="Write your ID" id="user_id"
							name="user_id" class="login__input">
					</div>
	
					<div>
						<label for="password" class="login__label">Password</label> <input
							type="password" placeholder="Enter your password" name="user_pwd"
							id="password" class="login__input">
					</div>
					</form>
				
			</div>

			<div>
				<p class="login__signup">
					아직 계정이 없으신가요? <a
						href="${pageContext.request.contextPath}/user/user"> 회원가입</a>
				</p>

				<a href="${pageContext.request.contextPath}/user/pwdFind" class="login__forgot"> 비밀번호를 잊으셨나요? </a>

				<div class="d-grid">
					<p class="form-control-plaintext text-center text-primary">${message}</p>
				</div>

				<button type="button" class="login__button" onclick="sendLogin();">로그인</button>
			</div>
			
		</div>
		
	</div>
</div>
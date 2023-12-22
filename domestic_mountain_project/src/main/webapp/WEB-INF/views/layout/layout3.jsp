<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css" type="text/css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
	
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--=============== REMIXICONS ===============-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css">

    <!-- silder -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
	
</head>

<body>

<header>
    <tiles:insertAttribute name="header"/>
</header>
	
<main>
    <tiles:insertAttribute name="body"/>
</main>

<footer>
    <tiles:insertAttribute name="footer"/>
</footer>

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
</div>



<script type="text/javascript">
	function dialogLogin() {
    $("form[name=modelLoginForm] input[name=userId]").val("");
    $("form[name=modelLoginForm] input[name=userPwd]").val("");
    
	$("#loginModal").modal("show");	
	
    $("form[name=modelLoginForm] input[name=userId]").focus();
	}
	
	function sendModelLogin() {
	    var f = document.modelLoginForm;
		var str;
		
		str = f.user_id.value;
	    if(!str) {
	        f.user_id.focus();
	        return;
	    }
	
	    str = f.user_pwd.value;
	    if(!str) {
	        f.user_pwd.focus();
	        return;
	    }
	
	    f.action = "${pageContext.request.contextPath}/user/login";
	    f.submit();
	}
</script>
<!--==================== LOGIN ====================-->
<div class="login" id="login">
   <form name="modelLoginForm" id="loginForm" class="login__form" method="post">
   	 <h2 class="login__title">로그인</h2>

    <div class="login__group">
        <div>
            <label for="user_id" class="login__label">ID</label> 
            <input type="text" placeholder="Write your ID" id="user_id" name="user_id" class="login__input">
        </div>

        <div>
            <label for="password" class="login__label">Password</label> 
            <input type="password" placeholder="Enter your password" name="user_pwd" id="password" class="login__input">
        </div>
    </div>

   		<div>
        <p class="login__signup">
            아직 계정이 없으신가요? <a href="${pageContext.request.contextPath}/user/user"> 회원가입</a>
        </p>

        <a href="${pageContext.request.contextPath}/user/userFind" class="login__forgot"> 비밀번호를 잊으셨나요? </a>

        <button type="button" class="login__button" onclick="sendModelLogin();">로그인</button>
	    </div>
	</form>

    <i class="ri-close-line login__close" id="login-close"></i>
</div>

<script>
/*=============== SEARCH ===============*/
/* const search = document.getElementById('search'),
searchBtn = document.getElementById('search-btn'),
searchClose = document.getElementById('search-close') */

/* Search show */
/* searchBtn.addEventListener('click', () => {
   search.classList.add('show-search')
}) */

/* Search hidden */
/* searchClose.addEventListener('click', () => {
   search.classList.remove('show-search')
}) */


/*=============== LOGIN ===============*/
const login = document.getElementById('login'),
   loginBtn = document.getElementById('login-btn'),
   loginClose = document.getElementById('login-close')

/* Login show */
loginBtn.addEventListener('click', () => {
   login.classList.add('show-login')
})

/* Login hidden */
loginClose.addEventListener('click', () => {
   login.classList.remove('show-login')
})
</script>

</body>
</html>
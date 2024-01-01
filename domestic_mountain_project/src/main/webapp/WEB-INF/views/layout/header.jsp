<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--==================== SEARCH ====================-->
<div class="search" id="search">
	<form action="" class="search__form">
		<i class="ri-search-line search__icon"></i> <input type="search" id="search"
			placeholder="What are you looking for?" class="search__input">
	</form>

	<i class="ri-close-line search__close" id="search-close"></i>
</div>

<!--==================== MAIN ====================-->
<section class="header-bi">
	<!--==================== HEADER ====================-->
	<header class="header" id="header">
		<nav class="nav container">
			<div class="img-div-tag">
				<a class="img-a-tag" href="${pageContext.request.contextPath}/"> 
					<img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo_black.png">
				</a>
			</div>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="${pageContext.request.contextPath}/emaps/main" class="nav__link">Information</a></li>

					<li class="nav__item"><a href="${pageContext.request.contextPath}/product/product" class="nav__link">DM
							Store</a></li>

					<li class="nav__item"><a href="${pageContext.request.contextPath}/Related/main" class="nav__link">Related</a>
					</li>

					<li class="nav__item"><a href="${pageContext.request.contextPath}/recommend/list" class="nav__link">Community</a>
					</li>

					<li class="nav__item"><a href="${pageContext.request.contextPath}/notice/list" class="nav__link">Services</a>
					</li>

					<li class="nav__item"><a href="#" class="nav__link">My
							Page</a></li>
				</ul>

				<!-- Close button -->
				<div class="nav__close" id="nav-close">
					<i class="ri-close-line"></i>
				</div>
			</div>

			<div class="nav__actions">
				<i class=""></i>
				<!-- Search button -->
				<i class="ri-search-line nav__search" id="search-btn"></i>
				
				<!-- Login button -->
				<c:choose>
				    <c:when test="${empty sessionScope.loginUser}">
				        <i class="ri-user-line nav__login" id="login-btn"></i>
				        <div class="p-2">
				            <a href="${pageContext.request.contextPath}/user/user" title="회원가입"><i class=""></i></a>
				        </div>
				    </c:when>
				    <c:otherwise>
				        <div class="p-2">
				            <a href="${pageContext.request.contextPath}/user/logout" title="로그아웃"><i class="fa-solid fa-right-from-bracket" id="logout-btn" 
				                onclick="location.href='${pageContext.request.contextPath}/user/logout';"></i></a>
				        </div>
				    </c:otherwise>
				</c:choose>
				
				<!-- Toggle button -->
				<div class="nav__toggle" id="nav-toggle">
					<i class="ri-menu-line"></i>
				</div>
			</div>
		</nav>
	</header>
</section>



<!--=============== MAIN JS ===============-->
<script>

      /*=============== SHOW MENU ===============*/
      const navMenu = document.getElementById('nav-menu'),
         navToggle = document.getElementById('nav-toggle'),
         navClose = document.getElementById('nav-close')

      /* Menu show */
      navToggle.addEventListener('click', () => {
         navMenu.classList.add('show-menu')
      })

      /* Menu hidden */
      navClose.addEventListener('click', () => {
         navMenu.classList.remove('show-menu')
      })

      


   </script>
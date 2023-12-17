<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== REMIXICONS ===============-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css">

<!-- silder -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<title>DM Project</title>
</head>
<style>

</style>

<!--==================== SEARCH ====================-->
<div class="search" id="search">
	<form action="" class="search__form">
		<i class="ri-search-line search__icon"></i> <input type="search"
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
				<a class="img-a-tag" href="#"> 
				<img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo_black.png">
				</a>
			</div>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="#" class="nav__link">Information</a></li>

					<li class="nav__item"><a href="${pageContext.request.contextPath}/product/product" class="nav__link">DM
							Store</a></li>

					<li class="nav__item"><a href="#" class="nav__link">Support</a>
					</li>

					<li class="nav__item"><a href="#" class="nav__link">Community</a>
					</li>

					<li class="nav__item"><a href="${pageContext.request.contextPath}/services/qna" class="nav__link">Services</a>
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
				<i class="ri-user-line nav__login" id="login-btn"></i>

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
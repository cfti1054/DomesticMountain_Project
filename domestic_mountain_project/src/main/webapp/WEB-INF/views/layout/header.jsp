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

<title>Final Project</title>
</head>
<style>
.features-1 {
	background-image: url(resources/images/mainImg/mainImg.svg),
		linear-gradient(to bottom, #f1f4fe 0, #fff 100%);
	background-repeat: no-repeat, repeat-x;
	background-position: 50% 0, 0 0;
	background-size: auto 600px, 100% 600px;
}
</style>


<!--==================== SEARCH ====================-->
<div class="search" id="search">
	<form action="" class="search__form">
		<i class="ri-search-line search__icon"></i> <input type="search"
			placeholder="What are you looking for?" class="search__input">
	</form>

	<i class="ri-close-line search__close" id="search-close"></i>
</div>

<!--==================== LOGIN ====================-->
<div class="login" id="login">
	<form action="" class="login__form">
		<h2 class="login__title">로그인</h2>

		<div class="login__group">
			<div>
				<label for="ID" class="login__label">ID</label> <input type="text"
					placeholder="Write your ID" id="ID" class="login__input">
			</div>

			<div>
				<label for="password" class="login__label">Password</label> <input
					type="password" placeholder="Enter your password" id="password"
					class="login__input">
			</div>
		</div>

		<div>
			<p class="login__signup">
				아직 계정이 없으신가요? <a href="#"> 회원가입</a>
			</p>

			<a href="#" class="login__forgot"> 비밀번호를 잊으셨나요? </a>

			<button type="submit" class="login__button">로그인</button>
		</div>
	</form>

	<i class="ri-close-line login__close" id="login-close"></i>
</div>

<!--==================== MAIN ====================-->
<section class="header-bi">
	<!--==================== HEADER ====================-->
	<header class="header" id="header">
		<nav class="nav container">
			<div class="img-div-tag">
				<a class="img-a-tag" href="#"> 
				<img alt="" src="resources/images/logo/logo_black.png">
				</a>
			</div>
			<div class="nav__menu" id="nav-menu">
				<ul class="nav__list">
					<li class="nav__item"><a href="#" class="nav__link">Information</a></li>

					<li class="nav__item"><a href="#" class="nav__link">DM
							Store</a></li>

					<li class="nav__item"><a href="#" class="nav__link">Support</a>
					</li>

					<li class="nav__item"><a href="#" class="nav__link">Community</a>
					</li>

					<li class="nav__item"><a href="#" class="nav__link">Services</a>
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
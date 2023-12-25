﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3"
			href="${pageContext.request.contextPath}/admin/">국내산</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>

		</ul>
	</nav>

	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">국내산</div>
					<a class="nav-link"
						href="${pageContext.request.contextPath}/resources/WEB-INF/admin/main/main.jsp">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 대시보드
					</a>
					<div class="sb-sidenav-menu-heading">주 기능</div>

					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 회원관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/memberManage/list">회원
								목록</a> <a class="nav-link"
								href="${pageContext.request.contextPath}/resources/admin/static/layout-sidenav-light.html">관리자
								권한 설정</a>
						</nav>
					</div>



					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapsePages" aria-expanded="false"
						aria-controls="collapsePages">
						<div class="sb-nav-link-icon">
							<i class="fas fa-headset"></i>
						</div> 고객 지원
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>


					<div class="collapse" id="collapsePages"
						aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"
							id="sidenavAccordionPages">
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#pagesCollapseAuth" aria-expanded="false"
								aria-controls="pagesCollapseAuth"> 1 : 1 문의 관리
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseAuth"
								aria-labelledby="headingOne"
								data-bs-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link"
										href="${pageContext.request.contextPath}/resources/admin/static/login.html">Login</a>
									<a class="nav-link"
										href="${pageContext.request.contextPath}/resources/admin/static/register.html">Register</a>
									<a class="nav-link"
										href="${pageContext.request.contextPath}/resources/admin/static/password.html">Forgot
										Password</a>
								</nav>
							</div>


							<a class="nav-link collapsed"
								href="${pageContext.request.contextPath}/admin/support/faq"
								data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
								aria-expanded="false" aria-controls="pagesCollapseError">
								FAQ 분류
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseError"
								aria-labelledby="headingOne"
								data-bs-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link"
										href="${pageContext.request.contextPath}/resources/admin/static/401.html">401
										Page</a> <a class="nav-link"
										href="${pageContext.request.contextPath}/resources/admin/static/404.html">404
										Page</a> <a class="nav-link"
										href="${pageContext.request.contextPath}/resources/admin/static/500.html">500
										Page</a>
								</nav>
							</div>

						</nav>
					</div>


					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseProducts" aria-expanded="false"
						aria-controls="collapseProducts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 상품관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseProducts"
						aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/product/all/list">장비 관리</a> <a
								class="nav-link"
								href="${pageContext.request.contextPath}/admin/">상품 리뷰 및 문의</a>
						</nav>
					</div>



					<div class="sb-sidenav-menu-heading">통계</div>
					<a class="nav-link"
						href="${pageContext.request.contextPath}/resources/admin/static/charts.html">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> Charts
					</a> <a class="nav-link"
						href="${pageContext.request.contextPath}/resources/admin/static/tables.html">
						<div class="sb-nav-link-icon">
							<i class="fas fa-table"></i>
						</div> Tables
					</a>
				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				관리자
			</div>
		</nav>
	</div>

</body>

</html>
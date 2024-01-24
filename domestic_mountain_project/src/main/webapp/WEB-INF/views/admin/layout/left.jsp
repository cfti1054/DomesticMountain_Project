<%@ page contentType="text/html; charset=UTF-8"%>
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
				<div class="p-2" style="color: gray;">
					<a href="${pageContext.request.contextPath}/" title="사용자"><i class="fas fa-user fa-fw"></i></a>
				</div>
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
						href="${pageContext.request.contextPath}/admin/">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 대시보드
					</a>
					<div class="sb-sidenav-menu-heading">주 기능</div>

					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-user fa-fw"></i>
						</div> 회원 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/memberManage/list2">회원
								목록</a> 
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/memberManage/list">등급 변경 내역</a> 								
						</nav>
					</div>



					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseProducts" aria-expanded="false"
						aria-controls="collapseProducts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 상품 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseProducts"
						aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/product/product_list">장비 관리</a>
						</nav>
					</div>


					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseOrder" aria-expanded="false"
						aria-controls="collapseOrder">
						<div class="sb-nav-link-icon">
							<i class="fas fa-cart-shopping"></i>
						</div> 주문 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseOrder"
						aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/admin/orderManage/order_list">주문 관리</a>
						</nav>
					</div>


					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"  data-bs-target="#collapseSupport" aria-expanded="false"  aria-controls="collapseSupport">
						<div class="sb-nav-link-icon">
							<i class="fas fa-headset"></i>
						</div> 고객 지원
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseSupport"  aria-labelledby="headingFive" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"  id="sidenavAccordionPages">
						
							<a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/support/inquiry_category_list" data-bs-toggle="collapse"  data-bs-target="#pagesCollapseInquiry" aria-expanded="false"  aria-controls="pagesCollapseInquiry"> 1 : 1 문의 관리
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseInquiry" aria-labelledby="headingSix" data-bs-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="${pageContext.request.contextPath}/admin/support/inquiry_category_list">카테고리 관리</a>
									<a class="nav-link" href="${pageContext.request.contextPath}/admin/support/inquiry_board_list">문의 관리</a>
								</nav>
							</div>
							<a class="nav-link collapsed"  href="${pageContext.request.contextPath}/admin/support/faq_category_list"  data-bs-toggle="collapse" data-bs-target="#pagesCollapseFaq"  aria-expanded="false" aria-controls="pagesCollapseFaq">
								FAQ 분류
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseFaq"  aria-labelledby="headingSeven"  data-bs-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link"  href="${pageContext.request.contextPath}/admin/support/faq_category_list">
										카테고리 관리</a> 
									<a class="nav-link"  href="${pageContext.request.contextPath}/admin/support/faq_board_list">
										질문 및 답변 관리</a> 
								</nav>
							</div>

						</nav>
					</div>
					
					
					
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"  data-bs-target="#collapseBoard" aria-expanded="false"  aria-controls="collapseBoard">
						<div class="sb-nav-link-icon">
							<i class="fas fa-gears"></i>
						</div> 홈페이지 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseBoard"  aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"  id="sidenavAccordionPages">
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"  data-bs-target="#pagesCollapseNotice" aria-expanded="false"  aria-controls="pagesCollapseNotice"> 공지사항 관리
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseNotice" aria-labelledby="headingOne"  data-bs-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link"  href="${pageContext.request.contextPath}/admin/boardManage/notice_category_list">카테고리 관리</a>
									<a class="nav-link"  href="${pageContext.request.contextPath}/admin/boardManage/notice_board_list">문의 관리</a>
								</nav>
							</div>

						</nav>
					</div>


					



					<div class="sb-sidenav-menu-heading">통계</div>
					<a class="nav-link"
						href="${pageContext.request.contextPath}/admin/stats/member_main">
						<div class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> 회원 통계
					</a> 
					<a class="nav-link"
						href="${pageContext.request.contextPath}/admin/stats/sales_main">
						<div class="sb-nav-link-icon">
							<i class="fas 	fa-won-sign"></i>
						</div> 거래 통계
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
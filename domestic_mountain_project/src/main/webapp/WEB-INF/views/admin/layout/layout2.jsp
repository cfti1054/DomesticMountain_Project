<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
	
	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/tabs.css" type="text/css">  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/paginate.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/forms.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/board.css" type="text/css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/static/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/static/js/menu2.js"></script>
	
	
	
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet" type="text/css" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   	<script src="${pageContext.request.contextPath}/resources/admin/static/js/scripts.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/static/assets/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/static/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/static/js/datatables-simple-demo.js"></script>
</head>

<body>
	<div id="layoutSidenav">
	
			<tiles:insertAttribute name="left"/>
			
		<main class="wrapper">
			<tiles:insertAttribute name="body"/>
		</main>
	
<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
	<div class="loader"></div>
	
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>

<footer class="py-4  mt-auto"><div class="py-4"></div></footer>
</html>
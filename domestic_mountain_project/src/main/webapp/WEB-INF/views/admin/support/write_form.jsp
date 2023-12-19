<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
function sendOk() {
    const f = document.writeForm;
	let str;
	
    str = f.categoryName.value.trim();
    if(!str) {
        alert("카테고리 이름을 입력하세요. ");
        f.subject.focus();
		return;
    }
	console.log("jsp");
	console.log(str);
    f.action = "${pageContext.request.contextPath}/admin/support/faq_category_list";
    f.submit();
    
}
</script>
<body class="bg-secondary bg-opacity-25">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                    
                                        <form name="writeForm" method="post">
                                        	<table class="table mt-5 write-form">
                                        	<tr>
                                        	<td>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="categoryName" type="text"/>
                                            </div>
                                            </td>
                                            </tr>
                                            <!-- <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div> -->
                                            </table>
                                            
                                            
                                        </form>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/support/faq_category_list';">취소</button>
                                                <button type="button" class="btn btn-primary" onclick="sendOk();">추가</button>
                                         </div>
                                        
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/static/js/scripts.js"></script>
    </body>
</html>
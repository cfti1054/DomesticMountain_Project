<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<script type="text/javascript">
/*
$(function(){
	$("#tab-content").on("click", ".accordion h3.question", function(){
		 const $answer = $(this).next(".accordion div.answer");
		 let isVisible = $answer.is(':visible');
		 if(isVisible) {
			 $(this).next(".accordion div.answer").hide();
			 $(this).removeClass("active");
		 } else {
			 $(".accordion div.answer").hide();
			 $(".accordion h3.question").removeClass("active");
			 
			 $(this).next(".accordion div.answer").show();
			 $(this).addClass("active");
		 }
	});
});

$(function(){
	let categoryNum = "${categoryNum}";
	let pageNo = "${pageNo}";
	if(pageNo === "") {
		pageNo = 1;
	}
	$("#tab-"+categoryNum).addClass("active");
	listPage(pageNo);

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+categoryNum).addClass("active");
		
		listPage(1);
	});
});

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $(".tabs .active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/admin/stats/member_list";
	let query = "categoryNum="+ categoryNum;
	
	let selector = "#tab-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.schType.value = $("#schType").val();
	f.kwd.value = $("#kwd").val().trim();

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	$("#schType").val("all");
	$("#kwd").val("");
	
	listPage(1);
}

**/
</script>



<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">
			<div id="pieChart" style="min-height: 800px;" class="echart"></div>
		  <script>
			document.addEventListener("DOMContentLoaded", () => {
			  echarts.init(document.querySelector("#pieChart")).setOption({
				title: {
				  text: '나이대 별 회원 분포',
				  subtext: '',
				  left: 'center'
				},
				tooltip: {
				  trigger: 'item'
				},
				legend: {
				  orient: 'vertical',
				  left: 'left'
				},
				series: [{
				  name: '나이 대',
				  type: 'pie',
				  radius: '70%',
				  data: [
						{value: ${value_list[0]},
						name: '${name_list[0]}'
						},
						{value: ${value_list[1]},
						name: '${name_list[1]}'
						},
						{value: ${value_list[2]},
						name: '${name_list[2]}'
						},
						{value: ${value_list[3]},
						name: '${name_list[3]}'
						},
						{value: ${value_list[4]},
						name: '${name_list[4]}'
						},	
						{value: ${value_list[5]},
						name: '${name_list[5]}'
						},
						{value: ${value_list[6]},
						name: '${name_list[6]}'
						}
						
						  
						  
						  
						  
					  
					  
					  
					  /* 
					  
					  {value: 1048,
					  name: 'Search Engine'},
					  
					{value: 735,
					  name: 'Direct'},
					  
					{value: 580,
					  name: 'Email'},
					  
					{value: 484,
					  name: 'Union Ads'},
					  
					{value: 300,
					  name: 'Video Ads'}, */
				  ],
				  emphasis: {
					itemStyle: {
					  shadowBlur: 10,
					  shadowOffsetX: 0,
					  shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				  }
				}]
			  });
			});
		  </script>
			
			<script src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
	
			</div>
	</main>
</div>
<!-- 

			<div class="body-main">

		<div>
			<ul class="tabs">
				<li id="tab-0" data-categoryNum=0>모두</li>
				<li id="tab-1" data-categoryNum=1>성별</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px;"></div>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="reloadFaq();" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
				</td>
			</tr>
		</table>
		</div>
		 -->
	


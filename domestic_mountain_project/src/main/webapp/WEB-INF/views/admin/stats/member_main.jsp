<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

<style type="text/css">
ul.tabs {
	display: flex;
	margin: 0;
	padding: 0;
	list-style: none;
	height: 35px;
	width: 100%;
	border-bottom: 1px solid #ddd;
}
ul.tabs > li {
	margin: 0;
	cursor: pointer;
	padding: 0px 21px;
	height: 35px;
	overflow: hidden;
	background: #fff;
	border-bottom: 1px solid #ddd;
	display: flex; align-items: center;
}
ul.tabs li:hover {
	background: #e7e7e7;
}	
ul.tabs li.active {
	font-weight: 700;
	border: 1px solid #ddd;
	border-bottom-color:  transparent;
}
</style>

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

	$("#tab-"+categoryNum).addClass("active");

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-content div").each(function() {
			$(this).hide();
		});
		$("#tab-"+categoryNum).addClass("active");
		$("#chart-"+categoryNum).show();
	});
});
*/




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

function listChart(num) {
	const $tab = $(".tabs .active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/admin/stats/member_main";
	let query = "categoryNum="+ num;
	
	
	const fn = function(){
	};
	ajaxFun(url, "get", query, "html", fn);
}
</script>



<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">
		<div class="body-main">

<div class="body-container">
    <div class="body-title">
    </div>
		<div>
			<ul class="tabs">
				<li id="tab-0" data-categoryNum=0 onclick="listChart('0');">나이 별 회원 분포</li>
				<li id="tab-1" data-categoryNum=1  onclick="listChart('1');">성별</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px;">
			<c:choose>
			<c:when test="${categoryNum == 0}">
				<div id="chart-0" style="min-height: 800px;" class="echart"></div>
			</c:when>
			<c:when test="${categoryNum == 1}">
				<div id="chart-1" style="min-height: 800px;" class="echart"></div>
			</c:when>
			</c:choose>
			
		</div>
		 
  			
		</div>
	</div>	
			
		  
		  <script>
			document.addEventListener("DOMContentLoad", () => {
			  echarts.init(document.querySelector("#chart-0")).setOption({
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
	<script type="text/javascript">
    var dom = document.getElementById('chart-1');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow'
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: [
    {
      type: 'category',
      data: '${reg_date_list}',
      axisTick: {
        alignWithLabel: true
      }
    }
  ],
  yAxis: [
    {
      type: 'value'
    }
  ],
  series: [
    {
      name: 'Direct',
      type: 'bar',
      barWidth: '60%',
      data: '${reg_num_list}'
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
			
	
			</div>
	</main>
</div>
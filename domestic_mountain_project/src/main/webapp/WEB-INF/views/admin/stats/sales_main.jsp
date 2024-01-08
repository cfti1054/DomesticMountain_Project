<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

</script>



<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">
		
		
			<div class="body-main">

				<div class="body-container">
					<div class="body-title"></div>
					<div>
						<ul class="tabs">
							<li id="tab-0" data-categoryNum=0>최근 7일 매출</li>
							<li id="tab-1" data-categoryNum=1>성별</li>
						</ul>
					</div>
					<div id="tab-content" style="padding: 15px 10px 5px;">
						<div id="show-0"></div>
							<div id="container" style="height: 800px;"></div>
							<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
							
						<div id="show-1">두번째 표</div>
					</div>
				</div>
			</div>





		</div>
	</main>
</div>

<script type="text/javascript">
    var dom = document.getElementById('container');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  xAxis: {
    type: 'category',
    data: ['${sales_date_list[0]}','${sales_date_list[1]}',
  	  '${sales_date_list[2]}','${sales_date_list[3]}',
	  '${sales_date_list[4]}','${sales_date_list[5]}','${sales_date_list[6]}']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: ${sales_num_list},
      type: 'line'
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
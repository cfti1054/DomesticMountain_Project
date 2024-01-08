<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.2/echarts.min.js"></script>
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
*/
$(function(){
	let categoryNum = 0;

	$("#tab-"+categoryNum).addClass("active");

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		console.log(categoryNum);
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-content div").each(function() {
			$(this).css('display','none');
		});
		$("#tab-"+categoryNum).addClass("active");
		$("#show-"+categoryNum).css('display','block');

	});
});






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
				<li id="tab-0" data-categoryNum=0>나이 별 회원 분포</li>
				<li id="tab-1" data-categoryNum=1>성별</li>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px;">
			<div id="show-0">
				<div id="chart-1" style="min-height: 800px;" class="echart"></div>
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
      data: ['${reg_date_list[0]}','${reg_date_list[1]}',
    	  '${reg_date_list[2]}','${reg_date_list[3]}',
    	  '${reg_date_list[4]}','${reg_date_list[5]}','${reg_date_list[6]}'],
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
      name: '가입자 수',
      type: 'bar',
      barWidth: '60%',
      data: ${reg_num_list}
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script> 
			</div>
					
			<div id="show-1">
				두번째 표
			</div>
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
  tooltip: {
    trigger: 'item'
  },
  legend: {
    top: '5%',
    left: 'center'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 10,
        borderColor: '#fff',
        borderWidth: 2
      },
      label: {
        show: false,
        position: 'center'
      },
      emphasis: {
        label: {
          show: true,
          fontSize: 40,
          fontWeight: 'bold'
        }
      },
      labelLine: {
        show: false
      },
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
      ]
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
	<!-- 
	
	<div id="chart-0" style="min-height: 800px;" class="echart"></div>
				<script>		  
			window.addEventListener("DOMContentLoaded", () => {
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
	
	
	
	
				<div id="chart-1" style="min-height: 800px;" class="echart"></div>
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
      data: ${reg_date_list},
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
      data: ${reg_num_list}
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script> -->

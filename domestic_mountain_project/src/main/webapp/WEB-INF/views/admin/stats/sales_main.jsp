<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/style2.css" type="text/css">
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
	background: #000;
	border-bottom: 1px solid #ddd;
	display: flex; align-items: center;
}
ul.tabs li:hover {
	background: #e7e7e7;
	color: #000;
}	
ul.tabs li.active {
	font-weight: 700;
	border: 1px solid #ddd;
	border-bottom-color:  transparent;
}
</style>

<script type="text/javascript">
$(function(){
	let categoryNum = 0;
	$(".show-content").hide();
	/* $("#tab-"+categoryNum).addClass("active"); */

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		console.log(categoryNum);
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		/*
		$("#tab-content div").each(function() {
			$(this).hide();
		});
		*/
		$(".show-content").hide();
		
		$("#tab-"+categoryNum).addClass("active");
		$("#show-"+categoryNum).show();

	});
});
</script>



<div id="layoutSidenav_content">
	<div class="content-wrapper">
	<main class="mt-4">
		<div class="container-fluid px-4">
			<div class="body-main">
				<div class="body-container">
					<div class="body-title"></div>
					
					<div>
						<ul class="tabs">
							<li id="tab-0" data-categoryNum=0>최근 7일 매출 / 순이익</li>
							<li id="tab-1" data-categoryNum=1>최근 7일 누적 매출 / 순이익</li>
							<li id="tab-2" data-categoryNum=2>최근 6개월 매출 / 순이익</li>
							<li id="tab-3" data-categoryNum=3>최근 6개월 누적 매출 / 순이익</li>
						</ul>
					</div>
					<div id="tab-content" style="padding: 15px 10px 5px;">
						<div id="show-0" class="show-content">
						
							<div id="container-0" style="min-height: 800px;"></div>
							<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
							<script type="text/javascript">
    var dom = document.getElementById('container-0');
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
    		      type: 'cross',
    		      crossStyle: {
    		        color: '#999'
    		      }
    		    }
    		  },
    		  toolbox: {
    		    feature: {
    		      dataView: { show: true, readOnly: false },
    		      magicType: { show: true, type: ['line', 'bar'] },
    		      restore: { show: true },
    		      saveAsImage: { show: true }
    		    }
    		  },
    		  xAxis: [
    		    {
    		      type: 'category',
    		      data: ['${sales_date_list[0]}','${sales_date_list[1]}',
    		    	  '${sales_date_list[2]}','${sales_date_list[3]}',
    		    	  '${sales_date_list[4]}','${sales_date_list[5]}','${sales_date_list[6]}'],
    		      axisPointer: {
    		        type: 'shadow'
    		      }
    		    }
    		  ],
    		  yAxis: [
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: Math.max(...${sales_num_list}),
    		      interval: Math.max(...${sales_num_list}) * 0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    },
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: Math.max(...${sales_num_list}),
    		      interval: Math.max(...${sales_num_list}) * 0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    }
    		  ],
    		  series: [
    		    {
    		      name: '총 매출',
    		      type: 'bar',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${sales_num_list},
    		      itemStyle: {
    		          color: "rgba(75, 137, 220, 1)"}
    		    },
    		    {
    		      name: '순이익',
    		      type: 'line',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${revenue_num_list},
    		      itemStyle: {
    		          color: "rgba(225, 0, 0, 1)"}
    		    }
    		  ]
    		};



    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
						
						</div>
							
							
						<div id="show-1" class="show-content">
							<div id="container-1" style="min-height: 800px;"></div>
							<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
							<script type="text/javascript">
    var dom = document.getElementById('container-1');
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
    		      type: 'cross',
    		      crossStyle: {
    		        color: '#999'
    		      }
    		    }
    		  },
    		  toolbox: {
    		    feature: {
    		      dataView: { show: true, readOnly: false },
    		      magicType: { show: true, type: ['line', 'bar'] },
    		      restore: { show: true },
    		      saveAsImage: { show: true }
    		    }
    		  },
    		  xAxis: [
    		    {
    		      type: 'category',
    		      data: ['${sales_date_list[0]}','${sales_date_list[1]}',
    		    	  '${sales_date_list[2]}','${sales_date_list[3]}',
    		    	  '${sales_date_list[4]}','${sales_date_list[5]}','${sales_date_list[6]}'],
    		      axisPointer: {
    		        type: 'shadow'
    		      }
    		    }
    		  ],
    		  yAxis: [
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: Math.max(...${sales_sum_list}),
    		      interval: Math.max(...${sales_sum_list}) * 0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    },
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: Math.max(...${sales_sum_list}),
    		      interval: Math.max(...${sales_sum_list}) * 0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    }
    		  ],
    		  series: [
    		    {
    		      name: '총 매출',
    		      type: 'bar',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${sales_sum_list},
    		      itemStyle: {
    		          color: "rgba(75, 137, 220, 1)"}
    		    },
    		    {
    		      name: '순이익',
    		      type: 'line',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${revenue_sum_list},
    		      itemStyle: {
    		          color: "rgba(225, 0, 0, 1)"}
    		    }
    		  ]
    		};



    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
						
						
						</div>

						<div id="show-2" class="show-content">
							<div id="container-2" style="min-height: 800px;"></div>
							<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
							<script type="text/javascript">
    var dom = document.getElementById('container-2');
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
    		      type: 'cross',
    		      crossStyle: {
    		        color: '#999'
    		      }
    		    }
    		  },
    		  toolbox: {
    		    feature: {
    		      dataView: { show: true, readOnly: false },
    		      magicType: { show: true, type: ['line', 'bar'] },
    		      restore: { show: true },
    		      saveAsImage: { show: true }
    		    }
    		  },
    		  xAxis: [
    		    {
    		      type: 'category',
    		      data: ['${sales_month_list[0]}','${sales_month_list[1]}',
    		    	  '${sales_month_list[2]}','${sales_month_list[3]}',
    		    	  '${sales_month_list[4]}','${sales_month_list[5]}'],
    		      axisPointer: {
    		        type: 'shadow'
    		      }
    		    }
    		  ],
    		  yAxis: [
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: Math.max(...${monthly_sales_num_list}),
    		      interval: Math.max(...${monthly_sales_num_list}) * 0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    },
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: Math.max(...${monthly_sales_num_list}),
    		      interval: Math.max(...${monthly_sales_num_list}) * 0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    }
    		  ],
    		  series: [
    		    {
    		      name: '총 매출',
    		      type: 'bar',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${monthly_sales_num_list},
    		      itemStyle: {
    		          color: "rgba(75, 137, 220, 1)"}
    		    },
    		    {
    		      name: '순이익',
    		      type: 'line',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${monthly_revenue_num_list},
    		      itemStyle: {
    		          color: "rgba(225, 0, 0, 1)"}
    		    }
    		  ]
    		};



    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
						
						</div>
						
						<div id="show-3" class="show-content">
								<div id="container-3" style="min-height: 800px;"></div>
							<script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
							<script type="text/javascript">
    var dom = document.getElementById('container-3');
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
    		      type: 'cross',
    		      crossStyle: {
    		        color: '#999'
    		      }
    		    }
    		  },
    		  toolbox: {
    		    feature: {
    		      dataView: { show: true, readOnly: false },
    		      magicType: { show: true, type: ['line', 'bar'] },
    		      restore: { show: true },
    		      saveAsImage: { show: true }
    		    }
    		  },
    		  xAxis: [
    		    {
    		      type: 'category',
    		      data: ['${sales_month_list[0]}','${sales_month_list[1]}',
    		    	  '${sales_month_list[2]}','${sales_month_list[3]}',
    		    	  '${sales_month_list[4]}','${sales_month_list[5]}'],
    		      axisPointer: {
    		        type: 'shadow'
    		      }
    		    }
    		  ],
    		  yAxis: [
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: ${monthly_sales_sum_list[5]},
    		      interval: ${monthly_sales_sum_list[5]}*0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    },
    		    {
    		      type: 'value',
    		      min: 0,
    		      max: ${monthly_sales_sum_list[5]},
    		      interval: ${monthly_sales_sum_list[5]}*0.2,
    		      axisLabel: {
    		        formatter: '₩ {value}'
    		      }
    		    }
    		  ],
    		  series: [
    		    {
    		      name: '총 매출',
    		      type: 'bar',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${monthly_sales_sum_list},
    		      itemStyle: {
    		          color: "rgba(75, 137, 220, 1)"}
    		    },
    		    {
    		      name: '순이익',
    		      type: 'line',
    		      tooltip: {
    		        valueFormatter: function (value) {
    		          return '₩' + value;
    		        }
    		      },
    		      data: ${monthly_revenue_sum_list},
    		      itemStyle: {
    		          color: "rgba(225, 0, 0, 1)"}
    		    }
    		  ]
    		};



    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
						</div>
					
					</div>
				
				
				</div>
			</div>
		</div>
	</main>
	</div>
</div>


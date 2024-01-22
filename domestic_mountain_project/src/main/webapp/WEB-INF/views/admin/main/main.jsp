<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/static/css/style2.css" type="text/css">

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/memberManage/ageAnalysis";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}
		
		Highcharts.chart('chart-container', {
		    chart: {
		    	backgroundColor: '#1A1C24',
		        type: 'column'
		    },
		    title: {
		        text: '연령대별 회원수',
		        style: {
		        	        color: 'white'
		        	        }
		    },
		    xAxis: {
		        categories: titles
		    },
		    yAxis: {
		    	title: {
		    		text:"인원(명)"
		    	}
		    },
		    series: [{
		    	type: 'column',
		    	colorByPoint: true,
		        name: '인원수',
		        data: values,
		        showInLegend: false
		    }]
		});
		
		
	});
});

</script>


<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/chart";
	
	$.getJSON(url, function(data){
		// console.log(data);	
		chartsDay(data);
	});

	function chartsDay(data) {
		let chartData = [];
		
		for(let item of data.days) {
			let s = parseInt(item.ORDER_DATETIME.substring(5, 7))+'월 ';
			s += parseInt(item.ORDER_DATETIME.substring(8))+'일';

			let obj = {value:item.ORDER_TOTAL_MONEY, name:s};
			chartData.push(obj);
		}
		
		const chartDom = document.querySelector(".charts-day");
		let myChart = echarts.init(chartDom);
		let option;
		
		option = {
		  tooltip: {
		    trigger: 'item'
		  },
		  legend: {
		    top: '5%',
		    left: 'center',
		    itemGap: 50,
		        textStyle: {
			        color: '#FFF',
		            fontSize: 30  
		          }
		  },
		  series: [
		    {
		      name: '일별 판매현황',
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
		          fontSize: '40',
		          fontWeight: 'bold'
		        }
		      },
		      labelLine: {
		        show: false
		      },
		      data: chartData
		    }
		  ]
		};		
		
		option && myChart.setOption(option);
	}
	
});	
</script>



<div id="layoutSidenav_content">
	<main>
        <div class="content-wrapper">
		
		<div class="container-fluid px-4">
			<h1 class="mt-4 h2 font-weight-bold mb-0"><i class='fas fa-database' style='font-size:24px'></i> 대시보드</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active font-weight-bold">- ADMIN -</li>
			</ol>
		<div class="inner-page">
		
		
            <div class="row">
              <div class="col-sm-4 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h5>오늘 판매 현황</h5>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><fmt:formatNumber value="${today.TOTAL}"/>원</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+3.5%</p>
                        </div>
                       	<br>
                        <h6 class="font-weight-normal">총판매 건수 ${today.COUNT}건</h6>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-codepen text-primary ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h5>이번달 판매 현황</h5>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><fmt:formatNumber value="${thisMonth.TOTAL}"/>원</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+8.3%</p>
                        </div>
                        <br>
                        <h6 class="font-weight-normal">총판매 건수 ${thisMonth.COUNT}건</h6>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h5>저번달 판매 현황</h5>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><fmt:formatNumber value="${previousMonth.TOTAL}"/>원</h2>
                          <p class="text-danger ml-2 mb-0 font-weight-medium">-24.1% </p>
                        </div>
                        <br>
                        <h6 class="font-weight-normal">총판매 건수 ${previousMonth.COUNT}건</h6>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-monitor text-success ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>		
		
          
            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title"><i class='far fa-address-book'></i> 회원 분석</h4>
               
					<div id="tab-content" style=" width: 100%;">
						<div id="chart-container"></div>
					</div>

                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                 
                      <div class="text-md-center text-xl-left">
                        <h6 class="mb-1">총 회원수</h6>
                        <p class="text-muted mb-0">${thisMonthMember.THISDATE}, 기준</p>
                      </div>
                      <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                        <h6 class="font-weight-bold mb-0">${thisMonthMember.THISMONTHMEMBER} 명</h6>
                      </div>
                    </div>
                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                      <div class="text-md-center text-xl-left">
                        <h6 class="mb-1">저번달 회원수</h6>
                        <p class="text-muted mb-0">${lastMonthMember.LASTDATE}, 기준</p>
                      </div>
                      <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                        <h6 class="font-weight-bold mb-0">${lastMonthMember.LASTMONTHMEMBER} 명</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-row justify-content-between">
                      <h4 class="card-title mb-1"><i class="fas fa-chart-bar"></i> 통계</h4>
                      <p class="text-muted mb-1"><!-- Your data status --></p>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">
 						<br>
 						
						<div class="fs-6 fw-semibold mb-2"><i class='fab fa-cc-visa' style='font-size:19px; color:red;'></i> 최근 1주일 판매 현황</div>
						<div class="charts-day rounded" style="height: 550px;"></div>
   
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

		</div>
		</div>
	
</div>
</main>
</div>





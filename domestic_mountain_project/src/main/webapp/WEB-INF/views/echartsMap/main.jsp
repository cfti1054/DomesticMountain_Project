<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.features-2 .text-end {
	max-width: 1000px;
	margin: auto;
}

.features-2 .row {
	width: 1000px;
}
</style>


<section class="features-1">
	<div class="maps-container">
		<div class="amain">
			<h1 class="amain-main">
				<a>한반도 지도<span>| Maps</span></a> <span><a href="/plus/">home</a>
					&gt; Maps</span>
			</h1>
		</div>

		<div class="maps-body-container" style="margin-top: 15px;">
			<div class="maps"></div>
		</div>
	</div>

</section>

<script type="text/javascript">
	var ROOT_PATH = '${pageContext.request.contextPath}/data/asset/geo';
	var sido, fullSido, sigungu; 
	
	var chartDom = document.querySelector('.maps');
	var myChart = echarts.init(chartDom);
	var option;
	
	myChart.showLoading();
	$.get(ROOT_PATH + '/0.json', function (geoJson) {
	  myChart.hideLoading();
	  echarts.registerMap('KOREA', geoJson);
	  
	  myChart.setOption(
	    (option = {
	      title: {
	        text: '대한민국',
	        //subtext: '전국지도',
	      },
	      tooltip: {
	        trigger: 'item',
	        formatter: '{b}'
	      },
	      toolbox: {
	          show: true,
	          orient: 'vertical',
	          left: 'right',
	          top: 'bottom',
	          feature: {
	            //dataView: { readOnly: false },
	            restore: {}
	          }
	      }, 
	      visualMap: {
	        min: 0,
	        max: 100,
	        text: ['100%', '0%'],
	        realtime: false,
	        calculable: true,
	        inRange: {
	          // color: ['#32CD32', '#3CB371', '#006400'] - 녹색 계열
	          color: ['#C6F9FF', '#6C9FFF', '#1245AB']
	        }
	      },
	      geo: {
	    	  map: 'KOREA',
	    	  roam: false,
	    	  zoom: 1.2,
	    	  nameMap : {
	              '서울특별시': '서울',
	              '부산광역시': '부산',
	              '대구광역시': '대구',
	              '인천광역시': '인천',
	              '광주광역시': '광주',
	              '대전광역시': '대전',
	              '울산광역시': '울산',
	              '세종특별자치시': '세종',
	              '경기도': '경기',
	              '강원도': '강원',
	              '충청북도': '충북',
	              '충청남도': '충남',
	              '전라북도': '전북',
	              '전라남도': '전남',
	              '경상북도': '경북',
	              '경상남도': '경남',
	              '제주특별자치도': '제주',
	    	  }
	      },
	      series: [
	        {
	          name: 'map',
	          type: 'map',
	          geoIndex: 0,
	          label: {
	        	  nomal:{
	        	  	show: false
	        	  }
	          },
	          data: [
	            { id: '11', name: '서울', fullName: '서울특별시', value: 100 }, // value 속성이 있어야 색을 입힘
	            { id: '26', name: '부산', fullName: '부산광역시', value: 80 },
	            { id: '27', name: '대구', fullName: '대구광역시', value: 60 },
	            { id: '28', name: '인천', fullName: '인천광역시', value: 40 },
	            { id: '29', name: '광주', fullName: '광주광역시', value: 20 },
	            { id: '30', name: '대전', fullName: '대전광역시', value: 0 },
	            { id: '31', name: '울산', fullName: '울산광역시', value: 10 },
	            { id: '36', name: '세종', fullName: '세종특별자치시', value: 30 },
	            { id: '41', name: '경기', fullName: '경기도', value: 50 },
	            { id: '42', name: '강원', fullName: '강원도', value: 70 },
	            { id: '43', name: '충북', fullName: '충청남도', value: 88 },
	            { id: '44', name: '충남', fullName: '충청북도', value: 12 },
	            { id: '45', name: '전북', fullName: '전라북도', value: 8 },
	            { id: '46', name: '전남', fullName: '전라남도', value: 99 },
	            { id: '47', name: '경북', fullName: '경상북도', value: 54 },
	            { id: '48', name: '경남', fullName: '경상남도', value: 53 },
	            { id: '50', name: '제주', fullName: '제주특별자치도', value: 78 }
	          ],
	          nameMap: {
	            '서울특별시': '서울',
	            '부산광역시': '부산',
	            '대구광역시': '대구',
	            '인천광역시': '인천',
	            '광주광역시': '광주',
	            '대전광역시': '대전',
	            '울산광역시': '울산',
	            '세종특별자치시': '세종',
	            '경기도': '경기',
	            '강원도': '강원',
	            '충청북도': '충북',
	            '충청남도': '충남',
	            '전라북도': '전북',
	            '전라남도': '전남',
	            '경상북도': '경북',
	            '경상남도': '경남',
	            '제주특별자치도': '제주'
	          }
	        }
	      ]
	    })
	  );
	});
	
	option && myChart.setOption(option);
	
	// 지도에서 지역을 클릭한 경우 -----
	myChart.on('click', function(params){
		if((! params.data) || (! params.data.fullName)) { // 시군구를 클릭 한 경우
			// 세종시는 확인 필요
			sigungu = params.name;
		
			// 여기가 이제 시군구 클릭을 했을때 넘기는 코드
			
		
		
			document.getElementById("region").innerHTML=fullSido + ' ' + sigungu;
			
			
			// alert(fullSido + ' ' + sido + ' ' + sigungu);
			
			return false;
		}
		
		// 시도를 클릭한 경우
		sido = params.name;
		
		
		// 여기가 이제 도를 클릭 했을때 넘기는 코드
		
		
		var id = params.data.id;
		fullSido = params.data.fullName;
		
		document.getElementById("region").innerHTML = fullSido;
		
		
		var arr = [];
		var colors = [0, 50, 30, 70, 20, 40, 80, 10, 90, 60, 100];	
		$.get(ROOT_PATH + '/' + id + '.json', function (geoJson) {
		  echarts.registerMap('KOREA', geoJson);
	
		  //console.log(geoJson);
		  let n = 0;
		  for(let f of geoJson.features) {
			  // arr.push({id: f.properties.id, name: f.properties.name, value: colors[n++]}); // value:색상
			  arr.push({name: f.properties.name, value: colors[n++]}); // value:색상
			  if(n >= colors.length) {
				  n = 0;
			  }
		  }
		  
		  myChart.setOption(
		    (option = {
    		  tooltip: {
		    	trigger: 'item',
		    	formatter: sido + ' {b}'
		      },
	  	      visualMap: {
	  	        min: 0,
	  	        max: 100,
	  	        text: ['100%', '0%'],
	  	        realtime: false,
	  	        calculable: true,
	  	        inRange: {
	  	        	color: ['#ffefef', '#f8a8a4', '#ec8184']
	  	        }
	  	      },
		      geo: {
		    	  map: 'KOREA',
		    	  roam: false,
		    	  zoom: 1
		      }
		    })
		  );
		  
		  myChart.setOption({
			  title: {
			    text: fullSido
			  },
			  series: [{  // 지도에 색상을 칠하기 위해(series를 지우면 기본 색상 - data 에서 value 속성이 색상)
	    	  	name: 'map',
	          	type: 'map',
	          	geoIndex: 0,
	          	data: arr
	      	  }]
		  });
		  
		});
	
	});

	// 오른쪽 Restore 버튼을 클릭한 경우 -----
	// 시군구에서 Restore 버튼을 클릭하면 지도 색상이 초기화 되므로
	myChart.on('restore', function(params){
		location.href = '${pageContext.request.contextPath}/emaps/main'; 
	});
	
	
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
	
</script>


<section class="features-2">
	<div class="mountain-h2">
		<div class="amain">
			<h1 class="amain-main">
				<a id="region">전체</a> <span>Mountain List</span>
			</h1>
		</div>
	</div>

	<div class="col-6 text-end datacount">
	
		<form class="row text-end-row" name="searchForm"
			action="${pageContext.request.contextPath}/emaps/main" method="post">
			
			<div class="col-auto p-1">
				<input type="text" name="kwd" value="${kwd}" class="form-control"
					placeholder="산명 검색하세요.">
			</div>
			<div class="col-auto p-1">
				<button type="button" class="btn btn-light" onclick="searchList()"
					style="background-color: #d3d4d5">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
		
		
		<div class="col">
			<button type="button" class="btn btn-light"
				onclick="location.href='${pageContext.request.contextPath}/emaps/main';"
				title="새로고침" style="background-color: #d3d4d5">
				<i class="bi bi-arrow-counterclockwise"></i>
			</button>
		</div>
		<div style="width: 100px; display: flex; justify-content: center; align-items: center; height: 38px;">
			${dataCount} 개
		</div>

	</div>


	<div class="mountain-main"
		style="overflow-y: scroll; width: auto; height: 1000px;">
		<ul>
			<c:forEach var="dto" items="${list}" varStatus="status">
				
				<li class="member co-funder type_bottom">
					<div class="thumb">
						<img src="${dto.mountain_img}">
					</div>
					<div class="description">
						<h3 class="mountain-name">${dto.mountain_name}</h3>
						<p>
							${dto.main_content}<br>
						</p>
						<a href="${pageContext.request.contextPath}/emaps/article?mountain_num=${dto.mountain_num}"># 상세보기</a>
					</div>
				</li>
					
			</c:forEach>
		</ul>

	</div>
</section>


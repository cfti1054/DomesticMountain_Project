<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>
<%-- 
	<div class="accordion"> 
	
		<c:forEach var="dto" items="${list}"> 
			<h3 class="question">
				<span class="q">Q.</span> <span class="subject">{dto.subject}</span>
				
			</h3>
			<div class="answer">
				
			
				<div class="category">분류 : {dto.category}</div>
				<div class="content">
		 			
				</div>

			</div>
		</c:forEach>


	</div>
--%>
 <div id="pieChart" style="min-height: 800px; width:100%;" class="echart"></div>
 <script>
			 document.addEventListener("DOMContentLoad", () => { 
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
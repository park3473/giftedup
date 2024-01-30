<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %> 
</head>

<body>
    <!--헤더-->
    <%@ include file="../include/header.jsp" %>
    <!--헤더 end-->
    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>커뮤니케이터 통계</span>
                            </div>

                            <div class="member_seach_form">
                                <div class="member_01_wrap mr-0">
                                    <form>
                                        <div class="form_01">
                                            <select name="SEARCH_TYPE" id="SEARCH_TYPE">
                                            	<option value="2020"  <c:if test="${model.YEAR == '2020'}">selected</c:if>>2020년</option>
                                            	<option value="2021" <c:if test="${model.YEAR == '2021'}">selected</c:if>>2021년</option>
                                            </select>
                                            <a class="w_btn" href="./stat.do?YEAR=${model.YEAR}">새로고침</a>
                                                <button type="button" value="검색" onClick="excel_down('1')">커뮤니케이터 출력</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="port_stat_area">
                            	<div class="port_stat_con">
                            		<div class="port_chart_box">
                            			<div class="port_chart_ob">
                            				<h2><span style="margin-right:10px"><img style="vertical-align: middle; margin-bottom:4px;" src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>찾아가는 영재키움</h2>
                            				<div class="port_chart" id="port_chart_01" ></div>
                            			</div>
                            		</div>
                            		<div class="port_chart_box">
                            			<div class="port_chart_ob">
                            				<h2><span style="margin-right:10px"><img style="vertical-align: middle; margin-bottom:4px;" src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>체험진로탐색</h2>
                            				<div class="port_chart" id="port_chart_02" ></div>
                            			</div>
                            		</div>
                            		<div class="port_chart_box">
                            			<div class="port_chart_ob">
                            				<h2><span style="margin-right:10px"><img style="vertical-align: middle; margin-bottom:4px;" src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>창의융합캠프</h2>
                            				<div class="port_chart" id="port_chart_03" ></div>
                            			</div>
                            		</div>
                            		<div class="port_chart_box">
                            			<div class="port_chart_ob">
                            				<h2><span style="margin-right:10px"><img style="vertical-align: middle; margin-bottom:4px;" src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>기타</h2>
                            				<div class="port_chart" id="port_chart_04" ></div>
                            			</div>
                            		</div>
                            		<div class="port_chart_box">
                            			<div class="port_chart_ob">
                            				<h2><span style="margin-right:10px"><img style="vertical-align: middle; margin-bottom:4px;" src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>수료 여부</h2>
                            				<div class="port_chart" id="port_chart_05" ></div>
                            			</div>
                            		</div>
                            		<div class="port_chart_box">
                            			<div class="port_chart_ob">
                            				<h2><span style="margin-right:10px"><img style="vertical-align: middle; margin-bottom:4px;" src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>활동횟수</h2>
                            				<div class="port_chart" id="port_chart_06" ></div>
                            			</div>
                            		</div>
                            	</div>
                            </div>
							
							
							
                        </div>
                    </section>
                    <!--본문 내용 end-->

                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/portfolio.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script>
		google.charts.load('current', {'packages':['bar']});
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		google.charts.setOnLoadCallback(drawChart2);
		google.charts.setOnLoadCallback(drawChart3);
		google.charts.setOnLoadCallback(drawChart4);
		google.charts.setOnLoadCallback(drawChart5);
		google.charts.setOnLoadCallback(drawChart6);
		//교육과정 프로그램(11:상담,12:진로적성검사,13:학습멘토링,14:자율연구,15:융합과학 프로젝트,16:전문가멘토링,17:기타,21:현장체험학습,22:또래멘토링23:온라인 학습멘토링,24:문화체험25기타,31:캠프,41:오리엔테이션,42:성과발표회,)
		function drawChart() {
		    var data = google.visualization.arrayToDataTable([
		        ['', '상담', '진로적성검사', '학습멘토링', '자율연구', '융합과학프로젝트', '전문가멘토링', '기타'],
		        ['활동시간', ${model.pageDomain.COURSE_PRGM_11}, ${model.pageDomain.COURSE_PRGM_12}, ${model.pageDomain.COURSE_PRGM_13}, ${model.pageDomain.COURSE_PRGM_14}, ${model.pageDomain.COURSE_PRGM_15}, ${model.pageDomain.COURSE_PRGM_16}, ${model.pageDomain.COURSE_PRGM_17}],
		        ['활동횟수', ${model.pageDomain.COURSE_PRGM_CNT_11}, ${model.pageDomain.COURSE_PRGM_CNT_12}, ${model.pageDomain.COURSE_PRGM_CNT_13}, ${model.pageDomain.COURSE_PRGM_CNT_14}, ${model.pageDomain.COURSE_PRGM_CNT_15}, ${model.pageDomain.COURSE_PRGM_CNT_16}, ${model.pageDomain.COURSE_PRGM_CNT_17}]
		    ]);
		    var options = {
		        vAxis: {
		        	format: 'decimal',
		        	baselineColor: 'black',
		        },
		        backgroundColor: "transparent",
		        chartArea: {
		            backgroundColor: {
		        		fill: 'transparent',
		        	},
		        },
		        legend: {
		        	position: 'top'
		        },
		    };
		
		    var chart = new google.charts.Bar(document.getElementById('port_chart_01'));
		
		    chart.draw(data, google.charts.Bar.convertOptions(options));
		}
		
		function drawChart2() {
		    var data = new google.visualization.arrayToDataTable([
		        ['', '현장체험학습', '또래멘토링', '온라인 학습멘토링', '문화체험', '기타'],
		        ['활동시간', ${model.pageDomain.COURSE_PRGM_21}, ${model.pageDomain.COURSE_PRGM_22}, ${model.pageDomain.COURSE_PRGM_23}, ${model.pageDomain.COURSE_PRGM_24}, ${model.pageDomain.COURSE_PRGM_25}],
		        ['활동횟수', ${model.pageDomain.COURSE_PRGM_CNT_21}, ${model.pageDomain.COURSE_PRGM_CNT_22}, ${model.pageDomain.COURSE_PRGM_CNT_23}, ${model.pageDomain.COURSE_PRGM_CNT_24}, ${model.pageDomain.COURSE_PRGM_CNT_25}]
		    ]);
		
		    var options = {
		        vAxis: {
		        	format: 'decimal',
		        	baselineColor: 'black',
		        },
		        backgroundColor: "transparent",
		        chartArea: {
		            backgroundColor: {
		        		fill: 'transparent',
		        	},
		        },
		        legend: {
		        	position: 'bottom'
		        },
		    };
		
		    var chart = new google.charts.Bar(document.getElementById('port_chart_02'));
		
		    chart.draw(data, google.charts.Bar.convertOptions(options));
		}
		
		function drawChart3() {
		    var data = new google.visualization.arrayToDataTable([
		        ['', '캠프'],
		        ['활동시간',  ${model.pageDomain.COURSE_PRGM_31}],
		        ['활동횟수',  ${model.pageDomain.COURSE_PRGM_CNT_31}]
		    ]);
		
		    var options = {
		        vAxis: {
		        	format: 'decimal',
		        	baselineColor: 'black',
		        },
		        backgroundColor: "transparent",
		        chartArea: {
		            backgroundColor: {
		        		fill: 'transparent',
		        	},
		        },
		        legend: {
		        	position: 'bottom'
		        },
		    };
		
		    var chart = new google.charts.Bar(document.getElementById('port_chart_03'));
		
		    chart.draw(data, google.charts.Bar.convertOptions(options));
		}
		
		function drawChart4() {
		    var data = new google.visualization.arrayToDataTable([
		        ['', '오리엔테이션', '성과발표회'],
		        ['활동시간',  ${model.pageDomain.COURSE_PRGM_41},  ${model.pageDomain.COURSE_PRGM_42}],
		        ['활동횟수',  ${model.pageDomain.COURSE_PRGM_CNT_41},  ${model.pageDomain.COURSE_PRGM_CNT_42}]
		    ]);
		
		    var options = {
		        vAxis: {
		        	format: 'decimal',
		        	baselineColor: 'black',
		        },
		        backgroundColor: "transparent",
		        chartArea: {
		            backgroundColor: {
		        		fill: 'transparent',
		        	},
		        },
		        legend: {
		        	position: 'bottom'
		        },
		    };
		
		    var chart = new google.charts.Bar(document.getElementById('port_chart_04'));
		
		    chart.draw(data, google.charts.Bar.convertOptions(options));
		}
		
		function drawChart5() {
			var data = google.visualization.arrayToDataTable([
		        ['', ''],
		        ['수료', ${model.EVAL_OPEN_Y}],
		        ['미수료', ${model.EVAL_OPEN_N}]
		    ]);
		
		    var options = {
		        backgroundColor: "transparent",
		        legend: {
		        	position: 'right'
		        },
		    };
		
		    var chart = new google.visualization.PieChart(document.getElementById('port_chart_05'));
		
		    chart.draw(data, options);
		}
		function drawChart6() {
		    var data = new google.visualization.arrayToDataTable([
		        ['', '활동횟수'],
		        ['초',  ${model.pageDomain.COURSE_PRGM_CNT_51}],
		        ['중',  ${model.pageDomain.COURSE_PRGM_CNT_52}],
		        ['고', ${model.pageDomain.COURSE_PRGM_CNT_53}]
		    ]);
		
		    var options = {
		        vAxis: {
		        	format: 'decimal',
		        	baselineColor: 'black',
		        },
		        backgroundColor: "transparent",
		        chartArea: {
		            backgroundColor: {
		        		fill: 'transparent',
		        	},
		        },
		        legend: {
		        	position: 'bottom'
		        },
		    };
		
		    var chart = new google.charts.Bar(document.getElementById('port_chart_06'));
		
		    chart.draw(data, google.charts.Bar.convertOptions(options));
		}
	</script>
	
	<script>
		$("#SEARCH_TYPE").change(function(){
			  location.href = './stat.do?YEAR='+$(this).val();
		});
	    function excel_down(st)
	    {
	    	deleteArrIdx = "";
	        location.href = './'+st+'/excelDown.do?MEMBER_ID='+deleteArrIdx;
	    }
	</script>
</body>
</html>

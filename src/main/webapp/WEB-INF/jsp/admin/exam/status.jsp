<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
</head>
<style>
	.status_div2{width:50%;float: left;text-align:center;margin-bottom:50px;border-bottom:1px #ccc solid;background:#fff;border:1px #ccc solid;padding:100px 0}
	.status_div{width:50%;float: left;text-align:center;margin-bottom:50px;border-bottom:1px #ccc solid;min-height:900px}
	.chart{
	width : 500px;margin:0 auto;padding-bottom:50px;
	}
</style>

<script type="text/javascript">
const select_list = '${model.view.select_list}';
console.log(select_list);
const select = (function() {
    return select_list.split(',');
})();
console.log(select);
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ckeditor필요한 부분 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.css">
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style>
	/*admin css 와 ckeditor css 충돌나서 바꿔버림*/
	.member_input_wrap .member_input button {
    margin-left: 0px !important;
	}
	.member_input_wrap .member_input textarea {
    	width: 100%;
    	height: 100%;
    	padding: 0px;
    }
	h2{font-size:24px;letter-spacing:-2px;font-weight:500}
</style>
<!-- ckeditor필요한 부분 -->

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
                    <div class="status_div2">
                    	<h2>전체 참여율 </h2>
                    	<p>등록된 응답자 수 : ${model.total_cnt }</p>
					    <div class="chart">
					    	<canvas id="pieChartRespondents"  width="400px" height="400px" ></canvas>
					    </div>
                    </div>
                    
                    <c:forEach var="item" items="${model.question }" varStatus="status">
	                    <c:if test="${item.select_type != '3' }">
		                    <div class="status_div2">
		                    	<h2>${status.index + 1 }번 문항 : ${item.name }</h2>
		                    	<br>
							    <div class="chart">
							    	<canvas id="questionChart_${status.index + 1 }"  width="400px" height="400px" ></canvas>
							    </div>
		                    </div>
	                    </c:if>
	                    <c:if test="${item.select_type == '3' }">
	                    	<div class="status_div2">
	                    		<h2>${status.index + 1 }번 문항 ${item.name }</h2>
	                    		<br>
	                    		<ul id="result_list_${status.index + 1 }" style="height : 550px;overflow:scroll">
	                    		</ul>
	                    	</div>
	                    </c:if>
                    </c:forEach>
                    
                </section>
                	
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script type="text/javascript">
//=====================================================================================================

function Question(idx , name , type , content , select_type , select_cnt , Choices){
	
	this.idx = idx;
	this.name = name;
	this.type = type;
	this.content = content;
	this.select_type = select_type;
	this.select_cnt = select_cnt;
	this.Choices = Choices;
	
}

//=====================================================================================================
var questions = [];
<c:forEach var="item" items="${model.question}" varStatus="status" >
questions.push(new Question(
		'${item.idx}',
		'${item.name}',
		'${item.type}',
		'${item.content}',
		'${item.select_type}',
		'${item.select_count}',
		'${item.Choices}'
		));
</c:forEach>
//=====================================================================================================

function Result(idx , member_id , select_list){
	
	this.idx = idx;
	this.member_id = member_id;
	this.select_list = select_list;
	
}

//=====================================================================================================
var results = [];
<c:forEach var="item" items="${model.resultList}" varStatus="status" >
results.push(new Result(
			'${item.idx}',
			'${item.member_id}',
			'${item.select_list}'
));
</c:forEach>
//=====================================================================================================
	
function calculateParticipationFrequencies() {
	
	var total_cnt = Number('${model.total_cnt}');
	
	var respon_cnt = Number('${model.respon_cnt}');
	
	var no_respon_cnt = total_cnt - respon_cnt; 
	
    let frequencies = { yes: respon_cnt , no: no_respon_cnt };

    return frequencies;
}

var frequencies = calculateParticipationFrequencies();
createParticipationChart(frequencies);

function createParticipationChart(frequencies) {
    var ctx = document.getElementById('pieChartRespondents').getContext('2d');
    var participationChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['응답자', '미응답자'],
            datasets: [{
                label: '참여율',
                data: [frequencies.yes, frequencies.no],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            plugins: {
            	legend: {
                    position: 'right',
                    labels: {
                        generateLabels: function(chart) {
                            const data = chart.data;
                            return data.labels.map((label, index) => {
                                const value = data.datasets[0].data[index];
                                return {
                                    text: label + ' : ' + value, // 레이블과 값 모두 표시
                                    fillStyle: data.datasets[0].backgroundColor[index],
                                };
                            });
                        }
                    }
                },
                datalabels: {
                    color: '#000000',
                    anchor: 'center',
                    align: 'center',
                    formatter: (value, context) => {
                        const total = context.dataset.data.reduce((sum, val) => sum + val, 0);
                        const percentage = (value / total * 100).toFixed(2);
                        if (percentage === '0.00') {
                            return ''; // 0%일 때는 레이블을 표시하지 않음
                        } else {
                        	return percentage + "%";
                        }
                    }
                }
            }
        },
        plugins: [ChartDataLabels]
    });
}


function parseSelectList(selectList) {
    // 정규 표현식을 사용하여 대괄호([]) 내부의 내용을 포함하여 분리
    const regex = /\[.*?\]|[^,]+/g;
    return selectList.match(regex);
}


function generateStatistics(questions, results) {
    const statistics = questions.map(question => ({
        idx: question.idx,
        name: question.name,
        type: question.select_type,
        Choices : question.Choices,
        responses: question.type === '3' ? [] : new Array(question.select_cnt).fill(0)
    }));

    results.forEach(result => {
        const responses = parseSelectList(result.select_list);
        responses.forEach((response, index) => {
            // 'questions' 배열의 범위를 넘어가지 않도록 체크
            if (index >= questions.length) return;
            const question = questions[index];

            // 해당 문항에 대한 통계 객체를 찾음
            const questionStat = statistics.find(stat => stat.idx === question.idx);
            if (!questionStat) return;

            console.log('type : ' + questionStat.type)
            
            if (questionStat.type !== '3') { // 선택형 문항
            	
            	console.log(index);
            	console.log(response);
            	
            	if (response.startsWith('[') && response.endsWith(']')) {
                    // 대괄호([])를 제거합니다.
                    const trimmedResponse = response.slice(1, -1);
                    
                    // 제거된 대괄호를 기준으로 쉼표로 구분된 값들을 배열로 변환.
                    const selectedIndexes = trimmedResponse.split(',').map(Number);
                    
                    // 각 선택된 인덱스에 대해 응답 횟수를 증가.
                    selectedIndexes.forEach(i => {
                        questionStat.responses[i - 1] = (questionStat.responses[i - 1] || 0) + 1;
                    });
                }else {
                    // 라디오 버튼 응답 처리. 숫자 변환 후 해당 선택지 카운트 증가
                    const selectedIndex = parseInt(response);
                    if(!isNaN(selectedIndex)) {
                        questionStat.responses[selectedIndex-1] = (questionStat.responses[selectedIndex-1] || 0) + 1;
                    }
                }
            }
            if (questionStat.type === '3') {
                // 답변형 응답 처리
                console.log(response);
                
                questionStat.responses.push(response);
                
            }
            
        });
    });



    return statistics;
}



const statistics = generateStatistics(questions, results);
console.log(statistics);

function drawChartsForQuestions(statistics) {
    statistics.forEach(function(stat, index) {
        // stat: 각 문항의 통계 데이터
        // index: 문항의 순서(0부터 시작)
        
        console.log(index);
        console.log(stat.type);
        if (stat.type !== '3') {
        	var ctx = document.getElementById('questionChart_' + (index + 1)).getContext('2d');
        }
        if (stat.type === '1') { // 라디오 버튼 (막대 그래프)
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: stat.Choices.split('#'), // 선택지 분리
                    datasets: [{
                        label: stat.name,
                        data: stat.responses, // 응답 데이터
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        legend: {
                            position: 'right',
                            align : 'center',
                            labels: {
                                    generateLabels: function(chart) {
                                        console.log(chart);
                                        const data = chart.data;
                                        console.log(data);
                                        return data.labels.map((label, index) => ({
                                            text: label + ": " + data.datasets[0].data[index],
                                            fillStyle: data.datasets[0].backgroundColor[index],
                                        }));
                                    }
                            }
                        },
                        title: {
                            display: false,
                        },
                        datalabels: {
                        color: '#000000',
                        anchor: 'center',
                        align: 'center',
                        formatter: (value, context) => {
                                const data = context.chart.data;
                                const total = data.datasets[0].data.reduce((sum, value) => sum + value, 0);
                                const percentage = total > 0 ? (value / total * 100).toFixed(2) : 0;
                                return percentage + "%";
                            }
                        }
                    }
                }
            });
        } else if (stat.type === '2') { // 체크박스 (파이 차트)
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: stat.Choices.split('#'), // 선택지 분리
                    datasets: [{
                        data: stat.responses, // 응답 데이터
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options : {
                	plugins: {
                        legend: {
                            position: 'right',
                            align : 'center',
                            labels: {
                                    generateLabels: function(chart) {
                                        console.log(chart);
                                        const data = chart.data;
                                        console.log(data);
                                        return data.labels.map((label, index) => ({
                                            text: label + ": " + data.datasets[0].data[index],
                                            fillStyle: data.datasets[0].backgroundColor[index],
                                        }));
                                    }
                            }
                        },
                        title: {
                            display: false,
                        },
                        datalabels: {
                        color: '#000000',
                        anchor: 'center',
                        align: 'center',
                        formatter: (value, context) => {
                                const data = context.chart.data;
                                const total = data.datasets[0].data.reduce((sum, value) => sum + value, 0);
                                const percentage = total > 0 ? (value / total * 100).toFixed(2) : 0;
                                return percentage + "%";
                            }
                        }
                    }
                }
                
            });
        }
    });
}

function updateTextResponseLists(statistics) {
    statistics.forEach(function(stat, index) {
        if (stat.type === '3') { // 답변형
            var listElement = document.getElementById('result_list_' + (index + 1));
            stat.responses.forEach(function(response) {
            	if(response && response !== "0") {
	                var listItem = document.createElement('li');
	                listItem.textContent = response;
	                listElement.appendChild(listItem);
            	}
            });
        }
    });
}


$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(6).css({
	    backgroundColor: "#fff"
	});
});

document.addEventListener('DOMContentLoaded', function() {
    // 'statistics'는 서버로부터 받은 문항 통계 데이터 변수입니다.
    drawChartsForQuestions(statistics);
    updateTextResponseLists(statistics);
});


</script>
</body>
</html>
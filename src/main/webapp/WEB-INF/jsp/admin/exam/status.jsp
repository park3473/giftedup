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
	width : 400px;margin:0 auto;padding-bottom:50px;
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
                    	yes or no
					    <div class="chart">
					    	<canvas id="pieChartRespondents"  width="400px" height="400px" ></canvas>
					    </div>
                    </div>
                    
                    <c:forEach var="item" items="${model.question }" varStatus="status">
	                    <c:if test="${item.select_type != '3' }">
		                    <div class="status_div2">
		                    	<h2>${status.index + 1 }번 문항 ${item.name }</h2>
		                    	<c:forEach var="choice" items="${fn:split(item.Choices, '#')}"  varStatus="select_status">
								 	${select_status.index + 1 }. ${choice}
								 </c:forEach>
							    <div class="chart">
							    	<canvas id="questionChart_${status.index + 1 }"  width="400px" height="400px" ></canvas>
							    </div>
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

function Respondents(idx , exam_idx , member_id , type , school_name , name , phone , respondents){
	
	this.idx = idx;
	this.exam_idx = exam_idx;
	this.member_id = member_id;
	this.type = type;
	this.school_name = school_name;
	this.name = name;
	this.phone = phone;
	this.respondents = respondents;
	
}
//=====================================================================================================
var respondents = [];	
<c:forEach var="item" items="${model.respondents}" varStatus="status" >
respondents.push(new Respondents(
	'${item.idx}',
	'${item.exam_idx}',
	'${item.member_id}',
	'${item.type}',
	'${item.school_name}',
	'${item.name}',
	'${item.phone}',
	'${item.respondents}',
))
</c:forEach>

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

function Result(idx , exam_idx , member_id , name , select_list , complete){
	
	this.idx = idx;
	this.exam_idx = exam_idx;
	this.member_id = member_id;
	this.name = name;
	this.select_list = select_list;
	this.complete = complete;
	
}

//=====================================================================================================
var results = [];
<c:forEach var="item" items="${model.resultList}" varStatus="status" >
results.push(new Result(
			'${item.idx}',
			'${item.exam_idx}',
			'${item.member_id}',
			'${item.name}',
			'${item.select_list}',
			'${item.complete}'
));
</c:forEach>
//=====================================================================================================
	
function calculateParticipationFrequencies(respondents) {
    let frequencies = { yes: 0, no: 0 };

    respondents.forEach(function(respondent) {
        if(respondent.respondents === 'yes') {
            frequencies.yes += 1;
        } else if(respondent.respondents === 'no') {
            frequencies.no += 1;
        }
    });

    return frequencies;
}

var frequencies = calculateParticipationFrequencies(respondents);
createParticipationChart(frequencies);

function createParticipationChart(frequencies) {
    var ctx = document.getElementById('pieChartRespondents').getContext('2d');
    var participationChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Yes', 'No'],
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
                        return percentage + "%";
                    }
                }
            }
        },
        plugins: [ChartDataLabels]
    });
}



	
// 집계 함수
function aggregateData(results, field) {
    return results.reduce(function (acc, result) {
        var key = result[field];
        acc[key] = (acc[key] || 0) + 1;
        return acc;
    }, {});
}

//사용자 응답 분석 및 빈도 계산
// 응답 빈도 계산을 위한 함수 수정
function calculateAnswerFrequencies(results, questions) {
    var frequencies = {};

    results.forEach(result => {
        // select_list 파싱 로직 변경
        var answers = parseSelectList(result.select_list); // 수정된 부분
        answers.forEach((answer, index) => {
            if (Array.isArray(answer)) { // 다중 선택 응답 처리
                answer.forEach(subAnswer => {
                    incrementFrequency(frequencies, index + 1, subAnswer);
                });
            } else {
                incrementFrequency(frequencies, index + 1, answer);
            }
        });
    });

    return frequencies;
}

function parseSelectList(selectList) {
    const result = [];
    let temp = '';
    let inBracket = false;
    let bracketContent = '';

    for (let i = 0; i < selectList.length; i++) {
        const char = selectList[i];
        if (char === '[') {
            inBracket = true;
        } else if (char === ']' && inBracket) {
            inBracket = false;
            result.push(bracketContent.split(',').map(item => item.trim()));
            bracketContent = '';
        } else if (char === ',' && !inBracket) {
            if (temp.trim() !== '') result.push(temp.trim());
            temp = '';
        } else {
            if (inBracket) {
                bracketContent += char;
            } else {
                temp += char;
            }
        }
    }
    if (temp.trim() !== '') result.push(temp.trim()); // 마지막 항목 추가
    return result;
}


//빈도 증가 함수
function incrementFrequency(frequencies, questionNumber, answer) {
    frequencies[questionNumber] = frequencies[questionNumber] || {};
    frequencies[questionNumber][answer] = (frequencies[questionNumber][answer] || 0) + 1;
}

// 답변 빈도 계산
var answerFrequencies = calculateAnswerFrequencies(results);

// 파이 차트 데이터 생성
function createPieChartData(frequencies, questionNumber , question) {
    var data = Object.values(frequencies);
    var choicesArray = question.Choices.split('#');
    var labels = choicesArray;

    return {
        labels: labels,
        datasets: [{
        	label: 'Data for ' + question.name,
            data: data,
            backgroundColor: [
            	'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
            	'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    };
}

//차트 생성 로직은 기본적으로 유지되나, 각 문항의 select_type에 따라 차트를 생성할지 말지 결정
function createPieCharts(answerFrequencies, questions) {
    questions.forEach((question, index) => {
        if (question.select_type !== '3') { // 답변형(텍스트) 문항 제외
            var questionNumber = index + 1;
            if (answerFrequencies[questionNumber]) {
                var chartData = createPieChartData(answerFrequencies[questionNumber], questionNumber , question);
                var canvasId = 'questionChart_' + questionNumber;
                var ctx = document.getElementById(canvasId).getContext('2d');
                new Chart(ctx, {
                    type: 'pie',
                    data: chartData,
                    options: {
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
			                            text: canvasId
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
                			},
                	plugins: [ChartDataLabels]
                });
            }
        }
    });
}

// 차트 생성
createPieCharts(answerFrequencies, questions);


$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(6).css({
	    backgroundColor: "#fff"
	});
});

</script>
</body>
</html>
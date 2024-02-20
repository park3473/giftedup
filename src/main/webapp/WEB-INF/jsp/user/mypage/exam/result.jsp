<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
</head>

<style>
    #new_sub_hd .title > p:first-of-type {
        display: none;
    }
    .tabs .tab-contents ul li{
    	white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: block;
    }
    .select_check{color:#ff0000;font-weight:bold}
</style>


<body>
     <a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		 <div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="../../include/menu.jsp" %>

    <!-- 본문 -->
    
     <div class="content">
    <div class="sub_cont_wrap">
    
     <!-- 타이틀 -->
        <div class="font_noto all_tit_30">설문조사</div>
        <div class="t_pad_15">
			<span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
			<span class="all_sort">마이페이지<i class="las la-angle-right"></i><b class="blue_01">설문 조사</b></span>
		</div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->
			    <section id="new_sub" class="sub_wrap">
			        <div id="new_sub_area" class="sub_area">
			            <div id="new_sub_con" class="sub_con">
			                <div class="sub_size">
			                    <nav class="sub_min_size" id="mento_member_insert">
			                        <div class="sub_page_wrap">
			                            <div class="sub_page">
			                                <div class="list_wrap">
			                                    <div class="title">
			                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
			                                        <p>${model.view.name }</p>
			                                    </div>
			                                    <!-- 멘토 지원서 -->
			                                    
			                                    <form action="" method="POST" name="member_re_mento_insert_form" id="mento_insertform" style="display:block" autocomplete="off">
			                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
			                                    <input type="hidden" name="exam_idx" value="${model.view.idx }">
			                                   	<div id="respondents" class="member_input_wrap">
			                                        <!-- 학생 view페이지 -->
			                                        <ul class="member_input nanumgothic">
			                                        	<c:forEach var="item" items="${model.question}" varStatus="status">
			                                        		<li class="pd-lr-10" id="question_list_li">
			                                        			<p>${item.name}</p>
			                                        			<c:choose>
			                                        				<c:when test="${item.select_type == '1' }">
			                                        					<ul class="list_ob list_ob_01">
			                                        						<li style="border : 0;" data-question="${status.index }">
				                                        						<ol>
				                                        						<c:forEach var="choice" items="${fn:split(item.Choices, '#')}" varStatus="choice_status">
								                                                    <li data="${choice }">${choice}</li>
							                                                    </c:forEach>
							                                                    </ol>
						                                                   </li>
						                                                </ul>
			                                        				</c:when>
			                                        				<c:when test="${item.select_type == '2' }">
			                                        					<ul class="list_ob list_ob_01">
			                                        						<li style="border : 0;" data-question="${status.index }">
				                                        						<ol>
				                                        						<c:forEach var="choice" items="${fn:split(item.Choices, '#')}" varStatus="choice_status" >
								                                                    <li data="${choice }">${choice}</li>
							                                                    </c:forEach>
							                                                    </ol>
						                                                    </li>
						                                                </ul>
			                                        				</c:when>
			                                        				<c:when test="${item.select_type == '3' }">
			                                        					<ul class="list_ob list_ob_01">
			                                        						<li style="border : 0;" data-question="${status.index }">
			                                        							
			                                        						</li>
						                                                </ul>
			                                        				</c:when>
			                                        			</c:choose>
			                                        		</li>
			                                        	</c:forEach>                                
			                                        </ul>
			                                    </div>
			                                    </form>
			                                </div>
			                            </div>
			                        </div>
			                    </nav>
			                </div>
			            </div>
			        </div>
			    </section>
 
  <%@ include file="../../include/footerJs.jsp" %> 


    </div>
</div>
    <%@ include file="../../include/right.jsp"%>
    
    <!-- 하단 -->
		<div class="footer">
			<div class="container">
				<div class="link">
					<span><a href="">센터소개</a></span><span class="gab">ㅣ</span> <span><a
						href="">이용약관</a></span><span class="gab">ㅣ</span> <span><a href="">개인정보처리방침</a></span><span
						class="gab">ㅣ</span> <span><a href="">이메일무단수집거부</a></span>
				</div>
				<div class="all_copy">
					<span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트
						과학영재교육연구원(34051)</span><span class="gab">ㅣ</span> <span>TEL :
						042-350-6227</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-6224</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
    
</body>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
<script type="text/javascript">


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
		[
			 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
			 '${choice}',
			 </c:forEach>
			 ]
		));
</c:forEach>
//=====================================================================================================

$(document).ready(function() {
	
	const select_list = '${model.view.select_list}';
	console.log(select_list);
	//먼저, 대괄호 안의 내용을 단일 항목으로 처리하기 위한 준비 작업
	//대괄호 안의 내용을 임시로 대체할 유니크한 문자열 생성
	const tempString = select_list.replace(/\[(.*?)\]/g, (match) => {
	 // 대괄호 안의 콤마를 제거하지 않고, 대괄호를 유지
	 return match.replace(/,/g, "，"); // 콤마 대신 유니크한 구분자(예: 전각 콤마) 사용
	});

	//이제 쉼표로 분할하여 각 항목 처리
	const selects = tempString.split(',').map(item => {
	 // 대체했던 유니크한 구분자를 다시 콤마로 변경
	 return item.replace(/，/g, ",");
	});
	
    // questions 배열과 select 배열을 반복 처리
    for(var i = 0; i < questions.length; i++){
        var question = questions[i];
        var selectType = question.select_type;
        var selectedChoice = selects[i];

        // selectType에 따라 다른 동작 수행
        switch(selectType){
            case '1':
            	$('#question_list_li ol li[data="'+questions[i].Choices[parseInt(selectedChoice)-1]+'"]').addClass('select_check');
                break;
            case '2':
                // 다중 선택 처리
                // 대괄호를 제거하고 쉼표로 분할하여 배열 생성
                var choicesArray = selectedChoice.replace(/[\[\]]/g, '').split(',');
                // 배열 내의 각 선택지에 대해 반복
                choicesArray.forEach(choice => {
                    // 해당 선택지에 select_check 클래스 추가
                	$('#question_list_li ol li[data="'+questions[i].Choices[parseInt(choice)-1]+'"]').addClass('select_check');
                });
                break;

            case '3':
                // 답변형인 경우, 해당 data-question 값을 가진 li에 값을 삽입
                var answer = selectedChoice; // 이 경우, selectedChoice는 사용자의 텍스트 답변을 나타냄
                $('li[data-question="'+i+'"]').text(answer); // data-question 값으로 해당하는 li 요소 찾아 텍스트 삽입
                break;
        }
    }
});

//=====================================================================================================
	
</script>

</html>
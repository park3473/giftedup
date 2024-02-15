<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
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
</style>


<body>
     <a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		 <div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="../include/menu.jsp" %>

    <!-- 본문 -->
    
     <div class="content">
    <div class="sub_cont_wrap">
    
     <!-- 타이틀 -->
        <div class="font_noto all_tit_30">설문조사</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트 설문조사.</span>
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
                                    <input type="hidden" name="complete" value="1">
                                    <input type="hidden" name="member_id" value="${ssion_user_id }">
                                    <input type="hidden" name="name" value="${ssion_name }">
                                   	<div id="respondents" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                        	<c:forEach var="item" items="${model.questionlist}" varStatus="status">
                                        		<li class="pd-lr-10">
                                        			<p>${item.name}</p>
                                        			<c:choose>
                                        				<c:when test="${item.select_type == '1' }">
                                        					<ul class="list_ob list_ob_01">
                                        						<c:forEach var="choice" items="${fn:split(item.Choices, '#')}" varStatus="choice_status">
				                                                    <input type="radio" value="${choice_status.index + 1}" name="${status.index + 1}" ><span>${choice}</span>
			                                                    </c:forEach>
			                                                </ul>
                                        				</c:when>
                                        				<c:when test="${item.select_type == '2' }">
                                        					<ul class="list_ob list_ob_01">
                                        						<c:forEach var="choice" items="${fn:split(item.Choices, '#')}" varStatus="choice_status" >
				                                                    <input type="checkbox" value="${choice_status.index + 1}" name="${status.index + 1}"><span>${choice}</span>
			                                                    </c:forEach>
			                                                </ul>
                                        				</c:when>
                                        				<c:when test="${item.select_type == '3' }">
                                        					<ul class="list_ob list_ob_01">
                                        						<input type="text" value="" name="${status.index + 1 }"  />
			                                                </ul>
                                        				</c:when>
                                        			</c:choose>
                                        		</li>
                                        	</c:forEach>                                
                                        </ul>
                                    </div>
                                    </form>                                    
                                    <div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="stat_update" href="#" onclick="respondents()">설문 제출</a>
                                  		</div>
                                  	</div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
 
  <%@ include file="../include/footerJs.jsp" %> 


    </div>
</div>
    <%@ include file="../include/right.jsp"%>
    
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
function respondents(){
	
	var result = confirm('해당 설문을 제출하시겠습니까?');
	 if(!result){
		 return;
	 }
	
    var select_list = collectSurveyResponses();
    
    console.log(select_list);
    
    if(!validateSurveyResponses()){
    	
    	alert('설문을 모두 완료해주세요.');
    	return;	
    }
    
    var exam_idx = $('[name=exam_idx]').val();
    var complete = $('[name=complete]').val();
    var member_id = $('[name=member_id]').val();
    var name = $('[name=name]').val();
    
    $.ajax({
    	url : '/user/exam/result/insert.do',
    	type : 'POST',
    	data : ({
    		exam_idx : exam_idx,
    		complete : complete,
    		member_id : member_id,
    		name : name,
    		select_list : select_list
    		
    	}),
    	success : function(xhr , status , success){
    		console.log('success');
    		alert('제출이 완료되었습니다.');
    		location.href='/index.do';
    	},
    	error : function(status , error){
    		console.log('error');
    	}
    })
    
	
}

function collectSurveyResponses() {
    var responses = [];

    $('.member_input > li').each(function() {
        var $inputs = $(this).find('input');
        if ($inputs.length > 0) {
            // 텍스트 입력 처리
            if ($inputs.first().attr('type') === 'text') {
                responses.push($inputs.first().val());
            }
            // 체크박스 (다중 선택 가능) 처리
            else if ($inputs.first().attr('type') === 'checkbox') {
                var checkedValues = $inputs.filter(':checked').map(function() { return this.value; }).get();
                responses.push('[' + checkedValues.join(',') + ']');
            }
            // 라디오 버튼 (단일 선택) 처리
            else if ($inputs.first().attr('type') === 'radio') {
                var selectedValue = $inputs.filter(':checked').val();
                responses.push(selectedValue || ''); // 선택된 것이 없으면 빈 문자열 추가
            }
        }
    });

    // 최종 결과 문자열 반환
    return responses.join(',');
}

function validateSurveyResponses() {
    var isValid = true; // 초기 상태는 모든 것이 유효하다고 가정

    $('.member_input > li').each(function() {
        var $inputs = $(this).find('input');
        // 텍스트 입력 검증
        if ($inputs.length > 0 && $inputs.first().attr('type') === 'text') {
            if ($inputs.first().val().trim() === '') {
                isValid = false; // 빈 텍스트 입력 발견
            }
        }
        // 체크박스 검증
        else if ($inputs.length > 0 && $inputs.first().attr('type') === 'checkbox') {
            if ($inputs.filter(':checked').length === 0) {
                isValid = false; // 선택된 체크박스가 없음
            }
        }
        // 라디오 버튼 검증
        else if ($inputs.length > 0 && $inputs.first().attr('type') === 'radio') {
            var name = $inputs.first().attr('name');
            if ($('input[type="radio"][name="'+name+'"]:checked').length === 0) {
                isValid = false; // 선택된 라디오 버튼이 없음
            }
        }
    });

    return isValid;
}


</script>

</html>
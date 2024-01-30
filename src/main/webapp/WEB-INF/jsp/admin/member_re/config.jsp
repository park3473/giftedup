 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/admin/member_re_list.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/resources/css/admin/jquery.datetimepicker.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
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
                    <!-- 해당 년도 데이터 없을시 -->
                    <c:if test="${model.count == 0}">
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>신입생 선발 관리</span>
                            </div>
							<div class="member_re_01_wrap">
                                <div class="member_input_wrap">
                                <form id="member_config_insert_form" name="member_config_insert_form" action="${pageContext.request.contextPath }/admin/member_re/config.do" method="POST">
                                   <ul class="member_input">
                                   		<li>
                                        	<span class="list_t">년도</span>
                                            <input class="input_size" type="text" readonly id="YEAR" name="YEAR" value="<%=NowYear%>">
                                        </li>
                                       	<li>
                                        	<span class="list_t">주제</span>
                                            <input class="input_size" type="text" id="TITLE" name="TITLE" readonly value="신입생선발">
                                        </li>
                                        <li>
                                        	<span class="list_t">신입생 신청 기간</span>
                                            <input class="input_size datecalendar" type="text" name="type_1_start_tm" id="type_1_start_tm" readonly>
                                            <span>~</span>
                                            <input class="input_size datecalendar" type="text" name="type_1_end_tm" id="type_1_end_tm" readonly>
                                        </li>
                                        <li>
                                        	<span class="list_t">신입생 서류 제출 기간</span>
                                            <input class="input_size datecalendar" type="text" name="type_2_start_tm" id="type_2_start_tm" readonly>
                                            <span>~</span>
                                            <input class="input_size datecalendar" type="text" name="type_2_end_tm" id="type_2_end_tm" readonly>
                                        </li>
                                   </ul>
                                   </form>
                                </div>
                            </div>
                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:insertConfig()">등록하기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                        </div>
                    </section>
                    </c:if>
                    <!--  해당 년도 데이터 있을시 -->
                    <c:if test="${model.count > 0}">
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>신입생 선발 관리</span>
                            </div>
							
                            <div class="member_re_01_wrap">
                                <div class="member_input_wrap">
                                <form id="member_config_insert_form" name="member_config_insert_form" action="${pageContext.request.contextPath }/admin/member_re/config.do" method="POST">
                                   <ul class="member_input">
                                   		<li>
                                        	<span class="list_t">년도</span>
                                            <input class="input_size" type="text" readonly id="YEAR" name="YEAR" value="${model.view1.YEAR }">
                                        </li>
                                       	<li>
                                        	<span class="list_t">주제</span>
                                            <input class="input_size" type="text" id="TITLE" name="TITLE" readonly value="${model.view1.TITLE }">
                                        </li>
                                        <li>
                                        	<span class="list_t">상태</span>
                                        	<c:if test="${model.view1.STATUS != 'TRUE' }">
                                        		<input type="text" readonly value="중지">
                                        	</c:if>
                                        	<c:if test="${model.view1.STATUS == 'TRUE' }">
                                        		<input type="text" readonly value="작동">
                                        	</c:if>
                                        </li>
                                        <li>
                                        	<span class="list_t">신입생 신청 기간</span>
                                            <input class="input_size datecalendar" type="text" name="type_1_start_tm" id="type_1_start_tm" value="${model.view1.START_TM.substring(0,11) }" readonly>
                                            <span>~</span>
                                            <input class="input_size datecalendar" type="text" name="type_1_end_tm" id="type_1_end_tm" value="${model.view1.END_TM.substring(0,11) }" readonly>
                                        </li>
                                        <li>
                                        	<span class="list_t">신입생 서류 제출 기간</span>
                                            <input class="input_size datecalendar" type="text" name="type_2_start_tm" id="type_2_start_tm" value="${model.view2.START_TM.substring(0,11) }" readonly>
                                            <span>~</span>
                                            <input class="input_size datecalendar" type="text" name="type_2_end_tm" id="type_2_end_tm" value="${model.view2.END_TM.substring(0,11) }" readonly>
                                        </li>
                                   </ul>
                                   </form>
                                </div>
                            </div>
                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:MemberReConfigUpdate()">수정하기</a>
                                    <c:if test="${model.view1.STATUS == 'TRUE' }">
                                    	<a class="bd_storage_w_btn" href="javascript:MemberReConfigStat('FALSE')">중지하기</a>
                                    </c:if>
                                    <c:if test="${model.view1.STATUS != 'TRUE' }">
                                    	<a class="bd_storage_w_btn" href="javascript:MemberReConfigStat('TRUE')">작동하기</a>
                                    </c:if>
                                    <a class="bd_storage_w_btn" href="javascript:DelMemberReConfig()">삭제하기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                        </div>
                    </section>
                    </c:if>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body></html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<script language="JavaScript">
$(function() {
	$.datetimepicker.setLocale('ko');
    jQuery('.datecalendar').datetimepicker({
        format: 'Y-m-d',
        lang: "ko",
        timepicker: false
    });
        
    for(i = 1; i < 3; i++){
    	console.log(i);
    	$('#type_'+i+'_start_tm').val($('#type_'+i+'_start_tm').val());
    	$('#type_'+i+'_end_tm').val($('#type_'+i+'_end_tm').val());
    }
    
    
});
</script>
<script type="text/javascript">
	
	//신입생 선발 설정 등록
	function insertConfig(){
		
		if($('#type_1_start_tm').val() == ''){
			alert('신청 시작 날짜를 작성하여 주세요.');
			return;
		}
		if($('#type_1_end_tm').val() == ''){
			alert('신청 종료 날짜를 작성하여 주세요.');
			return;
		}
		if($('#type_2_start_tm').val() == ''){
			alert('제출 시작 날짜를 작성하여 주세요.');
			return;
		}
		if($('#type_2_end_tm').val() == ''){
			alert('제출 종료 날짜를 작성하여 주세요.');
			return;
		}
		
		
		for(i=1 ; i < 3 ; i++){
			var START_TM = $('#type_'+i+'_start_tm').val();
			var END_TM = $('#type_'+i+'_end_tm').val();
			
			if(CheckConfigTM(START_TM,END_TM)){
				
				console.log('true');
				
			}else{
				
				console.log('false');
				if(i == 1){
				
					alert('신청 기간을 다시한번 확인해주세요.');
					
				}else if(i == 2){
					
					alert('제출 기간을 다시한번 확인해주세요.');
					
				}
				return;
				
			}
			
		}
		
		$('#member_config_insert_form').submit();
		
	}
	
	//신입생 선발 설정 수정
	function MemberReConfigUpdate(){
		
		for(i=1 ; i < 3 ; i++){
			
			var START_TM = $('#type_'+i+'_start_tm').val();
			var END_TM = $('#type_'+i+'_end_tm').val();
			var TYPE = i;
			var TITLE = '신입생선발';
			var YEAR = $('#YEAR').val();
	
			if(CheckConfigTM(START_TM,END_TM)){
				
				console.log('true');
				
			}else{
				
				console.log('false');
				if(i == 1){
				
					alert('신청 기간을 다시한번 확인해주세요.');
					
				}else if(i == 2){
					
					alert('제출 기간을 다시한번 확인해주세요.');
					
				}
				return;
				
			}
			
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/admin/member_re/ConfigUpdate.do',
				cache : false,
				data : ({
					TITLE : TITLE ,
					YEAR : YEAR ,
					START_TM : START_TM ,
					END_TM : END_TM ,
					TYPE : TYPE
				}),
				success : function(data , status){
					
				},
				error : function(xhr , status){
					
				}
			})
			
		}
		
		alert('수정 완료');
		
		location.reload();
		
	}
	
	//신입생 선발 설정 상태 변경
	function MemberReConfigStat(STAT){
		
		var YEAR = $('#YEAR').val();
		var STATUS = STAT;
		var TITLE = $('#TITLE').val();
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/admin/member_re/ConfigStat.do',
			cache : false,
			data : ({
				YEAR : YEAR,
				STATUS : STATUS,
				TITLE : TITLE
			}),
			success : function(data , status){
				if(STAT == 'TRUE'){
					alert('작동 성공');
					
					location.reload();
				}else if(STAT == 'FLASE'){
					alert('중지 성공');

					location.reload();
				}
			},
			error : function(xhr , status){
				alert('오류');
			}
			
		})
		
		
	}
	
	//신입생 선발 설정 삭제
	function DelMemberReConfig(){
		
		var result = confirm('정말 현 선발 일정을 삭제하시겠습니까?');
		
		if(result){
			
			var YEAR = $('#YEAR').val();
			
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/admin/member_re/ConfigDel.do',
				data : ({
					YEAR : YEAR
				}),
				cache : false,
				success : function(result , status){
					
					alert('설정이 삭제되었습니다.');
					location.reload();
					
				},
				error : function(xhr , status){
					
				}
			})
			
		}
		
	}
	
	//신입생 선발 설정 시간 체크
	function CheckConfigTM(START_TM , END_TM){
		
		var date1 = new Date(START_TM);
		
		var date2 = new Date(END_TM);
		
		if(date1 < date2){
			
			return true;
			
		}else{
			
			return false;
			
		}
		
	}
</script>
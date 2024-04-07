<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<!-- polyfiller file to detect and load polyfills -->
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
<script>
  webshims.setOptions('waitReady', false);
  webshims.setOptions('forms-ext', {types: 'date'});
  webshims.polyfill('forms forms-ext');
</script>
</head>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>

<style>
.tabs .tab-contents ul li {
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
		<%@ include file="../../include/menu.jsp"%>

		<!-- 본문 -->
		<div class="content">
			<div class="sub_cont_wrap">

				<!-- 타이틀 -->
				<div class="font_noto all_tit_30">기본정보수정</div>
				<div class="t_pad_15">
					<span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여
						맞춤형 교육을 지원합니다.</span> <span class="all_sort">마이페이지<i
						class="las la-angle-right"></i><b class="blue_01">기본정보수정</b></span>
				</div>
				<div class="line_gab_15"></div>
				<!-- 타이틀끝 -->

				<section id="new_sub" class="sub_wrap">
					<div id="new_sub_area" class="sub_area">
						<div id="new_sub_con" class="sub_con">
							<div class="sub_size">
								<div class="" id="test_haha">
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>${model.userMemberPageDomain.YEAR }커뮤니케이터 - 강좌 상세정보</p>
                                </div>
                                <div class="member_input_wrap" id="member_input_wrap">
                                    <form action="/user/mypage/communicator/insert.do" method="post" name="insertform" id="insertform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="COMM_MENTO" id="COMM_MENTO" value="${model.View.COMM_MENTO }" readonly="readonly">
                                        <input type="hidden" name="COMM_SCHOOL_NAME" value="${model.View.COMM_SCHOOL_NAME }" readonly="readonly">  
                                        <input type="hidden" name="COMM_TIME" id="COMM_TIME" value="${model.View.COMM_TIME }" readonly="readonly">         
                                        <!-- insert 페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">교사 명</span>
                                                <input class="input_size mr" type="text" name="COMM_MENTO_NAME" id="COMM_MENTO_NAME" value="${model.View.COMM_MENTO_NAME}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강좌 명<b class="relate_c">＊</b></span>
                                                <input class="input_size mr" type="text" name="COMM_NAME" id="COMM_NAME" value="${model.View.COMM_NAME }" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 인원<b class="relate_c">＊</b></span>
                                                <input class="input_size mr" type="text" name="COMM_PERSONNEL" id="COMM_PERSONNEL" value="${model.View.COMM_PERSONNEL }" readonly="readonly">
                                                <span class="list_t">현재 참여 인원</span>
                                                <input class="input_size_mr check_personnel" COMM_IDX="${model.View.COMM_IDX }" type="text" name="COMM_PERSONNEL_Cnt" id="COMM_PERSONNEL_Cnt" value="${model.PERSONNELCnt }" readonly="readonly">
                                                <c:if test="${ssion_member_type == '2' }">
                                                <input type="button"  id="COMM_PERSONNEL_CHECK" COMM_IDX="${model.View.COMM_IDX }" value="참여 학생 확인" style="width:7rem">
                                            	</c:if>
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">웨일ON 회의실 방 번호</span>
                                                <input class="input_size mr" type="text" name="COMM_ON_ID" id="COMM_ON_ID" value="${model.View.COMM_ON_ID }">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">웨일ON 회의실 비밀번호</span>
                                                <input class="input_size mr" type="text" name="COMM_ON_PW" id="COMM_ON_PW" value="${model.View.COMM_ON_PW }">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 시간<b class="relate_c">＊</b></span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_START_TM" id="COMM_START_TM" value="${fn:substring(model.View.COMM_START_TM,0,16)}"  readonly="readonly">
                                                <input type="hidden" id="hi_start" value="${model.View.COMM_START_TM }">
                                                <span> ~ </span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_END_TM" id="COMM_END_TM" value="${fn:substring(model.View.COMM_END_TM,0,16)}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강사 이메일</span>
                                                <input class="input_size mr" type="text" name="COMM_EMAIL" id="COMM_EMAIL" value="${model.View.COMM_EMAIL}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강사 지역</span>
                                                <input class="input_size mr" type="text" name="COMM_LOCAL" id="COMM_LOCAL" value="${model.View.COMM_LOCAL}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 분야</span>
                                                <input class="input_size mr" type="text" name="COMM_TYPE" id="COMM_TYPE" value="${model.View.COMM_TYPE}" readonly="readonly">                                            
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">대상학년<b class="relate_c">＊</b></span>
                                                	<table class="list_t_table">
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="4"onclick="return false;"><span>초등학교 4학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="5" onclick="return false;"><span>초등학교 5학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="6" onclick="return false;"><span>초등학교 6학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="7" onclick="return false;"><span>중학교 1학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="8" onclick="return false;"><span>중학교 2학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="9" onclick="return false;"><span>중학교 3학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="10" onclick="return false;"><span>고등학교 1학년</span></td>
                                                		</tr>
                                                	</table>
                                                	<input type="hidden" name="COMM_SCHOOL_YEAR" id="COMM_SCHOOL_YEAR" value="${model.View.COMM_SCHOOL_YEAR }">
                                            </li>
                                            <!-- 
                                            <li class="pd-lr-10" id="supplie">
                                                <span class="list_t">준비물</span>
                                                <c:if test="${ssion_member_type == '1'}">
                                            	</c:if>
                                                <ul id="ul_supplies">
                                                	<c:forEach var="item" items="${model.Suplist}" varStatus="status">
													<li id="supplies_id" style="margin-left: 195px;">
														<table id="supplies_table">
															<tr>
																<td colspan="2"><span style="margin-right: 4px;" class="table_span">이름</span>
																	<input style="width: 500px;" class="input_size mr COMM_SUPPLIES" type="text" name="SUP_NAME" id="SUP_NAME_${status.index }" value="${item.SUP_NAME }" readonly="readonly">
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<span style="margin-right: 4px;" class="table_span">구매처</span>
																	<input style="width: 500px;" class="input_size mr COMM_SUPPLIES" type="text" name="SUP_LINK" id="SUP_LINK_${status.index }" value="${item.SUP_LINK}" onclick="window.open('about:blank').location.href='${item.SUP_LINK}'" readonly="readonly">
																</td>
															</tr>
															<tr>
																<td><span style="margin-right: 4px;"
																	class="table_span">갯수</span>
																	<input class="input_size mr COMM_SUPPLIES" type="text" name="COMM_AMOUNT" id="SUP_AMOUNT_${status.index }" value="${item.SUP_AMOUNT }" readonly="readonly">
																</td>
																<td>
																	<span class="table_span">단가</span>
																	<input class="input_size mr COMM_SUPPLIES" type="text" name="SUP_PRICE" id="SUP_PRICE_${status.index }" value="${item.SUP_PRICE } 원" readonly="readonly">
																</td>
															</tr>
														</table>
													</li>
													</c:forEach>
												</ul>
                                            </li>
                                            -->
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 자료</span>
                                                <c:if test="${model.View.COMM_FILE != ''}">
                                                <a class="pro_file_btn" href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/communicator/${model.View.COMM_FILE}">
                                                  다운로드
                                                </a>
                                                </c:if>
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom:10px;">
                                                <span class="list_t">강의 개요<b class="relate_c">＊</b></span>
                                                <div id="COMM_SUMMARY" name="COMM_SUMMARY" placeholder="DHTML로 제작해주세요." readonly="readonly">${model.View.COMM_SUMMARY }</div>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <c:if test="${ssion_user_id == model.View.COMM_MENTO }">
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                    	<c:if test="${model.View.COMM_STAT == '0'}">
                                        <a class="delete" href="javascript:update();">수정</a>
                                        <a class="cancel" href="javascript:comm_delete();">삭제</a>
                                        <a class="stat_update" href="javascript:comm_apply_start()">접수 시작</a>
                                    	</c:if>
                                        <c:if test="${model.View.COMM_STAT == '1' }">
                                        <a class="stat_update" href="javascript:comm_apply_end()">접수 마감</a>
                                        <a class="cancel" href="javascript:comm_close();">강의 폐쇄</a>
                                        </c:if>
                                        <c:if test="${model.View.COMM_STAT == '2' }">
                                        <a class="stat_update" href="javascript:comm_preparation()">강의 준비</a>
                                        </c:if>
                                        <c:if test="${model.View.COMM_STAT == '3' }">
                                        <a class="stat_update" href="javascript:comm_start()">강의 시작</a>
                                        </c:if>
                                        <c:if test="${model.View.COMM_STAT == '4' }">
                                        <a class="stat_update" href="javascript:comm_end()">강의 완료</a>
                                        </c:if>
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${ssion_member_type == '1' }">
                                <c:if test="${model.View.COMM_STAT == '1'}">
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                        <a class="stat_update" href="javascript:student_delete();">신청 취소</a>
                                    </div>
                                </div>    
                                </c:if>
                                <c:if test="${model.View.COMM_STAT == '5' }">
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                        <a class="delete" href="javascript:PrintDiv($('#member_input_wrap'));">포트폴리오 작성</a>
                                    </div>
                                </div>
                                </c:if>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                    <c:if test="${ssion_member_type == '2' }">
                    <c:if test="${model.View.COMM_STAT == '5' }">
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>${model.userMemberPageDomain.YEAR }커뮤니케이터 - 강의 평가</p>
                                </div>
                                <div class="member_input_wrap">
                                    <form action="#" method="post" name="studentform" id="studentform" >     
                                        <!-- student 평가 페이지 -->
                                    </form>
                                </div>
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                    	<a class="cancle" href="javascript:test_pdf();">pdf 출력</a>
                                        <a class="delete" href="javascript:eval_update();">강의 평가 저장</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                    </c:if>
                    </c:if>
                    </div>
							</div>
						</div>
					</div>
				</section>



			</div>
		</div>
		<!-- 본문 끝 -->
		
		<!-- 삭제 modal -->
   <div class="danger_modal_area comm_delete">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>정말 현 강의를<span>삭제</span>하시겠습니까?.</h2>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.danger_modal_area').css('display','none');$('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a id="delete_button"onclick="location.href='${pageContext.request.contextPath}/user/mypage/communicator/delete.do?COMM_IDX=${model.View.COMM_IDX}'">예</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- zoom id 선택 모달 -->
     <div class="danger_modal_area zoom_id_check">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>사용가능한 ZOOM ID LIST.</h2>
                <!-- zoom id list -->
                <div id="zoom_list">
                
                </div>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.danger_modal_area').css('display','none');$('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a id="delete_button"onclick="javascript:comm_apply_end()">선택한 ZOOM ID 사용</a>
                </li>
            </ul>
        </div>
    </div>
	<!-- 신청한 학생 리스트 -->
    <div class="danger_modal_area student_check">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>현재 신청한 학생 리스트.</h2>
                <!-- student id list -->
                <div id="student_list">
                
                </div>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.student_check').css('display','none');$('.danger_bg').hide();">닫기</a>
                </li>
            </ul>
        </div>
    </div>
    
    
   <%--  
    22년도 학생 = 선착순 으로 설정
    <!-- 학생 수락 모달 학생 리스트 -->
    <div class="danger_modal_area student_accept">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>현재 신청한 학생 리스트.</h2>
                <!-- student id list -->
                <div id="student_accept_list">
                	
                </div>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="comm_zoom_check()">ZOOM 선택하러가기</a>
                </li>
                <li class="danger_btn_02">
                    <a onclick="$('.student_accept').css('display','none');$('.danger_bg').hide();">닫기</a>
                </li>
            </ul>
        </div>
    </div>
     --%>
            
    <div class="danger_bg"></div>
		

		<!-- 오른쪽 시작 -->
		<%@ include file="../../include/right.jsp"%>
		<!--  오른쪽 끝 -->
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
						042-350-6223</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-8660</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
	</div>
	<!--본문 end-->
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

<script type="text/javascript">
    
	//이미지(png)로 다운로드
	//pdf 출력
	function PrintDiv(div){
		div = div[0]
		html2canvas(div).then(function(canvas){
			var myImage = canvas.toDataURL();
			/*
			파일 저장 코드
			 var decoding = atob(myImage.split(',')[1]);
			let array = [];
			for(var i = 0; i < decoding.length; i ++){
				array.push(decoding.charCodeAt(i));
			}
			const new Blob([new Uint8Array(array)] , {type: 'image/png'});
			const fileName = 'canvas_img_'+new Date().getMilliseconds()+'.png';
			
			let formData = new FormData();
			formData.append('file',file,fileName);
			for(var gg of formData.values()){
		    console.log(gg);
			}
			*/
			
			//포트폴리오 페이지 전부 열린후 데이터값 보내기
			setTimeout(function(){
				popup.CKEDITOR.instances.EVALUATION.setData('<img src="'+myImage+'">');
			}, 2000);
			
			//포트폴리오 이동코드
			popup = window.open("/user/portfolio/detail/${ssion_user_id}/insert.do?YEAR=2022");
		
		});
	}
    
	
	//pdf test
	function test_pdf(){
		div = $('#test_haha')
	}
	
    
	//강의 종료후 평가 목록
	$(document).ready(function() {
	    if(${model.View.COMM_STAT} == '5'){
	    	var COMM_IDX = '${model.View.COMM_IDX}';

			$.ajax({
				type : "POST",
				url : "./studentlist.do?",
				cache : false,
				data : ({
					COMM_IDX : COMM_IDX
				}),
				dataType : "json",
				success : function(data, status, xhr) {
					console.log(data);
					var html = "";
					
					for(i = 0; i < data.length; i ++){
						html += "<ul class='member_input nanumgothic eval_input' id='member_eval_input_"+i+"'>";
						html += "<input type='hidden' id='STU_IDX_"+i+"' class='STU_IDX_"+i+"' value="+data[i].STU_IDX+" >"
						html += "<li class='pd-lr-10'>";
						html += "<span class='list_t'>이름</span>";
						html += "<input class='input_size mr' type='text' name='STU_NAME' id='STU_NAME_"+i+"' value="+data[i].STU_NAME+" readonly='readonly'>";
						html += "</li>";
						html += "<li class='pd-lr-10'>";
						html += "<span class='list_t'>평가</span>";
						html += "<input style='width:50rem' class='input_size mr' type='text' name='STU_EVAL' id='STU_EVAL_"+i+"' value='";
						if(data[i].STU_EVAL != ''){
							html += data[i].STU_EVAL	
						}
						html += "'>";
						html += "</li>";
						html += "</ul>";
					}
					
					$('#studentform').html(html);
					
				},
				error : function(xhr, status, error) {
					if (xhr.status == 404) {
						alert("오류!!");
					}
				}
			});
	    }
	}); 

    
	//학생 강의 신청 취소
    function student_delete(){
		if(window.confirm('현재 강의 신청을 취소하시겠습니까?')){
			var COMM_IDX = '${model.View.COMM_IDX }';
			var STU_MEMBER_ID = '${ssion_user_id}';
			location.href="${pageContext.request.contextPath}/user/communicator/studentdelete.do?COMM_IDX="+COMM_IDX+"&STU_MEMBER_ID="+STU_MEMBER_ID+"";
		}
	}
    
    //강의 대상 학년 확인 체크
    $(document).ready(function() {
        var school_year = '${model.View.COMM_SCHOOL_YEAR}'
        var array = [];
        array = school_year.split('_');
        for(i = 0; i < array.length; i++){
           $('input[name="COMM_SCHOOL_YEAR_CHECK"]:input[value="'+array[i]+'"]').attr('checked','checked');
        }
    });
    
    //강의 접수 시작
    function comm_apply_start(){
    	if(confirm('정말 접수를 진행하시겠습니까?\n강의 접수를 시작시 더이상 수정및 삭제가 불가능합니다.')){
    		location.href = '${pageContext.request.contextPath}/user/mypage/communicator/CommApplyStart.do?COMM_IDX=${model.View.COMM_IDX}&COMM_STAT=1';
    	}
    }
    
    
    //강의 패쇄
    function comm_close(){
    	if(confirm('현재 강의를 폐쇄 하시겠습니까?\n폐쇄 된 강의는 더이상 복구가 불가능합니다.')){
    		location.href='${pageContext.request.contextPath}/user/mypage/communicator/CommClose.do?COMM_IDX=${model.View.COMM_IDX}';
    	}
    }
    
    
    
   
    /* 22년도 강의 접수  = 선착순 수락 X
    //강의 접수 마감시 학생 수락 버튼 (강의 접수 마감 1)
    function comm_student_check(IDX){
    	var COMM_IDX = IDX;
    	$.ajax({
			type : "POST",
			url : "./studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
                
                var html = "";
				html += "<table id='student_accept_list' class='comm_list_tb' style='width:39rem;'>";
				html += "<thead>";
				html += "<tr>";
				html += "<th>";
				html += "수락 여부";
				html += "</th>";
				html += "<th>";
				html += "학생명";
				html += "</th>";
				html += "<th>";
				html += "학생지역";
				html += "</th>";
				html += "<th>";
				html += "학교명";
				html += "</th>";
				html += "<th>";
				html += "학년";
				html += "</th>";
				html += "<th>";
				html += "학생 번호";
				html += "</th>";
				html += "<th>";
				html += "멘토 번호";
				html += "</th>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				for(i = 0; i < data.length; i++){
					html += "<tr>";
					html += "<td>";
					html += "<input type='checkbox' name='student_accept_box' id='student_accept_box' stu_member_id='"+data[i].STU_MEMBER_ID+"' >"
					html += "</td>";
					html += "<td>";
					html += data[i].STU_NAME;
					html += "</td>";
					html += "<td>";
					html += data[i].ADDRESS_LOCAL;
					html += "</td>";
					html += "<td>";
					html += data[i].STU_SCHOOL_NAME;
					html += "</td>";
					html += "<td>";
					switch(data[i].STU_SCHOOL_YEAR){
					case 4 :
						html += "초등학교4학년";
						break;
					case 5 :
						html += "초등학교5학년";
						break;
					case 6 :
						html += "초등학교6학년";
						break;
					case 7 :
						html += "중학교1학년";
						break;
					case 8 :
						html += "중학교2학년";
						break;
					case 9 :
						html += "중학교3학년";
						break;
					case 10 :
						html += "고등학교1학년";
						break;
					}
					html += "</td>";
					html += "<td>";
					html += data[i].STU_PHONE;
					html += "</td>";
					html += "<td>";
					html += data[i].MENTO_PHONE;
					html += "</td>";
					html += "</tr>";
				}
				html += "</tbody>";
				html += "</table>";
				$('#student_accept_list').html(html);
				$('.student_accept').css('display','block');
				$('.student_accept').find('.danger_modal_con').css('max-width','800px');
		        $('.danger_bg').show();
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
    	
    } */
    
    //강의 zoom id 선택 (강의 접수 마감 1)
	function comm_zoom_check(){
		
    	
    	/* 22년도 학생 = 선착순 
		var comm_student_length = document.getElementsByName('student_accept_box').length;
		var accept_size = 0;
		
		for(i = 0; i < comm_student_length ; i ++){
			if(document.getElementsByName('student_accept_box')[i].checked == true){
				accept_size += 1;
			}
		}
		
		var personnel = ${model.View.COMM_PERSONNEL };
		
		if(accept_size > personnel){
			alert('수락 인원이 기존 참여가능한 인원보다 많습니다.');
			return;
		}
		
		$('.student_accept').css('display','none');
		 */
		 
		 
		var COMM_START_TM = $('#COMM_START_TM').val();
		COMM_START_TM = COMM_START_TM.substring(0,11);
		COMM_START_TM = COMM_START_TM.replaceAll('-','');
		var COMM_TIME = $('#COMM_TIME').val();
		
		
    	$.ajax({
			type : "POST",
			url : "./ZoomList.do?",
			cache : false,
			data : ({
				ZOOM_DT : COMM_START_TM,
				ZOOM_TYPE : COMM_TIME,
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
				var html = "";
				html += "<table id='zoom_list_tb' class='comm_list_tb'>";
				html += "<thead>";
				html += "<tr>";
				html += "<th>";
				html += "";
				html += "</th>";
				html += "<th>";
				html += "ID";
				html += "</th>";
				html += "<th>";
				html += "EMAIL";
				html += "</th>";
				html += "<th>";
				html += "PW";
				html += "</th>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				for(i = 0; i < data.length; i ++){
					html += "<tr>";
					html += "<td>";
					html += "<input type='radio' value='"+data[i].zoom_ID+"' pw='"+data[i].zoom_MT_PW+"' MT_ID='"+data[i].zoom_MT_ID+"' name='ZOOM_ID'>";
					html += "</td>";
					html += "<td>";
					html += data[i].zoom_ID;
					html += "</td>";
					html += "<td>";
					html += data[i].zoom_EMAIL;
					html += "</td>";
					html += "<td>";
					html += data[i].zoom_PW;
					html += "</td>";
					html += "</tr>";
				}
				html += "</tbody>";
				html += "</table>";
				
				$('#zoom_list').html(html);
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
    	
    	
    	$('.zoom_id_check').css('display','block');
        $('.danger_bg').show();
	}
    
    //강의 접수 마감 (강의 접수 마감 3)
    function comm_apply_end(){
    	
        //var ID = $('input:radio[name=ZOOM_ID]:checked').val();
    	//var MT_PW = $('input:radio[name=ZOOM_ID]:checked').attr('pw');
    	//var MT_ID = $('input:radio[name=ZOOM_ID]:checked').attr('MT_ID');
    	//var ZOOM_MEMBER_ID = $('#COMM_MENTO').val();
    	var COMM_TIME = $('#COMM_TIME').val();
    	var COMM_START_TM = $('#COMM_START_TM').val();
    	var COMM_IDX = '${model.View.COMM_IDX}';
    	
    	//var comm_student_length = document.getElementsByName('student_accept_box').length;
    	/*
		for(i = 0; i < comm_student_length; i++){
			if(document.getElementsByName('student_accept_box')[i].checked == false){
				console.log(document.getElementsByName('student_accept_box')[i]);
				var STU_MEMBER_ID = document.getElementsByName('student_accept_box')[i].getAttribute('stu_member_id');
				$.ajax({
					type : "POST",
					url : "./studentdelete.do?",
					cache : false,
					data : ({
						COMM_IDX : COMM_IDX,
						STU_MEMBER_ID : STU_MEMBER_ID
					}),
					dataType : "json",
					success : function(data, status, xhr) {
						console.log("성공");
					},
					error : function(xhr, status, error) {
						if (xhr.status == 404) {
							alert("오류!!");
						}
					}
				});
			}
		}
    	*/
    	
    	if(confirm('정말 접수를 마감하시겠습니까?\n강의 접수를 마감시 더이상 추가 접수가 불가능합니다.')){
    		location.href = '${pageContext.request.contextPath}/user/mypage/communicator/CommApplyEnd.do?COMM_IDX=${model.View.COMM_IDX}&COMM_STAT=2';
    	}
    	
    }
    
    //강의 준비
    function comm_preparation(){
    	var Stime= new Date($('#hi_start').val());
		Stime.setMinutes(Stime.getMinutes() - 30);
		var Ptime = new Date();
		if(Stime > Ptime){
			alert('강의 준비는 강의 시작 30분 전부터 가능합니다.');
			return;
		}
    	
    	
    	var ID = $('#ZOOM_ID').val();
    	var MT_PW = $('#ZOOM_MT_PW').val();
    	var MT_ID = $('#ZOOM_MT_ID').val();
    	
    	
    	if(confirm('강의 준비를 시작하시겠습니까?\n강의 준비를 시작시 더이상 접수 마감상태로 되돌아갈수 없습니다.')){
    		location.href = '${pageContext.request.contextPath}/user/mypage/communicator/CommPreparation.do?COMM_IDX=${model.View.COMM_IDX}&COMM_STAT=3&COMM_ON_ID='+${model.View.COMM_ON_ID}+'&COMM_ON_PW='+${model.View.COMM_ON_PW}+'';
    	}
    	
    }
    
    //강의 시작
    function comm_start(){
    	
    	var ID = $('#ZOOM_ID').val();
    	//var MT_PW = $('#ZOOM_MT_PW').val();
    	//var MT_ID = $('#ZOOM_MT_ID').val();
    	//var ZOOM_DT = $('#COMM_START_TM').val().substring(0,10).replaceAll('-','');
    	//var ZOOM_TYPE = '${model.View.COMM_TIME}';
    	
    	if(confirm('강의 진행을 시작하시겠습니까?')){
    		location.href = '${pageContext.request.contextPath}/user/mypage/communicator/CommStart.do?COMM_IDX=${model.View.COMM_IDX}&COMM_STAT=4&COMM_ON_ID='+${model.View.COMM_ON_ID}+'&COMM_ON_PW='+${model.View.COMM_ON_PW}+'';
    	}
    	
    }
    
    //강의 종료
    function comm_end(){
    	
    	if(confirm('강의를 종료하시겠습니까?\n강의를 종료시 zoom계정 을 로그아웃 해주시기 바랍니다.')){
    		location.href = '${pageContext.request.contextPath}/user/mypage/communicator/CommEnd.do?COMM_IDX=${model.View.COMM_IDX}&COMM_STAT=5&COMM_MENTO=${model.View.COMM_MENTO}';
    	}
    }
    
    
    //학생 평가 저장
    function eval_update(){
    	var size = $('.eval_input').length;
    	var COMM_IDX = '${model.View.COMM_IDX}';
    	for(i = 0; i < size ; i ++){
    		var STU_IDX = $('#STU_IDX_'+i).val();
    		var STU_EVAL = $('#STU_EVAL_'+i).val();
    		$.ajax({
    			type : "POST",
    			url : "./StudentEvalUpdate.do?",
    			cache : false,
    			data : ({
    				COMM_IDX : COMM_IDX,
    				STU_IDX : STU_IDX,
    				STU_EVAL : STU_EVAL
    			}),
    			dataType : "json",
    			success : function(data, status, xhr) {
    				
    			},
    			error : function(xhr, status, error) {
    				if (xhr.status == 404) {
    					alert("오류!!");
    				}
    			}
    		});
    	}
    	
    	alert('학생 평가가 저장되었습니다.');
		location.href='${pageContext.request.contextPath}/user/mypage/communicator/list.do';
    }
	
    
    //현재 강의 신청한 학생 명단 확인
	$('#COMM_PERSONNEL_CHECK').click(function() {
		
		console.log($(this).attr('comm_idx'));
		var COMM_IDX = $(this).attr('comm_idx');

		$.ajax({
			type : "POST",
			url : "./studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
                
                var html = "";
				html += "<table id='zoom_list_tb' class='comm_list_tb'>";
				html += "<thead>";
				html += "<tr>";
				html += "<th>";
				html += "학생명";
				html += "</th>";
				html += "<th>";
				html += "학생지역";
				html += "</th>";
				html += "<th>";
				html += "학교명";
				html += "</th>";
				html += "<th>";
				html += "학년";
				html += "</th>";
				html += "<th>";
				html += "학생 번호";
				html += "</th>";
				html += "<th>";
				html += "교사 번호";
				html += "</th>";
				html += "<th>";
				html += "주소";
				html += "</th>";
				html += "</tr>";
				html += "</thead>";
				html += "<tbody>";
				for(i = 0; i < data.length; i++){
					html += "<tr>";
					html += "<td>";
					html += data[i].STU_NAME;
					html += "</td>";
					html += "<td>";
					html += data[i].ADDRESS_LOCAL;
					html += "</td>";
					html += "<td>";
					html += data[i].STU_SCHOOL_NAME;
					html += "</td>";
					html += "<td>";
					switch(data[i].STU_SCHOOL_YEAR){
					case 4 :
						html += "초등학교4학년";
						break;
					case 5 :
						html += "초등학교5학년";
						break;
					case 6 :
						html += "초등학교6학년";
						break;
					case 7 :
						html += "중학교1학년";
						break;
					case 8 :
						html += "중학교2학년";
						break;
					case 9 :
						html += "중학교3학년";
						break;
					case 10 :
						html += "고등학교1학년";
						break;
					}
					html += "</td>";
					html += "<td>";
					html += data[i].STU_PHONE;
					html += "</td>";
					html += "<td>";
					html += data[i].MENTO_PHONE;
					html += "</td>";
					html += "<td>";
					html += data[i].STU_ADDRESS;
					html += "</td>";
					html += "</tr>";
				}
				html += "</tbody>";
				html += "</table>";
				$('#student_list').html(html);
				$('.student_check').css('display','block');
				$('.student_check').find('.danger_modal_con').css('max-width','90rem');
		        $('.danger_bg').show();
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	})
	
	
	//강의 삭제
	function comm_delete(){
    	$('.comm_delete').css('display','block');
        $('.danger_bg').show();
    }
	
	
    //강의 업데이트 페이지 이동
	function update(){
		location.href='${pageContext.request.contextPath}/user/mypage/communicator/update.do?COMM_IDX=${model.View.COMM_IDX}';
	}
	
    //강의 zoom 리스트 명단 가져오기
	$(document).ready(function() {
		if('${model.View.COMM_STAT}' == '2' || '${model.View.COMM_STAT}' == '3' || '${model.View.COMM_STAT}' == '4'){
			var COMM_MENTO_2 = '${model.View.COMM_MENTO}';
			var ZOOM_DT = $('#COMM_START_TM').val();
			ZOOM_DT = ZOOM_DT.substring(0,11);
			ZOOM_DT = ZOOM_DT.replaceAll('-','');
	        var COMM_MENTO = COMM_MENTO_2;
	        var ZOOM_TYPE = '${model.View.COMM_TIME}';
	    		$.ajax({
	    			type : "POST",
	    			url : "./GetZoom.do?",
	    			cache : false,
	    			data : ({
	    				ZOOM_MEMBER_ID : COMM_MENTO,
	    				ZOOM_DT : ZOOM_DT,
	    				ZOOM_TYPE : ZOOM_TYPE,
	    			}),
	    			dataType : "json",
	    			success : function(data, status, xhr) {
	    				//console.log(data);
	    				$('#ZOOM_ID').val(data[0].ZOOM_ID);
	    				$('#ZOOM_PW').val(data[0].ZOOM_PW);
	    				$('#ZOOM_EMAIL').val(data[0].ZOOM_EMAIL);
	    				$('#ZOOM_MT_ID').val(data[0].ZOOM_MT_ID);
	    				$('#ZOOM_MT_PW').val(data[0].ZOOM_MT_PW);
	    				if(${model.View.COMM_STAT} == 3 || ${model.View.COMM_STAT} == 4){
	    					$('#ZOOM_LINK').val(data[0].ZOOM_LINK);
		    				$('#ZOOM_LINK').attr('onclick','location.href="'+data[0].ZOOM_LINK+'"');	
	    				}
	    			},
	    			error : function(xhr, status, error) {
	    				if (xhr.status == 404) {
	    					alert("오류!!");
	    				}
	    			}
	    		});
		}
	});
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
	
	
</body>
</html>

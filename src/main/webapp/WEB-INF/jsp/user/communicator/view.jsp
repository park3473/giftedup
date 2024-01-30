<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
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
		<%@ include file="../include/menu.jsp"%>

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
								<!-- 교사 comm list start -->
 					<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>${model.userMemberPageDomain.YEAR }커뮤니케이터 - 강좌 상세정보</p>
                                </div>
                                <div class="member_input_wrap">
                                    <form action="/user/mypage/communicator/insert.do" method="post" name="insertform" id="insertform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="COMM_MENTO" value="${model.View.COMM_MENTO }" readonly="readonly">
                                        <input type="hidden" name="COMM_SCHOOL_NAME" value="${model.View.COMM_SCHOOL_NAME }" readonly="readonly">           
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
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 시간<b class="relate_c">＊</b></span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_START_TM" id="COMM_START_TM" value="${fn:substring(model.View.COMM_START_TM,0,16)}"  readonly="readonly">
                                                <span> ~ </span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_END_TM" id="COMM_END_TM" value="${fn:substring(model.View.COMM_END_TM,0,16)}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강사 이메일</span>
                                                <input class="input_size mr" type="text" name="COMM_EMAIL" id="COMM_EMAIL" value="${model.View.COMM_EMAIL}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">웨일ON 회의실 방 번호</span>
                                                <input class="input_size mr" type="text" name="COMM_ON_ID" id="COMM_ON_ID" value="${model.View.COMM_ON_ID }">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">웨일ON 회의실 비밀번호</span>
                                                <input class="input_size mr" type="text" name="COMM_ON_PW" id="COMM_ON_PW" value="${model.View.COMM_ON_PW }">
                                            </li>
                                            <%--
                                            22년도 X
                                             <li class="pd-lr-10">
                                                <span class="list_t">강사 지역</span>
                                                <input class="input_size mr" type="text" name="COMM_LOCAL" id="COMM_LOCAL" value="${model.View.COMM_LOCAL}" readonly="readonly">
                                            </li> --%>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 분야</span>
                                                <input class="input_size mr" type="text" name="COMM_TYPE" id="COMM_TYPE" value="${model.View.COMM_TYPE}" readonly="readonly">                                            
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">대상학년<b class="relate_c">＊</b></span>
                                                	<table class="list_t_table">
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="4" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'4') > -1 }"> checked="checked" </c:if> onclick="return false;"><span>초등학교 4학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="5" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'5') > -1 } ">checked="checked"</c:if> onclick="return false;"><span>초등학교 5학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="6" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'6') > -1 } ">checked="checked"</c:if> onclick="return false;"><span>초등학교 6학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="7" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'7') > -1 }">checked="checked"</c:if> onclick="return false;"><span>중학교 1학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="8" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'8') > -1 }">checked="checked"</c:if> onclick="return false;"><span>중학교 2학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="9" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'9') > -1 }">checked="checked"</c:if> onclick="return false;"><span>중학교 3학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="10" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'1') > -1 }">checked="checked"</c:if> onclick="return false;"><span>고등학교 1학년</span></td>
                                                		</tr>
                                                	</table>
                                                	<input type="hidden" name="COMM_SCHOOL_YEAR" id="COMM_SCHOOL_YEAR" value="">
                                            </li>
                                            <%--
                                            22년도 X
                                             <li class="pd-lr-10" id="supplie">
                                                <span class="list_t">준비물</span>
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
                                            </li> --%>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 자료</span>
                                                <a class="pro_file_btn" href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/communicator/${model.View.COMM_FILE}">
                                                  ${model.View.COMM_FILE}
                                                </a>
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom:10px;">
                                                <span class="list_t">강의 개요<b class="relate_c">＊</b></span>
                                                <div id="COMM_SUMMARY" name="COMM_SUMMARY" readonly="readonly">${model.View.COMM_SUMMARY }</div>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <c:if test="${model.View.COMM_STAT == '1' }">
                                <c:if test="${ssion_member_type == '1' }">
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                    	<a class="delete" href="javascript:Participate();">강의 신청</a>
                                        <a style="display:none" class="stat_update student_delete" href="javascript:student_delete();">신청 취소</a>
                                    </div>
                                </div>
                                </c:if>
                                </c:if>
                            </div>
                        </div>
                    </nav>
							</div>
						</div>
					</div>
				</section>


<div class="danger_modal_area insert_student_modal">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>현재 신청하신 <span>강의를</span>참여하시겠습니까?</h2>
                <h2>준비물 받을 실제 주소</h2>
                <button type="button" onclick="zipCode('mento')" >주소찾기</button>
                <input type="text" name="STU_ADDRESS" id="STU_ADDRESS" readonly="readonly" placeholder="주소를 입력하여주세요.">
                <input type="text" name="STU_ADDRESS_DETAIL" id="STU_ADDRESS_DETAIL" placeholder="상세주소s를 입력하여주세요.">
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.insert_student_modal').css('display','none');$('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a id="delete_button"onclick="LastParticipate()">예</a>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="danger_modal_area student_check">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>현재 신청한 학생 리스트.</h2>
                <!-- zoom id list -->
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
    
     <div class="danger_bg"></div>


			</div>
		</div>
		<!-- 본문 끝 -->

		<!-- 오른쪽 시작 -->
		<%@ include file="../include/right.jsp"%>
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
	</div>
	<!--본문 end-->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	/*현재 신청한 학생 목록 가져오기*/
	
	$(document).ready(function(){
		var COMM_IDX = '${model.View.COMM_IDX }';

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user/mypage/communicator/studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
				console.log(data.length);
				var personnel = $('#COMM_PERSONNEL').val();
				if(personnel >= data.length){
					var student_check_v = 0;
					for(i = 0; i < data.length; i ++){
						if('${ssion_user_id}' == data[i].STU_MEMBER_ID){
							student_check_v += 1;
						}
					}
					if(student_check_v > 0){
						$('.student_delete').css('display','block');
						return;
					}
				}
				
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	})
	
	
	
	function student_delete(){
		if(window.confirm('현재 강의 신청을 취소하시겠습니까?')){
			var COMM_IDX = '${model.View.COMM_IDX }';
			var STU_MEMBER_ID = '${ssion_user_id}';
			location.href="${pageContext.request.contextPath}/user/communicator/studentdelete.do?COMM_IDX="+COMM_IDX+"&STU_MEMBER_ID="+STU_MEMBER_ID+"";
		}
	}
	/*
	학생보기 풀기
	
	$('.check_personnel').click(function() {
		console.log($(this).attr('comm_idx'));
		var COMM_IDX = $(this).attr('comm_idx');

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user/mypage/communicator/studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
				var html = "";
				html += "<table id='zoom_list_tb'>";
				html += "<thead>";
				html += "<tr>";
				html += "<th>";
				html += "학생명";
				html += "</th>";
				html += "<th>";
				html += "학교명";
				html += "</th>";
				html += "<th>";
				html += "학년";
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
					html += "</tr>";
				}
				html += "</tbody>";
				html += "</table>";
				$('#student_list').html(html);
				$('.student_check').css('display','block');
		        $('.danger_bg').show();
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	})
	*/
	
	
	function Participate(){
		
		
		const ListCnt = 0;
		
		$.ajax({
			type:"POST",
			url : "${pageContext.request.contextPath}/user/mypage/communicator/listCnt.do",
			cache : false,
			success : function(data , status , xhr){
				console.log("success : "+data);
				
				if(data >= 3){
					alert('이번 년도에 이미 강의를 3번 신청하여 추가 신청이 불가능 합니다.');
					return;
				}
				
				if($('#COMM_PERSONNEL').val() <= $('#COMM_PERSONNEL_Cnt').val()){
					alert('강의 인원이 초과되어 현재 신청이 불가능 합니다.');
					return;
				}
				
				
				var COMM_IDX = '${model.View.COMM_IDX }';

				
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/user/mypage/communicator/studentlist.do?",
					cache : false,
					data : ({
						COMM_IDX : COMM_IDX
					}),
					dataType : "json",
					success : function(data, status, xhr) {
						console.log(data);
						console.log(data.length);
						var personnel = $('#COMM_PERSONNEL').val();
						if(personnel >= data.length){
							var student_check_v = 0;
							for(i = 0; i < data.length; i ++){
								if('${ssion_user_id}' == data[i].STU_MEMBER_ID){
									student_check_v += 1;
								}
							}
							if(student_check_v > 0){
								alert('이미 신청한 강의 입니다.');
								return;
							}
							$('.insert_student_modal').css('display','block');
					        $('.danger_bg').show();
						}else{
							alert('강의 인원이 초과되어 현재 신청이 불가능 합니다.');
							return;
						}
						
					},
					error : function(xhr, status, error) {
						if (xhr.status == 404) {
							alert("오류!!");
						}
					}
				});
				
			},
			error : function(xhr , error){
				console.log("error");
			}
			
		})
	
		
		
	}
	
	function LastParticipate(){
		
		
		if($('#COMM_PERSONNEL').val() <= $('#COMM_PERSONNEL_Cnt').val()){
			alert('강의 인원이 초과되어 현재 신청이 불가능 합니다.');
			return;
		}
		
		
		var COMM_IDX = '${model.View.COMM_IDX }';

		var STU_ADDRESS_FIRST = $('#STU_ADDRESS').val();
		var STU_ADDRESS_DETAIL = $('#STU_ADDRESS_DETAIL').val();
		STU_ADDRESS_DETAIL = '('+STU_ADDRESS_DETAIL+')';
		var STU_ADDRESS = STU_ADDRESS_FIRST + STU_ADDRESS_DETAIL;
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user/mypage/communicator/studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
				console.log(data.length);
				var personnel = $('#COMM_PERSONNEL').val();
				if(personnel > data.length){
					
					location.href='${pageContext.request.contextPath}/user/communicator/participate.do?COMM_IDX=${model.View.COMM_IDX}&STU_ADDRESS='+STU_ADDRESS+''
					
				}else{
					alert('강의 인원이 초과되어 현재 신청이 불가능 합니다.');
					return;
				}
				
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
		
	}
	
	
	//집 주소 검색
	function zipCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            console.log(data);
	            $('#STU_ADDRESS').val(data.address);
	        }
	    }).open();
	}
	
	$(document).ready(function() {
        var school_year = '${model.View.COMM_SCHOOL_YEAR}'
        var array = [];
        array = school_year.split('_');
        for(i = 0; i < array.length; i++){
           $('input[name="COMM_SCHOOL_YEAR_CHECK"]:input[value="'+array[i]+'"]').attr('checked','checked');
        }
    });
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
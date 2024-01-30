<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
<script type="text/javascript">
    // ckeditor setting
    var ckeditor_config = {
        allowedContent : true,
        resize_enabled : false, // 에디터 크기를 조절하지 않음
        enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
        shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
        toolbarCanCollapse : true,
        removePlugins : "elementspath", // DOM 출력하지 않음                        
        filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditor/file_upload.do', // 파일 업로드를 처리 할 경로 설정.
        height : '500px',
        // 에디터에 사용할 기능들 정의
        toolbar : [
            [  'Source','NewPage', 'Preview' ],
            [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
            [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript' ],
            ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
            [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], '/',
            ['Image','Link','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
            ['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize', 'ShowBlocks','-'],
            [ 'About' ] ]
    };

    var editor = null;

    jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace("COMM_SUMMARY", ckeditor_config);
    });

    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;

        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    CKEDITOR.replace('editor',{
    	contentsCss: '${pageContext.request.contextPath}/ckeditor/test.css'
    });
    //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';

</script>
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
								<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>${model.userMemberPageDomain.YEAR }커뮤니케이터 - 강좌 수정</p>
                                </div>
                                <div class="member_input_wrap">
                                    <form action="/user/mypage/communicator/insert.do" method="post" name="insertform" id="insertform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="COMM_MENTO" value="${model.View.COMM_MENTO }" readonly="readonly">
                                        <input type="hidden" name="COMM_SCHOOL_NAME" value="${model.View.COMM_SCHOOL_NAME }" readonly="readonly">  
                                        <input type="hidden" name="COMM_IDX" value="${model.View.COMM_IDX }">
                                                 
                                        <!-- insert 페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">교사 명</span>
                                                <input class="input_size mr" type="text" name="COMM_MENTO_NAME" id="COMM_MENTO_NAME" value="${model.View.COMM_MENTO_NAME}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강좌 명<b class="relate_c">＊</b></span>
                                                <input class="input_size mr" type="text" name="COMM_NAME" id="COMM_NAME" value="${model.View.COMM_NAME }">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 인원<b class="relate_c">＊</b></span>
                                                <select class="input_size mr" type="text" name="COMM_PERSONNEL" id="COMM_PERSONNEL" value="${model.View.COMM_PERSONNEL }">
                                                	<option value="start">강의 인원을 선택하여주세요</option>
                                                	<c:forEach var="i" begin="2" end="5">
                                                		<option value="${i}" <c:if test="${model.View.COMM_PERSONNEL == i }">selected</c:if>>${i}</option>
                                                	</c:forEach>
                                                </select>
                                                <span class="list_t">현재 참여 인원</span>
                                                <input class="input_size_mr check_personnel" COMM_IDX="${model.View.COMM_IDX }" type="text" name="COMM_PERSONNEL_Cnt" id="COMM_PERSONNEL_Cnt" value="${model.PERSONNELCnt }" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">이메일</span>
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
                                            <%-- <li class="pd-lr-10">
                                                <span class="list_t">이메일</span>
                                                <input class="input_size mr" type="text" name="COMM_LOCAL" id="COMM_LOCAL" value="${model.View.COMM_LOCAL}" readonly="readonly">
                                            </li> --%>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 분야</span>
                                                <span>수학<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="수학" <c:if test="${model.View.COMM_TYPE == '수학' }">checked="checked"</c:if>></span>
                                                <span>과학<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="과학" <c:if test="${model.View.COMM_TYPE == '과학' }">checked="checked"</c:if>></span>
                                                <span>융합<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="융합" <c:if test="${model.View.COMM_TYPE == '융합' }">checked="checked"</c:if>></span>
                                                <span>정보<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="정보" <c:if test="${model.View.COMM_TYPE == '정보' }">checked="checked"</c:if>></span>
                                                <span>인문<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="인문" <c:if test="${model.View.COMM_TYPE == '인문' }">checked="checked"</c:if>></span>
                                                <span>예술<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="예술" <c:if test="${model.View.COMM_TYPE == '예술' }">checked="checked"</c:if>></span>
                                                <span>기타<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="기타" <c:if test="${model.View.COMM_TYPE == '기타' }">checked="checked"</c:if>></span>
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">대상학년<b class="relate_c">＊</b></span>
                                                	<table class="list_t_table">
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="4" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'4') > -1 }"> checked="checked" </c:if> ><span>초 4학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="5" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'5') > -1 } ">checked="checked"</c:if> ><span>초 5학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="6" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'6') > -1 } ">checked="checked"</c:if> ><span>초 6학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="7" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'7') > -1 }">checked="checked"</c:if> ><span>중 1학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="8" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'8') > -1 }">checked="checked"</c:if> ><span>중 2학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="9" <c:if test="${fn:indexOf(model.View.COMM_SCHOOL_YEAR,'9') > -1 }">checked="checked"</c:if> ><span>중 3학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="10" <c:if test="${model.View.COMM_SCHOOL_YEAR == '10'}">checked="checked"</c:if> ><span>고 1학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="11" <c:if test="${model.View.COMM_SCHOOL_YEAR == '11' }">checked="checked"</c:if> ><span>고 2학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="12" <c:if test="${model.View.COMM_SCHOOL_YEAR == '12'}">checked="checked"</c:if> ><span>고 3학년</span></td>
                                                		</tr>
                                                	</table>
                                                	<input type="hidden" name="COMM_SCHOOL_YEAR" id="COMM_SCHOOL_YEAR" value="">
                                            </li>
                                            
                                            
                                            <%-- 22년도 강사 준비물 X
                                            <li class="pd-lr-10" id="supplie">
                                                <span class="list_t">준비물</span>
                                                <input type="hidden" name="number" id="supplies_number" su_number="">
                                                <input type="hidden" name="COMM_SUPPLIES" id="COMM_SUPPLIES">
                                                <span><button type="button" onclick="plus_supplies()">추가</button></span>
                                                <ul id="ul_supplies">
                                                	<c:forEach var="item" items="${model.Suplist}" varStatus="status">
													<li id="supplies_id" style="margin-left: 195px;" stat="update" class="supplies_cl su_cl">
														<table id="supplies_table">
															<input class="input_size mr COMM_SUPPLIES"  type="hidden" name="SUP_IDX" id="SUP_IDX_${status.index }" value="${item.SUP_IDX}" >
															<tr>
																<td colspan="2"><span style="margin-right: 4px;" class="table_span">이름</span>
																	<input style="width: 500px;" class="input_size mr COMM_SUPPLIES SUP_NAME" type="text" name="SUP_NAME" id="SUP_NAME_${status.index }" value="${item.SUP_NAME }" >
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<span style="margin-right: 4px;" class="table_span">구매처</span>
																	<input style="width: 500px;" class="input_size mr COMM_SUPPLIES SUP_LINK" type="text" name="SUP_LINK" id="SUP_LINK_${status.index }" value="${item.SUP_LINK}">
																</td>
															</tr>
															<tr>
																<td>
																	<span style="margin-right: 4px;" class="table_span">갯수</span>
																	<select class="input_size mr COMM_SUPPLIES SUP_AMOUNT" type="text" name="COMM_AMOUNT" id="SUP_AMOUNT_${status.index }" value="${item.SUP_AMOUNT }" >
																		<c:forEach var="i" begin="1" end="8">
																			<option value="${i}" <c:if test="${item.SUP_AMOUNT == i}">selected</c:if>>${i}</option>
																		</c:forEach>
																	</select>
																</td>
																<td>
																	<span class="table_span">단가</span>
																	<input class="input_size mr COMM_SUPPLIES SUP_PRICE" type="text" name="SUP_PRICE" id="SUP_PRICE_${status.index }" value="${item.SUP_PRICE }" >
																</td>
															</tr>
														</table>
													</li>
													</c:forEach>
												</ul>
                                            </li> --%>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 자료</span>
                                                <input class="input_size" type="text" name="fileName" id=fileName value="${model.View.COMM_FILE }">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" style="display: none;"/>
                                                <button type="button" id="btn-upload">파일선택</button>
                                                <input type="hidden" name="COMM_FILE" value="${model.View.COMM_FILE }" id="COMM_FILE">
                                                
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom:10px;">
                                                <span class="list_t">강의 개요<b class="relate_c">＊</b></span>
                                                <textarea id="COMM_SUMMARY" name="COMM_SUMMARY">${model.View.COMM_SUMMARY }</textarea>
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 시간<b class="relate_c">＊</b></span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_START_TM" id="COMM_START_TM" value="${fn:substring(model.View.COMM_START_TM,0,16)}"  >
                                                <span> ~ </span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_END_TM" id="COMM_END_TM" value="${fn:substring(model.View.COMM_END_TM,0,16)}" >
                                                <input style="width:3.7rem" type="text" id="COMM_TIME" name="COMM_TIME" readonly="readonly" change="no" value="">
                                                <button type="button" onclick="TimeValue(this)">강의 시간 확인</button>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                        <a class="delete" href="javascript:comm_update();">수정</a>
                                        <a class="cancel" onclick="history.go(-1)">돌아가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
							</div>
						</div>
					</div>
				</section>


<div class="danger_modal_area">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>정말 현 강의를<span>수정</span>하시겠습니까?.</h2>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.danger_modal_area').css('display','none');$('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a id="delete_button"onclick="update();">예</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="danger_bg"></div>


			</div>
		</div>
		<!-- 본문 끝 -->

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
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

<script type="text/javascript">
    
	    
	$.datetimepicker.setLocale('ko');
	$('.datecalendar').datetimepicker({
	    format:'Y.m.d H:i',
	    lang: "ko",
	    timepicker:true
	});
	
	$('.check_personnel').click(function() {
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
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	})
	
	$(function () {

        $('#btn-upload').click(function (e) {
            e.preventDefault();
            $('#file1').click();
        });

    });
	
	
	function changeValue(obj){
        var fileObj = obj.value;
        var pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
        pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader+1, pathMiddle);
        extName = fileObj.substring(pathMiddle+1, pathEnd);
        allFilename = fileName+"."+extName;

        $('#fileName').val(allFilename);
        $('#COMM_FILE').val(allFilename);
    }
	
	function plus_supplies(){
		var number = 0;
		if($('#supplies_id').length == '0'){
			number = 0;
		}else{
			number = $('#supplies_number').attr('su_number');
			number = Number(number);
			number += 1;
		}
		$('#supplies_number').attr('su_number',number);
		$('#ul_supplies').append('<li id="supplies_id" stat="insert" class="supplies_'+number+' su_cl" number="'+number+'" style="margin-left:195px;"><table id="supplies_table"><tr><td colspan="2"><span style="margin-right:4px;" class="table_span">이름</span><input style="width:500px;"class="input_size mr COMM_SUPPLIES SUP_NAME" type="text" name="SUP_NAME" id="SUP_NAME_'+number+'" ></td></tr><tr><td colspan="2"><span style="margin-right:4px;" class="table_span">구매처</span><input style="width:500px;"class="input_size mr COMM_SUPPLIES SUP_LINK" type="text" name="SUP_LINK" id="SUP_LINK_'+number+'" ></td></tr><tr><td><span style="margin-right:4px;" class="table_span">갯수</span><select class="input_size mr COMM_SUPPLIES SUP_AMOUNT" type="text" name="COMM_AMOUNT" id="SUP_AMOUNT_'+number+'" ><option value="supplies_start">갯수를 선택하여주세요.</option><c:forEach var="i" begin="1" end="8"><option value="${i}">${i}</option></c:forEach></select></td><td><span class="table_span">단가</span><input class="input_size mr COMM_SUPPLIES SUP_PRICE" type="Number" name="SUP_PRICE" id="SUP_PRICE_'+number+'" placeholder="숫자만입력해주세요." ></td></tr><tr><td><button type="button" onclick="delete_supplies('+number+')">삭제</button></td></tr></table></li>');
	}
	
	function TimeValue(obj){
		if($('#COMM_START_TM').val() != '' && $('#COMM_END_TM').val() != ''){
			var start_h = $('#COMM_START_TM').val().substring(11,13);
			var end_h = $('#COMM_END_TM').val().substring(11,13);
			var start_tm = $('#COMM_START_TM').val();
	        var end_tm = $('#COMM_END_TM').val();
	        var start_day = start_tm.substring(8,10);
	        var end_day = end_tm.substring(8,10);
	        var day = start_tm.substring(0,11);
	        
	        start_tm = start_tm.substring(11,16);
	        end_tm = end_tm.substring(11,16);
	        start_tm = start_tm.replace(':','');
	        end_tm = end_tm.replace(':','');
	        
	        between_tm = end_tm - start_tm;
	        
	        if(start_day != end_day){
	        	alert('강의 날짜는 같아야 됩니다.');
	        	return;
	        }
	        if(between_tm > 200){
	        	alert('강의 시간은 최대 두시간을 넘길수 없습니다.');
	        	return;
	        }
	   		if(start_h > end_h){
	   			alert('종료시간 혹은 시작시간을 다시 확인해주십시오.');
	   			return;
	   		}
	   		if(start_h == end_h){
	   			alert('종료시간과 시작시간이 같을순 없습니다.');
	   			return;
	   		}
			if(start_h >= 12){
				if(end_h < 12 ){
					alert('오후반 은 12시 이후 부터만 선택이 가능합니다.');
		   			return;	
				}
		        $.ajax({
		        	type : "POST",
					url : "${pageContext.request.contextPath}/user/communicator/TimeCheck.do",
					cache : false,
					data : ({
						COMM_START_TM : day,
						COMM_TIME : 2
					}),
					dataType : "json",
					success : function(data, status, xhr) {
						if(data == 'OK'){
							$('#COMM_TIME').val('오후반');
						}else if(data == 'NO'){
							alert('선택한 날짜의 오후반 강의는 더이상 생성이 불가능합니다.');
							return;
						}
					},
					error : function(xhr, status, error) {
					}
		        })
				
				$('#COMM_TIME').val('오후반');
			}else{
				if(end_h > 12 ){
					alert('오전반 은 12시 이전만 선택이 가능합니다.');
		   			return;	
				}
				var Day = start_tm;
				var COMM_IDX = '${model.View.COMM_IDX}';
		        $.ajax({
		        	type : "POST",
					url : "${pageContext.request.contextPath}/user/communicator/TimeCheck.do",
					cache : false,
					data : ({
						COMM_IDX : COMM_IDX,
						COMM_START_TM : day,
						COMM_TIME : 1
					}),
					dataType : "json",
					success : function(data, status, xhr) {
						if(data == 'OK'){
							$('#COMM_TIME').val('오전반');
						}else if(data == 'NO'){
							alert('선택한 날짜의 오전반 강의는 더이상 생성이 불가능합니다.');
							return;
						}
					},
					error : function(xhr, status, error) {
					}
		        })
			}
			
			
		}
	}
	
	
	function update(){
		
		// 대상 학년
		var comm_school_year_value = "";
		
		for( i =0 ; i < 11; i ++){
			if($("input[name='COMM_SCHOOL_YEAR_CHECK']").eq(i).is(':checked') == true){
				console.log($("input[name='COMM_SCHOOL_YEAR_CHECK']").eq(i).attr('value'));
				if(comm_school_year_value != ''){
					comm_school_year_value += '_'
				}
				comm_school_year_value += $("input[name='COMM_SCHOOL_YEAR_CHECK']").eq(i).attr('value');
				console.log(comm_school_year_value);
			}
		};
		
		$('#COMM_SCHOOL_YEAR').val(comm_school_year_value);
		
		$('#COMM_SUMMARY').val(CKEDITOR.instances.COMM_SUMMARY.getData());
		
		var size = document.getElementsByClassName('su_cl').length;
		
		console.log(size);
		
		if(size == '0'){
			$('#COMM_SUPPLIES').val('false');
		}else{
			$('#COMM_SUPPLIES').val('true');
		}
		
        if($('#COMM_NAME').val() == ''){
        	alert('강좌 명을 작성하여주세여.');
        	return;
        }
        if($('#COMM_PERSONNEL').val() == 'start'){
        	alert('강의 인원을 선택하여주세여.');
        	return;
        }
        if($('#COMM_START_TM').val() == ''){
        	alert('강의 시작시간을 선택하여주세여.');
        	return;
        }
        if($('#COMM_END_TM').val() == ''){
        	alert('강의 종료시간을 선택하여주세여.');
        	return;
        }
        if($("input[name='COMM_SCHOOL_YEAR_CHECK']:checked").length == '0'){
        	alert('대상 학년을 선택하여주세여.');
        	return;
        }
        if($('#COMM_SUMMARY').val() == ''){
        	alert('강의 개요를 작성하여 주세요.');
        	return;
        }
        if($('#COMM_TIME').val() == ''){
        	alert('강의 여부 확인 버튼을 클릭하여 강의 생성 여부를 확인하여 주세요.');
        	return;
        }
        
        
        if($('#COMM_TIME').val() == '오전반'){
        	$('#COMM_TIME').val('1');
        }else if($('#COMM_TIME').val() == '오후반'){
        	$('#COMM_TIME').val('2');
        }
        var form = $('#insertform')[0];
        var formData = new FormData(form);
        console.log(formData);
        
        $.ajax({
			type : "POST",
			url : "./update.do",
			cache : false,
			data : formData,
			dataType : "json",
			contentType : false,
			processData : false,
			success : function(data, status, xhr) {
				console.log(data);
				var size = document.getElementsByClassName('su_cl').length;
				console.log(size);
				if(size != '0'){
					for(i = 0 ; i < size; i ++){
						var SUP_IDX = $('#SUP_IDX_'+i).val();
						var SUP_NAME = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_NAME')[0].value;
						var SUP_LINK = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_LINK')[0].value;
						var SUP_AMOUNT = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_AMOUNT')[0].value;
						var SUP_PRICE = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_PRICE')[0].value;
						var COMM_IDX = data;
						var SUP_IF = $('.su_cl').eq(i).attr('stat');
						
						console.log(SUP_NAME);
						console.log(SUP_LINK);
						console.log(SUP_AMOUNT);
						console.log(SUP_PRICE);
						console.log(SUP_IF);
						if(SUP_IF == 'insert'){
							$.ajax({
								type : "POST",
								url : "./SupInsert.do",
								cache : false,
								data : ({
									SUP_NAME : SUP_NAME,
									SUP_LINK : SUP_LINK,
									SUP_AMOUNT : SUP_AMOUNT,
									SUP_PRICE : SUP_PRICE,
									COMM_IDX : COMM_IDX
								}),
								dataType : "json",
								success : function(data, status, xhr) {
									console.log('완료')
								},
								error : function(xhr, status, error) {
									if (xhr.status == 404) {
										console.log('실패')
									}
								}
							});
						}else if(SUP_IF == 'update'){
							$.ajax({
								type : "POST",
								url : "./SupUpdate.do",
								cache : false,
								data : ({
									SUP_IDX : SUP_IDX,
									SUP_NAME : SUP_NAME,
									SUP_LINK : SUP_LINK,
									SUP_AMOUNT : SUP_AMOUNT,
									SUP_PRICE : SUP_PRICE,
									COMM_IDX : COMM_IDX
								}),
								dataType : "json",
								success : function(data, status, xhr) {
									console.log('완료')
								},
								error : function(xhr, status, error) {
									if (xhr.status == 404) {
										console.log('실패')
									}
								}
							});
						}
						
					}
				
				}
				

				alert('강의 수정이 완료되었습니다.');
				location.href='${pageContext.request.contextPath}/user/mypage/communicator/list.do';
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
        
	}
	
	function comm_update(){
    	$('.danger_modal_area').css('display','block');
        $('.danger_bg').show();
    }
	
	$(window).load(function(){
		
		jQuery(function() {
	        // ckeditor 적용
	        editor = CKEDITOR.replace("COMM_SUMMARY", ckeditor_config);
	        
	    });
	});
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
	
	
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>

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
                                    <p>${model.userMemberPageDomain.YEAR }강좌 작성</p>
                                </div>
                                <div class="member_input_wrap">
                                    <form action="" method="post" name="insertform" id="insertform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="COMM_MENTO" value="${model.Mento.MEMBER_ID }">
                                        <input type="hidden" name="COMM_SCHOOL_NAME" value="${model.Mento.SCHOOL_NAME }">           
                                        <!-- insert 페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">교사 명</span>
                                                <input class="input_size mr" type="text" name="COMM_MENTO_NAME" id="COMM_MENTO_NAME" value="${model.Mento.NAME}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강좌 명<b class="relate_c">＊</b></span>
                                                <input class="input_size mr" type="text" name="COMM_NAME" id="COMM_NAME" >
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 인원<b class="relate_c">＊</b></span>
                                                <select class="input_size mr" type="text" name="COMM_PERSONNEL" id="COMM_PERSONNEL" >
                                                	<option value="start">강의 인원을 선택하여주세요</option>
                                                	<c:forEach var="i" begin="2" end="5">
                                                		<option value="${i}">${i}</option>
                                                	</c:forEach>
                                                </select>
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">이메일</span>
                                                <input class="input_size mr" type="text" name="COMM_EMAIL" id="COMM_EMAIL" value="${model.Mento.EMAIL}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">웨일ON 회의실 방 번호</span>
                                                <input class="input_size mr" type="text" name="COMM_ON_ID" id="COMM_ON_ID" value="" placeholder="공백 없이">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">웨일ON 회의실 비밀번호</span>
                                                <input class="input_size mr" type="text" name="COMM_ON_PW" id="COMM_ON_PW" value="" placeholder="공백 없이">
                                            </li>
                                            <%-- 
                                             22년도 강사 지역 X 
                                            <li class="pd-lr-10">
                                                <span class="list_t">이메일</span>
                                                <input class="input_size mr" type="text" name="COMM_LOCAL" id="COMM_LOCAL" value="${model.Mento.COMM_LOCAL}" readonly="readonly">
                                            </li> 
                                             --%>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 분야</span>
                                                <span>수학<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="수학"></span>
                                                <span>과학<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="과학"></span>
                                                <span>융합<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="융합"></span>
                                                <span>정보<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="정보"></span>
                                                <span>인문<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="인문"></span>
                                                <span>예술<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="예술"></span>
                                                <span>기타<input class="" type="radio" name="COMM_TYPE" id="COMM_TYPE" value="기타"></span>
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">대상학년<b class="relate_c">＊</b></span>
                                                	<table class="list_t_table">
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="4"><span>초 4학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="5"><span>초 5학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="6"><span>초 6학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="7"><span>중 1학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="8"><span>중 2학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="9"><span>중 3학년</span></td>
                                                		</tr>
                                                		<tr>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="10"><span>고 1학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="11"><span>고 2학년</span></td>
                                                			<td><input class=" mr" type="checkbox" name="COMM_SCHOOL_YEAR_CHECK" id="COMM_SCHOOL_YEAR_CHECK" value="12"><span>고 3학년</span></td>
                                                		</tr>
                                                	</table>
                                                	<input type="hidden" name="COMM_SCHOOL_YEAR" id="COMM_SCHOOL_YEAR" value="">
                                            </li>
                                            <!-- 22년도 준비물 X
                                            <li class="pd-lr-10" id="supplie">
                                                <span class="list_t">준비물</span>
                                                <input type="hidden" name="number" id="supplies_number" su_number="">
                                                <input type="hidden" name="COMM_SUPPLIES" id="COMM_SUPPLIES">
                                                <span><button type="button" onclick="plus_supplies()">추가</button></span>
                                                <ul id="ul_supplies">
                                                
                                                	준비물 리스트 공간
                                                	
                                                </ul>
                                            </li> -->
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 자료</span>
                                                <input class="input_size" type="text" name="fileName" id=fileName>
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" style="display: none;"/>
                                                <button type="button" id="btn-upload">파일선택</button>
                                                <input type="hidden" name="COMM_FILE" value="" id="COMM_FILE">
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom:10px;">
                                                <span class="list_t">강의 개요<b class="relate_c">＊</b></span>
                                                <textarea id="COMM_SUMMARY" name="COMM_SUMMARY" value="" placeholder="DHTML로 제작해주세요."></textarea>
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">강의 시간<b class="relate_c">＊</b></span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_START_TM" id="COMM_START_TM"  autocomplete="off">
                                                <span> ~ </span>
                                                <input class="input_size mr datecalendar" type="text" name="COMM_END_TM" id="COMM_END_TM"  autocomplete="off">
                                                <input style="width:3.7rem" type="text" id="COMM_TIME" name="COMM_TIME" readonly="readonly" value="" autocomplete="off">
                                                <button type="button" onclick="TimeValue(this)">강의 시간 확인</button>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                        <a class="delete" href="javascript:insert();">저장</a>
                                        <a class="cancel" href="javascript:cancel();">취소</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section> 	
    </div>
		</div>
		<!-- 본문 끝 -->

		<!-- 오른쪽 시작 -->
		<%@ include file="../../include/right.jsp"%>
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
    
    
	$(document).ready(function() {
	    $("#COMM_SUMMARY").on("change keyup paste", function() {
	        var summary_length = $(this).val();
	        $('#summary_length').text(summary_length.length);
	    })
	})
    
    $.datetimepicker.setLocale('ko');
	$('.datecalendar').datetimepicker({
	    format:'Y.m.d H:i',
	    lang: "ko",
	    timepicker:true
	});
	
	$(function () {

        $('#btn-upload').click(function (e) {
            e.preventDefault();
            $('#file1').click();
        });

    });
	
	function cancel(){
		history.go(-1);
	}
	
	function TimeValue(obj){
        if($('#COMM_NAME').val() == ''){
        	alert('내용을 전부 작성후 시간 확인을 클릭하여주세요.');
        	return;
        }
        if($('#COMM_PERSONNEL').val() == 'start'){
        	alert('내용을 전부 작성후 시간 확인을 클릭하여주세요.');
        	return;
        }
        if($('#COMM_START_TM').val() == ''){
        	alert('내용을 전부 작성후 시간 확인을 클릭하여주세요.');
        	return;
        }
        if($('#COMM_END_TM').val() == ''){
        	alert('내용을 전부 작성후 시간 확인을 클릭하여주세요.');
        	return;
        }
        if($("input[name='COMM_SCHOOL_YEAR_CHECK']:checked").length == '0'){
        	alert('내용을 전부 작성후 시간 확인을 클릭하여주세요.');
        	return;
        }
        $('#COMM_SUMMARY').val(CKEDITOR.instances.COMM_SUMMARY.getData());
        if($('#COMM_SUMMARY').val() == ''){
        	alert('내용을 전부 작성후 시간 확인을 클릭하여주세요.');
        	return;
        }
		
		
		
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
						console.log(data);
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
	
	// 22년도 위썜 = 준비물 사용 X
	/* function plus_supplies(){
		var number = 0;
		if($('#supplies_id').length == '0'){
			number = 0;
		}else{
			number = $('#supplies_number').attr('su_number');
			number = Number(number);
			number += 1;
		}
		$('#supplies_number').attr('su_number',number);
		
		$('#ul_supplies').append('<li id="supplies_id" class="supplies_'+number+' su_cl" number="'+number+'" style="margin-left:195px;"><table id="supplies_table"><tr><td colspan="2"><span style="margin-right:4px;" class="table_span">이름</span><input style="width:500px;"class="input_size mr COMM_SUPPLIES SUP_NAME" type="text" name="SUP_NAME" id="SUP_NAME_'+number+'" ></td></tr><tr><td colspan="2"><span style="margin-right:4px;" class="table_span">구매처</span><input style="width:500px;"class="input_size mr COMM_SUPPLIES SUP_LINK" type="text" name="SUP_LINK" id="SUP_LINK_'+number+'" ></td></tr><tr><td><span style="margin-right:4px;" class="table_span">갯수</span><select class="input_size mr COMM_SUPPLIES SUP_AMOUNT" type="text" name="COMM_AMOUNT" id="SUP_AMOUNT_'+number+'" ><option value="supplies_start">갯수를 선택하여주세요.</option><c:forEach var="i" begin="1" end="8"><option value="${i}">${i}</option></c:forEach></select></td><td><span class="table_span">단가</span><input class="input_size mr COMM_SUPPLIES SUP_PRICE" type="Number" name="SUP_PRICE" id="SUP_PRICE_'+number+'" placeholder="숫자만 입력해주세요."></td></tr><tr><td><button type="button" onclick="delete_supplies('+number+')">삭제</button></td></tr></table></li>');
	}
	
	
	function delete_supplies(number){
		$('.supplies_'+number).remove();
	} */
	
	function insert(){
		
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
			url : "./insert.do",
			cache : false,
			data : formData,
			dataType : "json",
			contentType : false,
			processData : false,
			success : function(data, status, xhr) {
				
				
				console.log(data);
				
				
				// 22년도 위쌤 준비물 X
				/* var size = document.getElementsByClassName('su_cl').length;
				
				if(size != '0'){
					for(i = 0 ; i < size; i ++){
						var SUP_NAME = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_NAME')[0].value;
						var SUP_LINK = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_LINK')[0].value;
						var SUP_AMOUNT = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_AMOUNT')[0].value;
						var SUP_PRICE = document.getElementsByClassName('su_cl')[i].getElementsByClassName('SUP_PRICE')[0].value;
						var COMM_IDX = data;
						
						console.log(SUP_NAME);
						console.log(SUP_LINK);
						console.log(SUP_AMOUNT);
						console.log(SUP_PRICE);
						
						
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
								console.log('성공');
							},
							error : function(xhr, status, error) {
								if (xhr.status == 404) {
									console.log('실패');
								}
							}
						});	
					}
				} */
				

				alert('강의 개설이 완료되었습니다.\n강좌 개설이후 반드시 접수 상세보기 - 접수 시작버튼을 클릭하여\n접수를 시작해주세요.');
				location.href='${pageContext.request.contextPath}/user/mypage/communicator/list.do';
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
		
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
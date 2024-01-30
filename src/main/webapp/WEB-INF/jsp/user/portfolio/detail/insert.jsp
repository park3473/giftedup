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
</head>
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
        editor = CKEDITOR.replace("EVALUATION", ckeditor_config);
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
    CKEDITOR.replace('editor1',{
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
								<!-- 교사 comm list start -->
 					<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>${model.userMemberPageDomain.YEAR }포트폴리오 작성</p>
                                </div>
                                <div class="member_input_wrap">
                                    <form action="/user/portfolio/detail/insert.do" method="post" name="insertform" id="insertform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="YEAR" value="${model.userMemberPageDomain.YEAR}"/>
                                        <c:set var="SCHOOL_YEAR_NM" value=""/>
                                        <c:choose>
											<c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '21'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '22'}"><c:set var="SCHOOL_YEAR_NM" value="중학교"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '23'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '4'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교4학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '5'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교5학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '6'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교6학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '7'}"><c:set var="SCHOOL_YEAR_NM" value="중학교1학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '8'}"><c:set var="SCHOOL_YEAR_NM" value="중학교2학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '9'}"><c:set var="SCHOOL_YEAR_NM" value="중학교3학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '10'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교1학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '11'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교2학년"/></c:when>
                                            <c:when test="${model.userMemberPageDomain.SCHOOL_YEAR == '12'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교3학년"/></c:when>
                                            <c:otherwise></c:otherwise>
										</c:choose>
                                                   
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">학생명</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" value="${model.userMemberPageDomain.NAME}" readonly="readonly">
                                                <span class="list_t">아이디</span>
                                                <input class="input_size mr" type="text" name="MEMBER_ID" id="MEMBER_ID" value="${model.userMemberPageDomain.MEMBER_ID}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <input class="input_size mr" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.userMemberPageDomain.SCHOOL_NAME}" readonly="readonly">
                                                <span class="list_t">학년/반</span>
                                                <input class="input_size mr" type="text" name="SCHOOL_YEAR" id="SCHOOL_YEAR" value="${SCHOOL_YEAR_NM} / ${model.pageDomain.SCHOOL_GROUP} 반" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">지역</span>
                                                <input class="input_size mr" type="text" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" value="${model.userMemberPageDomain.ADDRESS_LOCAL}" readonly="readonly">
                                                <span class="list_t">성별</span>
                                                <input class="input_size mr" type="text" name="SEX" id="SEX" value="${model.userMemberPageDomain.SEX}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">지원영역</span>
                                                <input class="input_size mr" type="text" name="SUPPORT_AREA" id="SUPPORT_AREA" value="${model.userMemberPageDomain.SUPPORT_AREA}" readonly="readonly">
                                                <span class="list_t">멘토교사명</span>
                                                <input class="input_size mr" type="text" name="PROF_NAME" id="PROF_NAME" value="${model.userMemberPageDomain.PROF_NAME}" readonly="readonly">
                                            </li>
											<li class="pd-lr-10">
												<span class="list_t">교육과정<b class="relate_c">＊</b></span>
												<span class="edu_box edu_00" id="COURSE"></span>
											</li>
											<li class="pd-lr-10">
												<span class="list_t">교육과정 프로그램<b class="relate_c">＊</b></span>
												<span class="edu_box edu_01" id="COURSE_PRGM">
													<span>교육과정은 선택해주세요.</span>
												</span>
											</li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">프로그램 명<b class="relate_c">＊</b></span>
                                                <input class="input_title mr" type="text" name="PRGM_NM" id="PRGM_NM" value="" placeholder="활동하신 프로그램명을 써주세요.">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">체험날짜<b class="relate_c">＊</b></span>
                                                <input class="input_size mr datecalendar2" type="text" name="START_TM" id="START_TM" value="" readonly="readonly" placeholder="시작날짜를 선택해주세요.">
                                                <span class="mr-2">~</span> 
                                                <input class="input_size mr datecalendar2" type="text" name="END_TM"   id="END_TM"   value="" readonly="readonly" placeholder="종료날짜를 선택해주세요.">
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">체험시간<b class="relate_c">＊</b></span>
                                            	<input class="input_size mr" type="number" name="RTICIPATION_TM" id="RTICIPATION_TM" value="" placeholder="시간단위로 숫자를 입력해주세요.">
                                            	<span class="list_t">장소<b class="relate_c">＊</b></span>
                                                <input class="input_size mr" type="text" name="PLACE" id="PLACE" value="" placeholder="활동하신 장소를 써주세요.">
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">학생만족도<b class="relate_c">＊</b></span>
                                            	<span class="edu_box">
                                            		<input class="mr-1" type="radio" name="STFT" value="5"><label>5점 이하</label>
													<input class="mr-1" type="radio" name="STFT" value="6"><label>6점</label>
													<input class="mr-1" type="radio" name="STFT" value="7"><label>7점</label>
													<input class="mr-1" type="radio" name="STFT" value="8"><label>8점</label>
													<input class="mr-1" type="radio" name="STFT" value="9"><label>9점</label>
													<input class="mr-1" type="radio" name="STFT" value="10"><label>10점</label>
                                            	</span>
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom:10px;">
                                                <span class="list_t">활동내용 및 소감<b class="relate_c">＊</b></span>
                                                <span style="font-size:0.8rem; color:#cf0000">하단 왼쪽의 아이콘(<img style="margin-bottom:2px;" src="${pageContext.request.contextPath}/resources/img/picture_img.png"/>)을 클릭해 이미지를 업로드 해주세요.</span>
                                                <textarea id="EVALUATION" name="EVALUATION" value="" placeholder="DHTML로 제작해주세요."></textarea>
                                            </li>
                                            
                                            <!-- 
                                            <li class="pd-lr-10">
                                                <span class="list_t">포트폴리오 첨부</span>
                                                <input class="input_size" type="text" name="fileName" id="fileName">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" style="display: none;"/>
                                                <button type="button" id="btn-upload" onClick="$('#file1').click();">파일선택</button>
                                                <span class="relate_b">선택된 파일 없음</span>
                                            </li>
                                            -->
                                            
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
		
		<%@ include file="../../include/footerJs.jsp" %>
		
	</div>
	
	</body>
	</html>
	<!--본문 end-->
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

<script type="text/javascript">
	var array = [];
	
	var map = new Object();
	map.id   = '1';
	map.name = '찾아가는 영재교육 프로그램';
	map.child = [{'id':'11','name':'상담'},{'id':'12','name':'진로적성검사'},{'id':'13','name':'학습지도'},{'id':'14','name':'자율연구'},{'id':'15','name':'융합과학 프로젝트'},{'id':'16','name':'전문가멘토링'},{'id':'17','name':'기타'}];
	array.push(map);
	
	map = new Object();
	map.id   = '2';
	map.name = '체험진로탐색 프로그램';
	map.child = [{'id':'21','name':'현장체험학습'},{'id':'22','name':'또래멘토링'},{'id':'23','name':'온라인 학습멘토링'},{'id':'24','name':'문화체험'},{'id':'25','name':'기타'}];
	array.push(map);
	
	map = new Object();
	map.id   = '3';
	map.name = '창의융합캠프';
	map.child = [{'id':'31','name':'캠프'}];
	array.push(map);
	
	map = new Object();
	map.id   = '4';
	map.name = '기타 프로그램';
	map.child = [{'id':'41','name':'오리엔테이션'},{'id':'42','name':'성과발표회'}];
	array.push(map);

    function changeValue(fileVal) {
        $('#fileName').val($('#file1')[0].files[0].name);
    }
    
    function insert(){
    	
    	if($("#PRGM_NM").val() == ''){
			alert("프로그램명을 입력해야 합니다.");
			return false;
		}
	    if($("#START_TM").val() == ''){
    		alert("시작시간을 입력하셔야 합니다.");
    		return false;
    	}
    	if($("#END_TM").val() == ''){
    		alert("종료시간을  입력하셔야 합니다.");
    		return false;
    	}
    	if($("#START_TM").val() >= $("#END_TM").val()){
    		alert("시간은 종료시간이 시작시간보다 빠르거나 같을 수 없습니다.");
    		return false;
    	}
	    if($("#RTICIPATION_TM").val() == ''){
			alert("체험시간을 입력해야 합니다.");
			return false;
		}
	    if($("#PLACE").val() == ''){
			alert("장소를  입력해야 합니다.");
			return false;
		}
	    if(!$("input[name=STFT]").is(":checked")){
			alert("학생만족도를 선택해야 합니다.");
			return false;
		}
	    if(CKEDITOR.instances.EVALUATION.getData().length < 1){
			alert("활동내용 및 소감을 입력해 주세요.");
			return;
		}
		
        $('#insertform').submit();
    }
    
    function cancel(){
    	$('#insertform').attr("action","/user/portfolio/detail/list.do");
    	$('#insertform').attr("method","get");
        $('#insertform').submit();
    }
    
    $.datetimepicker.setLocale('ko');
	$('.datecalendar2').datetimepicker({
	    format:'Y.m.d H:i',
	    lang: "ko",
	    timepicker:true
	});
	
$(window).load(function(){
		
		jQuery(function() {
	        // ckeditor 적용
	        editor = CKEDITOR.replace("EVALUATION", ckeditor_config);
	        
	        	editor2 = CKEDITOR.replace("EVALUATION_TACHER", ckeditor_config);
	        
	    });
		
		var html = '';
		$.each(array,function(idx,obj){
			html += '<input class="mr-1" type="radio" name="COURSE" value="' + obj.id + '"><label for="#">' + obj.name + '</label>';
		});
		
		$("#COURSE").html(html);
		
		$("input[name=COURSE]").change(function(){
			var val =$(this).val();
			
			$.each(array,function(idx,obj){
				
				if(obj.id == val){
					
					var html = '';
					$.each(obj.child,function(idx2,obj2){
						html += '<input class="mr-1" type="radio" name="COURSE_PRGM" value="' + obj2.id + '"><label for="#">' + obj2.name + '</label>';
					});
					$("#COURSE_PRGM").html(html);
				}
				
			});
		
			if('${model.pageDomain.COURSE_PRGM}' != ''){
				$("input:radio[name=COURSE_PRGM]:input[value='${model.pageDomain.COURSE_PRGM}']").attr("checked",true).trigger("change");
			}
				
		});
		
			if('${model.pageDomain.COURSE}' != ''){
				$("input:radio[name=COURSE]:input[value='${model.pageDomain.COURSE}']").attr("checked",true).trigger("change");
			}
		
	});
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">



<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    var editor2 = null;

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
    //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';

</script>
<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %> 

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %> 
        </section>
    </header>
    
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <c:if test="${
                            fn:indexOf(requestURI, '/member/') > -1
                            || fn:indexOf(requestURI, '/portfolio/') > -1
                            || fn:indexOf(requestURI, '/mypage/program/') > -1
                            || fn:indexOf(requestURI, '/mypage/survey/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/activity_allowance/') > -1 }">
                            <h2>마이페이지</h2>
                            </c:if>
                        </div>
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '1'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>포트폴리오 수정</p>
                                </div>
                                <div class="member_input_wrap">
                                    <form action="/user/portfolio/detail/${model.pageDomain.IDX}/update.do" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden"  name="IDX" value="${model.pageDomain.IDX}" />
                                        <input type="hidden" name="YEAR" value="${model.pageDomain.YEAR}" />
                                        
                                        <c:set var="SCHOOL_YEAR_NM" value=""/>
                                        <c:choose>
											<c:when test="${model.pageDomain.SCHOOL_YEAR == '21'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '22'}"><c:set var="SCHOOL_YEAR_NM" value="중학교"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '23'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '4'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교4학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '5'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교5학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '6'}"><c:set var="SCHOOL_YEAR_NM" value="초등학교6학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '7'}"><c:set var="SCHOOL_YEAR_NM" value="중학교1학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '8'}"><c:set var="SCHOOL_YEAR_NM" value="중학교2학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '9'}"><c:set var="SCHOOL_YEAR_NM" value="중학교3학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '10'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교1학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '11'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교2학년"/></c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '12'}"><c:set var="SCHOOL_YEAR_NM" value="고등학교3학년"/></c:when>
                                            <c:otherwise></c:otherwise>
										</c:choose>
                                        
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">학생명</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" value="${model.pageDomain.NAME}" readonly="readonly">
                                                <span class="list_t">아이디</span>
                                                <input class="input_size mr" type="text" name="MEMBER_ID" id="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <input class="input_size mr" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.pageDomain.SCHOOL_NAME}" readonly="readonly">
                                                <span class="list_t">학년/반</span>
                                                <input class="input_size mr" type="text" name="SCHOOL_YEAR" id="SCHOOL_YEAR" value="${SCHOOL_YEAR_NM} / ${model.pageDomain.SCHOOL_GROUP} 반" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">지역</span>
                                                <input class="input_size mr" type="text" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" value="${model.pageDomain.ADDRESS_LOCAL}" readonly="readonly">
                                                <span class="list_t">성별</span>
                                                <input class="input_size mr" type="text" name="SEX" id="SEX" value="${model.pageDomain.SEX}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">지원영역</span>
                                                <input class="input_size mr" type="text" name="SUPPORT_AREA" id="SUPPORT_AREA" value="${model.pageDomain.SUPPORT_AREA}" readonly="readonly">
                                                <span class="list_t">멘토교사명</span>
                                                <input class="input_size mr" type="text" name="PROF_NAME" id="PROF_NAME" value="${model.pageDomain.PROF_NAME}" readonly="readonly">
                                            </li>
                                            
                                            
                                            <!--교사 영역-->
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
											<!--교사 영역 end-->
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">프로그램 명<b class="relate_c">＊</b></span>
                                                <input class="input_title mr" type="text" name="PRGM_NM" id="PRGM_NM" value="${model.pageDomain.PRGM_NM}">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">체험기간<b class="relate_c">＊</b></span>
                                                
                                                <fmt:parseDate var="st" value="${model.pageDomain.START_TM}" pattern='yyyy-MM-dd HH:mm:ss' />
                                                <fmt:parseDate var="et" value="${model.pageDomain.END_TM}" pattern='yyyy-MM-dd HH:mm:ss' />
                                                
                                                <input class="input_size mr datecalendar2" type="text" name="START_TM" id="START_TM" value="<fmt:formatDate value="${st}" pattern="yyyy-MM-dd HH:mm:"/>" readonly="readonly">
                                                <span class="mr-2">~</span>
                                                <input class="input_size mr datecalendar2" type="text" name="END_TM"   id="END_TM"   value="<fmt:formatDate value="${et}" pattern="yyyy-MM-dd HH:mm"/>" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">체험시간<b class="relate_c">＊</b></span>
                                            	<input class="input_size mr" type="number" name="RTICIPATION_TM" id="RTICIPATION_TM" value="${model.pageDomain.RTICIPATION_TM}" placeholder="체험한 시간을 숫자로 입력해주세요.">
                                            	<span class="list_t">장소<b class="relate_c">＊</b></span>
                                                <input class="input_size mr" type="text" name="PLACE" id="PLACE" value="${model.pageDomain.PLACE}" placeholder="활동하신 장소를 써주세요.">
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">학생만족도<b class="relate_c">＊</b></span>
                                            	<span class="edu_box">
                                            		<input class="mr-1" type="radio" name="STFT" value="5" <c:if test="${model.pageDomain.STFT == '5'}">checked</c:if>><label>5점 이하</label>
													<c:forEach begin="6" end="10" var="score" step="1">
														<input class="mr-1" type="radio" name="STFT" value="${score}" <c:if test="${model.pageDomain.STFT == score}">checked</c:if>><label>${score}점</label>
													</c:forEach>
                                            	</span>
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom: 10px;">
                                                <span class="list_t">활동내용 및 소감<b class="relate_c">＊</b></span>
                                                <span style="font-size:0.8rem; color:#cf0000">하단 왼쪽의 아이콘(<img style="margin-bottom:2px;" src="${pageContext.request.contextPath}/resources/img/picture_img.png"/>)을 클릭해 이미지를 업로드 해주세요.</span>
                                                <textarea id="EVALUATION" name="EVALUATION">${model.pageDomain.EVALUATION}</textarea>
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
                                            
                                            <!-- 교사 피드백 내용 -->
                                            <c:if test="${ssion_member_type == '2'}">
                                            <li class="pd-lr-10">
                                            	<span class="list_t">피드백 공개여부<b class="relate_c">＊</b></span>
                                            	<span class="edu_box edu_box_size">
                                            		<input class="mr-1" type="radio" name="EVAL_OPEN_YN" value="0" <c:if test="${model.pageDomain.EVAL_OPEN_YN == '0'}">checked</c:if>><label for="#">공개</label>
													<input class="mr-1" type="radio" name="EVAL_OPEN_YN" value="1" <c:if test="${model.pageDomain.EVAL_OPEN_YN == '1'}">checked</c:if>><label for="#">비공개</label>
                                            	</span>
                                            	<span class="list_t">교사 만족도<b class="relate_c">＊</b></span>
                                            	<span class="edu_box">
                                            		<input class="mr-1" type="radio" name="PROF_STFT" value="5" <c:if test="${model.pageDomain.PROF_STFT == '5'}">checked</c:if>><label>5점 이하</label>
													<c:forEach begin="6" end="10" var="score" step="1">
														<input class="mr-1" type="radio" name="PROF_STFT" value="${score}" <c:if test="${model.pageDomain.PROF_STFT == score}">checked</c:if>><label>${score}점</label>
													</c:forEach>
                                            	</span>
                                            </li>
                                            <li class="pd-lr-10" style="padding-bottom: 10px;">
                                            	<span class="list_t">활동 피드백<b class="relate_c">＊</b></span>
                                            	<span style="font-size:0.8rem; color:#cf0000">하단 왼쪽의 아이콘(<img style="margin-bottom:2px;" src="${pageContext.request.contextPath}/resources/img/picture_img.png"/>)을 클릭해 이미지를 업로드 해주세요.</span>
                                            	<textarea id="EVALUATION_TACHER" name="EVALUATION_TACHER" placeholder="활동 피드백을 작성해주세요.">${model.pageDomain.EVALUATION_TACHER}</textarea>
                                            </li>
                                            </c:if>
                                            <!-- 교사 피드백 내용 end-->
                                            
                                        </ul>
                                    </form>
                                </div>
                                
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                        <a class="delete" href="javascript:update();">저장</a>
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

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %> 
    </footer>
    
    <%@ include file="../../include/footerJs.jsp" %>
    
</body>

</html>

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

    function update(){
    
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
	    if($("#EVALUATION").val() == ''){
			alert("활동내용 및 소감을 입력해야 합니다.");
			return false;
		}
	    
	    if("${ssion_member_type}"  == '2'){
	    	
	    	if(!$("input[name=COURSE]").is(":checked")){
		    	alert("교육과정을 선택해야 합니다.");
				return false;
		    }
	    	if(!$("input[name=COURSE_PRGM]").is(":checked")){
		    	alert("교육과정 프로그램을 선택해야 합니다.");
				return false;
		    }
	    	
	    	if(!$("input[name=EVAL_OPEN_YN]").is(":checked")){
		    	alert("피드백 공개여부를 선택해야 합니다.");
				return false;
		    }
	    	if(!$("input[name=PROF_STFT]").is(":checked")){
				alert("교사 만족도를 선택해야 합니다.");
				return false;
			}
		    if(CKEDITOR.instances.EVALUATION_TACHER.getData().length < 1){
				alert("활동 피드백을 입력해 주세요.");
				return;
			}
	    }
    	
        $('#updateform').submit();
    }
    
    function cancel(){
    	$('#updateform').attr("action","/user/portfolio/detail/list.do");
    	$('#updateform').attr("method","get");
        $('#updateform').submit();
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
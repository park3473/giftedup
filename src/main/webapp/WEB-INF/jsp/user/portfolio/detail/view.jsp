<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp"%>

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
                                    <p>포트폴리오 보기</p>
                                </div>
                                
                                <div id="pdf_wrap" class="member_input_wrap">
                                    <form action="../list.do" method="post" name="updateform" id="updateform">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden"  name="IDX"  value="${model.pageDomain.IDX}" />
                                        <input type="hidden" name="YEAR" value="${model.pageDomain.YEAR }"/>
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
                                                   
                                        <!-- 학생 view페이지 -->
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
                                            
											<li class="pd-lr-10">
												<span class="list_t">교육과정</span>
												<span class="input_size edu_box edu_contents edu_00">
													<c:choose>
                                                		<c:when test="${model.pageDomain.COURSE == 1}">찾아가는 영재교육 프로그램</c:when>
                                                		<c:when test="${model.pageDomain.COURSE == 2}">체험진로탐색 프로그램</c:when>
                                                		<c:when test="${model.pageDomain.COURSE == 3}">창의융합캠프</c:when>
                                                		<c:when test="${model.pageDomain.COURSE == 4}">기타 프로그램</c:when>
                                                		<c:otherwise>미등록</c:otherwise>
                                                	</c:choose>
												</span>
											</li>
											<li class="pd-lr-10">
												<span class="list_t">교육과정 프로그램</span>
												<span class="input_size edu_box edu_contents edu_01">
													<c:choose>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 11}">상담</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 12}">진로적성검사</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 13}">학습멘토링</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 14}">자율연구</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 15}">융합과학 프로젝트</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 16}">전문가멘토링</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 17}">기타</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 21}">현장체험학습</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 22}">또래멘토링</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 23}">온라인 학습멘토링</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 24}">문화체험</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 25}">기타</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 31}">캠프</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 41}">오리엔테이션</c:when>
                                                		<c:when test="${model.pageDomain.COURSE_PRGM == 42}">성과발표회</c:when>
                                                		<c:otherwise>미등록</c:otherwise>
                                                	</c:choose>
												</span>
											</li>
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">프로그램 명</span>
                                                <input class="input_title mr" type="text" name="PRGM_NM" id="PRGM_NM" value="${model.pageDomain.PRGM_NM}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">체험기간</span>

												<fmt:parseDate var="st" value="${model.pageDomain.START_TM}" pattern='yyyy-MM-dd HH:mm:ss' />
                                                <fmt:parseDate var="et" value="${model.pageDomain.END_TM}" pattern='yyyy-MM-dd HH:mm:ss' />
                                                                                                
                                                <input class="input_size mr" type="text" name="START_TM" id="START_TM" value="<fmt:formatDate value="${st}" pattern="yyyy-MM-dd HH:mm"/>"  readonly="readonly">
                                                <span class="mr-2">~</span>
                                                <input class="input_size mr" type="text" name="END_TM"   id="END_TM"   value="<fmt:formatDate value="${et}" pattern="yyyy-MM-dd HH:mm"/>"  readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">체험시간</span>
                                            	<input class="input_size mr" type="number" name="#" id="#" value="${model.pageDomain.RTICIPATION_TM }" placeholder="체험한 시간을 숫자로 입력해주세요." readonly>
                                            	<span class="list_t">장소</span>
                                                <input class="input_size mr" type="text" name="PLACE" id="PLACE" value="${model.pageDomain.PLACE}" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">학생만족도</span>
                                            	<input class="input_size mr" type="text" value="${model.pageDomain.STFT}점 <c:if test="${model.pageDomain.STFT == 5}">이하</c:if>" readonly="readonly">
                                            </li>
                                            <li class="pd-lr-10">
                                                <span class="list_t">활동내용 및 소감</span>
                                                <div class="contents_box">
                                                	${model.pageDomain.EVALUATION}
                                                </div>
                                            </li>
                                            
                                            <c:if test="${ssion_member_type == '1'}">
                                            	<c:if test="${model.pageDomain.EVAL_OPEN_YN == '0'}">
		                                            <li class="pd-lr-10">
		                                            	<span class="list_t">멘토교사 피드백</span>
		                                            	<div class="contents_box">
		                                            		${model.pageDomain.EVALUATION_TACHER}
		                                            	</div>
		                                            </li>
                                            	</c:if>
                                            </c:if>
                                            
                                            <!--교사 영역-->
                                            <c:if test="${ssion_member_type == '2'}">
                                            	<c:if test="${!empty model.pageDomain.EVALUATION_TACHER && fn:length(model.pageDomain.EVALUATION_TACHER) > 0}">
		                                            <li class="pd-lr-10">
		                                            	<span class="list_t">피드백 공개여부</span>
		                                            	<input class="input_size mr" type="text" value="<c:choose><c:when test="${model.pageDomain.EVAL_OPEN_YN == 0}">공개</c:when><c:otherwise>비공개</c:otherwise></c:choose>" readonly="readonly">
		                                            	<span class="list_t">교사 만족도</span>
		                                            	<input class="input_size mr" type="text" value="${model.pageDomain.PROF_STFT}점 <c:if test="${model.pageDomain.PROF_STFT == 5}">이하</c:if>" readonly="readonly">
		                                            </li>
		                                            <li class="pd-lr-10">
		                                            	<span class="list_t">활동 피드백</span>
		                                            	<div class="contents_box">
                                                			${model.pageDomain.EVALUATION_TACHER}
                                                		</div>
                                                		<!-- 
		                                            	<textarea id="EVALUATION_TACHER" name="EVALUATION_TACHER" readonly="readonly">${model.pageDomain.EVALUATION_TACHER}</textarea>
		                                            	-->
		                                            </li>
                                            	</c:if>
                                            </c:if>       
                                            <!--교사 영역 end-->                                                    
                                        </ul>
                                        
                                    </form>
                                </div>
                                
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                    	<!-- <a id="pdf_create" class="delete" href="#" onclick="javascript:savePdf('${model.pageDomain.IDX}');">PDF저장</a> -->
                                    	<!-- <a id="pdf_create" class="delete" href="#">PDF저장</a> -->
                                    	<c:if test="${ssion_member_type == '2'}">
                                    	<a class="delete" href="#" onclick="javascript:update('${model.pageDomain.IDX}');">피드백 작성 / 수정</a>
                                    	</c:if>
                                    	<c:if test="${ssion_member_type == '1'}">
                                        <a class="delete" href="#" onclick="javascript:update('${model.pageDomain.IDX}');">수정</a>
                                        <a class="cancel" href="#" onclick="javascript:del();">삭제</a>
                                        </c:if>
                                        <a class="cancel" href="#" onclick="javascript:list();">목록</a>
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

	
	
</body>
</html>

<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>


<script type="text/javascript">

	function update(idx) {
	    var URL = '/user/portfolio/detail/' +idx +'/update.do?';
	    URL = URL + "YEAR=${model.pageDomain.YEAR }";
	    location.href = URL;
	}
	
	function savePdf() {
		alert("준비중입니다.");
		return false;
	}
	
	function del() {
		
		/* alert($("input[name=IDX]").val()) */
		
		if(${fn:length(model.pageDomain.EVALUATION_TACHER)} > 0){
			alert("피드백이 작성된 포트폴리오는 삭제 할 수 없습니다.");
			return false;
		}

		if(!confirm("삭제된 포트폴리오는 복구되지 않습니다. 삭제를 진행하시겠습니까?")){
			return false;
		}
		
		$('#updateform').attr("action","/user/portfolio/detail/delete.do");
    	$('#updateform').attr("method","post");
        $('#updateform').submit();
	}
	
	function list(idx) {
	    var URL = '/user/portfolio/detail/list.do?';
	    URL = URL + "MEMBER_ID=${model.MEMBER_ID}";
	    URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
	    URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
	    location.href = URL;
	}
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
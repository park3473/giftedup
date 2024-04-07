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
        <div class="font_noto all_tit_30">신입생 선발 신청</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->
        
        
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
					
					<!-- 유형 신청 전 기존 유저 확인 유형 2,3 start-->
					<c:if test="${model.view.TYPE == '2' || model.view.TYPE == '3' }">
					
					<!-- 유형 2 , 3 start -->
                    <nav class="sub_min_size" style="display:block" id="member_insert">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>지원 신청서</p>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/user/member_re/insert.do" method="POST" name="member_re_insert_form" id="insertform" autocomplete="off">
                                    <input type="hidden" value="${model.TYPE }" name="TYPE" id="TYPE" class="TYPE" value="${model.view.TYPE }">
                                    <input type="hidden" value="11" name="LEVEL" id="LEVEL" class="LEVEL" value="${model.view.LEVEL }">
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="MEMBER_ID" value="${model.view.MEMBER_ID }"/>
                                    <input type="hidden" name="PASSWORD" id="PASSWORD" class="PASSWORD" value="${model.view.PASSWORD }"/>
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.view.NAME }</li>
                                                </ul>
                                                <span class="list_t">성별</span>
                                                <ul class="list_ob list_ob_01">
                                                    <span>남</span><input type="radio" value="남자" name="SEX" class="SEX" id="SEX" <c:if test="${model.view.SEX == '남자' }">checked</c:if>>
                                                    <span>여</span><input type="radio" value="여자" name="SEX" class="SEX" id="SEX"  <c:if test="${model.view.SEX == '여자' }">checked</c:if> >
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<li>${model.view.SCHOOL_NAME }</li>
                                                </ul>
                                                <input type="hidden" name="SCHOOL_TYPE" id="SCHOOL_TYPE" class="SCHOOL_TYPE" value="${model.view.SCHOOL_TYPE }">
                                                <input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS" value="${model.view.SCHOOL_ADDRESS }">
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" value="${model.view.SCHOOL_LOCATION }">
                                            </li>
                                    
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교급</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.view.SCHOOL_TYPE }</li>
                                                </ul>
                                            </li>
                                            
                                            
                                            <!-- 학생 학년 , 반 선택 -->
                                            <c:if test="${model.view.TYPE == '2' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">학년</span>
                                                <select name="SCHOOL_YEAR" id="SCHOOL_YEAR" class="SCHOOL_YEAR">
                                                	<option value="">학년 선택</option>
													<option value="4" <c:if test="${model.view.SCHOOL_YEAR == '4' }">selected</c:if> >초등학교 4학년</option>
													<option value="5" <c:if test="${model.view.SCHOOL_YEAR == '5' }">selected</c:if> >초등학교 5학년</option>
													<option value="6" <c:if test="${model.view.SCHOOL_YEAR == '6' }">selected</c:if> >초등학교 6학년</option>
													<option value="7" <c:if test="${model.view.SCHOOL_YEAR == '7' }">selected</c:if> >중학교 1학년</option>
													<option value="8" <c:if test="${model.view.SCHOOL_YEAR == '8' }">selected</c:if> >중학교 2학년</option>
													<option value="9" <c:if test="${model.view.SCHOOL_YEAR == '9' }">selected</c:if> >중학교 3학년</option>
													<option value="10" <c:if test="${model.view.SCHOOL_YEAR == '10' }">selected</c:if> >고등학교 1학년</option>
												</select>
                                                <span calss="list_t">반</span>
                                                <select name="SCHOOL_GROUP" id="SCHOOL_GROUP" class="SCHOOL_GROUP">
                                                	<option value="">반 선택</option>
                                                	<c:forEach var="i" begin="1" end="10" >
                                                		<option value="${i }" <c:if test="${model.view.SCHOOL_GROUP == i }">selected</c:if>>${i }</option>
                                                	</c:forEach>
                                                </select>
                                            </li>
                                            </c:if>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.view.BIRTH }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">주소</span>
                                                <ul class="list_ob list_ob_02">
                                                	<li>${model.view.ZIPCODE }</li>
                                                	<li>${model.view.ADDRESS } - ${model.view.ADDRESS_DETAIL }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">연락처</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.view.PHONE }</li>
                                            	</ul>
                                            </li>
                                            
                                            <!-- 학생 보호자 연락처 -->
                                            <c:if test="${model.view.TYPE == '2'}">
                                            <li class="pd-lr-10">
                                            	<span class="list_t">보호자 연락처</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.view.PARENT_PHONE }</li>
                                            	</ul>
                                            </li>
                                            </c:if>
											
											<li class="pd-lr-10">
                                            	<span class="list_t">이메일</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.view.EMAIL }</li>
                                            	</ul>
                                            </li>
											
											
											<!-- 유형 2 학생 필요한 부분 start-->
											<c:if test="${model.view.TYPE == '2' }">
											<li class="pd-lr-10">
                                                <span class="list_t">지원 분야</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.view.TYPE_SUB }</li>
                                                </ul>
                                            </li>
                                                 
                                                
                                                
											<li class="pd-lr-10">
												<span class="list_t">지원 자격</span>
												<ul class="list_ob list_ob_01">
                                                    <li id="ELIGIBILITY" value="${model.view.ELIGIBILITY }" >${model.view.ELIGIBILITY }</li>
                                                </ul>
											</li>
											
											</c:if>
	                                         
	                                         <c:if test="${model.view.TYPE == '2' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<select class="EXP_TYPE" id="EXP_TYPE" name="EXP_TYPE">
                                                		<option value="" <c:if test="${model.view.EXP_TYPE == ''}">selected</c:if> >선택해주세요.</option>
                                                		<option value="no" <c:if test="${model.view.EXP_TYPE == 'no'}">selected</c:if> >무</option>
                                                		<option value="영재학급" <c:if test="${model.view.EXP_TYPE == '영재학급'}">selected</c:if> >영재학급</option>
                                                		<option value="영재교육원" <c:if test="${model.view.EXP_TYPE == '영재교육원'}">selected</c:if> >영재교육원</option>
                                                		<option value="대학부설 과학영재교육원" <c:if test="${model.view.EXP_TYPE == '대학부설 과학영재교육원'}">selected</c:if> >대학부설 과학영재교육원</option>
                                                		<option value="기타" <c:if test="${model.view.EXP_TYPE == '기타'}">selected</c:if> >기타</option>
                                                	</select>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
	                                            <span class="list_t">영재 교육 참여 기간</span>
	                                            <ul class="list_ob list_ob_01">
	                                                <select class="EXP_DATA" id="EXP_DATA" name="EXP_DATA">
                                                        <option value="" <c:if test="${model.view.EXP_DATA == ''}">selected</c:if> >선택해주세요.</option>
	                                                	<option value="경험 없음" <c:if test="${model.view.EXP_DATA == '경험 없음'}">selected</c:if> >경험 없음</option>
	                                                	<option value="6개월이하" <c:if test="${model.view.EXP_DATA == '6개월 이하'}">selected</c:if> >6개월 이하</option>
	                                                	<option value="6개월~1년" <c:if test="${model.view.EXP_DATA == '6개월~1년'}">selected</c:if> >6개월~1년</option>
	                                                	<option value="1~2년" <c:if test="${model.view.EXP_DATA == '1년~2년'}">selected</c:if> >1년~2년</option>
	                                                	<option value="3년 이상" <c:if test="${model.view.EXP_DATA == '3년 이상'}">selected</c:if> >3년 이상</option>
	                                                	<option value="기타" <c:if test="${model.view.EXP_DATA == '기타'}">selected</c:if> >기타</option>
	                                                </select>
	                                            </ul>
	                                         </li>
                                                 
                                                 
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">자기소개서<br>(<span id="self_length">0</span>)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size" placeholder="아래의 내용이 포함 되어야 합니다.&#13;&#10;1. 지원 동기 : 영재키움 프로젝트 참여한 이유와 동기, 다짐과 각오 등&#13;&#10;2. 태도와 경험: 지원분야(수과학, 영어, 인문사회, 발명 등)에 대한 경험과 어려움을 극복한 사례 등&#13;&#10;3. 성취: 지원 분야 또는 이외의 분야에서 어려움을 이기고 성공한 경험과 사례 등">${model.view.SELF_INTR }</textarea>
	                                         </li>
	                                         </c:if>
	                                         <c:if test="${model.view.TYPE == '3' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">전공</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.view.TYPE_SUB }</li>
                                                </ul>
                                            </li>
                                                 
                                                 
                                                 
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 연수 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<span class="list_t" >유</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="yes" disabled <c:if test="${model.view.EXP_TYPE == 'yes' }">checked</c:if> >
                                                	<span class="list_t" >무</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="no" disabled  <c:if test="${model.view.EXP_TYPE == 'no' }">checked</c:if> >
                                                </ul>
                                            </li>     
                                                 
                                            
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">멘토교사 지원동기<br>(<span id="self_length">0</span>)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size" readonly="readonly" placeholder="아래의 내용이 포함 되어야 합니다.&#13;&#10;1. 지원 동기 : 영재키움 프로젝트 참여한 이유와 동기, 다짐과 각오 등&#13;&#10;2. 태도와 경험: 지원분야(수과학, 영어, 인문사회, 발명 등)에 대한 경험과 어려움을 극복한 사례 등&#13;&#10;3. 성취: 지원 분야 또는 이외의 분야에서 어려움을 이기고 성공한 경험과 사례 등">${model.view.SELF_INTR }</textarea>
	                                         </li>
	                                         </c:if>
	                                         <c:if test="${model.view.COMMENT != '' }">
											<li class="pd-lr-10">
	                                         	<span class="list_t">관리자 코멘트</span>
	                                         		<textarea type="text" name="COMMENT" id="COMMENT" class="COMMENT mr-2 textarea_size" >${model.view.COMMENT }</textarea>
	                                         </li>									          
	                                         </c:if>                              
                                        </ul>
                                    </div>
                                    </form>
                                  	<div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="cancel" onclick="MemberReUpdate('${model.view.NAME}','${model.view.BIRTH }','${model.view.TYPE }')">수정하기</a>
                                  			<a class="stat_update" onclick="MemberReDcmnt('${model.view.NAME}','${model.view.BIRTH }','${model.view.TYPE }','${model.view.IDX }')">제출 서류 확인</a>
                                  		</div>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                    </c:if>
                    <!-- 유형 2 , 3 end -->
                    
                    <!-- 유형 1 start -->
                    <c:if test="${model.mento_view.TYPE == '1' }">
                    <nav class="sub_min_size"  id="mento_member_insert">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>멘토 지원 신청서</p>
                                    </div>
                                    <!-- 멘토 지원서 -->
                                    
                                    <form action="" method="POST" name="member_re_mento_insert_form" id="mento_insertform" style="display:block" autocomplete="off">
                                    <input type="hidden" value="${model.mento_view.TYPE }" name="TYPE" id="TYPE" class="TYPE">
                                    <input type="hidden" value="" name="LEVEL" id="LEVEL" class="LEVEL" value="${model.mento_view.LEVEL}">
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="MEMBER_ID" value="${model.mento_view.MEMBER_ID }" />
                                    <input type="hidden" name="PASSWORD" id="PASSWORD" class="PASSWORD" value="${model.mento_view.PASSWORD }"/>
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <li>${model.mento_view.NAME }</li>
                                                </ul>
                                                <span class="list_t">성별</span>
                                               <ul class="list_ob list_ob_01">
                                                    <span>남</span><input type="radio" value="남자" name="SEX" class="SEX" id="SEX" <c:if test="${model.mento_view.SEX == '남자' }">checked</c:if>>
                                                    <span>여</span><input type="radio" value="여자" name="SEX" class="SEX" id="SEX"  <c:if test="${model.mento_view.SEX == '여자' }">checked</c:if> >
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<li>${model.mento_view.SCHOOL_NAME }</li>
                                                </ul>
                                                <input type="hidden" name="SCHOOL_TYPE" id="SCHOOL_TYPE" class="SCHOOL_TYPE" value="${model.mento_view.SCHOOL_TYPE }">
                                                <input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS" value="${model.mento_view.SCHOOL_ADDRESS }">
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" value="${model.mento_view.SCHOOL_LOCATION }">
                                            </li>
                                            
                                             <li class="pd-lr-10">
                                                <span class="list_t">학교급</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.mento_view.SCHOOL_TYPE }</li>
                                                </ul>
                                            </li>
                                    
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.mento_view.BIRTH }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">주소</span>
                                                <ul class="list_ob list_ob_02">
                                                	<li>${model.mento_view.ZIPCODE }</li>
                                                	<li>${model.mento_view.ADDRESS } - ${model.mento_view.ADDRESS_DETAIL }</li>
                                                </ul>
                                            </li>
                                            
                                             <li class="pd-lr-10">
                                            	<span class="list_t">연락처</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.mento_view.PHONE }</li>
                                            	</ul>
                                            </li>
                                            
											<li class="pd-lr-10">
                                            	<span class="list_t">이메일</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.mento_view.EMAIL }</li>
                                            	</ul>
                                            </li>
                                    
                                            <li class="pd-lr-10">
                                                <span class="list_t">전공</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.mento_view.TYPE_SUB }</li>
                                                </ul>
                                            </li>
	                                        
	                                        <li class="pd-lr-10">
	                                            <span class="list_t">영재 교육 연수 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<span class="list_t" >유</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="yes" <c:if test="${model.mento_view.EXP_TYPE == 'yes'}">checked</c:if> >
                                                	<span class="list_t" >무</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="no" <c:if test="${model.mento_view.EXP_TYPE == 'no'}">checked</c:if> >
                                                </ul>
	                                         </li>
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">멘토교사 지원동기<br>(<span id="self_length">0</span>)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size" readonly="readonly" placeholder="아래의 내용이 포함 되어야 합니다.&#13;&#10;1. 지원 동기 : 영재키움 프로젝트 참여한 이유와 동기, 다짐과 각오 등&#13;&#10;2. 태도와 경험: 지원분야(수과학, 영어, 인문사회, 발명 등)에 대한 경험과 어려움을 극복한 사례 등&#13;&#10;3. 성취: 지원 분야 또는 이외의 분야에서 어려움을 이기고 성공한 경험과 사례 등">${model.mento_view.SELF_INTR }</textarea>
	                                         </li>
	                                         <c:if test="${model.mento_view.COMMENT != '' }">
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">멘토교사 - 관리자 코멘트</span>
	                                         		<textarea type="text" name="COMMENT" id="COMMENT" class="COMMENT mr-2 textarea_size">${model.mento_view.COMMENT }</textarea>
	                                         </li>	
	                                         </c:if>
											                                        
                                        </ul>
                                    </div>
                                    </form>
                                    
                                    <!-- 학생 지원서 -->
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>학생 지원 신청서</p>
                                    </div>
                                    
                                    <form action="" method="POST" name="member_re_student_insert_form" id="student_insertform" style="display:block" autocomplete="off">
                                    <input type="hidden" value="${model.student_view.TYPE }" name="TYPE" id="TYPE" class="TYPE">
                                    <input type="hidden" value="" name="LEVEL" id="LEVEL" class="LEVEL" value="${model.student.view.LEVEL }">
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="MEMBER_ID" value="${model.student_view.MEMBER_ID }" />
                                    <input type="hidden" name="PASSWORD" id="PASSWORD" class="PASSWORD" value="${model.student_view.PASSWORD }"/>
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <input type="text" name="NAME" class="NAME" id="NAME" value="${model.student_view.NAME }">
                                                </ul>
                                                <span class="list_t">성별</span>
                                               <ul class="list_ob list_ob_01">
                                                    <span>남</span><input type="radio" value="남자" name="SEX" class="SEX" id="SEX" <c:if test="${model.student_view.SEX == '남자' }">checked</c:if>>
                                                    <span>여</span><input type="radio" value="여자" name="SEX" class="SEX" id="SEX"  <c:if test="${model.student_view.SEX == '여자' }">checked</c:if> >
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<li>${model.student_view.SCHOOL_NAME }</li>
                                                </ul>
                                                <input type="hidden" name="SCHOOL_TYPE" id="SCHOOL_TYPE" class="SCHOOL_TYPE" value="${model.student_view.SCHOOL_TYPE }">
                                                <input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS" value="${model.student_view.SCHOOL_ADDRESS }">
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" value="${model.student_view.SCHOOL_LOCATION }">
                                            </li>
                                            
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학년</span>
                                                <select name="SCHOOL_YEAR" id="SCHOOL_YEAR" class="SCHOOL_YEAR">
                                                	<option value="">학년 선택</option>
													<option value="4" <c:if test="${model.student_view.SCHOOL_YEAR == '4' }">selected</c:if> >초등학교 4학년</option>
													<option value="5" <c:if test="${model.student_view.SCHOOL_YEAR == '5' }">selected</c:if> >초등학교 5학년</option>
													<option value="6" <c:if test="${model.student_view.SCHOOL_YEAR == '6' }">selected</c:if> >초등학교 6학년</option>
													<option value="7" <c:if test="${model.student_view.SCHOOL_YEAR == '7' }">selected</c:if> >중학교 1학년</option>
													<option value="8" <c:if test="${model.student_view.SCHOOL_YEAR == '8' }">selected</c:if> >중학교 2학년</option>
													<option value="9" <c:if test="${model.student_view.SCHOOL_YEAR == '9' }">selected</c:if> >중학교 3학년</option>
													<option value="10" <c:if test="${model.student_view.SCHOOL_YEAR == '10' }">selected</c:if> >고등학교 1학년</option>
												</select>
                                                <span calss="list_t">반</span>
                                                <select name="SCHOOL_GROUP" id="SCHOOL_GROUP" class="SCHOOL_GROUP">
                                                	<option value="">반 선택</option>
                                                	<c:forEach var="i" begin="1" end="10" >
                                                		<option value="${i }" <c:if test="${model.student_view.SCHOOL_GROUP == i }">selected</c:if>>${i }</option>
                                                	</c:forEach>
                                                </select>
                                            </li>
                                            
                                             <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <ul class="list_ob list_ob_01">
                                                	<li>${model.student_view.BIRTH }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">주소</span>
                                                <ul class="list_ob list_ob_02">
                                                	<li>${model.student_view.ZIPCODE }</li>
                                                	<li>${model.student_view.ADDRESS } - ${model.student_view.ADDRESS_DETAIL }</li>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">연락처</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.student_view.PHONE }</li>
                                            	</ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">보호자 연락처</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.student_view.PARENT_PHONE }</li>
                                            	</ul>
                                            </li>
											
											<li class="pd-lr-10">
                                            	<span class="list_t">이메일</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<li>${model.student_view.EMAIL }</li>
                                            	</ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
												<span class="list_t">지원 분야</span>
												<ul class="list_ob list_ob_01">
                                                    <li id="TYPE_SUB" value="${model.student_view.TYPE_SUB }">${model.student_view.TYPE_SUB }</li>
                                                </ul>
											</li>


											<li class="pd-lr-10">
												<span class="list_t">지원 자격</span>
												<ul class="list_ob list_ob_01">
                                                    <li id="ELIGIBILITY" value="${model.student_view.ELIGIBILITY }">${model.student_view.ELIGIBILITY }</li>
                                                </ul>
											</li>
											
											
                                           <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<select class="EXP_TYPE" id="EXP_TYPE" name="EXP_TYPE">
                                                		<option value="" <c:if test="${model.student_view.EXP_TYPE == ''}">selected</c:if> >선택해주세요.</option>
                                                		<option value="no" <c:if test="${model.student_view.EXP_TYPE == 'no'}">selected</c:if> >무</option>
                                                		<option value="영재학급" <c:if test="${model.student_view.EXP_TYPE == '영재학급'}">selected</c:if> >영재학급</option>
                                                		<option value="영재교육원" <c:if test="${model.student_view.EXP_TYPE == '영재교육원'}">selected</c:if> >영재교육원</option>
                                                		<option value="대학부설 과학영재교육원" <c:if test="${model.student_view.EXP_TYPE == '대학부설 과학영재교육원'}">selected</c:if> >대학부설 과학영재교육원</option>
                                                		<option value="기타" <c:if test="${model.student_view.EXP_TYPE == '기타'}">selected</c:if> >기타</option>
                                                	</select>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
	                                            <span class="list_t">영재 교육 참여 기간</span>
	                                            <ul class="list_ob list_ob_01">
	                                                <select class="EXP_DATA" id="EXP_DATA" name="EXP_DATA">
                                                        <option value="" <c:if test="${model.student_view.EXP_DATA == ''}">selected</c:if> >선택해주세요.</option>
	                                                	<option value="경험 없음" <c:if test="${model.student_view.EXP_DATA == '경험 없음'}">selected</c:if> >경험 없음</option>
	                                                	<option value="6개월이하" <c:if test="${model.student_view.EXP_DATA == '6개월 이하'}">selected</c:if> >6개월 이하</option>
	                                                	<option value="6개월~1년" <c:if test="${model.student_view.EXP_DATA == '6개월~1년'}">selected</c:if> >6개월~1년</option>
	                                                	<option value="1~2년" <c:if test="${model.student_view.EXP_DATA == '1년~2년'}">selected</c:if> >1년~2년</option>
	                                                	<option value="3년 이상" <c:if test="${model.student_view.EXP_DATA == '3년 이상'}">selected</c:if> >3년 이상</option>
	                                                	<option value="기타" <c:if test="${model.student_view.EXP_DATA == '기타'}">selected</c:if> >기타</option>
	                                                </select>
	                                            </ul>
	                                         </li>
	                                         
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">자기소개서<br>(<span id="self_length">0</span>)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size" readonly="readonly" placeholder="아래의 내용이 포함 되어야 합니다.&#13;&#10;1. 지원 동기 : 영재키움 프로젝트 참여한 이유와 동기, 다짐과 각오 등&#13;&#10;2. 태도와 경험: 지원분야(수과학, 영어, 인문사회, 발명 등)에 대한 경험과 어려움을 극복한 사례 등&#13;&#10;3. 성취: 지원 분야 또는 이외의 분야에서 어려움을 이기고 성공한 경험과 사례 등">${model.student_view.SELF_INTR }</textarea>
	                                         </li>
	                                         <c:if test="${model.student_view.COMMENT != '' }">
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">학생 - 관리자 코멘트</span>
	                                         		<textarea type="text" name="COMMENT" id="COMMENT" class="COMMENT mr-2 textarea_size">${model.student_view.COMMENT }</textarea>
	                                         </li>	
											</c:if>
                                        </ul>
                                    </div>
                                    <div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="cancel" onclick="MemberReUpdate('${model.mento_view.NAME}','${model.mento_view.BIRTH }','${model.mento_view.TYPE }')">수정하기</a>
                                  			<a class="stat_update" onclick="MemberReDcmnt('${model.mento_view.NAME}','${model.mento_view.BIRTH }','${model.mento_view.TYPE }','${model.mento_view.IDX }')">제출 서류 확인</a>
                                  		</div>
                                  </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </nav>
                    </c:if>
                    <!-- 유형 1 end -->
                    
                    
                    
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
					<p><span>TEL : </span>서울・강원・제주권역 (서울대학교) : 02-880-4477~8, 경기・인천권역 (인천대학교) : 032-835-4915, 충청・호남권역 (대전대학교) : 042-226-0701(혹은 0705), 경상권역 (부산대학교) : 051-510-1840~2</p>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
    
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function MemberReUpdate(name,birth,type){
		
		location.href="${pageContext.request.contextPath}/user/member_re/update.do?NAME="+name+"&BIRTH="+birth+"&TYPE="+type+"";
		
	}
	
	function MemberReDcmnt(name,birth,type,IDX){
		
		if(type != '3'){
	
			var ELIGIBILITY = $('#ELIGIBILITY').attr('value');
			
			location.href="${pageContext.request.contextPath}/user/member_re/document.do?IDX="+IDX+"&MEMBER_NAME="+name+"&BIRTH="+birth+"&TYPE="+type+"&ELIGIBILITY="+ELIGIBILITY+"";
			
		}else if(type == '3'){
			alert('유형3 은 제출하실 서류가 없습니다.');
		}else{
			alert('error-homepage reload please');
		}
		
	}

</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">

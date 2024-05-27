<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">
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
					<c:if test="${model.TYPE == '2' || model.TYPE == '3' }">
					<nav class="sub_min_size" id="member_check_form">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    
                                    <div class="title">
                                		<span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                		<p>안내</p>
                                    	<p style="color:#f55c5c">신규 지원 : 2024년에 처음으로 영재키움 프로젝트에 지원하는 경우</p>
                                    	<p style="color:#f55c5c">기존 참가자 : 2019 ~ 2023 년도 중 참여한 적이 있는 경우 또는 ID가 있는 경우 선택</p>
                                	</div>
                                    
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>지원 신청서</p>
                                    </div>
                                    
                                  	<div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="delete" onclick="MemberCheck('no','all')" >신규 지원</a>
                                  			<a class="delete" onclick="MemberCheck('yes','all')" >기존 참가자</a>
                                  		</div>
                                  </div>

                                </div>
                            </div>
                        </div>
                    </nav>
					
					<!-- 유형 2 , 3 start -->
                    <nav class="sub_min_size" style="display:none" id="member_insert">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                	
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>지원 신청서</p>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/user/member_re/insert.do" method="POST" name="member_re_insert_form" id="insertform" autocomplete="off">
                                    <input type="hidden" value="${model.TYPE }" name="TYPE" id="TYPE" class="TYPE">
                                    <c:if test="${model.TYPE == '2' }">
                                    <input type="hidden" value="11" name="LEVEL" id="LEVEL" class="LEVEL">
                                    </c:if>
                                    <c:if test="${model.TYPE == '3' }">
                                    <input type="hidden" value="8" name="LEVEL" id="LEVEL" class="LEVEL">
                                    </c:if>
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="MEMBER_ID" />
                                    <input type="hidden" name="PASSWORD" id="PASSWORD" class="PASSWORD" />
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <input type="text" name="NAME" class="NAME" id="NAME" >
                                                </ul>
                                                <span class="list_t">성별</span>
                                                <ul class="list_ob list_ob_01">
                                                    <span>남</span><input type="radio" value="남자" name="SEX" class="SEX" id="SEX" >
                                                    <span>여</span><input type="radio" value="여자" name="SEX" class="SEX" id="SEX" >
                                                </ul>
                                            </li>
                                            <c:if test="${model.TYPE == '2' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<input type="text" name="SCHOOL_NAME" class="SCHOOL_NAME" id="SCHOOL_NAME" readonly="readonly">
                                                </ul>
                                                <span><button type="button" onclick="SchoolSearch('no')">학교 검색</button></span>
                                                <span><button type="button" onclick="SchoolInputOpen('student');">직접 입력</button></span>
                                            </li>
                                            <li style="display:none" id="SCHOOL_ADD">
                                            	<span class="list_t">학교 주소</span>
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" placeholder="학교지역을 작성 해주세요">
                                                <span style="color:red">예시 : 충청남도 : 충남 / 경상남도 : 경남 등으로 작성해주세요</span>
                                                <div class="address_02">
                                                <input type="hidden" name="SCHOOL_TYPE" id="SCHOOL_TYPE" class="SCHOOL_TYPE" placeholder="학교 급을 작성하여주세요">
                                                <span style="color:red">예시 : 초등학교 / 중학교 / 고등학교 으로 작성해주세요</span>
                                                </div>
                                                <div class="address_02">
                                                	<input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS input_address" placeholder="학교 주소를 작성하여주세요.">
                                                </div>
                                            </li>
                                            
                                            </c:if>
                                            
                                            
                                            
                                            <c:if test="${model.TYPE == '3' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<input type="text" name="SCHOOL_NAME" class="SCHOOL_NAME" id="SCHOOL_NAME">
                                                </ul>
                                                <span><button type="button" onclick="SchoolSearch('no-mento')">학교 검색</button></span>
                                                <span><button type="button" onclick="SchoolInputOpen('mento');">직접 입력</button></span>
                                            </li>
                                            <li class="pd-lr-10">
                                            	<span class="list_t">학교급</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<select id="SCHOOL_TYPE" name="SCHOOL_TYPE" class="SCHOOL_TYPE">
                                            			<option value="">선택하여주세요.</option>
                                            			<option value="초등교사">초등교사</option>
                                            			<option value="중등교사">중등교사</option>
                                            		</select>
                                            	</ul>
                                            </li>
                                            <li style="display:none" id="SCHOOL_ADD">
                                            	<span class="list_t">학교 주소</span>
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" placeholder="학교지역을 작성 해주세요">
                                                <span style="color:red">예시 : 충청남도 : 충남 / 경상남도 : 경남 등으로 작성해주세요</span>
                                                <div class="address_02">
                                                	<input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS input_address" placeholder="학교 주소를 작성하여주세요.">
                                                </div>
                                            </li>
                                            </c:if>
                                            
                                            <!-- 학생 학년 , 반 선택 -->
                                            <c:if test="${model.TYPE == '2' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">학년</span>
                                                <select name="SCHOOL_YEAR" id="SCHOOL_YEAR" class="SCHOOL_YEAR">
                                                	<option value="">학년 선택</option>
													<option value="4">초등학교 4학년</option>
													<option value="5">초등학교 5학년</option>
													<option value="6">초등학교 6학년</option>
													<option value="7">중학교 1학년</option>
													<option value="8">중학교 2학년</option>
													<option value="9">중학교 3학년</option>
													<option value="10">고등학교 1학년</option>
												</select>
                                                <span calss="list_t">반</span>
                                                <select name="SCHOOL_GROUP" id="SCHOOL_GROUP" class="SCHOOL_GROUP">
                                                	<option value="">반 선택</option>
                                                	<c:forEach var="i" begin="1" end="10" >
                                                		<option value="${i }">${i }</option>
                                                	</c:forEach>
                                                </select>
                                            </li>
                                            </c:if>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <input type="text" name="BIRTH" id="BIRTH" class="BIRTH" readonly="readonly">
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">주소</span>
                                                <input type="text" name="ZIPCODE" id="ZIPCODE" class="ZIPCODE" readonly="readonly">
                                                <button type="button" onclick="zipCode()">주소 찾기</button>
                                                <div class="address_02">
                                                <input type="text" name="ADDRESS" id="ADDRESS" class="ADDRESS input_address" readonly="readonly">
                                                <input type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" class="ADDRESS_DETAIL input_address" placeholder="상세주소를 입력하여주세요.">
                                            	</div>
                                            	<input type="hidden" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" class="ADDRESS_LOCAL">
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">연락처</span>
                                            	<input type="number" name="PHONE" id="PHONE" class="PHONE" oninput="max_length(this,11)" onkeydown="return onlyNumber();">
                                            	<span class="relate_c">연락처는 숫자만 입력해주세요.</span>
                                            </li>
                                            
                                            <!-- 학생 보호자 연락처 -->
                                            <c:if test="${model.TYPE == '2' }">
                                            <li class="pd-lr-10">
                                            	<span class="list_t">보호자 연락처</span>
                                            	<input type="number" name="PARENT_PHONE" id="PARENT_PHONE" class="PARENT_PHONE" oninput="max_length(this,11)" onkeydown="return onlyNumber();">
                                            	<span class="relate_c">연락처는 숫자만 입력해주세요.</span>
                                            </li>
                                            </c:if>
											
											<li class="pd-lr-10">
                                            	<span class="list_t">이메일</span>
                                            	<input type="text" name="EMAIL_FIRST" id="EMAIL_FIRST" class="EMAIL_FIRST">
                                            	@
                                            	<input type="text" name="EMAIL_LAST" id="EMAIL_LAST" class="EMAIL_LAST">
                                            	<select id="EMAIL_LAST_SELECT" class="EMAIL_LAST_SELECT" onchange="EmailChange(this)">
                                            		<option value="">직접 입력</option>
                                            		<option value="naver.com">naver.com</option>
                                            		<option value="daum.net">daum.net</option>
                                            		<option value="gmail.com">gmail.com</option>
                                            	</select>
                                            	<input type="hidden" name="EMAIL" id="EMAIL" class="EMAIL">
                                            </li>
											
											
											<c:if test="${model.TYPE == '2' }">
												<li class="pd-lr-10">
	                                            	<span class="list_t">지원분야</span>
	                                            	<select class="TYPE_SUB" id="TYPE_SUB" name="TYPE_SUB">
	                                            		<option value="">선택해주세요.</option>
	                                            		<option value="수학">수학</option>
	                                            		<option value="과학">과학</option>
	                                            		<option value="수·과학">수·과학</option>
	                                            		<option value="발명">발명</option>
	                                            		<option value="정보">정보</option>
	                                            		<option value="인문사회">인문사회</option>
	                                            	</select>
	                                            </li>
											</c:if>
											
											<c:if test="${model.TYPE == '3' }">
												<li class="pd-lr-10">
	                                            	<span class="list_t">전공</span>
	                                            	<input type="text" class="TYPE_SUB" id="TYPE_SUB" name="TYPE_SUB" >
	                                            </li>
											</c:if>
											
											
											<c:if test="${model.TYPE == '2' }">
											
											<li class="pd-lr-10">
												<span class="list_t">지원 자격</span>
												<ul class="list_ob list_ob_01">
                                                    <select id="ELIGIBILITY" class="ELIGIBILITY input_address" name="ELIGIBILITY">
                                                    	<option value="">지원자격를 선택하여주세요.</option>
                                                    	<c:forEach var="item" items="${model.list }" varStatus="status">
                                                    		<option value="${item.DCMNT_TYPE }">${item.DCMNT_TYPE }</option>
                                                    	</c:forEach>
                                                    </select>
                                                </ul>
											</li>
											
											</c:if>
											
											<c:if test="${model.TYPE == '3' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 연수 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<span class="list_t" >유</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="yes">
                                                	<span class="list_t" >무</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="no" >
                                                </ul>
                                            </li>
	                                        </c:if>
	                                        
	                                        <c:if test="${model.TYPE == '2' }">
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<select class="EXP_TYPE" id="EXP_TYPE" name="EXP_TYPE">
                                                		<option value="">선택해주세요.</option>
                                                		<option value="no">무</option>
                                                		<option value="영재학급">영재학급</option>
                                                		<option value="영재교육원">영재교육원</option>
                                                		<option value="대학부설 과학영재교육원">대학부설 과학영재교육원</option>
                                                		<option value="기타">기타</option>
                                                	</select>
                                                </ul>
                                            </li>
	                                        </c:if>
	                                        
	                                        <c:if test="${model.TYPE == '2' }">
	                                        <li class="pd-lr-10">
	                                            <span class="list_t">영재 교육 참여 기간</span>
	                                            <ul class="list_ob list_ob_01">
	                                                <select class="EXP_DATA" id="EXP_DATA" name="EXP_DATA">
	                                                	<option value="">선택해주세요.</option>
	                                                	<option value="경험 없음">경험 없음</option>
	                                                	<option value="6개월이하">6개월 이하</option>
	                                                	<option value="6개월~1년">6개월~1년</option>
	                                                	<option value="1~2년">1년~2년</option>
	                                                	<option value="3년 이상">3년 이상</option>
	                                                	<option value="기타">기타</option>
	                                                </select>
	                                            </ul>
	                                         </li>
	                                         </c:if>
	                                         
	                                         
	                                         <c:if test="${model.TYPE == '2' }">
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">자기소개서 <br>(최대1000자 까지)<br>(<span id="self_length">0</span>/1000)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size" placeholder="아래의 내용이 포함 되어야 합니다.&#13;&#10;1. 지원 동기 : 영재키움 프로젝트 참여한 이유와 동기, 다짐과 각오 등&#13;&#10;2. 태도와 경험: 지원분야(수과학, 영어, 인문사회, 발명 등)에 대한 경험과 어려움을 극복한 사례 등&#13;&#10;3. 성취: 지원 분야 또는 이외의 분야에서 어려움을 이기고 성공한 경험과 사례 등"></textarea>
	                                         </li>
	                                         </c:if>
	                                         <c:if test="${model.TYPE == '3' }">
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">멘토교사 지원동기 <br>(최대1000자 까지)<br>(<span id="self_length">0</span>)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size"></textarea>
	                                         </li>
	                                         </c:if>
											                                        
                                        </ul>
                                    </div>
                                    </form>
                                  	<div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="cancel" onclick="MemberReInsert('${model.TYPE}')">제출하기</a>
                                  		</div>
                                  </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                    </c:if>
                    <!-- 유형 2 , 3 end -->
                    
                    <!-- 유형 1 start -->
                    <c:if test="${model.TYPE == '1' }">
                    <nav class="sub_min_size"  id="mento_member_insert">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                	<div class="title">
                                		<span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                		<p>안내</p>
                                    	<p style="color:#f55c5c">신규 지원 : 2023년에 처음으로 영재키움 프로젝트에 지원하는 경우</p>
                                    	<p style="color:#f55c5c">기존 참가자 : 2019 ~ 2022 년도 중 참여한 적이 있는 경우 또는 ID가 있는 경우 선택</p>
                                	</div>
                                
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>멘토 지원 신청서</p>
                                    </div>
                                    <!-- 멘토 지원서 -->
                                    
                                    <div class="board_btn_wrap" id="mento_btn">
                                  		<div class="board_btn">
                                  			<a class="delete" onclick="MemberCheck('no','mento')" >신규 지원</a>
                                  			<a class="delete" onclick="MemberCheck('yes','mento')" >기존 참가자</a>
                                  		</div>
                                  </div>
                                    
                                    <form action="" method="POST" name="member_re_mento_insert_form" id="mento_insertform" style="display:none" autocomplete="off">
                                    <input type="hidden" value="${model.TYPE }" name="TYPE" id="TYPE" class="TYPE">
                                    <input type="hidden" name="LEVEL" id="LEVEL" class="LEVEL" value="8">
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="MEMBER_ID" />
                                    <input type="hidden" name="PASSWORD" id="PASSWORD" class="PASSWORD" />
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <input type="text" name="NAME" class="NAME" id="NAME" >
                                                </ul>
                                                <span class="list_t">성별</span>
                                                <ul class="list_ob list_ob_01">
                                                    <span>남</span><input type="radio" value="남자" name="SEX" class="SEX" id="SEX" >
                                                    <span>여</span><input type="radio" value="여자" name="SEX" class="SEX" id="SEX" >
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<input type="text" name="SCHOOL_NAME" class="SCHOOL_NAME" id="SCHOOL_NAME" readonly="readonly">
                                                   	<br>
                                                </ul>
                                                <span><button type="button" onclick="SchoolSearch('mento')">학교 검색</button></span>
                                                <span><button type="button" onclick="SchoolInputOpen('mento');">직접 입력</button></span>
                                                
                                            </li>
                                            
                                            <li style="display:none" id="SCHOOL_ADD">
                                            	<span class="list_t">학교 주소</span>
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" placeholder="학교지역을 작성 해주세요">
                                                <span style="color:red">예시 : 충청남도 : 충남 / 경상남도 : 경남 등으로 작성해주세요</span>
                                                <div class="address_02">
                                                	<input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS input_address" placeholder="학교 주소를 작성하여주세요.">
                                                </div>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">학교급</span>
                                            	<ul class="list_ob list_ob_01">
                                            		<select id="SCHOOL_TYPE" name="SCHOOL_TYPE" class="SCHOOL_TYPE">
                                            			<option value="">선택하여주세요.</option>
                                            			<option value="초등교사">초등교사</option>
                                            			<option value="중등교사">중등교사</option>
                                            		</select>
                                            	</ul>
                                            </li>
                                            
                                            
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <input type="text" name="BIRTH" id="BIRTH" class="BIRTH" readonly="readonly">
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">주소</span>
                                                <input type="text" name="ZIPCODE" id="ZIPCODE" class="ZIPCODE" readonly="readonly">
                                                <button type="button" onclick="zipCode('mento')">주소 찾기</button>
                                                <div class="address_02">
                                                <input type="text" name="ADDRESS" id="ADDRESS" class="ADDRESS input_address" readonly="readonly">
                                                <input type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" class="ADDRESS_DETAIL input_address" placeholder="상세주소를 입력하여주세요.">
                                            	</div>
                                            	<input type="hidden" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" class="ADDRESS_LOCAL">
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">연락처</span>
                                            	<input type="number" name="PHONE" id="PHONE" class="PHONE" oninput="max_length(this,11)" onkeydown="return onlyNumber();" onkeydown="return onlyNumber();">
                                            	<span class="relate_c">연락처는 숫자만 입력해주세요.</span>
                                            </li>
                                            
											<li class="pd-lr-10">
                                            	<span class="list_t">이메일</span>
                                            	<input type="text" name="EMAIL_FIRST" id="EMAIL_FIRST" class="EMAIL_FIRST">
                                            	@
                                            	<input type="text" name="EMAIL_LAST" id="EMAIL_LAST" class="EMAIL_LAST">
                                            	<select id="EMAIL_LAST_SELECT" class="EMAIL_LAST_SELECT" onchange="EmailChange(this,'mento')">
                                            		<option value="">직접 입력</option>
                                            		<option value="naver.com">naver.com</option>
                                            		<option value="daum.net">daum.net</option>
                                            		<option value="gmail.com">gmail.com</option>
                                            	</select>
                                            	<input type="hidden" name="EMAIL" id="EMAIL" class="EMAIL">
                                            </li>
											
											<li class="pd-lr-10">
                                            	<span class="list_t">전공</span>
                                            	<input type="text" class="TYPE_SUB" id="TYPE_SUB" name="TYPE_SUB" >
                                            </li>
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 연수 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<span class="list_t" >유</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="yes" >
                                                	<span class="list_t" >무</span>
                                                	<input type="radio" name="EXP_TYPE" id="EXP_TYPE" class="EXP_TYPE" value="no" >
                                                </ul>
                                            </li>
	                                         
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">멘토교사 지원동기 <br>(최대1000자 까지)<br>(<span id="self_length">0</span>/1000)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size"></textarea>
	                                         </li>
											                                        
                                        </ul>
                                    </div>
                                    </form>
                                    
                                    <!-- 학생 지원서 -->
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>학생 지원 신청서</p>
                                    </div>
                                    
                                    <div class="board_btn_wrap" id="student_btn">
                                  		<div class="board_btn">
                                  			<a class="delete" onclick="MemberCheck('no','student')" >신규 지원</a>	
                                  			<a class="delete" onclick="MemberCheck('yes','student')" >기존 참가자</a>
                                  		</div>
                                    </div>
                                    
                                    <form action="" method="POST" name="member_re_student_insert_form" id="student_insertform" style="display:none" autocomplete="off">
                                    <input type="hidden" value="${model.TYPE }" name="TYPE" id="TYPE" class="TYPE">
                                    <input type="hidden" name="LEVEL" id="LEVEL" class="LEVEL" value="11">
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" class="MEMBER_ID" />
                                    <input type="hidden" name="PASSWORD" id="PASSWORD" class="PASSWORD" />
                                   	<div id="pdf_wrap" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                            <li class="pd-lr-10">
                                                <span class="list_t">이름</span>
                                                <ul class="list_ob list_ob_01">
                                                    <input type="text" name="NAME" class="NAME" id="NAME" >
                                                </ul>
                                                <span class="list_t">성별</span>
                                                <ul class="list_ob list_ob_01">
                                                    <span>남</span><input type="radio" value="남자" name="SEX" class="SEX" id="SEX" >
                                                    <span>여</span><input type="radio" value="여자" name="SEX" class="SEX" id="SEX" >
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학교명</span>
                                                <ul class="list_ob list_ob_01">
                                                   	<input type="text" name="SCHOOL_NAME" class="SCHOOL_NAME" id="SCHOOL_NAME" readonly="readonly">
                                                </ul>
                                                <span><button type="button" onclick="SchoolSearch('student')">학교 검색</button></span>
                                                <span><button type="button" onclick="SchoolInputOpen('student');">직접 입력</button></span>
                                            </li>
                                            
                                            <li style="display:none" id="SCHOOL_ADD">
                                            	<span class="list_t">학교 주소</span>
                                                <input type="hidden" name="SCHOOL_LOCATION" id="SCHOOL_LOCATION" class="SCHOOL_LOCATION" placeholder="학교지역을 작성 해주세요">
                                                <span style="color:red">예시 : 충청남도 : 충남 / 경상남도 : 경남 등으로 작성해주세요</span>
                                                <div class="address_02">
                                                <input type="hidden" name="SCHOOL_TYPE" id="SCHOOL_TYPE" class="SCHOOL_TYPE" placeholder="학교 급을 작성하여주세요">
                                                <span style="color:red">예시 : 초등학교 / 중학교 / 고등학교 으로 작성해주세요</span>
                                                </div>
                                                <div class="address_02">
                                                	<input type="hidden" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" class="SCHOOL_ADDRESS input_address" placeholder="학교 주소를 작성하여주세요.">
                                                </div>
                                            </li>
                                            
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">학년</span>
                                                <select name="SCHOOL_YEAR" id="SCHOOL_YEAR" class="SCHOOL_YEAR">
                                                	<option value="">학년 선택</option>
													<option value="4">초등학교 4학년</option>
													<option value="5">초등학교 5학년</option>
													<option value="6">초등학교 6학년</option>
													<option value="7">중학교 1학년</option>
													<option value="8">중학교 2학년</option>
													<option value="9">중학교 3학년</option>
													<option value="10">고등학교 1학년</option>
												</select>
                                                <span calss="list_t">반</span>
                                                <select name="SCHOOL_GROUP" id="SCHOOL_GROUP" class="SCHOOL_GROUP">
                                                	<option value="">반 선택</option>
                                                	<c:forEach var="i" begin="1" end="10" >
                                                		<option value="${i }">${i }</option>
                                                	</c:forEach>
                                                </select>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">생년월일</span>
                                                <input type="text" name="BIRTH" id="BIRTH" class="BIRTH" readonly="readonly">
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                                <span class="list_t">주소</span>
                                                <input type="text" name="ZIPCODE" id="ZIPCODE" class="ZIPCODE" readonly="readonly">
                                                <button type="button" onclick="zipCode('student')">주소 찾기</button>
                                                <div class="address_02">
                                                <input type="text" name="ADDRESS" id="ADDRESS" class="ADDRESS input_address" readonly="readonly">
                                                <input type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" class="ADDRESS_DETAIL input_address" placeholder="상세주소를 입력하여주세요.">
                                            	</div>
                                            	<input type="hidden" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" class="ADDRESS_LOCAL">
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">연락처</span>
                                            	<input type="number" name="PHONE" id="PHONE" class="PHONE" oninput="max_length(this,11)" onkeydown="return onlyNumber();">
                                            	<span class="relate_c">연락처는 숫자만 입력해주세요.</span>
                                            </li>
                                            
                                            <li class="pd-lr-10">
                                            	<span class="list_t">보호자 연락처</span>
                                            	<input type="number" name="PARENT_PHONE" id="PARENT_PHONE" class="PARENT_PHONE" oninput="max_length(this,11)" onkeydown="return onlyNumber();">
                                            	<span class="relate_c">연락처는 숫자만 입력해주세요.</span>
                                            </li>
											
											<li class="pd-lr-10">
                                            	<span class="list_t">이메일</span>
                                            	<input type="text" name="EMAIL_FIRST" id="EMAIL_FIRST" class="EMAIL_FIRST">
                                            	@
                                            	<input type="text" name="EMAIL_LAST" id="EMAIL_LAST" class="EMAIL_LAST">
                                            	<select id="EMAIL_LAST_SELECT" class="EMAIL_LAST_SELECT" onchange="EmailChange(this,'student')">
                                            		<option value="">직접 입력</option>
                                            		<option value="naver.com">naver.com</option>
                                            		<option value="daum.net">daum.net</option>
                                            		<option value="gmail.com">gmail.com</option>
                                            	</select>
                                            	<input type="hidden" name="EMAIL" id="EMAIL" class="EMAIL">
                                            </li>
											
											<li class="pd-lr-10">
                                            	<span class="list_t">지원 분야</span>
                                            	<select class="TYPE_SUB" id="TYPE_SUB" name="TYPE_SUB">
                                            		<option value="">선택해주세요.</option>
                                            		<option value="수학">수학</option>
                                            		<option value="과학">과학</option>
                                            		<option value="수·과학">수·과학</option>
                                            		<option value="발명">발명</option>
                                            		<option value="정보">정보</option>
                                            		<option value="인문사회">인문사회</option>
                                            	</select>
                                            </li>
											
											<li class="pd-lr-10">
												<span class="list_t">지원 자격</span>
												<ul class="list_ob list_ob_01">
                                                    <select id="ELIGIBILITY" class="ELIGIBILITY input_address" name="ELIGIBILITY">
                                                    	<option value="">지원자격를 선택하여주세요.</option>
                                                    	<c:forEach var="item" items="${model.list }" varStatus="status">
                                                    		<option value="${item.DCMNT_TYPE }">${item.DCMNT_TYPE }</option>
                                                    	</c:forEach>
                                                    </select>
                                                </ul>
											</li>
											
											
                                            <li class="pd-lr-10">
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <ul class="list_ob list_ob_01">
                                                	<select class="EXP_TYPE" id="EXP_TYPE" name="EXP_TYPE">
                                                		<option value="">선택해주세요.</option>
                                                		<option value="no">무</option>
                                                		<option value="영재학급">영재학급</option>
                                                		<option value="영재교육원">영재교육원</option>
                                                		<option value="대학부설 과학영재교육원">대학부설 과학영재교육원</option>
                                                		<option value="기타">기타</option>
                                                	</select>
                                                </ul>
                                            </li>
                                            
                                            <li class="pd-lr-10">
	                                            <span class="list_t">영재 교육 참여 기간</span>
	                                            <ul class="list_ob list_ob_01">
	                                                <select class="EXP_DATA" id="EXP_DATA" name="EXP_DATA">
	                                                	<option value="">선택해주세요.</option>
	                                                	<option value="경험 없음">경험 없음</option>
	                                                	<option value="6개월이하">6개월 이하</option>
	                                                	<option value="6개월~1년">6개월~1년</option>
	                                                	<option value="1~2년">1년~2년</option>
	                                                	<option value="3년 이상">3년 이상</option>
	                                                	<option value="기타">기타</option>
	                                                </select>
	                                            </ul>
	                                         </li>
	                                         
	                                         <li class="pd-lr-10">
	                                         	<span class="list_t">자기소개서 <br>(최대1000자 까지)<br>(<span id="self_length">0</span>/1000)</span>
	                                         		<textarea type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" class="SELF_INTR mr-2 textarea_size" placeholder="아래의 내용이 포함 되어야 합니다.&#13;&#10;1. 지원 동기 : 영재키움 프로젝트 참여한 이유와 동기, 다짐과 각오 등&#13;&#10;2. 태도와 경험: 지원분야(수과학, 영어, 인문사회, 발명 등)에 대한 경험과 어려움을 극복한 사례 등&#13;&#10;3. 성취: 지원 분야 또는 이외의 분야에서 어려움을 이기고 성공한 경험과 사례 등"></textarea>
	                                         </li>
											                                        
                                        </ul>
                                    </div>
                                    <div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="cancel" onclick="MemberReInsert('${model.TYPE}')">제출하기</a>
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

	 <!-- 기존 유저 확인 모달-->
    <div class="danger_modal_area" id="MemberCheckModal">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>기존 유저 확인</h2>
                <input type="text" name="MODAL_NAME" id="MODAL_NAME" class="MODAL_NAME" placeholder="이름을 입력하여주세요.">
                <input type="text" name="MODAL_ID" id="MODAL_ID" class="MODAL_ID" placeholder="아이디를 입력하여주세요.">
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <button type="button" id="member_check_button" onclick="javascript:member_view()">확인</button>
                </li>
                <li class="danger_btn_02">
                    <button type="button" onclick="$('.danger_modal_area').css('display','none');$('.danger_bg').css('display','none')">아니요</button>
                </li>
            </ul>
        </div>
    </div>
    <!--제출성공 모달 end-->
    
    <!-- 모달 배경 -->
    <div class="danger_bg"></div>
    
    
 
    <!--본문 end-->
    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    
    <%@ include file="../include/footerJs.jsp" %>
    
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 유형 1 스크립트 -->
<c:if test="${model.TYPE == '1'}">
<script type=text/javascript>
	
	
function SchoolInputOpen(TYPE){
	console.log(TYPE);
	$('#'+TYPE+'_insertform #SCHOOL_NAME').attr('readonly',false);
    $('#'+TYPE+'_insertform #SCHOOL_ADD').show();
    $('#'+TYPE+'_insertform #SCHOOL_ADDRESS').attr('type','text');
    if(TYPE == 'student'){
    	$('#'+TYPE+'_insertform #SCHOOL_TYPE').attr('type','text');	
    }
    $('#'+TYPE+'_insertform #SCHOOL_LOCATION').attr('type','text');
	
}
	
	
function onlyNumber(){
	  console.log(event.keyCode);
	  if((event.keyCode > 48 && event.keyCode < 57 ) || event.keyCode == 109){
	
	  	event.returnValue=false;
	  }else{
		event.returnValue=true;
	}
}
	
$.datetimepicker.setLocale('ko');
jQuery('.BIRTH').datetimepicker({
    format: 'Y.m.d',
    lang: "ko",
    timepicker: false
});
	
	// 기존/신규 확인
	function MemberCheck(data,type_data){
		
		if(data == 'yes'){
			$('#MemberCheckModal').css('display','block');
			$('.danger_bg').css('display','block');
			$('#member_check_button').attr('onclick','javascript:member_view('+'"'+type_data+'"'+')');
		}else if(data == 'no'){
			$('#'+type_data+'_btn').css('display','none');
			$('#'+type_data+'_insertform').css('display','block');
		}else{
			alert('error');
		}
		
	}
	
	// 기존 멤버 확인
	function member_view(type_data){
		
		var NAME = $('#MODAL_NAME').val();
		var MEMBER_ID = $('#MODAL_ID').val();
		
		$('#MODAL_NAME').val('');
		$('#MODAL_ID').val('');
		
		$.ajax({
			type : 'POST',
			url : '${pageConext.request.contextPath}/user/member_re/membercheck.do',
			cache : false,
			data : ({
				NAME : NAME,
				MEMBER_ID : MEMBER_ID
			}),
			dataType : 'json',
			success : function(data , xhr , status){
				console.log(data);
				if(data != 'FALSE'){
					MemberInsert(data,type_data);		
				}else{
					Swal.fire('입력한 정보를 \n다시한번 확인해주세요.');
				}
				$('.danger_modal_area').css('display','none');
				$('.danger_bg').css('display','none');
			},
			error : function(xhr , status){
				console.log('error');
			}
		})
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	
	function MemberInsert(data,type_data){
		
	
		console.log(data);
		console.log(type_data);
		
		//공통 부분
		$('#'+type_data+'_insertform #MEMBER_ID').val(data.member_ID);
		$('#'+type_data+'_insertform #PASSWORD').val(data.password)
		$('#'+type_data+'_insertform #NAME').val(data.name);
		$('#'+type_data+'_insertform input:radio[name="SEX"]:radio[value="'+data.sex+'"]').prop('checked',true);
		$('#'+type_data+'_insertform #ZIPCODE').val(data.zipcode)
		$('#'+type_data+'_insertform #ADDRESS').val(data.address);
		$('#'+type_data+'_insertform #ADDRESS_DETAIL').val(data.address_DETAIL);
		$('#'+type_data+'_insertform #ADDRESS_LOCAL').val(data.address_LOCAL);
		$('#'+type_data+'_insertform #BIRTH').val(data.birth);
		$('#'+type_data+'_insertform #PHONE').val(data.phone);
		$('#'+type_data+'_insertform #SCHOOL_NAME').val(data.school_NAME);
		$('#'+type_data+'_insertform #SCHOOL_TYPE').val(data.school_TYPE);
		$('#'+type_data+'_insertform #SCHOOL_ADDRESS').val(data.school_ADDRESS);
		$('#'+type_data+'_insertform #SCHOOL_LOCATION').val(data.school_LOCAL);
		
		if(data.email != ''){
			var email_array = data.email.split('@');
			$('#'+type_data+'_insertform #EMAIL_LAST_SELECT').val(email_array[1]).prop('selected',true);
			$('#'+type_data+'_insertform #EMAIL_FIRST').val(email_array[0]);
			$('#'+type_data+'_insertform #EMAIL_LAST').val(email_array[1]);
		}
		
		
		//학생 , 교사 확인후 값 넣기
		if(type_data == 'student'){
			
			$('#'+type_data+'_insertform #SCHOOL_YEAR').val(data.school_YEAR).prop('selected',true);
			$('#'+type_data+'_insertform #SCHOOL_GROUP').val(data.school_GROUP).prop('selected',true);
			$('#'+type_data+'_insertform #PARENT_PHONE').val(data.parents_PHONE);
			$('#'+type_data+'_insertform #ELIGIBILITY').val(data.eligibility).prop('selected',true);
			
			
		}else if(type_data == 'mento'){
			
			
			
		}
	
		
		
		$('#'+type_data+'_btn').css('display','none');
		$('#'+type_data+'_insertform').css('display','block');
	}
	
	//학교 검색
	function SchoolSearch(type_data){
		
		window.open('${pageContext.request.contextPath}/user/member_re/school_search.do?TYPE_DATA='+type_data+'&SEARCH_TEXT=' , '_blank' , '학교 검색');
		
	}
	
		
	
	
		//집 주소 검색
		function zipCode(type_data) {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            console.log(data);
		            $('#'+type_data+'_insertform #ZIPCODE').val(data.zonecode);
		            $('#'+type_data+'_insertform  #ADDRESS').val(data.address);
		            $('#'+type_data+'_insertform #ADDRESS_LOCAL').val(data.sido);
		        }
		    }).open();
		}
		
	  //연락처 번호 글자수 제한
		function max_length(input,maxlength){
			if(input.value.length > maxlength){
				input.value = input.value.substr(0,maxlength);
			}
		}
	  
	  //이메일 변경
	  function EmailChange(data,type_data){
		  
		  console.log(data.value);
		  
		  if(data.value != ''){
			  $('#'+type_data+'_insertform #EMAIL_LAST').val(data.value);
			  $('#'+type_data+'_insertform #EMAIL_LAST').attr('readonly','readonly');
		  }else{
			  $('#'+type_data+'_insertform #EMAIL_LAST').val(data.value);
			  $('#'+type_data+'_insertform #EMAIL_LAST').attr('readonly',false);
		  }
		  
	  }
	  
	  //멘토교사 지원동기 작성 글 갯수 표현
	  $(document).ready(function() {
        $('#mento_insertform #SELF_INTR').on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#mento_insertform #self_length').text(self_length.length);
      	  })
      })
      
      //자기 소개서 작성 글 갯수 표현
	  $(document).ready(function() {
        $('#student_insertform #SELF_INTR').on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#student_insertform #self_length').text(self_length.length);
      	  })
      })
      
      //제출
	  function MemberReInsert(type){
		  
		  console.log('type : ' +type);
		  
		  if(type == '1'){
			  
			  $.ajax({
				  type : 'POST',
				  url : '${pageContext.request.contextPath}/user/member_re/matchingcnt.do',
			  })
			  
		  }
		  
		  
		  if(type == '1'){
			  //유형1
			  
			  $.ajax({
				  type : 'POST',
				  url : '${pageContext.request.contextPath}/user/member_re/matchingcnt.do',
				  dataType : 'json',
				  success : function(data , status , xhr){
					  
					  console.log(data);
					  
					  $('#mento_insertform #MATCHING').val(data);
					  $('#student_insertform #MATCHING').val(data);
					  

					  MemberFinalInsert(data);
					  
				  },
				  error : function(error , status , xhr){
					  
				  }
			  })
		  }
		  
	  }
	  
	  //유형1 => 최종입력폼 
	  function MemberFinalInsert(MATCHING){
		  
		  var EMAIL = $('#mento_insertform #EMAIL_FIRST').val() + '@' + $('#mento_insertform #EMAIL_LAST').val();
		  
		  $('#mento_insertform #EMAIL').val(EMAIL);
		  
		  var mento_birth = $('#mento_insertform #BIRTH').val();
		  
		  var mento_type = $('#mento_insertform #TYPE').val();
		  
		  var mento_name = $('#mento_insertform #NAME').val();
		  
		  var mento_el = $('#student_insertform #ELIGIBILITY').val();
		  
		  var ValueCheck1 = false;
		  
		  var ValueCheck2 = false;
		  
		  ValueCheck1 = MemberValueCheck('mento');
		  
		  console.log(ValueCheck1);
		  
		  var WhatResult = "true";
		  
		  if(ValueCheck1 == true){
			  
			  var STUDENT_EMAIL = $('#student_insertform #EMAIL_FIRST').val() + '@' + $('#student_insertform #EMAIL_LAST').val();
			  
			  $('#student_insertform #EMAIL').val(STUDENT_EMAIL);
			  
			  ValueCheck2 = MemberValueCheck('student');
			  
			  console.log(ValueCheck2);
		  }
		  
		
		  
		  
		  if(ValueCheck1 == true && ValueCheck2 == true){
			
			  
			  var MentoFormData = $('#mento_insertform').serialize();
			  
			  MentoFormData += "&MATCHING=" + MATCHING;
			  
			  if($('#mento_insertform #MEMBER_ID').val() == ''){
					
					var NAME = $('#mento_insertform #NAME').val();
					var BIRTH = $('#mento_insertform #BIRTH').val();
					var TYPE = $('#mento_insertform #TYPE').val();
					
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
						cache : false,
						data : ({
							NAME : NAME,
							BIRTH : BIRTH,
							TYPE : TYPE
						}),
						dataType : "json",
						success : function(data , status , xhr){
							console.log(data);
							
							var RESULT = data;
							
							if(data == 'true'){
								
								alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
								
								return;	
								
								
								
							}else if(data == 'false'){
							
								
								$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/user/member_re/insert.do",
									data : MentoFormData,
									success : function(status , xhr){
										
										console.log('멘토 제출 성공 하였습니다.');
									
										//학생 등록
										  
										  ValueCheck2 = MemberValueCheck('student');
										  
										  console.log(ValueCheck2);
										  
										  if(ValueCheck2 == true){
											  
											  var StudentFormData = $('#student_insertform').serialize();
											  
											  StudentFormData += "&MATCHING=" + MATCHING;
											  
											  if($('#student_insertform #MEMBER_ID').val() == ''){
													
													var NAME = $('#student_insertform #NAME').val();
													var BIRTH = $('#student_insertform #BIRTH').val();
													var TYPE = $('#student_insertform #TYPE').val();
													
													$.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
														cache : false,
														data : ({
															NAME : NAME,
															BIRTH : BIRTH,
															TYPE : TYPE
														}),
														dataType : "json",
														success : function(data , status , xhr){
															console.log(data);
															
															var RESULT = data;
															
															if(data == 'true'){
																alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
																
																WhatResult = 'false';
																
																return;	
															}else if(data == 'false'){
															
																
																$.ajax({
																	type : "POST",
																	url : "${pageContext.request.contextPath}/user/member_re/insert.do",
																	data : StudentFormData,
																	success : function(status , xhr){
																		
																		console.log('학생 제출 성공 하였습니다.');
																		
																		let timerInterval
													                    Swal.fire({
													                        toast : true,
													                        showConfirmButton: false,
													                      title: '제출이 완료되었습니다.',
													                      html: '3초뒤 서류 제출 페이지로 이동됩니다.',
													                      timer: 3000,
													                      timerProgressBar: true,
													                    }).then((result) => {
													                      /* Read more about handling dismissals below */
													                      if (result.dismiss === Swal.DismissReason.timer) {
													                        location.href='${pageContext.request.contextPath}/user/member_re/documentview.do?NAME='+mento_name+'&BIRTH='+mento_birth+'&TYPE='+mento_type+'&ELIGIBILITY='+mento_el+''; 
													                      }
													                    });
																	},
																	error : function(status , xhr , error){
																		
																		console.log('error');
																		alert('error');
																		
																	}
																})
																
															}
															
															
														},
														error : function(xhr , status , error){
															
															console.log('error');
														}
													})
													
													
													
												}else{
													
													
													var NAME = $('#student_insertform #NAME').val();
													var BIRTH = $('#student_insertform #BIRTH').val();
													var TYPE = $('#student_insertform #TYPE').val();
													
													$.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
														cache : false,
														data : ({
															NAME : NAME,
															BIRTH : BIRTH,
															TYPE : TYPE
														}),
														dataType : "json",
														success : function(data , status , xhr){
															console.log(data);
															
															var RESULT = data;
															
															if(data == 'true'){
																alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
																
																WhatResult = 'false';
																
																return;	
															}else if(data == 'false'){
															
																
																$.ajax({
																	type : "POST",
																	url : "${pageContext.request.contextPath}/user/member_re/insert.do",
																	data : StudentFormData,
																	success : function(status , xhr){
																		
																		console.log('학생 제출 성공 하였습니다.');
																		
																		let timerInterval
													                    Swal.fire({
													                        toast : true,
													                        showConfirmButton: false,
													                      title: '제출이 완료되었습니다.',
													                      html: '3초뒤 서류 제출 페이지로 이동됩니다.',
													                      timer: 3000,
													                      timerProgressBar: true,
													                    }).then((result) => {
													                      /* Read more about handling dismissals below */
													                      if (result.dismiss === Swal.DismissReason.timer) {
													                        location.href='${pageContext.request.contextPath}/user/member_re/documentview.do?NAME='+mento_name+'&BIRTH='+mento_birth+'&TYPE='+mento_type+'&ELIGIBILITY='+mento_el+''; 
													                      }
													                    });
																		
																	},
																	error : function(status , xhr , error){
																		
																		console.log('error');
																		alert('error');
																		
																	}
																})
																
															}
															
															
														},
														error : function(xhr , status , error){
															
															console.log('error');
														}
													})
													
												}
										  
											
											  
										  
									  }
									
									},
									error : function(status , xhr , error){
										
										console.log('error');
										alert('error');
										
									}
								})
								
							}
							
							
						},
						error : function(xhr , status , error){
							
							console.log('error');
						}
					})
					
					
				}else{
					
					
					var NAME = $('#mento_insertform #NAME').val();
					var BIRTH = $('#mento_insertform #BIRTH').val();
					var TYPE = $('#mento_insertform #TYPE').val();
					
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
						cache : false,
						data : ({
							NAME : NAME,
							BIRTH : BIRTH,
							TYPE : TYPE
						}),
						dataType : "json",
						success : function(data , status , xhr){
							console.log(data);
							
							var RESULT = data;
							
							if(data == 'true'){
								
								alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
								
								WhatResult = 'false';
								
								return;	
								
								
								return;	
								
							}else if(data == 'false'){
							
								
								$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/user/member_re/insert.do",
									data : MentoFormData,
									success : function(status , xhr){
										
										console.log('멘토 제출 성공 하였습니다.');
										
										//학생 등록
										  
										  ValueCheck2 = MemberValueCheck('student');
										  
										  console.log(ValueCheck2);
										  
										  if(ValueCheck2 == true){
											  
											  var StudentFormData = $('#student_insertform').serialize();
											  
											  StudentFormData += "&MATCHING=" + MATCHING;
											  
											  if($('#student_insertform #MEMBER_ID').val() == ''){
													
													var NAME = $('#student_insertform #NAME').val();
													var BIRTH = $('#student_insertform #BIRTH').val();
													var TYPE = $('#student_insertform #TYPE').val();
													
													$.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
														cache : false,
														data : ({
															NAME : NAME,
															BIRTH : BIRTH,
															TYPE : TYPE
														}),
														dataType : "json",
														success : function(data , status , xhr){
															console.log(data);
															
															var RESULT = data;
															
															if(data == 'true'){
																alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
																
																WhatResult = 'false';
																
																return;	
															}else if(data == 'false'){
															
																
																$.ajax({
																	type : "POST",
																	url : "${pageContext.request.contextPath}/user/member_re/insert.do",
																	data : StudentFormData,
																	success : function(status , xhr){
																		
																		console.log('학생 제출 성공 하였습니다.');
																		
																		let timerInterval
													                    Swal.fire({
													                        toast : true,
													                        showConfirmButton: false,
													                      title: '제출이 완료되었습니다.',
													                      html: '3초뒤 서류 제출 페이지로 이동됩니다.',
													                      timer: 3000,
													                      timerProgressBar: true,
													                    }).then((result) => {
													                      /* Read more about handling dismissals below */
													                      if (result.dismiss === Swal.DismissReason.timer) {
													                        location.href='${pageContext.request.contextPath}/user/member_re/documentview.do?NAME='+mento_name+'&BIRTH='+mento_birth+'&TYPE='+mento_type+'&ELIGIBILITY='+mento_el+''; 
													                      }
													                    });
																	},
																	error : function(status , xhr , error){
																		
																		console.log('error');
																		alert('error');
																		
																	}
																})
																
															}
															
															
														},
														error : function(xhr , status , error){
															
															console.log('error');
														}
													})
													
													
													
												}else{
													
													
													var NAME = $('#student_insertform #NAME').val();
													var BIRTH = $('#student_insertform #BIRTH').val();
													var TYPE = $('#student_insertform #TYPE').val();
													
													$.ajax({
														type : "post",
														url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
														cache : false,
														data : ({
															NAME : NAME,
															BIRTH : BIRTH,
															TYPE : TYPE
														}),
														dataType : "json",
														success : function(data , status , xhr){
															console.log(data);
															
															var RESULT = data;
															
															if(data == 'true'){
																alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
																
																WhatResult = 'false';
																
																return;	
															}else if(data == 'false'){
															
																
																$.ajax({
																	type : "POST",
																	url : "${pageContext.request.contextPath}/user/member_re/insert.do",
																	data : StudentFormData,
																	success : function(status , xhr){
																		
																		console.log('학생 제출 성공 하였습니다.');
																		
																		let timerInterval
													                    Swal.fire({
													                        toast : true,
													                        showConfirmButton: false,
													                      title: '제출이 완료되었습니다.',
													                      html: '3초뒤 서류 제출 페이지로 이동됩니다.',
													                      timer: 3000,
													                      timerProgressBar: true,
													                    }).then((result) => {
													                      /* Read more about handling dismissals below */
													                      if (result.dismiss === Swal.DismissReason.timer) {
													                        location.href='${pageContext.request.contextPath}/user/member_re/documentview.do?NAME='+mento_name+'&BIRTH='+mento_birth+'&TYPE='+mento_type+'&ELIGIBILITY='+mento_el+''; 
													                      }
													                    });
																		
																	},
																	error : function(status , xhr , error){
																		
																		console.log('error');
																		alert('error');
																		
																	}
																})
																
															}
															
															
														},
														error : function(xhr , status , error){
															
															console.log('error');
														}
													})
													
												}
										  
											
											  
										  
									  }
										
									},
									error : function(status , xhr , error){
										
										console.log('error');
										alert('error');
										
									}
								})
								
							}
							
							
						},
						error : function(xhr , status , error){
							
							console.log('error');
						}
					})
					
					
				}
			  
		  }
		  
		  
		  
		  
	  }
      
      //회원 필수값 확인 function
	  function MemberValueCheck(type_data){
			if(type_data == 'student'){
			  //학생
			  
			 if($('#'+type_data+'_insertform #NAME').val() == ''){
				 alert('학생 지원서 이름를 확인하여주세요.');
				 $('#'+type_data+'_insertform #NAME').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #SEX').val() == ''){
				 alert('학생 지원서 성별를 확인하여주세요.');
				 $('#'+type_data+'_insertform #SEX').focus();
				 return;
			 }
			  
			 if($('#'+type_data+'_insertform #SCHOOL_NAME').val() == ''){
				 alert('학생 지원서 학교명를 확인하여주세요.');
				 $('#'+type_data+'_insertform #SCHOOL_NAME').focus();
				 return;
			 }
			  
			 if($('#'+type_data+'_insertform #SCHOOL_YEAR').val() == ''){
				 alert('학생 지원서 학년를 확인하여주세요.');
				 $('#'+type_data+'_insertform #SCHOOL_YEAR').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #SCHOOL_GROUP').val() == ''){
				 alert('학생 지원서 반를 확인하여주세요.');
				 $('#'+type_data+'_insertform #SCHOOL_GROUP').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #BIRTH').val() == ''){
				 alert('학생 지원서 생년월일을 확인하여주세요.');
				 $('#'+type_data+'_insertform #BIRTH').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #ADDRESS').val() == ''){
				 alert('학생 지원서 주소를 확인하여주세요.');
				 $('#'+type_data+'_insertform #ADDRESS').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #ADDRESS_LOCAL').val() == ''){
				 alert('학생 지원서 상세 주소를 확인하여주세요.');
				 $('#'+type_data+'_insertform #ADDRESS_LOCAL').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #PHONE').val() == '' && $('#'+type_data+'_insertform #PARENT_PHONE').val() == ''){
				 alert('학생 지원서 연락처 혹은 보호자 연락처 둘중하나라도 작성하여주세요.');
				 $('#'+type_data+'_insertform #PHONE').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #EMAIL').val() == ''){
				 alert('학생 지원서 이메일을 확인하여주세요.');
				 $('#'+type_data+'_insertform #EMAIL_FIRST').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #ELIGIBILITY').val() == '' || $('#'+type_data+'_insertform #ELIGIBILITY').val() == null){
				 alert('학생 지원서 지원유형을 확인하여주세요.');
				 console.log('zzzz');
				 $('#'+type_data+'_insertform #ELIGIBILITY').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #SELF_INTR').val() == ''){
				 alert('학생 지원서 자기소개서를 확인하여주세요.');
				 console.log('????');
				 $('#'+type_data+'_insertform #SELF_INTR').focus();
				 return;
			 }
			
			 return true;
			 
		  }else if(type_data == 'mento'){
			  
			//교사
			  
			  
			 if($('#'+type_data+'_insertform #NAME').val() == ''){
				 alert('멘토 지원서 이름를 확인하여주세요.');
				 $('#'+type_data+'_insertform #NAME').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #SEX').val() == ''){
				 alert('멘토 지원서 성별를 확인하여주세요.');
				 $('#'+type_data+'_insertform #SEX').focus();
				 return;
			 }
			  
			 if($('#'+type_data+'_insertform #SCHOOL_NAME').val() == ''){
				 alert('멘토 지원서 학교명를 확인하여주세요.');
				 $('#'+type_data+'_insertform #SCHOOL_NAME').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #BIRTH').val() == ''){
				 alert('멘토 지원서 생년월일을 확인하여주세요.');
				 $('#'+type_data+'_insertform #BIRTH').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #ADDRESS').val() == ''){
				 alert('멘토 지원서 주소를 확인하여주세요.');
				 $('#'+type_data+'_insertform #ADDRESS').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #ADDRESS_LOCAL').val() == ''){
				 alert('멘토 지원서 상세 주소를 확인하여주세요.');
				 $('#'+type_data+'_insertform #ADDRESS_LOCAL').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #PHONE').val() == ''){
				 alert('멘토 지원서 연락처를 확인하여주세요.');
				 $('#'+type_data+'_insertform #PHONE').focus();
				 return;
			 }
			 
			 if($('#'+type_data+'_insertform #EMAIL').val() == ''){
				 alert('멘토 지원서 이메일을 확인하여주세요.');
				 $('#'+type_data+'_insertform #EMAIL_FIRST').focus();
				 return;
			 }
			
			 return true;
			  
			  
		  }
		  
	  }
	  
</script>
</c:if>

<!-- 유형 2,3 스크립트 -->
<c:if test="${model.TYPE == '2' || model.TYPE == '3'}">
<script type=text/javascript>
	
	
	
$.datetimepicker.setLocale('ko');
jQuery('.BIRTH').datetimepicker({
    format: 'Y.m.d',
    lang: "ko",
    timepicker: false
});


function SchoolInputOpen(TYPE){
	console.log();
	$('#SCHOOL_NAME').attr('readonly',false);
    $('#SCHOOL_ADD').show();
    $('#SCHOOL_ADDRESS').attr('type','text');
    if(TYPE == 'student'){
    	$('#SCHOOL_TYPE').attr('type','text');	
    }
    $('#SCHOOL_LOCATION').attr('type','text');
	
}
	
	// 기존/신규 확인
	function MemberCheck(data){
		
		if(data == 'yes'){
			$('#MemberCheckModal').css('display','block');
			$('.danger_bg').css('display','block');
		}else if(data == 'no'){
			$('#member_check_form').css('display','none');
			$('#member_insert').css('display','block');
		}else{
			alert('error');
		}
		
	}
	
	// 기존 멤버 확인
	function member_view(){
		
		var NAME = $('#MODAL_NAME').val();
		var MEMBER_ID = $('#MODAL_ID').val();
		
		$('#MODAL_NAME').val('');
		$('#MODAL_ID').val('');
		
		$.ajax({
			type : 'POST',
			url : '${pageConext.request.contextPath}/user/member_re/membercheck.do',
			cache : false,
			data : ({
				NAME : NAME,
				MEMBER_ID : MEMBER_ID
			}),
			dataType : 'json',
			success : function(data , xhr , status){
				console.log(data);
				if(data != 'FALSE'){
					if(data.level == '11' && ${model.TYPE} == '3'){
						Swal.fire('선택하신 유형을\n다시한번 확인해주세요.');
					}else if(data.level == '8' && ${model.TYPE} == '2'){
						Swal.fire('선택하신 유형을\n다시한번 확인해주세요.');
					}else{
						MemberInsert(data);	
					}	
				}else{
					Swal.fire('입력한 정보를 \n다시한번 확인해주세요.');
				}
				$('.danger_modal_area').css('display','none');
				$('.danger_bg').css('display','none');
			},
			error : function(xhr , status){
				console.log('error');
			}
		})
		
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	
	function MemberInsert(data){
	
		console.log(data);
		
		//공통 부분
		$('#MEMBER_ID').val(data.member_ID);
		$('#PASSWORD').val(data.password)
		$('#NAME').val(data.name);
		$('input:radio[name="SEX"]:radio[value="'+data.sex+'"]').prop('checked',true);
		$('#ZIPCODE').val(data.zipcode)
		$('#ADDRESS').val(data.address);
		$('#ADDRESS_DETAIL').val(data.address_DETAIL);
		$('#ADDRESS_LOCAL').val(data.address_LOCAL);
		$('#BIRTH').val(data.birth);
		$('#PHONE').val(data.phone);
		$('#SCHOOL_NAME').val(data.school_NAME);
		$('#SCHOOL_TYPE').val(data.school_TYPE);
		$('#SCHOOL_ADDRESS').val(data.school_ADDRESS);
		$('#SCHOOL_LOCATION').val(data.school_LOCAL);
		
		if(data.email != ''){
			var email_array = data.email.split('@');
			$('#EMAIL_LAST_SELECT').val(email_array[1]).prop('selected',true);
			$('#EMAIL_FIRST').val(email_array[0]);
			$('#EMAIL_LAST').val(email_array[1]);
		}
		
		
		//학생 부분
		if(data.level == '11'){
			$('#SCHOOL_YEAR').val(data.school_YEAR).prop('selected',true);
			$('#SCHOOL_GROUP').val(data.school_GROUP).prop('selected',true);
			$('#PARENT_PHONE').val(data.parents_PHONE);
			$('#ELIGIBILITY').val(data.eligibility).prop('selected',true);
		}
		
		//교사 부분
		if(data.level == '8'){
			
		}
		
		$('#member_check_form').css('display','none');
		$('#member_insert').css('display','block');
	}
	
	//학교 검색
	function SchoolSearch(type_data){
		
		window.open('${pageContext.request.contextPath}/user/member_re/school_search.do?TYPE_DATA='+type_data+'&SEARCH_TEXT=' , '_blank' , '학교 검색');
		
	}
		
	
	
		//집 주소 검색
		function zipCode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            console.log(data);
		            $('#ZIPCODE').val(data.zonecode);
		            $('#ADDRESS').val(data.address);
		            $('#ADDRESS_LOCAL').val(data.sido);
		        }
		    }).open();
		}
		
	  //연락처 번호 글자수 제한
		function max_length(input,maxlength){
			
		  	console.log(input.value);
		  	if(input.value == ''){
		  		event.returnValue=false;
		  	}
		  
		  	if(input.value.length > maxlength){
				input.value = input.value.substr(0,maxlength);
			}
		}
	  
	  function onlyNumber(){
		  console.log(event.keyCode);
		  if((event.keyCode > 48 && event.keyCode < 57 ) || event.keyCode == 109){
		
		  	event.returnValue=false;
		  }else{
			event.returnValue=true;
		}
	  }
	  
	  //이메일 변경
	  function EmailChange(data){
		  
		  console.log(data.value);
		  
		  if(data.value != ''){
			  $('#EMAIL_LAST').val(data.value);
			  $('#EMAIL_LAST').attr('readonly','readonly');
		  }else{
			  $('#EMAIL_LAST').val(data.value);
			  $('#EMAIL_LAST').attr('readonly',false);
		  }
		  
	  }
	  
	  //자기 소개서 작성 글 갯수 표현
	  $(document).ready(function() {
        $("#SELF_INTR").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length').text(self_length.length);
      	  })
      })
      
      //제출
	  function MemberReInsert(type){
		  
		  console.log('type : ' +type);
		  
		  
		  if(type == '1'){
			  //유형1
			  var ValueCheck = MemberValueCheck('1');
			  
		  }else if(type == '2'){
			  //유형2
			  $('#EMAIL').val($('#EMAIL_FIRST').val() + '@' + $('#EMAIL_LAST').val());
			  console.log($('#EMAIL').val());
			  var ValueCheck = MemberValueCheck('2');
			  if(ValueCheck == true){
				//$('#insertform').submit();
				
				var FormData = $('#insertform').serialize();
					
				console.log(FormData);
				
				if($('#MEMBER_ID').val() == ''){
					
					var NAME = $('#NAME').val();
					var BIRTH = $('#BIRTH').val();
					var TYPE = $('#TYPE').val();
					var el = $('#ELIGIBILITY').val();
					
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
						cache : false,
						data : ({
							NAME : NAME,
							BIRTH : BIRTH,
							TYPE : TYPE
						}),
						dataType : "json",
						success : function(data , status , xhr){
							console.log(data);
							
							var RESULT = data;
							
							if(data == 'true'){
								alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
								return;	
							}else if(data == 'false'){
								
								var FormData = $('#insertform').serialize();
								
								console.log(FormData);
								
								$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/user/member_re/insert.do",
									data : FormData,
									success : function(status , xhr){
										
										console.log('성공 하였습니다.');
										
										let timerInterval
					                    Swal.fire({
					                        toast : true,
					                        showConfirmButton: false,
					                      title: '제출이 완료되었습니다.',
					                      html: '3초뒤 서류 제출 페이지로 이동됩니다.',
					                      timer: 3000,
					                      timerProgressBar: true,
					                    }).then((result) => {
					                      if (result.dismiss === Swal.DismissReason.timer) {
					                    	  location.href='${pageContext.request.contextPath}/user/member_re/documentview.do?NAME='+NAME+'&BIRTH='+BIRTH+'&TYPE='+type+'&ELIGIBILITY='+el+''; 
					                      }
					                    })
										
									},
									error : function(status , xhr , error){
										
										console.log('error');
										alert('error');
										
									}
								})
								
								
							}
							
							
						},
						error : function(xhr , status , error){
							
							console.log('error');
						}
					})
					
					
					
				}else{
					
					var FormData = $('#insertform').serialize();
					
					console.log(FormData);
					
					var NAME = $('#NAME').val();
					var BIRTH = $('#BIRTH').val();
					var TYPE = $('#TYPE').val();
					var el = $('#ELIGIBILITY').val();
					
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
						cache : false,
						data : ({
							NAME : NAME,
							BIRTH : BIRTH,
							TYPE : TYPE
						}),
						dataType : "json",
						success : function(data , status , xhr){
							console.log(data);
							
							var RESULT = data;
							
							if(data == 'true'){
								alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
								return;	
							}else if(data == 'false'){
								
								var FormData = $('#insertform').serialize();
								
								console.log(FormData);
								
								$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/user/member_re/insert.do",
									data : FormData,
									success : function(status , xhr){
										
										console.log('성공 하였습니다.');
										
										let timerInterval
					                    Swal.fire({
					                        toast : true,
					                        showConfirmButton: false,
					                      title: '제출이 완료되었습니다.',
					                      html: '3초뒤 서류 제출 페이지로 이동됩니다.',
					                      timer: 3000,
					                      timerProgressBar: true,
					                    }).then((result) => {
					                      /* Read more about handling dismissals below */
					                      if (result.dismiss === Swal.DismissReason.timer) {
					                    	  location.href='${pageContext.request.contextPath}/user/member_re/documentview.do?NAME='+NAME+'&BIRTH='+BIRTH+'&TYPE='+type+'&ELIGIBILITY='+el+''; 
					                      }
					                    })
										
									},
									error : function(status , xhr , error){
										
										console.log('error');
										alert('error');
										
									}
								})
								
							}
							
							
						},
						error : function(xhr , status , error){
							
							console.log('error');
						}
					})
					
				}
				
			  }else{
				  
			  }
			  
			  
		  }else if(type == '3'){
			  //유형3
			  $('#EMAIL').val($('#EMAIL_FIRST').val() + '@' + $('#EMAIL_LAST').val());
			  var ValueCheck = MemberValueCheck('3');
			  if(ValueCheck == true){
					//$('#insertform').submit();
					
					var FormData = $('#insertform').serialize();
					
					console.log(FormData);
					
					if($('#MEMBER_ID').val() == ''){
						
						var NAME = $('#NAME').val();
						var BIRTH = $('#BIRTH').val();
						var TYPE = $('#TYPE').val();
						
						$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/user/member_re/membercheck2.do",
							cache : false,
							data : ({
								NAME : NAME,
								BIRTH : BIRTH,
								TYPE : TYPE
							}),
							dataType : "json",
							success : function(data , status , xhr){
								console.log(data);
								
								var RESULT = data;
								
								if(data == 'true'){
									alert('이미 2023년도\n신입생 선발에 신청하셨습니다.');
									return;	
								}else if(data == 'false'){
									
									var FormData = $('#insertform').serialize();
									
									console.log(FormData);
									
									$.ajax({
										type : "POST",
										url : "${pageContext.request.contextPath}/user/member_re/insert.do",
										data : FormData,
										success : function(status , xhr){
											
											console.log('성공 하였습니다.');
											
											alert('성공적으로 제출되었습니다.');
											location.href = '${pageContext.request.contextPath}/';
											
										},
										error : function(status , xhr , error){
											
											console.log('error');
											alert('error');
											
										}
									})
									
								}
								
								
							},
							error : function(xhr , status , error){
								
								console.log('error');
							}
						})
						
						
						
					}else{
						
						var FormData = $('#insertform').serialize();
						
						console.log(FormData);
						
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/user/member_re/insert.do",
							data : FormData,
							success : function(status , xhr){
								
								console.log('성공 하였습니다.');
								
								alert('성공적으로 제출되었습니다.');
								location.href = '${pageContext.request.contextPath}/';
								
							},
							error : function(status , xhr , error){
								
								console.log('error');
								alert('error');
								
							}
						})
						
					}
					
				  }else{
					  
				  }	  
			  
		  }
		  
	  }
      
      //회원 필수값 확인 function
	  function MemberValueCheck(type){
		  if(type == '1'){
			  //유형1
			  
			  
			  
		  }else if(type == '2'){
			  //유형2
			  
			  
			  
			 if($('#NAME').val() == ''){
				 alert('이름를 확인하여주세요.');
				 $('#NAME').focus();
				 return;
			 }
			 
			 if($('input[name="SEX"]').is(':checked') == false){
				 alert('성별를 확인하여주세요.');
				 $('#SEX').focus();
				 return;
			 }
			  
			 if($('#SCHOOL_NAME').val() == ''){
				 alert('학교명를 확인하여주세요.');
				 $('#SCHOOL_NAME').focus();
				 return;
			 }
			  
			 if($('#SCHOOL_YEAR').val() == ''){
				 alert('학년를 확인하여주세요.');
				 $('#SCHOOL_YEAR').focus();
				 return;
			 }
			 
			 if($('#SCHOOL_GROUP').val() == ''){
				 alert('반를 확인하여주세요.');
				 $('#SCHOOL_GROUP').focus();
				 return;
			 }
			 
			 if($('#BIRTH').val() == ''){
				 alert('생년월일을 확인하여주세요.');
				 $('#BIRTH').focus();
				 return;
			 }
			 
			 if($('#ADDRESS').val() == ''){
				 alert('주소를 확인하여주세요.');
				 $('#NAME').focus();
				 return;
			 }
			 
			 if($('#ADDRESS_LOCAL').val() == ''){
				 alert('상세 주소를 확인하여주세요.');
				 $('#ADDRESS_LOCAL').focus();
				 return;
			 }
			 
			 if($('#PHONE').val() == '' && $('#PARENT_PHONE').val() == ''){
				 alert('연락처 혹은 보호자 연락처 둘중하나라도 작성하여주세요.');
				 $('#PHONE').focus();
				 return;
			 }
			 
			 if($('#TYPE_SUB').val() == ''){
				 alert('지원 분야를 확인하여주세요.');
				 $('#TYPE_SUB').focus();
				 return;
			 }
			 
			 
			 
			 if($('#ELIGIBILITY').val() == '' || $('#ELIGIBILITY').val() == null){
				 alert('지원자격을 확인하여주세요.');
				 $('#ELIGIBILITY').focus();
				 return;
			 }
			
			 
			 if($('#EXP_TYPE').val() == ''){
				 alert('영재 교육 경험 여부를 확인하여주세요.');
				 $('#EXP_TYPE').focus();
				 return;
			 }
			 
			 if($('#EXP_DATA').val() == ''){
				 alert('영재 교육 참여 기간를 확인하여주세요.');
				 $('#EXP_DATA').focus();
				 return;
			 }
			 
			 if($('#SELF_INTR').val() == ''){
				 alert('자기소개서를 확인하여주세요.');
				 console.log('????');
				 $('#SELF_INTR').focus();
				 return;
			 }
			
			 return true;
			 
		  }else if(type == '3'){
			  //유형3
			  
		
			  
			 if($('#NAME').val() == ''){
				 alert('이름를 확인하여주세요.');
				 $('#NAME').focus();
				 return;
			 }
			 
			 if($('input[name="SEX"]').is(':checked') == false){
				 alert('성별를 확인하여주세요.');
				 $('#SEX').focus();
				 return;
			 }
			  
			 if($('#SCHOOL_NAME').val() == ''){
				 alert('학교명를 확인하여주세요.');
				 $('#SCHOOL_NAME').focus();
				 return;
			 }
			 
			 if($('#SCHOOL_TYPE').val() == ''){
				 alert('학교급을 선택하여주세요.');
				 $('#SCHOOL_TYPE').focus();
				 return;
			 }
			 
			 if($('#BIRTH').val() == ''){
				 alert('생년월일을 확인하여주세요.');
				 $('#BIRTH').focus();
				 return;
			 }
			 
			 if($('#ADDRESS').val() == ''){
				 alert('주소를 확인하여주세요.');
				 $('#NAME').focus();
				 return;
			 }
			 
			 if($('#ADDRESS_LOCAL').val() == ''){
				 alert('상세 주소를 확인하여주세요.');
				 $('#ADDRESS_LOCAL').focus();
				 return;
			 }
			 
			 if($('#PHONE').val() == ''){
				 alert('연락처를 확인하여주세요.');
				 $('#PHONE').focus();
				 return;
			 }
			 
			
			 if($('#TYPE_SUB').val() == ''){
				 alert('전공를 확인하여주세요.');
				 $('#TYPE_SUB').focus();
				 return;
			 }
			 
			 if($('input[name="EXP_TYPE"]').is(':checked') == false){
				 alert('교육 연수 여부를 선택하여주세요.');
				 $('#EXP_TYPE').focus();
				 return;
			 }
			 
			 if($('#SELF_INTR').val() == ''){
				 alert('지원동기를 확인하여주세요.');
				 $('#SELF_INTR').focus();
				 return;
			 }
			 
			 return true;
			  
			  
		  }
		  
	  }
	  
</script>
</c:if>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">

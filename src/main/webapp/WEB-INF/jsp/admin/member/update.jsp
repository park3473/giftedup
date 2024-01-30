<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %> 
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
                    <section class="adm_sc_txt">
                        <form action="../update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                            <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />

                            <input type="hidden"  name="TYPE_SUB" value="" />
                           
                            <c:if test="${model.pageDomain.TYPE == '1'}">
                            <input type="hidden" name="SCHOOL_MAJOR" value=""/>
                            <input type="hidden"  name="TYPE" value="1" />
                            
                            <div class="sc_con" id="div_con">
                                <div class="title">
                                    <span></span>
                                    <span>회원목록관리</span>
                                </div>
                                
                                <div class="member_register_wrap">
                                    <div class="title">
                                        <h2>회원정보 입력</h2>
                                    </div>
                                    
                                    
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>학생</li>
                                            <li>
                                                <span class="list_t">아이디</span>
                                                <input class="input_size" type="text" name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디를 써주세요." value="${model.pageDomain.MEMBER_ID}"  readonly>
                                            </li>
                                            <li>
                                                <span class="list_t">비밀번호</span>
                                                <input class="input_size mr" type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호를 써주세요.">
                                                
                                                <!--
                                                <span class="relate_c">영문자,숫자조합,특수문자 조합(7자 ~ 20자)</span>
                                                <div  id="password1"><span class="relate_c span_none span_active">※ 특수조합을 같이 조합해주세요.</span></div>
                                                -->
                                            </li>
                                            <li>
                                                <span class="list_t">비밀번호 확인</span>
                                                <input class="input_size" type="password" name="PASSWORD2" id="PASSWORD2">
                                                <div id="password2"><span class="relate_c span_none span_active" >※ 비밀번호가 동일하지 않습니다.</span></div>
                                                <div id="password3"><span class="relate_c span_none span_active" >※ 비밀번호가 동일 합니다.</span></div>
                                            </li>
                                            <li>
                                                <span class="list_t">이름</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="한글"  value="${model.pageDomain.NAME}" >
                                                <!-- 
                                                <input class="input_size mr" type="text" name="NAME_ENG" id="NAME_ENG" placeholder="영문"  value="${model.pageDomain.NAME_ENG}" >
                                                <input class="input_size mr" type="text" name="NAME_HANJA" id="NAME_HANJA" placeholder="한자"  value="${model.pageDomain.NAME_HANJA}" >
                                                -->
                                            </li>
                                            <li>
                                                <span class="list_t">사진</span>
                                                <input type="file" id="file" name="file"/>${fn:substring(model.pageDomain.IMAGE , 13,fn:length(model.pageDomain.IMAGE))}
                                                <!-- <input class="input_size" type="text" name="pic" id="pic"> -->
                                                <span class="relate_b">115px X 150px jpg, gif</span>
                                            </li>
                                            <li>
                                                <span class="list_t">시도명</span>
                                                <select ID="ADDRESS_LOCAL" class="input_size" NAME="ADDRESS_LOCAL">
                                                    <option value="">선택하여주세요</option>
                                                    <option value="서울" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                    <option value="부산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                    <option value="대구" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                    <option value="인천" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                    <option value="광주" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                    <option value="대전" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                    <option value="울산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '울산'}">selected</c:if>>울산</option>
                                                    <option value="세종" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                    <option value="경기도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경기도'}">selected</c:if>>경기도</option>
                                                    <option value="강원도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '강원도'}">selected</c:if>>강원도</option>
                                                    <option value="충청북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청북도'}">selected</c:if>>충청북도</option>
                                                    <option value="충청남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청남도'}">selected</c:if>>충청남도</option>
                                                    <option value="전라북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라북도'}">selected</c:if>>전라북도</option>
                                                    <option value="전라남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라남도'}">selected</c:if>>전라남도</option>
                                                    <option value="경상북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상북도'}">selected</c:if>>경상북도</option>
                                                    <option value="경상남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상남도'}">selected</c:if>>경상남도</option>
                                                    <option value="제주도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '제주도'}">selected</c:if>>제주도</option>
                                                </select>
                                                <span class="relate_b">현재 거주하는 시,도명</span>
                                            </li>
                                            <li>
                                                <span class="list_t">학교급</span>
                                                <select class="input_size mr-2" name="SCHOOL_TYPE" id="SCHOOL_TYPE" value="${model.pageDomain.SCHOOL_TYPE}">
                                                    <option <c:if test="${fn:indexOf(model.pageDomain.SCHOOL_TYPE, '초등학교') > -1}">selected</c:if>>초등학교</option>
                                                    <option <c:if test="${fn:indexOf(model.pageDomain.SCHOOL_TYPE, '중학교') > -1}">selected</c:if>>중학교</option>
                                                    <option <c:if test="${fn:indexOf(model.pageDomain.SCHOOL_TYPE, '고등학교') > -1}">selected</c:if>>고등학교</option>
                                                </select>
                                                <span class="list_t">학교명</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.pageDomain.SCHOOL_NAME}">
                                            </li>
                                            <li>
                                                <span class="list_t">학년</span>
                                                <select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                                    <option value="">선택해주세요</option>
                                                    <option value="4"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                    <option value="12"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                                </select>
                                                <span class="list_t">반</span>
                                                <input class="input_size" type="number" name="SCHOOL_GROUP" id="SCHOOL_GROUP" value="${model.pageDomain.SCHOOL_GROUP}">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr-2 datecalendar" type="text" name="BIRTH" id="BIRTH" placeholder="날짜를 선택해주세요." value="${model.pageDomain.BIRTH}">
                                                <!--  <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a>-->
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" id="man" value="남자" <c:if test="${fn:indexOf(model.pageDomain.SEX, '남자') > -1}">checked</c:if>>
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="여자" <c:if test="${fn:indexOf(model.pageDomain.SEX, '여자') > -1}">checked</c:if>>
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">학교주소</span>
                                                    <input class="input_size" type="text" name="SCHOOL_ZIPCODE" id="SCHOOL_ZIPCODE" value="${model.pageDomain.SCHOOL_ZIPCODE}" readonly >
                                                    <button type="button" onClick="schoolZipCode()">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" value="${model.pageDomain.SCHOOL_ADDRESS}" readonly>
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS_DETAIL" id="SCHOOL_ADDRESS_DETAIL" value="${model.pageDomain.SCHOOL_ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">휴대폰</span>
                                                <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.pageDomain.PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.pageDomain.EMAIL}">
                                            </li>
                                            <li>
                                                <span class="list_t">지원 영역</span>
                                                <select class="input_size" id="SUPPORT_AREA" name="SUPPORT_AREA" value="${model.pageDomain.SUPPORT_AREA}">
                                                    <option <c:if test="${model.pageDomain.SUPPORT_AREA == '수학'}">selected</c:if>>수학</option>
                                                    <option <c:if test="${model.pageDomain.SUPPORT_AREA == '과학'}">selected</c:if>>과학</option>
                                                    <option <c:if test="${model.pageDomain.SUPPORT_AREA == '수·과학'}">selected</c:if>>수·과학</option>
                                                    <option <c:if test="${model.pageDomain.SUPPORT_AREA == '발명'}">selected</c:if>>발명</option>
                                                    <option <c:if test="${model.pageDomain.SUPPORT_AREA == '정보'}">selected</c:if>>정보</option>
                                                    <option <c:if test="${model.pageDomain.SUPPORT_AREA == '인문사회'}">selected</c:if>>인문사회</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">지원 자격</span>
                                                <select class="input_size" id="ELIGIBILITY" name="ELIGIBILITY">
                                                    <option value="">선택해주세요</option>
                                                    <option value="교육급여수급자" <c:if test="${model.pageDomain.ELIGIBILITY == '교육급여수급자'}">selected</c:if>>교육급여수급자</option>
                                                    <option value="특수교육대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '특수교육대상자'}">selected</c:if>>특수교육대상자</option>
                                                    <option value="도서·벽지 거주자" <c:if test="${model.pageDomain.ELIGIBILITY == '도서·벽지 거주자'}">selected</c:if>>도서·벽지 거주자</option>
                                                    <option value="읍·면지역 거주자" <c:if test="${model.pageDomain.ELIGIBILITY == '읍·면지역 거주자'}">selected</c:if>>읍·면지역 거주자</option>
                                                    <option value="학교장 추천" <c:if test="${model.pageDomain.ELIGIBILITY == '학교장 추천'}">selected</c:if>>학교장 추천</option>
                                                    <option value="국가보훈처 지정 교육보호대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '국가보훈처 지정 교육보호대상자'}">selected</c:if>>국가보훈처 지정 교육보호대상자</option>
                                                    <option value="북한이탈주민 또는 그 자녀" <c:if test="${model.pageDomain.ELIGIBILITY == '북한이탈주민 또는 그 자녀'}">selected</c:if>>북한이탈주민 또는 그 자녀</option>
                                                    <option value="법정차상위계층" <c:if test="${model.pageDomain.ELIGIBILITY == '법정차상위계층'}">selected</c:if>>법정차상위계층</option>
                                                    <option value="한부모 가정보호 대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '한부모 가정보호 대상자'}">selected</c:if>>한부모 가정보호 대상자</option>
                                                    <option value="아동 복지 전담기관 보호 대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '아동 복지 전담기관 보호 대상자'}">selected</c:if>>아동 복지 전담기관 보호 대상자</option>
                                                    <option value="다문화 대상자" <c:if test="${model.pageDomain.ELIGIBILITY == '다문화 대상자'}">selected</c:if>>다문화 대상자</option>
                                                    <option value="소년·소녀 가장 및 조손가정의 자녀" <c:if test="${model.pageDomain.ELIGIBILITY == '소년·소녀 가장 및 조손가정의 자녀'}">selected</c:if>>소년·소녀 가장 및 조손가정의 자녀</option>
                                                    <option value="순직 군경·소방관·교직원의 자녀" <c:if test="${model.pageDomain.ELIGIBILITY == '순직 군경·소방관·교직원의 자녀'}">selected</c:if>>순직 군경·소방관·교직원의 자녀</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <input type="radio" name="EXP" id="EXP1" value="1">
                                                <label>유</label>
                                                <input type="radio" name="EXP" id="EXP2" value="0" checked>
                                                <label>무</label>
                                            </li>
                                            <li id="ll_exp_data1">
                                                <span class="list_t">영재 교육 경험 종류</span>
                                                <select class="input_size mr-2" id="EXP_TYPE" name="EXP_TYPE">
                                                    <option value="">선택해주세요</option>
                                                    <option value="영재학교" <c:if test="${model.pageDomain.EXP_TYPE == '영재학교'}">selected</c:if>>영재학교</option>
                                                    <option value="과학고등학교" <c:if test="${model.pageDomain.EXP_TYPE == '과학고등학교'}">selected</c:if>>과학고등학교</option>
                                                    <option value="시도교육청 영재교육원" <c:if test="${model.pageDomain.EXP_TYPE == '시도교육청 영재교육원'}">selected</c:if>>시도교육청 영재교육원</option>
                                                    <option value="대학교 영재교육원" <c:if test="${model.pageDomain.EXP_TYPE == '대학교 영재교육원'}">selected</c:if>>대학교 영재교육원</option>
                                                    <option value="영재학급" <c:if test="${model.pageDomain.EXP_TYPE == '영재학급'}">selected</c:if>>영재학급</option>
                                                    <option value="기타" <c:if test="${model.pageDomain.EXP_TYPE == '기타'}">selected</c:if>>기타</option>
                                                </select>
                                            </li>
                                            <li id="ll_exp_data2">
                                                <span class="list_t">영재 교육 참여 기간</span>
                                                <select class="input_size mr-2" id="EXP_DATA" name="EXP_DATA">
                                                    <option value="">선택해주세요</option>
                                                    <option value="1년 이하" <c:if test="${model.pageDomain.EXP_DATA == '1년 이하'}">selected</c:if>>1년 이하</option>
                                                    <option value="1년 ~ 2년" <c:if test="${model.pageDomain.EXP_DATA == '1년 ~ 2년'}">selected</c:if>>1년 ~ 2년</option>
                                                    <option value="2년 ~ 3년" <c:if test="${model.pageDomain.EXP_DATA == '2년 ~ 3년'}">selected</c:if>>2년 ~ 3년</option>
                                                    <option value="3년 ~ 4년" <c:if test="${model.pageDomain.EXP_DATA == '3년 ~ 4년'}">selected</c:if>>3년 ~ 4년</option>
                                                    <option value="4년 이상" <c:if test="${model.pageDomain.EXP_DATA == '4년 이상'}">selected</c:if>>4년 이상</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">회원 등급</span>
                                                <select class="input_size mr" id="LEVEL" name="LEVEL">
                                                    <option value="1" <c:if test="${model.pageDomain.LEVEL == '1'}">selected</c:if>>관리자</option>
                                                    <option value="9" <c:if test="${model.pageDomain.LEVEL == '9'}">selected</c:if>>대표멘토교사</option>
                                                    <option value="8" <c:if test="${model.pageDomain.LEVEL == '8'}">selected</c:if>>교사</option>
                                                    <option value="11" <c:if test="${model.pageDomain.LEVEL == '11'}">selected</c:if>>학생</option>
                                                    <option value="10" <c:if test="${model.pageDomain.LEVEL == '10'}">selected</c:if>>일반회원</option>
                                                </select>
                                                <span class="relate_c">회원등급을 선택해주세요.</span>
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" value="${model.pageDomain.ZIPCODE}" readonly>
                                                    <button type="button" onClick="ZipCode()">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS" value="${model.pageDomain.ADDRESS}" readonly>
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.pageDomain.ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="title">
                                        <h2>개인정보동의서</h2>
                                    </div>
                                    <div class="member_input_wrap" id="info_agreement">
                                        <ul class="member_input">
                                            <c:if test="${model.pageDomain.INFO_AGREEMENT == '1'}"> 
                                            <li>
                                                <div class="person_title">
                                                    <h2>영재키움 프로젝트 개인정보 수집동의서[일반용]</h2>
                                                </div>
                                                <div class="person_content">
                                                    ${session_infoAgreement}
                                                    <div class="person_data"><span>${model.pageDomain.INFO_AGREEMENT_TM}</span></div>
                                                    <div class="person_user">
                                                        <p style="text-coler:blue">정보 제공자 : <span>${model.pageDomain.NAME}</span></p>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:if>
                                            
                                            <c:if test="${model.pageDomain.INFO_AGREEMENT != '1'}"> 
                                            <li>
                                                동의 하지 않음
                                            </li>
                                            </c:if>
                                        </ul>
									</div>
									<div class="title">
										<h2>보호자 정보입력</h2>
									</div>
									<div class="guardian_input_wrap">
										<ul class="guardian_input">
											<li>
												<span class="list_t">이름</span>
												<input class="input_size" type="text" name="PARENTS_NAME" id="PARENTS_NAME" value="${model.pageDomain.PARENTS_NAME}"/>
											</li>
											<li>
												<span class="list_t">학생과의 관계</span>
												<input class="input_size" type="text" name="PARENTS_RELATION" id="PARENTS_RELATION" value="${model.pageDomain.PARENTS_RELATION}"/>
											</li>
											<li>
												<span class="list_t">연락처</span>
												<input class="input_size" type="number" name="PARENTS_PHONE" id="PARENTS_PHONE" value="${model.pageDomain.PARENTS_PHONE}"/>
											</li>
											<!--
											<li>
												<span class="list_t">휴대폰</span>
												<input class="input_size" type="number" name="PARENTS_PHONE2" id="PARENTS_PHONE2" value="${model.pageDomain.PARENTS_PHONE2}"/>
											</li>
											-->
                                        </ul>
                                    </div>
                                </div>

                                <!--저장하기 버튼-->
                                <div class="register_btn_area">
                                    <div class="register_btn_con">
                                        <a class="storage" href="javascript:infoPdfDownClick()">정보이용동의서출력</a>
                                        <a class="storage" href="javascript:insertClick()">저장하기</a>
                                        <a class="cancel" href="javascript:history.back()">취소하기</a>
                                    </div>
                                </div>
                                <!--저장하기 버튼 end-->
                                
                            </div>
                            </c:if>
                            <c:if test="${model.pageDomain.TYPE == '2'}"> 
                            <input type="hidden" name="EXP_TYPE" value=""/>
                            <input type="hidden" name="ELIGIBILITY" value=""/>
                            <input type="hidden" name="EXP" value=""/>
                            <input type="hidden" name="EXP_DATA" value=""/>

                            <div class="sc_con" id="div_con2">
                                <div class="title">
                                    <span></span>
                                    <span>회원목록관리</span>
                                </div>

                                <div class="member_register_wrap">

                                    <div class="title">
                                        <h2>회원정보 입력</h2>
                                    </div>
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">가입유형</span>
                                                <label for="teacher">교사</label>
                                            </li>

                                            <li>
                                                <span class="list_t">아이디</span>
                                                <input class="input_size" type="text" name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디를 써주세요." value="${model.pageDomain.MEMBER_ID}" readonly>
                                            </li>
                                            
                                            <li>
                                                <span class="list_t">비밀번호</span>
                                                <input class="input_size mr" type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호를 써주세요.">
                                                <!--
                                                <span class="relate_c">영문자,숫자조합,특수문자 조합(7자 ~ 20자)</span>
                                                <div  id="password1"><span class="relate_c span_none span_active">※ 특수조합을 같이 조합해주세요.</span></div>
                                                -->
                                            </li>

                                            <li>
                                                <span class="list_t">비밀번호 확인</span>
                                                <input class="input_size" type="password" name="PASSWORD2" id="PASSWORD2">
                                                <div id="password2"><span class="relate_c span_none span_active" >※ 비밀번호가 동일하지 않습니다.</span></div>
                                            </li>

                                            <li>
                                                <span class="list_t">이름</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="한글" value="${model.pageDomain.NAME}">
                                                <!-- 
                                                <input class="input_size mr" type="text" name="NAME_ENG" id="NAME_ENG" placeholder="영문" value="${model.pageDomain.NAME_ENG}">
                                                <input class="input_size mr" type="text" name="NAME_HANJA" id="NAME_HANJA" placeholder="한자" value="${model.pageDomain.NAME_HANJA}">
                                                -->
                                                <!--
                                                <input type="radio" name="name" id="name">
                                                <label class="relate_c" for="name">동명이인(성명+생년월일+성별 일치)</label>
                                                -->
                                            </li>
                                            
                                            <li class="file_ob">
                                                <span class="list_t">사진</span>

                                                <input type="file" id="file" class="mr" name="file"/>${fn:substring(model.pageDomain.IMAGE , 13,fn:length(model.pageDomain.IMAGE))}
                                                <span class="relate_b">115px X 150px jpg, gif</span>
                                            </li>
                                            
                                            <li>
                                                <span class="list_t">시도명</span>
                                                <select ID="ADDRESS_LOCAL" NAME="ADDRESS_LOCAL">
                                                    <option value="">선택하여주세요</option>
                                                    <option value="서울" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                    <option value="부산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                    <option value="대구" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                    <option value="인천" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                    <option value="광주" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                    <option value="대전" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                    <option value="울산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '울산'}">selected</c:if>>울산</option>
                                                    <option value="세종" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                    <option value="경기도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경기도'}">selected</c:if>>경기도</option>
                                                    <option value="강원도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '강원도'}">selected</c:if>>강원도</option>
                                                    <option value="충청북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청북도'}">selected</c:if>>충청북도</option>
                                                    <option value="충청남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청남도'}">selected</c:if>>충청남도</option>
                                                    <option value="전라북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라북도'}">selected</c:if>>전라북도</option>
                                                    <option value="전라남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라남도'}">selected</c:if>>전라남도</option>
                                                    <option value="경상북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상북도'}">selected</c:if>>경상북도</option>
                                                    <option value="경상남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상남도'}">selected</c:if>>경상남도</option>
                                                    <option value="제주도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '제주도'}">selected</c:if>>제주도</option>
                                                </select>                                                

                                                <span class="relate_b">현재 거주하는 시,도명</span>
                                            </li>
                                            
                                            <li>
                                                <span class="list_t">소속학교명</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.pageDomain.SCHOOL_NAME}">
                                            </li>
                                            
                                            <li>
                                                <span class="list_t">직급</span>
                                                <input class="input_size mr-2" type="text" name="SCHOOL_JIGGEUB" id="SCHOOL_JIGGEUB" value="${model.pageDomain.SCHOOL_JIGGEUB}">
                                            </li>
                                            
                                            <li>
                                                <span class="list_t">전공</span>
                                                <input class="input_size mr-2" type="text" name="SCHOOL_MAJOR" id="SCHOOL_MAJOR" value="${model.pageDomain.SCHOOL_MAJOR}">
                                            </li>

                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr-2 datecalendar" type="text" name="BIRTH" id="BIRTH" placeholder="달력을 선택해주세요." value="${model.pageDomain.BIRTH}">
                                                <!--
                                                <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a>
                                                -->
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" value="남자" id="man" <c:if test="${fn:indexOf(model.pageDomain.SEX, '남자') > -1}">checked</c:if>>
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" value="여자" id="woman" <c:if test="${fn:indexOf(model.pageDomain.SEX, '여자') > -1}">checked</c:if>>
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">학교주소</span>
                                                    <input class="input_size" type="text" name="SCHOOL_ZIPCODE" id="SCHOOL_ZIPCODE" value="${model.pageDomain.SCHOOL_ZIPCODE}" readonly>
                                                    <button type="button" onClick="schoolZipCode()">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" value="${model.pageDomain.SCHOOL_ADDRESS}" readonly>
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS_DETAIL" id="SCHOOL_ADDRESS_DETAIL" value="${model.pageDomain.SCHOOL_ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="number" name="TEL" id="TEL" value="${model.pageDomain.TEL}">
                                            </li>
                                            <li>
                                                <span class="list_t">휴대폰</span>
                                                <input class="input_size" type="number" name="PHONE" id="PHONE" value="${model.pageDomain.PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.pageDomain.EMAIL}">
                                            </li>
                                            <li>
                                                <span class="list_t">연수지명번호</span>
                                                <input class="input_size" type="text" name="AREA_NUMBER" id="AREA_NUMBER" value="${model.pageDomain.AREA_NUMBER}">
                                                <!--
                                                <input type="checkbox" name="place_name" id="place_name">
                                                <label class="relate_c" for="name">체크시 활성화 됨</label>
                                                -->
                                            </li>
                                            <li>
                                                <span class="list_t">회원등급</span>
                                                <select class="input_size" id="LEVEL" name="LEVEL">
                                                    <option value="1" <c:if test="${model.pageDomain.LEVEL == '1'}">selected</c:if>>관리자</option>
                                                    <option value="9" <c:if test="${model.pageDomain.LEVEL == '9'}">selected</c:if>>대표멘토교사</option>
                                                    <option value="8" <c:if test="${model.pageDomain.LEVEL == '8'}">selected</c:if>>교사</option>
                                                    <option value="11" <c:if test="${model.pageDomain.LEVEL == '11'}">selected</c:if>>학생</option>
                                                    <option value="10" <c:if test="${model.pageDomain.LEVEL == '10'}">selected</c:if>>일반회원</option>
                                                    <!--
                                                    <option value="5" <c:if test="${model.pageDomain.LEVEL == '5'}">selected</c:if>>기타</option>
                                                    -->
                                                </select>
                                            </li>                                            
                                        </ul>
                                    </div>
                                    <div class="title">
                                        <h2>개인정보동의서</h2>
                                    </div>
                                    <div class="member_input_wrap" id="info_agreement">
                                        <ul class="member_input">
                                            <c:if test="${model.pageDomain.INFO_AGREEMENT == '1'}"> 
                                            <li>
                                                <div class="person_title">
                                                    <h2>영재키움 프로젝트 개인정보 수집동의서[일반용]</h2>
                                                </div>
                                                <div class="person_content">
                                                    ${session_infoAgreement}
                                                    <div class="person_data"><span>${model.pageDomain.INFO_AGREEMENT_TM}</span></div>
                                                    <div class="person_user">
                                                        <p>정보 제공자 : <span>${model.pageDomain.NAME}</span></p>
                                                    </div>
                                                </div>
                                            </li>
                                            </c:if>
                                            <c:if test="${model.pageDomain.INFO_AGREEMENT != '1'}"> 
                                            <li>
                                               	동의 하지 않음
                                            </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                                <!--저장하기 버튼-->
                                <div class="register_btn_area">
                                    <div class="register_btn_con">
                                        <a class="storage" href="javascript:infoPdfDownClick()">정보이용동의서출력</a>
                                        <a class="storage" href="javascript:insertClick()">저장하기</a>
                                        <a class="cancel" href="javascript:history.back()">취소하기</a>
                                    </div>
                                </div>
                                </c:if>
                            </form>
                            <!--저장하기 버튼 end-->
                        </div>
                    </section>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    
</body>
</html>

<script type="text/javascript">
    $(document).ready(function() {
        $("input:radio[name=TYPE]").click(function(){
            if($("input[name=TYPE]:checked").val() == "1"){
                location.href='./insert.do?TYPE=1';
            }else if($("input[name=TYPE]:checked").val() == "2") {
                location.href='./insert.do?TYPE=2';					
            }
            $("input[name=radio]:checked")
        });

        $("#password1").hide();
        $("#password2").hide();
        $("#password3").hide();
        $("#PASSWORD").on("change keyup paste", function() {

            if(validatePassword($('#PASSWORD').val()) == false) {
                $("#password1").show();
            }else {
                $("#password1").hide();
            }
        });


        $("#PASSWORD2").on("change keyup paste", function() {
            if($("#PASSWORD").val() == $("#PASSWORD2").val()) {
                $("#password2").hide();
                $("#password3").show();
            }else {
                $("#password2").show();
                $("#password3").hide();
            }
        });
    });
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    $('#ll_exp_data1').hide();
    $('#ll_exp_data2').hide();
    $("input[name=EXP]").change(function() {
        if($(this).val() == '1') {
            $('#ll_exp_data1').show();
            $('#ll_exp_data2').show();
        }else {
            $('#ll_exp_data1').hide();
            $('#ll_exp_data2').hide();
        }
    });
    
    function ZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                $('#ZIPCODE').val(data.zonecode);
                $('#ADDRESS').val(data.roadAddress);
            }
        }).open();	
    }
    
    function schoolZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                $('#SCHOOL_ZIPCODE').val(data.zonecode);
                $('#SCHOOL_ADDRESS').val(data.roadAddress);
            }
        }).open();	
    }
    
    var idchk  = false;
    function idCheck() {
        if(CheckPass($('#MEMBER_ID').val()) == false) {
            alert("아이디는 영문 숫자 조합 7자리 ~ 20자리 입력 부탁 드립니다.");   // 넣고 싶은 메세지 넣으시면 됩니다~
            return;
        }
        
        var URL = "${pageContext.request.contextPath}/admin/member/idCheck.do?MEMBER_ID=" + $('#MEMBER_ID').val();

        $.ajax({
            url: URL,
            type: 'GET',
            success: function(result) {
                console.log(result);
                var s = result.indexOf("true");
                if(s != -1) {
                    idchk = true;
                    $('#MEMBER_ID').attr("readonly", true); 
                    alert('사용가능합니다.');
                    return;
                }else {
                    alert('이미사용중입니다.');
                    return;
                }
            }
        });  
    }
    
    function CheckPass(str) {
        var reg1 = /^[a-z0-9]{7,20}$/;    // a-z 0-9 중에 7자리 부터 14자리만 허용 한다는 뜻이구요
        var reg2 = /[a-z]/g;    
        var reg3 = /[0-9]/g;
        return(reg1.test(str) &&  reg2.test(str) && reg3.test(str));
    }
    
    function validatePassword(character) {
        return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{7,}$/.test(character)
    }

    function insertClick() {
        if($('#PASSWORD').val() != '') {
            if($('#PASSWORD').val() != $('#PASSWORD2').val()) {
                alert("입력된 비밀번호가 일치 하지 않습니다.");   // 넣고 싶은 메세지 넣으시면 됩니다~
                return;
            }
            
            /*
            if(CheckPass($('#MEMBER_ID').val()) == false) {
                alert("아이디를 입력해주세요.");   // 넣고 싶은 메세지 넣으시면 됩니다~
                return;
            }
            */
        }
        /* 
        if($('#ADDRESS_LOCAL').val() == '') {
            alert('시도명을 입력 하여 주세요');
            return;
        }
        
        if($('#SCHOOL_NAME').val() == '') {
            alert('소속학교명 입력 하여 주세요');
            return;
        }

        if($('#NAME').val() == '') {
            alert('이름을 입력 하여 주세요');
            return;
        }

        if($('#PHONE').val() == '') {
            alert('연락처를 입력 하여 주세요');
            return;
        }
        */

        $('#updateform').submit();
    }
    
    function infoPdfDownClick() {
        /*
        var initBody = document.body.innerHTML;
        window.onbeforeprint = function(){
            document.body.innerHTML = document.getElementById('info_agreement').innerHTML;
        }
        window.onafterprint = function(){
            document.body.innerHTML = initBody;
        }
        window.print(); 
        */
        window.open('./infoPdf.do','팝업창','width=750, height=800, left=300, top=150');
    }
    
</script>

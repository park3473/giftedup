<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<!--css-->
<link rel="stylesheet" href="/resources/css/admin/jquery.datetimepicker.css">
    <%@ include file="../include/head.jsp" %> 
</head>

<body>
	<%@ include file="../include/header.jsp" %>

        <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con"  id="div_con">
                            <div class="title">
                                <span></span>
                                <span>지원서 확인</span>
                            </div>
                            
                            <div class="member_register_wrap">
									<!-- 유형1 -->
									<c:if test="${model.beforeData.TYPE == '1' }">	
                                      <div class="title">
		                                <h2>유형 ${model.beforeData.TYPE}</h2>
		                            </div>
		                            <form id="StudentUpdateForm" name="StudentUpdateForm" method="POST" action="${pageContext.request.contextPath }/admin/member_re/update.do" >
		                            <input type="hidden" id="RESULT" class="RESULT" value="${model.StudentView.RESULT }" >
		                            <input type="hidden" id="IDX" class="IDX" name="IDX" value="${model.StudentView.IDX }">
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학생명</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="이름"  value="${model.StudentView.NAME}" >
                                            </li>
                                            <li>
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" id="man" value="남자" 
                                                <c:if test="${model.StudentView.SEX == '남자'}">checked</c:if>
                                                >
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="여자" ss="${model.StudentView.SEX == '여자' }"
                                                <c:if test="${model.StudentView.SEX == '여자'}">checked</c:if>
                                                >
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <span class="list_t">학교 급</span>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_1" value="초등학교" <c:if test="${fn:indexOf(model.StudentView.SCHOOL_TYPE, '초') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_1">초</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_2" value="중학교" <c:if test="${fn:indexOf(model.StudentView.SCHOOL_TYPE, '중') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_2">중</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_3" value="고등학교" <c:if test="${fn:indexOf(model.StudentView.SCHOOL_TYPE, '고') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_3">고</label>
                                            </li>
                                            <li>
                                            	<span class="list_t">학교명</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.StudentView.SCHOOL_NAME}">
                                            </li>
                                            <li>
                                            	<span class="list_t">학년</span>
                                            	<select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                            		<option value="4"  <c:if test="${model.StudentView.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5"  <c:if test="${model.StudentView.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6"  <c:if test="${model.StudentView.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.StudentView.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8"  <c:if test="${model.StudentView.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9"  <c:if test="${model.StudentView.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10" <c:if test="${model.StudentView.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11" <c:if test="${model.StudentView.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                    <option value="12" <c:if test="${model.StudentView.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                            	</select>
                                            	<span class="list_t">반</span>
                                                <input class="input_size" type="text" name="SCHOOL_GROUP" id="SCHOOL_GROUP" value="${model.StudentView.SCHOOL_GROUP}">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr datecalendar" type="text" name="BIRTH" id="BIRTH" value="${model.StudentView.BIRTH}">
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" value="${model.StudentView.ZIPCODE}" >
                                                    <button type="button" onClick="zipCode();">주소찾기</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS"  value="${model.StudentView.ADDRESS}">
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.StudentView.ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.StudentView.PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">보호자 연락처</span>
                                                <input class="input_size" type="text" name="TEL" id="TEL" value="${model.StudentView.PARENT_PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.StudentView.EMAIL}">
                                            </li>
                                             <li>
                                                <span class="list_t">지원 자격</span>
                                                <select id="ELIGIBILITY" class="ELIGIBILITY input_address" name="ELIGIBILITY">
                                                    	<option value="">지원분야를 선택하여주세요.</option>
                                                    	<c:forEach var="item" items="${model.DcmntAllList }" varStatus="status">
                                                    		<option value="${item.DCMNT_TYPE }" <c:if test="${model.StudentView.ELIGIBILITY == item.DCMNT_TYPE }">selected</c:if> >${item.DCMNT_TYPE }</option>
                                                    	</c:forEach>
                                                </select>
                                            </li>
                                             <li>
                                                <span class="list_t">영재 교육 참여 기간</span>
                                                <c:if test="${model.StudentView.EXP_DATA != '' }">
                                                	<input id="EXP_DATA" class="EXP_DATA" name="EXP_DATA" value="${model.StudentView.EXP_DATA }" readonly="readonly">
                                                </c:if>
                                            </li>
                                            <c:if test="${model.StudentView.EXP_DATA != '' }">
                                            <li>
                                            	<span class="list_t">기존 아이디</span>
                                            	<input type="text" id="MEMBER_ID" class="MEMBER_ID" name="MEMBER_ID" value="${model.StudentView.MEMBER_ID }" readonly="readonly">
                                            </li>
                                            </c:if>
                                             <li>
                                                <span class="list_t">자기 소개서</span>
                                   			   	<textarea class="textarea_size" type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR"  style="height: 180px;" value="${model.StudentView.SELF_INTR }">${model.StudentView.SELF_INTR }</textarea>
                                    		</li>
                                    		<li>
                                                <span class="list_t">학생 - 관리자 피드백</span>
                                   			   	<textarea class="textarea_size" type="text" name="COMMENT" id="COMMENT" style="height: 180px;" >${model.StudentView.COMMENT }</textarea>
                                    		</li>
                                        </ul>
                                    </div>
                                    </form>
                                    <form  id="MentoUpdateForm" name="MentoUpdateForm" method="POST" action="${pageContext.request.contextPath }/admin/member_re/update.do">
                                     <input type="hidden" id="IDX" class="IDX" name="IDX" value="${model.MentoView.IDX }">
                                     <input type="hidden" id="RESULT" class="RESULT" value="${model.MentoView.RESULT }" >
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">교사명</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="이름"  value="${model.MentoView.NAME}" >
                                            </li>
                                            <li>
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" id="man" value="남자"
                                                <c:if test="${model.MentoView.SEX == '남자'}">checked</c:if>
                                                >
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="여자"
                                                <c:if test="${model.MentoView.SEX == '여자'}">checked</c:if>
                                                >
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <span class="list_t">학교 급</span>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_1" value="초등학교" <c:if test="${fn:indexOf(model.MentoView.SCHOOL_TYPE, '초') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_1">초</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_2" value="중학교" <c:if test="${fn:indexOf(model.MentoView.SCHOOL_TYPE, '중') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_2">중</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_3" value="고등학교" <c:if test="${fn:indexOf(model.MentoView.SCHOOL_TYPE, '고') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_3">고</label>
                                            </li>
                                            <li>
                                            	<span class="list_t">학교명</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.MentoView.SCHOOL_NAME}">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr datecalendar" type="text" name="BIRTH" id="BIRTH" value="${model.MentoView.BIRTH}">
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" value="${model.MentoView.ZIPCODE}" >
                                                    <button type="button" onClick="zipCode();">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS"  value="${model.MentoView.ADDRESS}">
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.MentoView.ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.MentoView.PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.MentoView.EMAIL}">
                                            </li>
                                             <li>
                                                <span class="list_t">영재 교육 참여 기간</span>
                                                <c:if test="${model.StudentView.EXP_DATA != '' }">
                                                	<input id="EXP_DATA" class="EXP_DATA" name="EXP_DATA" value="${model.MentoView.EXP_DATA }" readonly="readonly">
                                                </c:if>
                                            </li>
                                            <c:if test="${model.MentoView.EXP_DATA != '' }">
                                            <li>
                                            	<span class="list_t">기존 아이디</span>
                                            	<input type="text" id="MEMBER_ID" class="MEMBER_ID" name="MEMBER_ID" value="${model.MentoView.MEMBER_ID }" readonly="readonly">
                                            </li>
                                            </c:if>
                                             <li>
                                                <span class="list_t">멘토교사 지원동기</span>
                                   			   	<textarea class="textarea_size" type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR"  style="height: 180px;" value="${model.MentoView.SELF_INTR }">${model.MentoView.SELF_INTR }</textarea>
                                    		</li>
                                    		<li>
                                                <span class="list_t">멘토교사 - 관리자 피드백</span>
                                   			   	<textarea class="textarea_size" type="text" name="COMMENT" id=""COMMENT"" style="height: 180px;" >${model.MentoView.COMMENT }</textarea>
                                    		</li>
                                        </ul>
                                    </div>
                                    </form>
                                    </c:if>
                                    
                                    <!-- 유형 2, 3 -->
                                    <c:if test="${model.beforeData.TYPE == '2' || model.beforeData.TYPE == '3' }">	
                                    <div class="title">
		                                <h2>유형 ${model.View.TYPE} - <c:if test="${model.View.LEVEL == '8'}">교사</c:if><c:if test="${model.View.LEVEL == '11'}">학생</c:if></h2>
		                            </div>
                                    <form id="UpdateForm" name="UpdateForm" method="POST" action="${pageContext.request.contextPath }/admin/member_re/update.do" >
                                    <input type="hidden" id="IDX" class="IDX" name="IDX" value="${model.View.IDX }">
                                    <input type="hidden" id="RESULT" class="RESULT" value="${model.View.RESULT }" >
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">성명</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="이름"  value="${model.View.NAME}" >
                                            </li>
                                            <li>
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" id="man" value="남자" <c:if test="${fn:indexOf(model.View.SEX, '남자') > -1}">checked</c:if>>
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="여자" <c:if test="${fn:indexOf(model.View.SEX, '여자') > -1}">checked</c:if>>
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <span class="list_t">학교 급</span>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_1" value="초등학교" <c:if test="${fn:indexOf(model.View.SCHOOL_TYPE, '초') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_1">초</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_2" value="중학교" <c:if test="${fn:indexOf(model.View.SCHOOL_TYPE, '중') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_2">중</label>
                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE_3" value="고등학교" <c:if test="${fn:indexOf(model.View.SCHOOL_TYPE, '고') > -1}">checked</c:if>>
                                                <label for="SCHOOL_TYPE_3">고</label>
                                            </li>
                                            <li>
                                            	<span class="list_t">학교명</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.View.SCHOOL_NAME}">
                                            </li>
                                            <li>
                                            	<span class="list_t">학년</span>
                                            	<select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                            		<option value="4"  <c:if test="${model.View.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5"  <c:if test="${model.View.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6"  <c:if test="${model.View.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.View.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8"  <c:if test="${model.View.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9"  <c:if test="${model.View.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10" <c:if test="${model.View.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11" <c:if test="${model.View.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                    <option value="12" <c:if test="${model.View.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                            	</select>
                                            	<span class="list_t">반</span>
                                                <input class="input_size" type="text" name="SCHOOL_GROUP" id="SCHOOL_GROUP" value="${model.View.SCHOOL_GROUP}">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr datecalendar" type="text" name="BIRTH" id="BIRTH" value="${model.View.BIRTH}">
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" value="${model.View.ZIPCODE}" >
                                                    <button type="button" onClick="zipCode();">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS"  value="${model.View.ADDRESS}">
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.View.ADDRESS_DETAIL}">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.View.PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">보호자 연락처</span>
                                                <input class="input_size" type="text" name="TEL" id="TEL" value="${model.View.PARENT_PHONE}">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.View.EMAIL}">
                                            </li>
                                             <li>
                                                <span class="list_t">지원 자격</span>
                                                <select id="ELIGIBILITY" class="ELIGIBILITY input_address" name="ELIGIBILITY">
                                                    	<option value="">지원분야를 선택하여주세요.</option>
                                                    	<c:forEach var="item" items="${model.DcmntAllList }" varStatus="status">
                                                    		<option value="${item.DCMNT_TYPE }" <c:if test="${model.View.ELIGIBILITY == item.DCMNT_TYPE }">selected</c:if> >${item.DCMNT_TYPE }</option>
                                                    	</c:forEach>
                                                </select>
                                            </li> 
                                              <li>
                                                <span class="list_t">영재 교육 참여 기간</span>
                                                <c:if test="${model.View.EXP_DATA != '' }">
                                                	<input id="EXP_DATA" class="EXP_DATA" name="EXP_DATA" value="${model.View.EXP_DATA }" readonly="readonly">
                                                </c:if>
                                            </li>
                                            <c:if test="${model.View.EXP_DATA != '' }">
                                            <li>
                                            	<span class="list_t">기존 아이디</span>
                                            	<input type="text" id="MEMBER_ID" class="MEMBER_ID" name="MEMBER_ID" value="${model.View.MEMBER_ID }" readonly="readonly">
                                            </li>
                                            </c:if>
                                             <li>
                                                <span class="list_t">자기 소개서</span>
                                   			   	<textarea class="textarea_size" type="text" maxlength="1000" name="SELF_INTR" id="SELF_INTR" style="height: 180px;" value="${model.View.SELF_INTR }">${model.View.SELF_INTR }</textarea>
                                    		</li>
                                    		<li>
                                                <span class="list_t">관리자 피드백</span>
                                   			   	<textarea class="textarea_size" type="text" name="COMMENT" id=""COMMENT"" style="height: 180px;" >${model.View.COMMENT }</textarea>
                                    		</li>
                                        </ul>
                                    </div>
                                    </form>
                                    </c:if>
                                    
                                    <div class="title">
		                                <h2>서류 - 유형</h2>
		                            </div>
                                    
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                        	<c:if test="${model.beforeData.TYPE == '1' }">
                                        		<li data-document="보호자 서약서">
                                        			<span class="list_t">보호자 서약서</span>
                                        		</li>
                                        		<li data-document="지원자 서약서">
                                        			<span class="list_t">지원자 서약서</span>
                                        		</li>
                                        		<li data-document="학교장 확인서">
                                        			<span class="list_t" >학교장 확인서</span>
                                        		</li>
                                        	</c:if>
                                        	<c:if test="${model.beforeData.TYPE == '2' }">
                                        		<li data-document="보호자 서약서">
                                        			<span class="list_t" >보호자 서약서</span>
                                        		</li>
                                        		<li data-document="지원자 서약서">
                                        			<span class="list_t" >지원자 서약서</span>
                                        		</li>
                                        	</c:if>
                                        	<c:if test="${model.beforeData.TYPE == '3' }">
                                        		<li data-document="지원자 서약서">
                                        			<span class="list_t" >지원자 서약서</span>
                                        		</li>
                                        	</c:if>
                                        </ul>
                                    </div>
                                    
                                    <div class="title">
		                                <h2>서류 - 지원자격</h2>
		                            </div>
                                    
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                        	<c:forEach var="item" items="${model.DcmntList }" varStatus="status">
                                        		<li data-document="${item.DCMNT_NAME }">
                                        			<span class="list_t" >${item.DCMNT_NAME }</span>
                                        		</li>
                                        	</c:forEach>
                                        </ul>
                                    </div>
                                    
                            </div>
							
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:updateClick(${model.beforeData.TYPE })">수정 하기</a>
                                    <c:if test="${model.beforeData.TYPE == '1' }">
                                    	<c:if test="${model.StudentView.RESULT == 'check' }">
                                    		<a class="bd_storage_w_btn" href="javascript:PassUp('${model.beforeData.TYPE }')">합격자 선정</a>
                                    	</c:if>
                                    	<c:if test="${model.StudentView.RESULT == 'pass' }">
                                    		<a class="bd_storage_w_btn" href="javascript:PassDown('${model.beforeData.TYPE }')">합격 취소</a>
                                    	</c:if>
                                    </c:if>
                                    <c:if test="${model.beforeData.TYPE == '2' || model.beforeData.TYPE == '3'}">
                                    	<c:if test="${model.View.RESULT == 'check' }">
                                    		<a class="bd_storage_w_btn" href="javascript:PassUp('${model.beforeData.TYPE }')">합격자 선정</a>
                                    	</c:if>
                                    	<c:if test="${model.View.RESULT == 'pass' }">
                                    		<a class="bd_storage_w_btn" href="javascript:PassDown('${model.beforeData.TYPE }')">합격 취소</a>
                                    	</c:if>
                                    </c:if>
                                    <a class="bd_storage_w_btn" href="javascript:history.back()">뒤로 가기</a>
                                    <c:if test="${model.beforeData.TYPE == '1' }">
                                    	<a class="bd_storage_w_btn" onclick="MemberReDelete('${model.beforeData.TYPE }','${model.MentoView.MATCHING}')">지원 삭제</a>
                                    </c:if>
                                    <c:if test="${model.beforeData.TYPE == '2' || model.beforeData.TYPE == '3' }">
                                    	<a class="bd_storage_w_btn" onclick="MemberReDelete('${model.beforeData.TYPE }','${model.View.IDX}')">지원 삭제</a>
                                    </c:if>
                                    <c:if test="${fn:length(model.UploadFileList) > 0}">
                                    	<a class="bd_storage_w_btn" onclick="TotalDocumentDown()">서류 통합 다운로드</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>
</html>

<script src="/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<!-- 다음 주소 검색 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--부트스트랩 js-->
<script src="/resources/js/bootstrap/bootstrap.js"></script>
<script>
    
    //집주소 선택
	function zipCode()
	{
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	$('#ZIPCODE').val(data.sigunguCode);
	        	$('#ADDRESS').val(data.roadAddress);
	        }
	    }).open();	
	}
	
    
	function updateClick(TYPE){
		
		if(TYPE == '1'){
			
			const StudentForm = $('#StudentUpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/update.do',
				type : 'POST',
				data :StudentForm,
				success : function(status , xhr){
					console.log('success')
				},
				error : function(error , xhr , status){
					
				}
			})
			
			
			const MentoForm = $('#MentoUpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/update.do',
				type : 'POST',
				data : MentoForm,
				success : function(status , xhr){
					console.log('success')
				},
				error : function(error , xhr , status){
					
				}
			})
			
			console.log('all success');
			
			alert('신청서 수정이 완료되었습니다.');
			
			location.href='${pageContextPath.request.contextPath}/admin/member_re/list.do';
			
		}else if(TYPE == '2' || TYPE == '3'){
			
			const Form = $('#UpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/update.do',
				type : 'POST',
				data :Form,
				success : function(status , xhr){
					console.log('success')
				},
				error : function(error , xhr , status){
					
				}
			})
			
			console.log('all success');
			
			alert('신청서 수정이 완료되었습니다.');
			
			location.href='${pageContextPath.request.contextPath}/admin/member_re/list.do';
			
			
		}
	}
	
	
	//합격
	function PassUp(TYPE){
		
		if(TYPE == '1'){
			
			const StudentForm = $('#StudentUpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/pass.do',
				type : 'POST',
				data :StudentForm,
				success : function(status , xhr){
					console.log('success');
				},
				error : function(error , xhr , status){
					console.log('error');
				}
			})
			
			const MentoForm = $('#MentoUpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/pass.do',
				type : 'POST',
				data : MentoForm,
				success : function(status , xhr){
					console.log('success');
				},
				error : function(error , xhr , status){
					console.log('error');
				}
			})
			
			console.log('all success');
			
			alert('합격 처리가 완료되었습니다.');
			
			location.href='${pageContextPath.request.contextPath}/admin/member_re/list.do';
			
		}else if(TYPE == '2' || TYPE == '3'){
			
			const Form = $('#UpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/pass.do',
				type : 'POST',
				data :Form,
				success : function(status , xhr){
					console.log('success')
				},
				error : function(error , xhr , status){
					console.log('error');
				}
			})
			
			console.log('all success');
			
			alert('합격 처리가 완료되었습니다.');
			
			location.href='${pageContextPath.request.contextPath}/admin/member_re/list.do';
			
		}
		
	}
	
	//합격 취소
	function PassDown(TYPE){
		
		if(TYPE == '1'){
			
			const StudentForm = $('#StudentUpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/passDown.do',
				type : 'POST',
				data :StudentForm,
				success : function(status , xhr){
					console.log('success');
				},
				error : function(error , xhr , status){
					console.log('error');
				}
			})
			
			const MentoForm = $('#MentoUpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/passDown.do',
				type : 'POST',
				data : MentoForm,
				success : function(status , xhr){
					console.log('success');
				},
				error : function(error , xhr , status){
					console.log('error');
				}
			})
			
			console.log('all success');
			
			alert('합격 취소 처리가 완료되었습니다.');
			
			location.href='${pageContextPath.request.contextPath}/admin/member_re/list.do';
			
		}else if(TYPE == '2' || TYPE == '3'){
			
			const Form = $('#UpdateForm').serialize();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/member_re/passDown.do',
				type : 'POST',
				data :Form,
				success : function(status , xhr){
					console.log('success')
				},
				error : function(error , xhr , status){
					console.log('error');
				}
			})
			
			console.log('all success');
			
			alert('합격 취소 처리가 완료되었습니다.');
			
			location.href='${pageContextPath.request.contextPath}/admin/member_re/list.do';
			
		}
		
	}
	
	function MemberReDelete(TYPE,DATA){
		
		var result = confirm('정말 해당 지원서를 삭제하시겠습니까?\n삭제된 지원서는 복구할수 없습니다.');
		
		if(result == true){
			if(TYPE == '1'){
			
				$.ajax({
					url : '${pageContext.request.contextPath}/admin/member_re/delete.do',
					type : 'POST',
					data : ({
						TYPE : TYPE,
						MATCHING : DATA
					}),
					success : function(status , success){
						alert('지원 삭제가 완료되었습니다.');
						location.href='${pageContext.request.contextPath}/admin/member_re/list.do';
					},
					error : function(xhr , error){
						alert('error');
					}
				})
				
			}else if(TYPE == '2' || TYPE == '3'){
				$.ajax({
					url : '${pageContext.request.contextPath}/admin/member_re/delete.do',
					type : 'POST',
					data : ({
						TYPE : TYPE,
						IDX : DATA
					}),
					success : function(status , success){
						alert('지원 삭제가 완료되었습니다.');
						location.href='${pageContext.request.contextPath}/admin/member_re/list.do';
					},
					error : function(xhr , error){
						alert('error');
					}
				})
			}else{
				alert('error');
			}
			
		}
		
	}
	
	$(document).ready(function(){
		var UploadList = [];
		<c:forEach var="item" items="${model.UploadFileList}" varStatus="status">
		UploadList.push('${item}');
		</c:forEach>
		console.log(UploadList);
		if(UploadList.length > 0){
			
			for(var i = 0; i < UploadList.length; i++){
				
				var UploadFile = UploadList[i];
				var html = `<span class="list_t">제출 완료</span>
        			<button type="button" onclick="DcmntFileDown(this)" FILENAME="`+UploadFile+`">파일 다운로드</button>`;
				$('[data-document="'+UploadFile+'"]').append(html);
				
			}
			
		}
		
	});

	
	
</script>

<c:if test="${model.beforeData.TYPE == '1'}">	
<script>

function DcmntFileDown(e){
	var BIRTH = '${model.MentoView.BIRTH}';
	var MEMBER = '${model.MentoView.NAME}';
	var NAME = $(e).attr('FILENAME');
	console.log(NAME);
	$.ajax({
		url : '/user/member_re/FileLinkCheck.do',
		type : 'POST',
		data : ({
			NAME : NAME,
			MEMBER_NAME : MEMBER,
			BIRTH : BIRTH
		}),
		success : function(data , status , xhr){
			
			console.log(data);
			location.href='/fileDown.do?path=/resources/upload/member_re/delete/'+BIRTH+MEMBER+'/'+data+'';
			
		},
		error : function(status , xhr){
			
		}
		
	})
}

function TotalDocumentDown(){
	
	var UploadList = [];
	<c:forEach var="item" items="${model.UploadFileList}" varStatus="status">
	UploadList.push('${item}');
	</c:forEach>
	
	var filesString = '';
	
	let promises = [];
	
	for(var i = 0; i < UploadList.length; i ++){
		
		var BIRTH = '${model.MentoView.BIRTH}';
		var MEMBER = '${model.MentoView.NAME}';
		var NAME = UploadList[i];
		
		console.log(NAME);
		 promises.push(
			$.ajax({
				url : '/user/member_re/FileLinkCheck.do',
				type : 'POST',
				data : ({
					NAME : NAME,
					MEMBER_NAME : MEMBER,
					BIRTH : BIRTH
				}),
				success : function(data , status , xhr){
					
					console.log(data);
					
					var URL = '/resources/upload/member_re/delete/' + BIRTH + MEMBER + '/'
					
					URL += data;
					
					if(filesString == ''){
						filesString = filesString + URL;	
					}else{
						filesString = filesString + ',' + URL;	
					}
					
				},
				error : function(status , xhr){
					
				}
				
			})
		)
		
		
	}
	
	var BIRTH = '${model.MentoView.BIRTH}';
	var MEMBER = '${model.MentoView.NAME}';
	
	Promise.all(promises).then(function() {
		
		console.log(filesString);
		
		BIRTH = BIRTH.replaceAll('.','');

		window.location.href = '/fileAllDown.do?NAME='+BIRTH + MEMBER+'&filesString=' + encodeURIComponent(filesString);
		
    }).catch(function(error) {
        console.error('오류 발생', error);
    });

	
}

</script>
</c:if>

<c:if test="${model.beforeData.TYPE == '2' || model.beforeData.TYPE == '3' }">	
<script>

function DcmntFileDown(e){
	var BIRTH = '${model.View.BIRTH}';
	var MEMBER = '${model.View.NAME}';
	var NAME = $(e).attr('FILENAME');
	console.log(NAME);
	$.ajax({
		url : '/admin/member_re/FileLinkCheck.do',
		type : 'POST',
		data : ({
			NAME : NAME,
			MEMBER_NAME : MEMBER,
			BIRTH : BIRTH
		}),
		success : function(data , status , xhr){
			
			console.log(data);
			location.href='/fileDown.do?path=/resources/upload/member_re/delete/'+BIRTH+MEMBER+'/'+data+'';
			
		},
		error : function(status , xhr){
			
		}
		
	})
}

function TotalDocumentDown(){
	
	var UploadList = [];
	<c:forEach var="item" items="${model.UploadFileList}" varStatus="status">
	UploadList.push('${item}');
	</c:forEach>
	
	var filesString = '';
	
	let promises = [];
	
	for(var i = 0; i < UploadList.length; i ++){
		
		var BIRTH = '${model.View.BIRTH}';
		var MEMBER = '${model.View.NAME}';
		var NAME = UploadList[i];
		
		console.log(NAME);
		 promises.push(
			$.ajax({
				url : '/user/member_re/FileLinkCheck.do',
				type : 'POST',
				data : ({
					NAME : NAME,
					MEMBER_NAME : MEMBER,
					BIRTH : BIRTH
				}),
				success : function(data , status , xhr){
					
					console.log(data);
					
					var URL = '/resources/upload/member_re/delete/' + BIRTH + MEMBER + '/'
					
					URL += data;
					
					if(filesString == ''){
						filesString = filesString + URL;	
					}else{
						filesString = filesString + ',' + URL;	
					}
					
				},
				error : function(status , xhr){
					
				}
				
			})
		)
		
		
	}
	
	var BIRTH = '${model.View.BIRTH}';
	var MEMBER = '${model.View.NAME}';
	
	Promise.all(promises).then(function() {
		
		console.log(filesString);
		
		BIRTH = BIRTH.replaceAll('.','');

		window.location.href = '/fileAllDown.do?NAME='+BIRTH + MEMBER+'&filesString=' + encodeURIComponent(filesString);
		
    }).catch(function(error) {
        console.error('오류 발생', error);
    });

	
}

</script>
</c:if>

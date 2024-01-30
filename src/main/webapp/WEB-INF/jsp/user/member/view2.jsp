<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %> 

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %> 
        </section>
    </header>


    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
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
                                    <p>기본정보</p>
                                </div>
                                <div class="info_wrap">
                                    <c:if test="${ssion_member_type == '1'}">
                                    <div class="title mr-0">
                                        <h2>학생정보</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th class="my_th">과정</th>
                                            <td class="my_td">${model.pageDomain.SCHOOL_TYPE}</td>
                                            <th class="my_th">소속학교</th>
                                            <td class="my_td">${model.pageDomain.SCHOOL_NAME}</td>
                                        </tr>
                                        <tr>
                                            <th class="my_th">학년</th>
                                            <td class="my_td">
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '4'}">초등학교4학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '5'}">초등학교5학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '6'}">초등학교6학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '7'}">중학교1학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '8'}">중학교2학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '9'}">중학교3학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '10'}">고등학교1학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '11'}">고등학교2학년</c:if>
                                                <c:if test="${model.pageDomain.SCHOOL_YEAR == '12'}">고등학교3학년</c:if>
                                            </td>
                                            <th class="my_th">이름</th>
                                            <td class="my_td">${model.pageDomain.NAME}</td>
                                        </tr>
                                        <tr>
                                        	<th class="my_th">성별</th>
                                        	<td class="my_td">
                                                <c:if test="${model.pageDomain.SEX == '남자'}">남자</c:if>
                                                <c:if test="${model.pageDomain.SEX == '여자'}">여자</c:if>
                                            </td>
                                        	<th class="my_th">생년월일</th>
                                        	<td class="my_td">${model.pageDomain.BIRTH}</td>
                                        </tr>
                                        <tr>
                                            <th class="my_th">지역</th>
                                            <td class="my_td">${model.pageDomain.ADDRESS_LOCAL}</td>
                                            <th class="my_th">지원영역</th>
                                        	<td class="my_td">${model.pageDomain.SUPPORT_AREA}</td>
                                        </tr>
                                        <tr>
                                        	<th class="my_th">연락처</th>
                                        	<td class="my_td">${model.pageDomain.PHONE}</td>
                                        	<th class="my_th">이메일</th>
                                        	<td class="my_td">${model.pageDomain.EMAIL}</td>
                                        </tr>
                                        <!-- 
                                        <tr>
                                            <th class="my_th">우편번호</th>
                                            <td class="my_td">${model.pageDomain.ZIPCODE}</td>
                                            <th class="my_th">주소</th>    
                                            <td class="my_td">${model.pageDomain.ADDRESS} ${model.pageDomain.ADDRESS_DETAIL}</td>
                                        </tr>
                                        -->
                                    </table>
                                    
                                    <div class="title mr-0">
                                        <h2>멘토교사정보</h2>
                                    </div>
                                    <table class="txt info_table">
                                    	<tr>
                                    		<th class="my_th">이름</th>
                                    		<td class="my_td">${model.pageDomain.PROF_NAME}</td>
                                    		<th class="my_th">학교</th>
                                    		<td class="my_td">${model.pageDomain.PROF_SCHOOL_NAME}</td>
                                    	</tr>
                                    	<tr>
                                    		<th class="my_th">이메일</th>
                                    		<td class="my_td">${model.pageDomain.PROF_EMAIL}</td>
                                    		<th class="my_th">연락처</th>
                                    		<td class="my_td">${model.pageDomain.PROF_PHONE}</td>
                                    	</tr>
                                    </table>
                                    
                                    <!--
                                    <div class="title mr-0">
                                        <h2>보호자</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th class="my_th">성명</th>
                                            <td class="my_td">${model.pageDomain.PARENTS_NAME}</td>
                                            <th class="my_th">학생과의 관계</th>
                                            <td class="my_td">${model.pageDomain.PARENTS_RELATION}</td>
                                        </tr>
                                        <tr>
                                            <th class="my_th">연락처</th>
                                            <td class="my_td" colspan="3">${model.pageDomain.PARENTS_PHONE}</td>
                                        </tr>
                                        <tr>
                                            <th class="my_th">휴대전화</th>
                                            <td class="my_td" colspan="3">${model.pageDomain.PARENTS_PHONE2}</td>
                                        </tr>
                                    </table>
                                    -->
                                    <!-- 
                                    <div class="title mr-0">
                                        <h2>가족사항</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th class="my_th">가족</th>
                                            <td class="my_td" style="width: 85%;">
                                                <c:if test="${model.pageDomain.PARENTS_NAME != ''}">성명 : ${model.pageDomain.PARENTS_NAME}  </c:if>
                                                <c:if test="${model.pageDomain.PARENTS_RELATION != ''}">관계 :  ${model.pageDomain.PARENTS_RELATION}  </c:if>
                                                <c:if test="${model.pageDomain.PARENTS_PHONE != ''}">연락처 : ${model.pageDomain.PARENTS_PHONE}  </c:if>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="title mr-0">
                                        <h2>수상경력</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th class="my_th">수상경력1</th>
                                            <td class="my_td" style="width: 85%;">수상일 : 미입력, 수상내역 : 미입력</td>
                                        </tr>
                                    </table>
                                    -->
                                    </c:if>

                                    <c:if test="${ssion_member_type == '2'}">
                                    <div class="title mr-0">
                                        <h2>교사 정보</h2>
                                    </div>

                                    <table class="txt info_table">
                                        <tr>
                                            <th class="my_th">이름</th>
                                            <td class="my_td">${fn:substring(model.pageDomain.NAME,0,19)}</td>
                                            <th class="my_th">소속</th>
                                            <td class="my_td">${model.pageDomain.SCHOOL_NAME}</td>
                                        </tr>
                                        <tr>
                                        	<th class="my_th">지역</th>
                                        	<td class="my_td">${model.pageDomain.ADDRESS_LOCAL}</td>
                                            <th class="my_th">연락처</th>
                                            <td class="my_td">${model.pageDomain.PHONE}</td>
                                        </tr>
                                        <!-- 
                                        <tr>
                                            <th class="my_th">우편번호</th>
                                            <td class="my_td">${model.pageDomain.ZIPCODE}</td>
                                            <th class="my_th">주소</th>
                                            <td class="my_td">${model.pageDomain.ADDRESS} ${model.pageDomain.ADDRESS_DETAIL}
                                            </td>
                                        </tr>
                                        -->
                                        <tr>
                                            <th class="my_th">이메일</th>
                                            <td class="my_td" colspan="3">${model.pageDomain.EMAIL}</td>
                                            <!-- 
                                            <th class="my_th">전공</th>
                                            <td class="my_td">${model.pageDomain.SCHOOL_MAJOR}</td>
                                            -->
                                        </tr>
                                    </table>
                                    
                                    <div class="title mr-0">
                                        <h2>멘티 학생정보</h2>
                                    </div>
                                    <div class="table_scroll">
	                                    <table class="txt">
	                                    	<tr>
	                                    		<th class="name">이름</th>
	                                    		<th class="school">학교</th>
	                                    		<th class="process">학년</th>
	                                    		<th class="support">지원영역</th>
	                                    		<th class="sex">성별</th>
	                                    		<th class="phone">연락처</th>
	                                    		<th class="email">이메일</th>
	                                    		<th class="name">학부모 이름</th>
	                                    		<th class="phone">학부모 연락처</th>
	                                    	</tr>
	                                    	
	                                    	<c:forEach items="${model.MEMBER2.list}" var="member2">
		                                    	<tr>
		                                    		<td>${member2.NAME}</td>
		                                    		<td>${member2.SCHOOL_NAME}</td>
		                                    		<td>
		                                    			<c:choose>
															<c:when test="${member2.SCHOOL_YEAR == '21'}">초등학교</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '22'}">중학교</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '23'}">고등학교</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '4'}">초등학교<br>4학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '5'}">초등학교<br>5학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '6'}">초등학교<br>6학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '7'}">중학교<br>1학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '8'}">중학교<br>2학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '9'}">중학교<br>3학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '10'}">고등학교<br>1학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '11'}">고등학교<br>2학년</c:when>
				                                            <c:when test="${member2.SCHOOL_YEAR == '12'}">고등학교<br>3학년</c:when>
				                                            <c:otherwise></c:otherwise>
														</c:choose>
		           									</td>
		                                    		<td>${member2.SUPPORT_AREA}</td>
		                                    		<td>${member2.SEX}</td>
		                                    		<td>${member2.PHONE}</td>
		                                    		<td>${member2.EMAIL}</td>
		                                    		<td>${member2.PARENTS_NAME}</td>
		                                    		<td>${member2.PARENTS_PHONE}</td>
		                                    	</tr>
	                                    	</c:forEach>
	                                    </table>
                                    </div>
                                    
                                    </c:if>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            <a class="delete" href="./update2.do">회원정보 변경</a>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %> 
    </footer>
    <%@ include file="../include/footerJs.jsp" %> 
</body>
</html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">


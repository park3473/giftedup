<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %> 

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %> 
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
                                    <p>프로그램정보</p>
                                </div>
                                <table class="txt project_info">
                                    <tr>
                                        <th class="sortation">구분</th>
                                        <th class="pro_txt">내용</th>
                                    </tr>
                                    <tr>
                                        <td class="sortation">학년도</td>
                                        <td class="pro_txt">${model.pageDomain.YEAR}</td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">과정</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '24'}">전체</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '23'}">초등학교</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '22'}">중학교</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '21'}">고등학교</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '4'}">초등학교4학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '5'}">초등학교5학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '6'}">초등학교6학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '7'}">중학교1학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '8'}">중학교2학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '9'}">중학교3학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '10'}">고등학교1학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '11'}">고등학교2학년</c:when>
                                            <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">프로그램명</td>
                                        <td class="pro_txt">${model.pageDomain.NAME}</td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">신청기간</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.START_TM == null}">-</c:when>
                                            <c:otherwise>${fn:substring(model.pageDomain.START_TM,0,11)} ~ ${fn:substring(model.pageDomain.END_TM,0,11)}</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">체험기간</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.EXPERIENCE_START_TM == null}">-</c:when>
                                            <c:otherwise>${fn:substring(model.pageDomain.EXPERIENCE_START_TM,0,11)} ~ ${fn:substring(model.pageDomain.EXPERIENCE_END_TM,0,11)}</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">정원</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.SCHOOL_CNT == null}">-</c:when>
                                            <c:otherwise>${model.pageDomain.SCHOOL_CNT}명</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    
                                    <!-- 
                                    <tr>
                                        <td class="sortation">참가비</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.SCHOOL_MONEY == null}">-</c:when>
                                            <c:otherwise>${model.pageDomain.SCHOOL_MONEY}원</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">계좌번호</td>
                                        <td class="pro_txt">${model.pageDomain.BANK_NAME}</td>
                                    </tr>
                                    -->
                                    
                                    <tr>
                                        <td class="sortation">버스탑승지</td>
                                        <td class="pro_txt">${model.pageDomain.BUS_STATION}</td>
                                    </tr>
                                </table>
                            </div>

                            <!--보드 검색_버튼-->
                            <div class="board_btn_wrap">
                                <div class="board_btn">
                                    <!-- <a class="delete request_btn" href="../sub/sub_05_c-3.html">신청하기</a> -->
                                    <a class="register prev_btn" href="../list.do">이전화면</a>
                                </div>
                            </div>
                            <!--보드 검색_버튼 end-->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %> 
    </footer>
    
    <%@ include file="../../include/footerJs.jsp" %> 
    
</body>

</html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">

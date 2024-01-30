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
                                    <p>프로젝트 목록</p>
                                </div>
                                <table class="txt project_txt">
                                    <tr>
                                        <th class="class_num">학년</th>
                                        <th class="class_num" style="width: 15%;">프로그램</th>
                                        <th class="program_name">프로그램명</th>
                                        <th class="join_time">신청기간</th>
                                        <th class="join_time">체험기간</th>
                                        <!-- 
                                        <th class="stat">인원</th>
                                        -->
                                    </tr>

                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td>
                                            <c:choose>
                                            <c:when test="${item.SCHOOL_YEAR == '24'}">전체</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '23'}">초등학교</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '22'}">중학교</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '21'}">고등학교</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '4'}">초등학교4학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '5'}">초등학교5학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '6'}">초등학교6학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '7'}">중학교1학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '8'}">중학교2학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '9'}">중학교3학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '10'}">고등학교1학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '11'}">고등학교2학년</c:when>
                                            <c:otherwise></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                            <c:when test="${item.TYPE == '101'}">융합과학 프로젝트</c:when>
                                            <c:when test="${item.TYPE == '105'}">발명 및 특허교육</c:when>
                                            <c:when test="${item.TYPE == '102'}">창의융합캠프</c:when>
                                            <c:when test="${item.TYPE == '103'}">멘토링데이</c:when>
                                            <c:when test="${item.TYPE == '104'}">자율연구</c:when>
                                            <c:when test="${item.TYPE == '106'}">기타</c:when>
                                            <c:when test="${item.TYPE == '201'}">교사연수</c:when>
                                            <c:when test="${item.TYPE == '202'}">중앙 컨설팅</c:when>
                                            <c:when test="${item.TYPE == '203'}">성과 발표회</c:when>
                                            <c:when test="${item.TYPE == '204'}">발대식</c:when>
                                            <c:otherwise>${item.TYPE }</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="align_lt"><a href="javascript:view(${item.IDX});">${item.NAME}</a></td>
                                        <td>${fn:substring(item.START_TM,0,11)} ~ ${fn:substring(item.END_TM,0,11)}</td>
                                        <td>${fn:substring(item.EXPERIENCE_START_TM,0,11)} ~ ${fn:substring(item.EXPERIENCE_END_TM,0,11)}</td>
                                        <!-- <td>${item.SCHOOL_CNT}명</td> -->
                                    </tr>
                                    </c:forEach>
                                </table>

                                <!--페이지 넘버-->
                                <nav class="paging_number">
                                    <%@ include file="../../include/pageing.jsp" %>
                                </nav>
                                <!--페이지 넘버 end-->
                            </div>
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

<script type="text/javascript">
    function view(id) {

        var URL = './' + id + '/update.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
    }

</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
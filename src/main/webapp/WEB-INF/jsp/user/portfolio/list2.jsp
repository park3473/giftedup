<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                    <p>포트폴리오</p>
                                </div>
                                <div class="info_wrap">
                                    <div class="member_seach_form">
                                        <div class="member_01_wrap mr-0">
                                            <form>
                                                <div class="form_01">
                                                    <div class="page_seach">
                                                        <select id="YEAR" name="YEAR">
                                                            <option value="">학년도선택</option>
                                                            <c:forEach var="item" items="${model.YEARLIST.list}" varStatus="status">
                                                            <option value="${item.YEAR}" <c:if test="${model.beforeDomain.YEAR == item.YEAR}">selected</c:if>>${item.YEAR}년</option>
                                                            </c:forEach>
                                                        </select>
                                                        <label class="blind" for="YEAR">학년도선택</label>
                                                        <select name="SEARCH_TYPE" id="SEARCH_TYPE">
                                                            <option VALUE="ALL"          <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL'}">selected</c:if>>전체</option>
                                                            <option VALUE="NAME"         <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>학생 명</option>
                                                            <option VALUE="SCHOOL_NAME"  <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_NAME'}">selected</c:if>>학교 명</option>
                                                            <option VALUE="SCHOOL_YEAR"  <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_YEAR'}">selected</c:if>>학년</option>
                                                            <option VALUE="SEX"          <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SEX'}">selected</c:if>>성별</option>
                                                            <option VALUE="SUPPORT_AREA" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SUPPORT_AREA'}">selected</c:if>>지원영역</option>
                                                            <option VALUE="PHONE"        <c:if test="${model.beforeDomain.SEARCH_TYPE == 'PHONE'}">selected</c:if>>연락처</option>
                                                        </select>
                                                        <label class="blind" for="SEARCH_TYPE"></label>
                                                        <input style="width: 191px;" type="text" name="SEARCH_TEXT" id="SEARCH_TEXT" value="${model.SEARCH_TEXT}">
                                                        <label class="blind" for="SEARCH_TEXT"></label>
                                                        <button type="submit" value="검색" onClick="searchBtnClick()">검색</button>
                                                        <a class="w_btn" href="./list.do">새로고침</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="info_wrap">
                                        <div class="title mr-0">
                                            <h2>학생 포트폴리오 목록</h2>
                                        </div>
                                        <table class="txt project_txt">
                                            <caption class="blind">포트폴리오 관리</caption>
                                            <tr>
                                                <th class="sch_year">학년도</th>
                                                <th class="name">학생 명</th>
                                                <th class="school">학교 명</th>
                                                <th class="process">학년/반</th>
                                                <th class="sex">성별</th>
                                                <th class="support">지원영역</th>
                                                <th class="phone">학생연락처</th>
                                                <th class="claim-stat">포트폴리오</th>
                                            </tr>
                                            <c:forEach var="item" items="${model.list}" varStatus="status">
	                                            <tr>
	                                                <td>${item.YEAR}</td>
	                                                <td>${item.NAME}</td>
	                                                <td>${item.SCHOOL_NAME}</td>
	                                                <td>
	                                                    <c:if test="${item.SCHOOL_YEAR == '4'}">초등학교<br>4학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '5'}">초등학교<br>5학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '6'}">초등학교<br>6학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '7'}">중학교<br>1학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '8'}">중학교<br>2학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '9'}">중학교<br>3학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '10'}">고등학교<br>1학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '11'}">고등학교<br>2학년</c:if>
	                                                    <c:if test="${item.SCHOOL_YEAR == '12'}">고등학교<br>3학년</c:if>
	                                                    / ${item.SCHOOL_GROUP}반
	                                                </td>
	                                                <td>${item.SEX}</td>
	                                                <td>${item.SUPPORT_AREA}</td>
	                                                <td>${item.PHONE}</td>
	                                                <td><a href="./detail/list.do?YEAR=${item.YEAR }&MEMBER_ID=${item.MEMBER_ID}" class="td_list_btn">관리보기</a></td>
	                                            </tr>
                                            </c:forEach>
                                            <c:if test="${empty model.list}">
                                            	<tr>
	                                                <td colspan="8">검색 결과가 없습니다.</td>
	                                            </tr>
                                            </c:if>
                                        </table>
                                    </div>
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

<script>
    
    /*
    $("#YEAR").change(function() {

        $.ajax({
            type : "GET",
            url : './getProgramList.do?YEAR='+$(this).val(),
            cache : false,
            data : "",
            success: function(result) {
                $('#IDX').html(result);
            }
        });
    });
    */
    
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
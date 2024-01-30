<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp"%>

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
				<div class="font_noto all_tit_30">프로그램 신청</div>
				<div class="t_pad_15">
					<span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여
						맞춤형 교육을 지원합니다.</span> <span class="all_sort">마이페이지<i
						class="las la-angle-right"></i><b class="blue_01">프로그램 신청</b></span>
				</div>
				<div class="line_gab_15"></div>
				<!-- 타이틀끝 -->

				<section id="new_sub" class="sub_wrap">
					<div id="new_sub_area" class="sub_area">
						<div id="new_sub_con" class="sub_con">
							<div class="sub_size">
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
	
	<%@ include file="../../include/footerJs.jsp" %>
	
	<!--본문 end-->
	
	
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


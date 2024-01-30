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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">


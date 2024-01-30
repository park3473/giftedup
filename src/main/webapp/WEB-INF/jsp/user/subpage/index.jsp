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
    </header>



    <!-- 본문 -->
    <section id="new_sc" class="sc_wrap">
        <div id="new_sc_area" class="sc_area">
            <div id="new_sc_con" class="sc_con">
                <div class="sc_size">
                    <div class="board_stat">
                        <div class="col-sm-6 board_notice_size">
                            <div class="board_notice">
                                <div class="title col-sm-12">
                                    <h3 class="notosans">공지사항 안내</h3>
                                    <div class="more_btn">
                                        <a href="#">
                                            <img src="${pageContext.request.contextPath}/resources/img/plus_icon.png" alt="더보기">
                                        </a>
                                    </div>
                                </div>
                                <ul class="notice_list">
                                    <li class="nanumgothic">
                                        <div class="noice_con row">
                                            <div class="notice_left col-sm-10">
                                                <div class="board_icon col-sm-12 p-0">
                                                    <span class="icon hangle">
                                                        <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                    </span>
                                                    <span class="icon pdf">
                                                        <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                    </span>
                                                </div>
                                                <a class="board_title" href="#">
                                                    <h3>2019 영재키움 프로젝트 우수 멘토교사 유공 표창 서류 입니다.TEST</h3>
                                                </a>
                                                <p>
                                                    2019년 영재키움 프로젝트 우수 멘토 유공 표창'서류서류서류서류
                                                </p>
                                            </div>
                                            <div class="notice_right col-sm-2">
                                                <div class="days">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="more_btn">
                                                    <a href="#">
                                                        <span>
                                                            <img src="${pageContext.request.contextPath}/resources/img/more_check.png" alt="더보기체크" />
                                                        </span>
                                                        더보기
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nanumgothic">
                                        <div class="noice_con row">
                                            <div class="notice_left col-sm-10">
                                                <div class="board_icon col-sm-12 p-0">
                                                    <span class="icon hangle">
                                                        <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                    </span>
                                                    <span class="icon pdf">
                                                        <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                    </span>
                                                </div>
                                                <a class="board_title" href="#">
                                                    <h3>2019 영재키움 프로젝트 우수 멘토교사 유공 표창 서류 입니다.TEST</h3>
                                                </a>
                                                <p>
                                                    2019년 영재키움 프로젝트 우수 멘토 유공 표창'서류서류서류서류
                                                </p>
                                            </div>
                                            <div class="notice_right col-sm-2">
                                                <div class="days">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="more_btn">
                                                    <a href="#">
                                                        <span>
                                                            <img src="${pageContext.request.contextPath}/resources/img/more_check.png" alt="더보기체크" />
                                                        </span>
                                                        더보기
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nanumgothic">
                                        <div class="noice_con row">
                                            <div class="notice_left col-sm-10">
                                                <div class="board_icon col-sm-12 p-0">
                                                    <span class="icon hangle">
                                                        <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                    </span>
                                                    <span class="icon pdf">
                                                        <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                    </span>
                                                </div>
                                                <a class="board_title" href="#">
                                                    <h3>2019 영재키움 프로젝트 우수 멘토교사 유공 표창 서류 입니다.TEST</h3>
                                                </a>
                                                <p>
                                                    2019년 영재키움 프로젝트 우수 멘토 유공 표창'서류서류서류서류
                                                </p>
                                            </div>
                                            <div class="notice_right col-sm-2">
                                                <div class="days">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="more_btn">
                                                    <a href="#">
                                                        <span>
                                                            <img src="${pageContext.request.contextPath}/resources/img/more_check.png" alt="더보기체크" />
                                                        </span>
                                                        더보기
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6 board_stats_size notosans">
                            <div class="board_stats">
                                <ul class="stat_list_wrap col-sm-12">
                                    <li class="col-sm-4">
                                        <h3>학생현황</h3>
                                        <div class="stat_icon">
                                            <img src="${pageContext.request.contextPath}/resources/img/stat_icon_01.png" alt="학생현황" />
                                        </div>
                                        <p class="counter">750</p>
                                    </li>
                                    <li class="col-sm-4">
                                        <h3>교사현황</h3>
                                        <div class="stat_icon">
                                            <img src="${pageContext.request.contextPath}/resources/img/stat_icon_02.png" alt="교사현황" />
                                        </div>
                                        <p class="counter">300</p>
                                    </li>
                                    <li class="col-sm-4">
                                        <h3>참여학교현황</h3>
                                        <div class="stat_icon">
                                            <img src="${pageContext.request.contextPath}/resources/img/stat_icon_03.png" alt="참여학교현황" />
                                        </div>
                                        <p class="counter">800</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="board_banner">
                        <div class="board_file_wrap col-sm-6">
                            <div class="board_file_size">
                                <div class="board_prom">
                                    <div class="title">
                                        <h3 class="notosans">홍보자료</h3>
                                    </div>
                                    <ul class="prom_slider row nanumgothic">
                                        <li class="col-sm-4 prom_slide">
                                            <a href="#">
                                                <div class="date">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/resources/img/test_01.png" alt="게시글">
                                                    </span>
                                                    <p>영재키움 프로젝트 페이스북 개설!!!!!!!</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-4 prom_slide">
                                            <a href="#">
                                                <div class="date">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/resources/img/test_01.png" alt="게시글">
                                                    </span>
                                                    <p>영재키움 프로젝트 페이스북 개설!!!!!!!</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-4 prom_slide">
                                            <a href="#">
                                                <div class="date">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/resources/img/test_01.png" alt="게시글">
                                                    </span>
                                                    <p>영재키움 프로젝트 페이스북 개설!!!!!!!</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-4 prom_slide">
                                            <a href="#">
                                                <div class="date">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/resources/img/test_01.png" alt="게시글">
                                                    </span>
                                                    <p>영재키움 프로젝트 페이스북 개설!!!!!!!</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-4 prom_slide">
                                            <a href="#">
                                                <div class="date">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/resources/img/test_01.png" alt="게시글">
                                                    </span>
                                                    <p>영재키움 프로젝트 페이스북 개설!!!!!!!</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-4 prom_slide">
                                            <a href="#">
                                                <div class="date">
                                                    <p>2019-10-15</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                        <img src="${pageContext.request.contextPath}/resources/img/test_01.png" alt="게시글">
                                                    </span>
                                                    <p>영재키움 프로젝트 페이스북 개설!!!!!!!</p>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="board_qna">
                                    <div class="title">
                                        <h3 class="notosans">질문과 답변</h3>
                                        <div class="more_btn">
                                            <a href="#">
                                                <img src="${pageContext.request.contextPath}/resources/img/plus_icon.png" alt="더보기">
                                            </a>
                                        </div>
                                    </div>
                                    <ul class="qna_list_wrap nanumgothic">
                                        <li class="col-sm-12 p-0">
                                            <a href="#" class="row">
                                                <div class="txt col-sm-9">
                                                    <p class="col-sm-9">2019 영재키움 프로젝트 우수 멘토교사 유공표창점점점점점점점점점</p>
                                                    <div class="file_icon col-sm-3">
                                                        <span class="icon hangle">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                        </span>
                                                        <span class="icon pdf">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="date col-sm-3">
                                                    <span>2019-10-15</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-12 p-0">
                                            <a href="#" class="row">
                                                <div class="txt col-sm-9">
                                                    <p class="col-sm-9">2019 영재키움 프로젝트 우수 멘토교사 유공표창점점점점점점점점점</p>
                                                    <div class="file_icon col-sm-3">
                                                        <span class="icon hangle">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                        </span>
                                                        <span class="icon pdf">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="date col-sm-3">
                                                    <span>2019-10-15</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="col-sm-12 p-0">
                                            <a href="#" class="row">
                                                <div class="txt col-sm-9">
                                                    <p class="col-sm-9">2019 영재키움 프로젝트 우수 멘토교사 유공표창점점점점점점점점점</p>
                                                    <div class="file_icon col-sm-3">
                                                        <span class="icon hangle">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                        </span>
                                                        <span class="icon pdf">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="date col-sm-3">
                                                    <span>2019-10-15</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="banner_zone_wrap col-sm-6">
                            <div class="banner_zone_size">
                                <div class="title">
                                    <h3 class="notosans">질문과 답변</h3>
                                </div>
                                <ul class="banner_slider">
                                    <li class="banner_slide">
                                        <a href="#">
                                            <img src="${pageContext.request.contextPath}/resources/img/banner_slide_01.png" alt="모집배너">
                                        </a>
                                    </li>
                                    <li class="banner_slide">
                                        <a href="#">
                                            <img src="${pageContext.request.contextPath}/resources/img/banner_slide_01.png" alt="모집배너">
                                        </a>
                                    </li>
                                    <li class="banner_slide">
                                        <a href="#">
                                            <img src="${pageContext.request.contextPath}/resources/img/banner_slide_01.png" alt="모집배너">
                                        </a>
                                    </li>
                                </ul>
                                <div class="banner_req">
                                    <ul class="banner_req_list row">
                                        <li class="banner_req_box col-sm-4">
                                            <a href="sub/sub_02_c.html">
                                                <img src="${pageContext.request.contextPath}/resources/img/banner_req_01.png" alt="창의융합캠프신청">
                                                <p>창의융합 캠프 신청</p>
                                            </a>
                                        </li>
                                        <li class="banner_req_box col-sm-4">
                                            <a href="sub/sub_02_b-6.html">
                                                <img src="${pageContext.request.contextPath}/resources/img/banner_req_02.png" alt="멘토링데이신청">
                                                <p>멘토링데이 신청</p>
                                            </a>
                                        </li>
                                        <li class="banner_req_box col-sm-4">
                                            <a href="sub/sub_02_b-4.html">
                                                <img src="${pageContext.request.contextPath}/resources/img/banner_req_03.png" alt="진로탐색신청">
                                                <p>진로탐색 신청</p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
	<%@ include file="../include/footer.jsp" %> 
    </footer>
	<%@ include file="../include/footerJs.jsp" %> 
</body></html>

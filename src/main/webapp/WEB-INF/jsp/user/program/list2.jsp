<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!--부트스트랩 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" type="text/css">

    <!--JQuery-UI-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <title>영재키움프로젝트</title>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>
        <!-- 중단메뉴시작 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
        <!-- 중단메뉴종료 -->
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
                            fn:indexOf(requestURI, '/subpage/program/study/') > -1
                            || fn:indexOf(requestURI, '/notices_data/6/') > -1
                            || fn:indexOf(requestURI, '/program/101/') > -1
                            || fn:indexOf(requestURI, '/notices_data/7/') > -1
                            || fn:indexOf(requestURI, '/notices_data/8/') > -1
                            || fn:indexOf(requestURI, '/notices_data/9/') > -1
                            || fn:indexOf(requestURI, '/notices_data/10/') > -1
                            || fn:indexOf(requestURI, 'user/mentoring/') > -1}">
                            <h2>찾아가는 영재교육 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                            || fn:indexOf(requestURI, '/user/program/110/') > -1
                            || fn:indexOf(requestURI, '/user/program/111/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                            || fn:indexOf(requestURI, '/user/program/105/') > -1}">
                            <h2>체험 진로탐색 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/program/201/') > -1
                            || fn:indexOf(requestURI, '/program/202/') > -1
                            || fn:indexOf(requestURI, '/program/203/') > -1
                            || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <h2>교사 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/program/103/') > -1}">
                            <h2>멘토링 데이</h2>
                            </c:if>
                            <c:if test="${
                            fn:indexOf(requestURI, '/program/106/') > -1}">
                            <h2>기타</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/program/104/') > -1}">
                            <h2>자율연구</h2>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                            || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                            <h2>창의융합캠프</h2>
                            </c:if>
                        </div>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/104/list.do">고등자율연구 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->

                            <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                	<c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/13/list.do">공지사항</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a></li>
                                    </c:if>
                                    <!-- 
                                    <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a></li>
                                    </c:if>
                                    -->
                                </ul>
                            </li>

                            <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>
                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                            </li>

                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->

                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="#" onclick="alert('페이지 준비중입니다.');return false;">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->

                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="#" onclick="alert('페이지 준비중입니다.');return false;">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육 신청</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/201/list.do">교사연수 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1 || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의융합캠프 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1 || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/102/list.do">창의융합캠프 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>프로그램 목록</p>
                                </div>

                                <c:if test="${model.PROGRAM_TYPE != '101'}">
                                <table class="txt project_txt">
                                    <caption class="blind">프로그램 목록</caption>
                                    <tr>
                                        <th class="sortation" style="width:7%;">순번</th>
                                        <th class="program_name" style="width:30%;">프로그램명</th>
                                        <th class="period" style="width:19%;">신청기간</th>

                                        <c:if test="${item.TYPE != '1'}">
                                        <th class="period" style="width:19%;">체험기간</th>
                                        </c:if>

                                        <th class="apply" style="width:13%;">신청하기</th>
                                        <th class="data" style="width:13%;">교육자료</th>
                                    </tr>

                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td class="td_num">${(model.itemCount * model.page) + status.index + 1}</td>
                                        <td class="td_tit align_lt">${item.NAME}</td>
                                        <td class="td_data_01">${fn:substring(item.START_TM,0,11)}~${fn:substring(item.END_TM,0,11)}</td>

                                        <c:if test="${item.TYPE != '1'}">
                                        <td class="td_data_02">${fn:substring(item.EXPERIENCE_START_TM,0,11)}~${fn:substring(item.EXPERIENCE_END_TM,0,11)}</td>
                                        </c:if>

                                        <c:if test="${item.TYPE == '1'}">
                                        <td></td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '1' && item.END_TM_STEP== '1'}">
                                        <td class="td_aply apply">
                                            <a href="./${item.IDX}/${model.TYPE}/insert.do">신청하기</a>
                                        </td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '1' && item.END_TM_STEP== '0'}">
                                        <td class="td_aply apply">
                                            <a style="background-color: #d1e8ff; border: 1px solid #90cbff;" href="#" onclick="alert('신청이 종료되었습니다.')">신청종료</a>
                                        </td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '0' && item.END_TM_STEP== '1'}">
                                        <td class="td_aply apply">
                                            <a style="background-color: #ffde97; border: 1px solid #ffc732;" href="#" onclick="alert('신청대기 기간입니다.')">신청대기</a>
                                        </td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '0' && item.END_TM_STEP== '0'}">
                                        <td class="td_aply apply">종료</td>
                                        </c:if>

                                        <td class="td_data_03 data">
                                            <c:if test="${item.FILES != '' && item.FILES != null}">
                                            <a href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/program/${item.FILES}">다운로드</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>

                                </table>
                                </c:if>

                                <!-- 융합과학 프로젝트 -->
                                <style>
                                    .project_101 tr td{
                                        padding: 10px 15px !important;
                                    }
                                </style>
                                <c:if test="${model.PROGRAM_TYPE == '101'}">
                                <table class="txt project_txt project_101">
                                    <caption class="blind">프로그램 목록</caption>
                                    <tr>
                                        <th class="sortation" style="width:7%;">순번</th>
                                        <th class="sortation" style="width:15%;">학년</th>
                                        <th class="program_name" style="width:50%;">프로그램명</th>
                                        <th class="data" style="width:13%;">교육자료</th>
                                    </tr>
                                    
                                    <!-- 융합과학 프로젝트 리스트 2020.05.26.화요일 작업 -->
                                    <tr>
                                        <td class="td_num">19</td>
                                        <td>고등학교</td>
                                        <td class="td_tit align_lt">오또봇</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/고등_오또봇_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">18</td>
                                        <td>중학교 3학년</td>
                                        <td class="td_tit align_lt">휴대용 스피커 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중3_휴대용 스피커 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">17</td>
                                        <td>중학교 3학년</td>
                                        <td class="td_tit align_lt">아두이노 로봇팔</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중3_아두이노 로봇팔_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">16</td>
                                        <td>중학교 3학년</td>
                                        <td class="td_tit align_lt">스네이크봇 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중3_스네이크봇 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">15</td>
                                        <td>중학교 2학년</td>
                                        <td class="td_tit align_lt">아크릴 이모티콘</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중2_아크릴 이모티콘_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">14</td>
                                        <td>중학교 2학년</td>
                                        <td class="td_tit align_lt">아두이노 자율주행 CAR</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중2_아두이노 자율주행 CAR_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">13</td>
                                        <td>중학교 2학년</td>
                                        <td class="td_tit align_lt">빛 추적 로봇</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중2_빛 추적 로봇_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">12</td>
                                        <td>중학교 2학년</td>
                                        <td class="td_tit align_lt">DIY 아크릴 램프</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중2_DIY 아크릴 램프_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">11</td>
                                        <td>중학교 1학년</td>
                                        <td class="td_tit align_lt">태양광 주택 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중1_태양광 주택 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">10</td>
                                        <td>중학교 1학년</td>
                                        <td class="td_tit align_lt">지진 감지기 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중1_지진 감지기 만들기.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">09</td>
                                        <td>중학교 1학년</td>
                                        <td class="td_tit align_lt">RGB 무드등 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/중1_RGB 무드등 만들기.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">08</td>
                                        <td>초등학교 6학년</td>
                                        <td class="td_tit align_lt">스마트 가로등 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초6_스마트 가로등 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">07</td>
                                        <td>초등학교 6학년</td>
                                        <td class="td_tit align_lt">드라디오 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초6_드라디오 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">06</td>
                                        <td>초등학교 5학년</td>
                                        <td class="td_tit align_lt">프로펠러 자동차</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초5_프로펠러 자동차_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">05</td>
                                        <td>초등학교 5학년</td>
                                        <td class="td_tit align_lt">큐브 현미경 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초5_큐브 현미경 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">04</td>
                                        <td>초등학교 5학년</td>
                                        <td class="td_tit align_lt">무한회전 연필</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초5_무한회전 연필_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">03</td>
                                        <td>초등학교 4학년</td>
                                        <td class="td_tit align_lt">미니 진동 로봇</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초4_미니 진동 로봇_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">02</td>
                                        <td>초등학교 4학년</td>
                                        <td class="td_tit align_lt">무한거울 액자 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초4_무한거울 액자 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_num">01</td>
                                        <td>초등학교 4학년</td>
                                        <td class="td_tit align_lt">나만의 별자리판 만들기</td>
                                        <td class="td_data_03 data">
                                            <a href="${pageContext.request.contextPath}/resources/files/programfile/초4_나만의 별자리판 만들기_temp.pdf">다운로드</a>
                                        </td>
                                    </tr>
                                    <!-- 융합과학 프로젝트 리스트 end -->
                                    
                                    <!--
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td class="td_num">${model.itemtotalcount - (status.index + model.beforeDomain.PAGE * model.beforeDomain.ITEM_COUNT)}</td>
                                        <td>
                                            <c:if test="${item.SCHOOL_YEAR == '24'}">전체</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '23'}">초등학교</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '22'}">중학교</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '21'}">고등학교</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '4'}">초등학교4학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '5'}">초등학교5학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '6'}">초등학교6학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '7'}">중학교1학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '8'}">중학교2학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '9'}">중학교3학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '10'}">고등학교1학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '11'}">고등학교2학년</c:if>
                                        </td>
                                        <td class="td_tit align_lt">${item.NAME}</td>
                                        <td class="td_data_03 data">
                                            <c:if test="${item.FILES != '' && item.FILES != null}">
                                            <a href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/program/${item.FILES}">다운로드</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    -->
                                    
                                </table>

                                <!--
                                <table class="txt project_txt">
                                    <caption class="blind">프로그램 목록</caption>
                                    <tr>
                                        <th class="sortation" style="width:7%;">순번</th>
                                        <th class="program_name" style="width:30%;">프로그램명</th>
                                        <th class="period" style="width:19%;">신청기간</th>
                                        <th class="apply" style="width:13%;">신청하기</th>
                                        <th class="data" style="width:13%;">교육자료</th>
                                    </tr>

                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td class="td_num">${model.itemtotalcount - (status.index + model.beforeDomain.PAGE * model.beforeDomain.ITEM_COUNT)}</td>
                                        <td class="td_tit align_lt">${item.NAME}</td>
                                        <td class="td_data_01 td_data_00">${fn:substring(item.START_TM,0,11)}~${fn:substring(item.END_TM,0,11)}</td>

                                        <c:if test="${item.START_TM_STEP== '1' && item.END_TM_STEP== '1'}">
                                        <td class="td_aply apply">
                                            <a href="./${item.IDX}/${model.TYPE}/insert.do">신청하기</a>
                                        </td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '1' && item.END_TM_STEP== '0'}">
                                        <td class="td_aply apply">신청종료</td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '0' && item.END_TM_STEP== '1'}">
                                        <td class="td_aply apply">신청대기</td>
                                        </c:if>

                                        <c:if test="${item.START_TM_STEP== '0' && item.END_TM_STEP== '0'}">
                                        <td class="td_aply apply">종료</td>
                                        </c:if>

                                        <td class="td_data_03 data">
                                            <c:if test="${item.FILES != '' && item.FILES != null}">
                                            <a href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/program/${item.FILES}">다운로드</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                                -->
                                </c:if>
                                <!-- 융합과학 프로젝트  end-->


                                <!--페이지 넘버-->
                                <!--
                                <nav class="paging_number">
                                    <%@ include file="../include/pageing.jsp" %>
                                </nav>
                                -->
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
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>

</body>

</html>

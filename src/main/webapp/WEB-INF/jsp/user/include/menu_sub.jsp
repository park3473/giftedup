<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="sub_hd_area">
    <div class="sub_hd_con">
        <div class="sub_hd_size">
            <div class="min_size">
                <nav class="sub_nav">
                    <div class="home">
                        <a href="${pageContext.request.contextPath}/">
                            <img src="${pageContext.request.contextPath}/resources/img/sub/sub_home.png" alt="홈" />
                        </a>
                    </div>
                    <ul class="main_menu">
                        <li class="sub_nav_menu">
                            <a href="#">
                                <c:if test="${
                                fn:indexOf(requestURI, '/notices_data/5/') > -1
                                || fn:indexOf(requestURI, '/notices_data/4/') > -1
                                || fn:indexOf(requestURI, '/notices_data/6/') > -1
                                || fn:indexOf(requestURI, '/notices_data/7/') > -1
                                || fn:indexOf(requestURI, '/notices_data/8/') > -1
                                || fn:indexOf(requestURI, '/notices_data/9/') > -1
                                || fn:indexOf(requestURI, '/notices_data/10/') > -1
                                || fn:indexOf(requestURI, '/notices_data/13/') > -1
                                || fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                                || fn:indexOf(requestURI, '/subpage/program/find/') > -1
                                || fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1
                                || fn:indexOf(requestURI, '/subpage/program/patent/') > -1
                                || fn:indexOf(requestURI, '/subpage/program/study/') > -1
                                || fn:indexOf(requestURI, '/program/101/') > -1
                                || fn:indexOf(requestURI, '/program/104/') > -1
                                || fn:indexOf(requestURI, '/program/102/') > -1
                                || fn:indexOf(requestURI, '/program/103/') > -1
                                || fn:indexOf(requestURI, '/program/105/') > -1
                                || fn:indexOf(requestURI, '/program/106/') > -1
                                || fn:indexOf(requestURI, '/program/110/') > -1
                                || fn:indexOf(requestURI, '/program/111/') > -1
                                || fn:indexOf(requestURI, '/mentoring/') > -1
                                || fn:indexOf(requestURI, '/user/communicator/') > -1
                                }">
                                학생프로그램
                                </c:if>

                                <c:if test="${
                                fn:indexOf(requestURI, '/notices_data/1/') > -1
                                || fn:indexOf(requestURI, '/notices_data/2/') > -1
                                || fn:indexOf(requestURI, '/notices_data/3/') > -1
                                || fn:indexOf(requestURI, '/notices_data/12/') > -1
                                || fn:indexOf(requestURI, '/notices_data/11/') > -1
                                || fn:indexOf(requestURI, '/user/survey/') > -1}">
                                커뮤니티
                                </c:if>
                                
                                <c:if test="${
                                fn:indexOf(requestURI, '/user/member_re/') > -1}">
                                모집
                                </c:if>

                                <c:if test="${
                                fn:indexOf(requestURI, '/member/') > -1
                                || fn:indexOf(requestURI, '/portfolio/') > -1
                                || fn:indexOf(requestURI, '/mypage/program/') > -1
                                || fn:indexOf(requestURI, '/mypage/survey/') > -1
                                || fn:indexOf(requestURI, '/user/survey/') > -1
                                || fn:indexOf(requestURI, '/activity_allowance/') > -1
                                || fn:indexOf(requestURI, '/mypage/communicator/') > -1 }">
                                마이페이지
                                </c:if>

                                <c:if test="${
                                fn:indexOf(requestURI, '/program/201/') > -1
                                || fn:indexOf(requestURI, '/program/202/') > -1
                                || fn:indexOf(requestURI, '/program/203/') > -1
                                || fn:indexOf(requestURI, '/program/204/') > -1
                                }">
                                교사 프로그램
                                </c:if>

                                <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
                            </a>
                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">영재키움프로젝트</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">학생 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/201/list.do">교사 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">커뮤니티</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/member_re/check.do">모집</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/member/view.do">마이페이지</a></li>
                            </ul>
                        </li>

                        <li class="sub_nav_menu">
                            <a href="#">
                                <c:if test="${
                                fn:indexOf(requestURI, '/subpage/program/study/') > -1
                                || fn:indexOf(requestURI, '/notices_data/6/') > -1
                                || fn:indexOf(requestURI, '/program/101/') > -1
                                || fn:indexOf(requestURI, '/notices_data/7/') > -1
                                || fn:indexOf(requestURI, '/notices_data/8/') > -1
                                || fn:indexOf(requestURI, '/notices_data/9/') > -1
                                || fn:indexOf(requestURI, '/notices_data/10/') > -1
                                || fn:indexOf(requestURI, '/notices_data/13/') > -1
                                || fn:indexOf(requestURI, 'user/mentoring/') > -1
                                || fn:indexOf(requestURI, '/user/communicator/') > -1
                                }">
                                찾아가는 영재교육 프로그램
                                </c:if>

                                <c:if test="${
                                fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                                || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                                || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                                || fn:indexOf(requestURI, '/user/program/110/') > -1
                                || fn:indexOf(requestURI, '/user/program/111/') > -1
                                || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                                || fn:indexOf(requestURI, '/user/program/105/') > -1}">
                                체험 진로탐색 프로그램
                                </c:if>

                                <c:if test="${fn:indexOf(requestURI, '/user/member/') > -1 && fn:indexOf(requestURI, '/user/member/insert.do') == -1}">기본정보수정</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/member/insert.do') > -1}">회원가입</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/mypage/communicator/') > -1 }">나의 커뮤니케이터</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/portfolio/') > -1}">포트폴리오</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/mypage/program/') > -1}">프로그램신청</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/mypage/survey/') > -1}">설문조사</c:if>

                                <c:if test="${ssion_member_type == '2'}">
                                <c:if test="${fn:indexOf(requestURI, '/activity_allowance/') > -1}">활동수당신청</c:if>
                                </c:if>

                                <c:if test="${fn:indexOf(requestURI, '/program/103/') > -1}">멘토링데이</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/program/106/') > -1}">기타</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1}">자율연구</c:if>

                                <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1}">교사연수</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/program/202/') > -1}">중앙컨설팅</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/program/203/') > -1}">성과발표회</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/program/204/') > -1}">발대식</c:if>


                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                                || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                                창의융합캠프
                                </c:if>

                                <c:if test="${fn:indexOf(requestURI, '/notices_data/1/') > -1}">공지사항</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/2/') > -1}">홍보자료</c:if>
                                <!--<c:if test="${fn:indexOf(requestURI, '/user/survey/') > -1}">설문조사</c:if>-->
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/3/') > -1}">자료실</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/12/') > -1}">FAQ</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/11/') > -1}">알림마당</c:if>
                                
                                <c:if test="${
                                fn:indexOf(requestURI, '/user/member_re/check.do') > -1}">신규 참가자 지원</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/member_re/inquiry.do') > -1}">지원서/합격자 조회</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/member_re/mento_check.do') > -1}">멘토교사 지원</c:if>

                                <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
                            </a>

                            <c:if test="${
                            fn:indexOf(requestURI, '/notices_data/5/') > -1
                            || fn:indexOf(requestURI, '/notices_data/4/') > -1
                            || fn:indexOf(requestURI, '/notices_data/6/') > -1
                            || fn:indexOf(requestURI, '/notices_data/7/') > -1
                            || fn:indexOf(requestURI, '/notices_data/8/') > -1
                            || fn:indexOf(requestURI, '/notices_data/9/') > -1
                            || fn:indexOf(requestURI, '/notices_data/10/') > -1
                            || fn:indexOf(requestURI, '/notices_data/13/') > -1

                            || fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                            || fn:indexOf(requestURI, '/subpage/program/find/') > -1
                            || fn:indexOf(requestURI, '/subpage/program/mentoring/') > -1
                            || fn:indexOf(requestURI, '/subpage/program/patent/') > -1
                            || fn:indexOf(requestURI, '/subpage/program/study/') > -1

                            || fn:indexOf(requestURI, '/program/101/') > -1
                            || fn:indexOf(requestURI, '/program/104/') > -1

                            || fn:indexOf(requestURI, '/program/110/') > -1
                            || fn:indexOf(requestURI, '/program/111/') > -1

                            || fn:indexOf(requestURI, '/program/105/') > -1
                            || fn:indexOf(requestURI, '/program/102/') > -1
                            || fn:indexOf(requestURI, '/program/103/') > -1
                            || fn:indexOf(requestURI, '/program/106/') > -1

                            || fn:indexOf(requestURI, '/mentoring/') > -1
                            || fn:indexOf(requestURI, '/user/communicator') > -1
                            }">

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">찾아가는 영재교육 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">체험 진로탐색 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의융합캠프</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/104/list.do">자율연구</a></li>
                                <!-- <li><a href="${pageContext.request.contextPath}/user/program/103/list.do">멘토링데이</a></li> -->
                                <li><a href="${pageContext.request.contextPath}/user/program/106/list.do">기타</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/communicator/list.do">커뮤니케이터</a></li>
                            </ul>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/notices_data/1/') > -1
                            || fn:indexOf(requestURI, '/notices_data/2/') > -1
                            || fn:indexOf(requestURI, '/notices_data/11/') > -1
                            || fn:indexOf(requestURI, '/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/notices_data/12/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1}">

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료</a></li>
                                <!-- <li><a href="${pageContext.request.contextPath}//user/survey/list.do">설문조사</a></li> -->
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실</a></li>
                                <!--<li><a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ</a></li>-->
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당</a></li>
                            </ul>
                            </c:if>
                            
                            <c:if test="${
                            fn:indexOf(requestURI, '/user/member_re/') > -1}">

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/member_re/check.do">신규 참가자 지원</a></li>
                                <li><a onclick="MemberReCheckForm()">지원서 조회</a></li>
                            </ul>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/user/member/') > -1
                            || fn:indexOf(requestURI, '/user/portfolio/') > -1
                            || fn:indexOf(requestURI, '/mypage/') > -1
                            || fn:indexOf(requestURI, '/user/activity_allowance/') > -1
                            || fn:indexOf(requestURI, '/mypage/communicator/') > -1}">

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">나의 커뮤니케이터</a></li>
                                <c:if test="${ssion_member_type == '1'}">
                                <li><a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오</a></li>
                                </c:if>
                                <c:if test="${ssion_member_type == '2'}">
                                <li><a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오</a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
                                <c:if test="${ssion_member_type == '2'}">
                                <li><a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청</a></li>
                                </c:if>
                            </ul>

                            </c:if>
                            <c:if test="${
                            fn:indexOf(requestURI, '/program/201/') > -1
                            || fn:indexOf(requestURI, '/program/202/') > -1
                            || fn:indexOf(requestURI, '/program/203/') > -1
                            || fn:indexOf(requestURI, '/program/204/') > -1}">

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/program/201/list.do">교사연수</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식</a></li>
                            </ul>
                            </c:if>
                        </li>

                        <c:if test="${
                        fn:indexOf(requestURI, '/subpage/program/study/') > -1
                        || fn:indexOf(requestURI, '/notices_data/6/') > -1
                        || fn:indexOf(requestURI, '/program/101/') > -1
                        || fn:indexOf(requestURI, '/notices_data/7/') > -1
                        || fn:indexOf(requestURI, '/notices_data/8/') > -1
                        || fn:indexOf(requestURI, '/notices_data/9/') > -1
                        || fn:indexOf(requestURI, '/notices_data/10/') > -1
                        || fn:indexOf(requestURI, '/notices_data/13/') > -1
                        || fn:indexOf(requestURI, 'user/mentoring/') > -1}">

                        <li class="sub_nav_menu">
                            <a href="#">
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/study/') > -1}">프로그램 소개</c:if>
                                <!--<c:if test="${fn:indexOf(requestURI, '/notices_data/6/') > -1}">진로상담</c:if>-->
                                <!--<c:if test="${fn:indexOf(requestURI, '/program/104/') > -1}">자율연구</c:if>-->
                                <c:if test="${fn:indexOf(requestURI, '/program/101/') > -1}">융합과학프로젝트</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/7/') > -1}">온라인학습멘토링</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/8/') > -1}">온라인학습멘토링</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/9/') > -1}">온라인학습멘토링</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/10/') > -1}">온라인학습멘토링</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/notices_data/13/') > -1}">온라인학습멘토링</c:if>
                                <c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}">전문가멘토링</c:if>

                                <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
                            </a>

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개</a></li>
                                <!-- <li><a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담</a></li> -->
                                <!-- <li><a href="${pageContext.request.contextPath}/user/program/104/list.do">자율연구</a></li> -->
                                <li><a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학프로젝트</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링</a>
                                    <ul class="sub_ul_menu sub_box">
                                    	<li><a href="${pageContext.request.contextPath}/user/notices_data/13/list.do">공지사항</a></li>
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a></li>
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a></li>
                                        <!--
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a></li>
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a></li>
                                    	 -->
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가멘토링</a></li>
                            </ul>
                        </li>
                        </c:if>

                        <c:if test="${
                        fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                        || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                        || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                        || fn:indexOf(requestURI, '/user/program/110/') > -1
                        || fn:indexOf(requestURI, '/user/program/111/') > -1
                        || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                        || fn:indexOf(requestURI, '/user/program/105/') > -1}">

                        <li class="sub_nav_menu">
                            <a href="#">
                                <c:if test="${fn:indexOf(requestURI, '/user/subpage/program/find/') > -1}">프로그램 소개</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1}">또래 멘토링 소개</c:if>
                                <!--<c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">또래 멘토링</c:if>-->
                                <c:if test="${fn:indexOf(requestURI, '/user/program/110/') > -1}">문화체험 소개</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/program/111/') > -1}">진로탐색 소개</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1}">발명 및 특허교육</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/program/105/') > -1}">발명 및 특허교육 신청</c:if>

                                <span><img src="${pageContext.request.contextPath}/resources//img/sub/down_arrow.png" alt="다운" /></span>
                            </a>
                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램 소개</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개</a>
                                    <!--
                                    <ul class="sub_ul_menu sub_box">
                                        <li><a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링 </a></li>
                                    </ul>
                                    -->
                                </li>
                                <li><a href="#" onclick="alert('페이지 준비중입니다.');return false;">문화체험 소개</a></li>
                                <!-- <li><a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 소개</a></li> -->
                                <li><a href="#" onclick="alert('페이지 준비중입니다.');return false;">진로탐색 소개</a></li>
                                <!-- <li><a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 소개</a></li> -->
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육</a>
                                    <ul class="sub_ul_menu sub_box">
                                        <li><a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허교육 신청</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        </c:if>

                        <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                        || fn:indexOf(requestURI, '/user/program/102/') > -1}">

                        <li class="sub_nav_menu">
                            <a href="#">
                                <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1}">창의융합캠프 소개</c:if>
                                <c:if test="${fn:indexOf(requestURI, '/user/program/102/') > -1}">창의융합캠프 신청</c:if>

                                <span><img src="${pageContext.request.contextPath}/resources//img/sub/down_arrow.png" alt="다운" /></span>
                            </a>

                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의융합캠프 소개</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/102/list.do">창의융합캠프 신청</a></li>
                            </ul>
                        </li>
                        </c:if>
                    </ul>

                    <div class="options">
                        <!-- 
                        <div class="font_plus">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/plus.png" alt="크게" /></a>
                        </div>
                        <div class="font_minus">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/minus.png" alt="작게" /></a>
                        </div>
                        -->
                        <div class="print">
                            <a id="print_btn" href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/print.png" alt="작게" /> 프린트</a>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $('#print_btn').on("click", function () {
                            $("#new_sub").printThis({
                            });
                        });
                    </script>
                </nav>
                <div class="title">
                    <c:if test="${fn:indexOf(requestURI, '/camp_/') > -1}"> <h2>프로젝트 기본방향</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/find/') > -1}"> <h2>체험 진로탐색 프로그램</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/study/') > -1}"> <h2>찾아가는 영재교육 프로그램</h2></c:if>

                    <c:if test="${fn:indexOf(requestURI, '/user/program/201/') > -1}"> <h2>교사연수</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/202/') > -1}"> <h2>중앙컨설팅</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/203/') > -1}"> <h2>성과발표회</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/204/') > -1}"> <h2>발대식</h2></c:if>

                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1}"> <h2>진로상담</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/104/') > -1}"> <h2>자율연구</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/101/') > -1}"> <h2>융합과학 프로젝트</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/7/') > -1}"> <h2>온라인학습멘토링</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/8/') > -1}"> <h2>온라인학습멘토링</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/9/') > -1}"> <h2>온라인학습멘토링</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/10/') > -1}"> <h2>온라인학습멘토링</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/mentoring/') > -1}"> <h2>전문가멘토링</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/communicator/') > -1 }"><h2>커뮤니케이터</h2></c:if>

                    <c:if test="${fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1}"> <h2>또래멘토링소개</h2></c:if>								
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}"> <h2>또래멘토링</h2></c:if>	
                    <c:if test="${fn:indexOf(requestURI, '/user/program/110/') > -1}"> <h2>문화체험 소개</h2></c:if>	
                    <c:if test="${fn:indexOf(requestURI, '/user/program/111/') > -1}"> <h2>진로탐색 소개</h2></c:if>	
                    <c:if test="${fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1}"> <h2>발명 및 특허교육 소개</h2></c:if>	
                    <c:if test="${fn:indexOf(requestURI, '/user/program/105/') > -1}"> <h2>발명 및 특허교육</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/subpage/program/camp/') > -1}"> <h2>창의융합캠프 소개</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/102/') > -1}"> <h2>창의융합캠프신청</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/103/') > -1}"> <h2>멘토링 데이</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/program/106/') > -1}"> <h2>기타</h2></c:if>

                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1}"> <h2>공지사항</h2></c:if>	
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/2/') > -1}"> <h2>홍보자료</h2></c:if>	
                    <!--<c:if test="${fn:indexOf(requestURI, '/user/survey/') > -1}"> <h2>설문조사</h2></c:if>-->	
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/3/') > -1}"> <h2>자료실</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/12/') > -1}"> <h2>FAQ</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/11/') > -1}"> <h2>알림마당</h2></c:if>
                    
                    <c:if test="${
                    fn:indexOf(requestURI, '/user/member_re/check.do') > -1
                    || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1
                    || fn:indexOf(requestURI, '/user/member_re/mento_all.do') > -1
                    || fn:indexOf(requestURI, '/user/member_re/view.do') > -1
                    || fn:indexOf(requestURI, '/user/member_re/student_update.do') > -1
                    || fn:indexOf(requestURI, '/user/member_re/update.do') > -1}"><h2>신입생 지원</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/member_re/inquiry.do') > -1}"><h2>지원서/합격자 조회</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/member_re/mento_check.do') > -1}"><h2>멘토교사 지원</h2></c:if>
						
                    <c:if test="${fn:indexOf(requestURI, '/user/member/') > -1 && fn:indexOf(requestURI, '/user/member/insert.do') == -1}"> <h2>기본정보수정</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/member/insert.do') > -1}"> <h2>회원가입</h2></c:if>
					<c:if test="${fn:indexOf(requestURI, '/user/mypage/communicator/') > -1 }"><h2>나의 커뮤니케이터</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/portfolio/') > -1}"> <h2>포트폴리오</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/mypage/program/') > -1}"> <h2>프로그램신청</h2></c:if>
                    <c:if test="${fn:indexOf(requestURI, '/user/mypage/survey/') > -1}"> <h2>설문조사</h2></c:if>
                    <c:if test="${ssion_member_type == '2'}">
                    <c:if test="${fn:indexOf(requestURI, '/user/activity_allowance/') > -1}"> <h2>활동수당신청</h2></c:if>
                    </c:if>

                    <p>영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</p>

                    <c:if test="${fn:indexOf(requestURI, '/study/') > -1}">
                    <p>영재키움 프로젝트는 찾아가는 영재교육 프로그램, 창의융합캠프, 체험·진로 탐색프로그램 등 핵심역량 기반의 맞춤형 프로그램 운영하고 있습니다.</p>
                    </c:if>						
                </div>
            </div>
        </div>
    </div>
</div>
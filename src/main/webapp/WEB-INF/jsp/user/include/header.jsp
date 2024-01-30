<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src=""></script>
<div id="new_hd_area" class="hd_area">
    <div id="new_hd_con" class="hd_con">
    	
        <!--슬라이더-->
        <div class="slider">
            <div class="slider_wrap">
                <ul class="slider_con">
                    <li class="slide_box slide_01">
                        <video id="video_slide" autoplay loop muted>
                            <source src="${pageContext.request.contextPath}/resources/video/st.mp4" />
                        </video>
                        <div class="slide_size">
                            <h2><span>영재키움</span> 프로젝트</h2>
                            <p class="nanumbarungothic">영재키움 프로젝트는 환경에 상관없이 잠재력과 재능이 충분히발휘될 수 있도록 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 사업입니다.</p>
                        </div>
                    </li>
                    <li class="slide_box slide_02">
                        <div class="slide_size">
                            <h2><span>영재키움</span> 프로젝트</h2>
                            <p class="nanumbarungothic">영재키움 프로젝트는 환경에 상관없이 잠재력과 재능이 충분히발휘될 수 있도록 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 사업입니다.</p>
                        </div>
                    </li>
                    <li class="slide_box slide_03">
                        <div class="slide_size">
                            <h2><span>영재키움</span> 프로젝트</h2>
                            <p class="nanumbarungothic">영재키움 프로젝트는 환경에 상관없이 잠재력과 재능이 충분히발휘될 수 있도록 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 사업입니다.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--슬라이더 end-->
		
		
		<!--슬라이더-->
        <div class="slider sub_slider">
            <div class="slider_wrap">
                <ul class="slider_con">
                    <li class="slide_box slide_02">
                        <div class="slide_size">
                            <h2><span>영재키움</span> 프로젝트</h2>
                            <p class="nanumbarungothic">영재키움 프로젝트는 환경에 상관없이 잠재력과 재능이 충분히발휘될 수 있도록 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 사업입니다.</p>
                        </div>
                    </li>
                    <li class="slide_box slide_03">
                        <div class="slide_size">
                            <h2><span>영재키움</span> 프로젝트</h2>
                            <p class="nanumbarungothic">영재키움 프로젝트는 환경에 상관없이 잠재력과 재능이 충분히발휘될 수 있도록 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 사업입니다.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--슬라이더 end-->
		
		
        <!--상단&중간 메뉴-->
        <div class="hd_size">
            <!--상단 로그인 메뉴-->
            <nav class="login_menu">
                <ul class="login_menu_box">
                    <li class="login">
                        <%
                        String ssion_login = (String)session.getAttribute("ssion_login");  
                        String ssion_user_id =  (String)session.getAttribute("ssion_user_id"); 
                        String ssion_level =  (String)session.getAttribute("ssion_level");
                        String ssion_member_type =  (String)session.getAttribute("ssion_member_type");
                        String ssion_name =  (String)session.getAttribute("ssion_name"); 
                        if (ssion_login == null || ssion_login == "nono"){%> 
                        <a href="${pageContext.request.contextPath}/user/member/login.do">로그인</a>
                        <%}else if(ssion_login == "okok"){ %>
                        <a href="${pageContext.request.contextPath}/user/member/logout.do">LOGOUT</a>
                        <%}else{ %>
                        <a href="${pageContext.request.contextPath}/user/member/login.do">로그인</a>
                        <%} %>
                    </li>
                    <!-- 
                    <%  if (ssion_login == null|| ssion_login == "nono"){ %>
                    <li class="join">
                        <a href="${pageContext.request.contextPath}/user/member/insert.do">회원가입</a>
                    </li>
                    <%} %>
                    -->
                    <%  if (ssion_login == "okok" && ("1".equals(ssion_level) || "2".equals(ssion_level))){ %>
                    <li class="admin">
                        <a href="${pageContext.request.contextPath}/admin/member/list.do">관리자</a>
                    </li>
                    <%} %>
                    <!-- 
                    <li class="allMenu">
                        <a href="#">전체메뉴</a>
                    </li>
                    -->
                </ul>
            </nav>
            <!--상단 로그인 메뉴 end-->

            <!--메인 메뉴-->
            <nav class="main_menu">
                <!--PC로고-->
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/index.do">
                        <div class="logo_img"></div>
                    </a>
                </div>
                <!--PC로고 end-->

                <!--메인메뉴-->
                <ul class="nav_main row float-xl-right">
                    <li class="col-sm-auto">
                        <a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do" class="menu_active">영재키움 프로젝트</a>
                        <ul class="sub_main">
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">프로젝트 기본방향</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/program/index.do">주요 프로그램</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/project/index.do">사업추친체계</a></li>
                            <!--<li><a href="${pageContext.request.contextPath}/user/subpage/project/faq/index.do">FAQ</a></li>-->
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길</a></li>
                        </ul>
                    </li>
                    <li class="col-sm-auto">
                        <a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">학생프로그램</a>
                        <ul class="sub_main">
                            <li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">찾아가는 영재교육프로그램</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">체험 진로탐색 프로그램</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의융합캠프</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/program/104/list.do">자율연구</a></li>
                            <!-- <li><a href="${pageContext.request.contextPath}/user/program/103/list.do">멘토링데이</a></li> -->
                            <li><a href="${pageContext.request.contextPath}/user/program/106/list.do">기타</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/communicator/list.do">커뮤니케이터</a></li>
                        </ul>
                    </li>
                    <li class="col-sm-auto">
                        <a href="${pageContext.request.contextPath}/user/program/201/list.do">교사 프로그램</a>
                        <ul class="sub_main">
                            <li><a href="${pageContext.request.contextPath}/user/program/201/list.do">교사연수</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식</a></li>
                        </ul>
                    </li>
                    <li class="col-sm-auto">
                        <a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">커뮤니티</a>
                        <ul class="sub_main">
                            <li><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료</a></li>
                            <!-- <li><a href="${pageContext.request.contextPath}/user/survey/list.do">설문조사</a></li> -->
                            <li><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당</a></li>
                            <!--신입생 모집 종료시 사용  onclick="alert('신입생 지원 모집이 종료되었습니다.');return false;"-->
                            <!-- <a href="${pageContext.request.contextPath}/user/member_re/check.do" onclick="alert('신입생 지원 모집이 종료되었습니다.');return false;">신입생 지원 모집</a> -->
                            <li><a href="${pageContext.request.contextPath}/user/member_re/check.do">신입생 지원 모집</a></li>
                        </ul>
                    </li>
                    <li class="col-sm-auto">
                    	<a href="${pageContext.request.contextPath}/user/member_re/check.do">모집</a>
                    	<ul class="sub_main teacher">
                    		<li><a href="${pageContext.request.contextPath}/user/member_re/intro.do">신규 참가자 지원</a></li>
                    		<li><a onclick="MemberReCheckForm()">지원서 조회</a></li>
                    		<li><a onclick="MemberRePassCheck()">합격자 조회</a></li>
                    	</ul>
                    </li>
                    <li class="col-sm-auto">
                        <a href="${pageContext.request.contextPath}/user/member/view.do">마이페이지</a>

                        <!--교사 서브메인 -->
                        <% if("2".equals(ssion_member_type)) { %>
                        <ul class="sub_main teacher">
                            <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">나의 커뮤니케이터</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당 신청</a></li>
                        </ul>
                        <!--교사 서브메인 end -->

                        <!--학생 서브메인
                        <%}else{ %>
                        <!--학생 서브메인 -->
                        <ul class="sub_main student">
                            <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">나의 커뮤니케이터</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
                        </ul>
                        <%} %>
                        <!--학생 서브메인 end -->
                    </li>
                </ul>
                <!--메인메뉴end-->
            </nav>
            <!--메인 메뉴 end-->

            <!--모바일 메인 메뉴-->
            <nav class="m_main_menu">
                <!--PC로고-->
                <div class="col-sm-auto logo">
                    <a href="${pageContext.request.contextPath}/index.do">
                        <img class="logo_off" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고" />
                        <img class="logo_on" src="${pageContext.request.contextPath}/resources/img/logo_on.png" alt="로고" />
                    </a>
                </div>
                <!--PC로고 end-->

                <!-- 모바일 메뉴 버튼 -->
                <div class="m_btn_area">
                    <div class="m_btn_con">
                        <div class="patty"></div>
                        <div class="patty"></div>
                        <div class="patty"></div>
                    </div>
                </div>
                <!-- 모바일 메뉴 버튼 end -->

                <!--메인메뉴-->
                <ul class="m_nav_main float-xl-right">
                    <div class="m_nav_close">
                        <div class="m_close_bars"></div>
                    </div>
                    <div class="m_nav_main_area">
                        <li class="col-sm-auto m_menu">
                            <a href="#" class="m_menu_active">영재키움 프로젝트<i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                            <ul class="m_sub_main">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">프로젝트 기본방향</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/program/index.do">주요 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/project/index.do">사업추친체계</a></li>
                                <!--<li><a href="${pageContext.request.contextPath}/user/subpage/project/faq/index.do">FAQ</a></li>-->
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길</a></li>
                            </ul>
                        </li>
                        <li class="col-sm-auto m_menu">
                            <a href="#">학생프로그램<i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                            <ul class="m_sub_main">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">찾아가는 영재교육프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">체험 진로탐색 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의융합캠프</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/104/list.do">자율연구</a></li>
                                <!-- <li><a href="${pageContext.request.contextPath}/user/program/103/list.do">멘토링데이</a></li> -->
                                <li><a href="${pageContext.request.contextPath}/user/program/106/list.do">기타</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/communicator/list.do">커뮤니케이터</a></li>
                            </ul>
                        </li>
                        <li class="col-sm-auto m_menu">
                            <a href="#">교사 프로그램<i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                            <ul class="m_sub_main">
                                <li><a href="${pageContext.request.contextPath}/user/program/201/list.do">교사연수</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식</a></li>
                            </ul>
                        </li>
                        <li class="col-sm-auto m_menu">
                            <a href="#">커뮤니티<i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                            <ul class="m_sub_main">
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료</a></li>
                                <!--<li><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">설문조사</a></li>-->
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">자료실</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당</a></li>
                                <!--신입생 모집 종료시 사용  onclick="alert('신입생 지원 모집이 종료되었습니다.');return false;"-->
                                <li><a href="${pageContext.request.contextPath}/user/member_re/check.do" >신입생 지원 모집</a></li>
                            </ul>
                        </li>
                        <li class="col-sm-auto m_menu">
                        	<a href="#">모집<i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                    		<ul class="m_sub_main">
	                    		<li><a href="${pageContext.request.contextPath}/user/member_re/intro.do">신규 참가자 지원</a></li>
	                    		<li><a onclick="MemberReCheckForm()">지원서 조회</a></li>
	                    		<li><a onclick="MemberRePassCheck()">합격자 조회</a></li>
                    		</ul>
                        </li>
                        <li class="col-sm-auto m_menu">
                            <a href="#">마이페이지<i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                            <!--학생 서브메인 -->
                            <% if("2".equals(ssion_member_type)) { %>
                            <ul class="m_sub_main teacher">
                                <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">나의 커뮤니케이터</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당 신청</a></li>
                            </ul>
                            <!--교사 서브메인 end -->

                            <!--학생 서브메인 
                            <%}else{ %>
                            <!--학생 서브메인 -->
                            <ul class="m_sub_main student">
                                <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/member/view.do">나의 커뮤니케이터</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
                            </ul>
                            <%} %>
                            <!--학생 서브메인 end -->
                        </li>
                    </div>
                    <ul class="m_login_menu_box">
                        <li class="login">
                            <% if (ssion_login == null || ssion_login == "nono"){%> 
                            <a href="${pageContext.request.contextPath}/user/member/login.do">로그인</a>
                            <%}else if(ssion_login == "okok"){ %>
                            <a href="${pageContext.request.contextPath}/user/member/logout.do">LOGOUT</a>
                            <%}else{ %>
                            <a href="${pageContext.request.contextPath}/user/member/login.do">로그인</a>
                            <%} %>
                        </li>
                        <!-- 
                        <% if (ssion_login == null|| ssion_login == "nono"){ %>
                        <li class="join">
                            <a href="${pageContext.request.contextPath}/user/member/insert.do">회원가입</a>
                        </li>
                        <%} %>
                        -->
                        <%  if (ssion_login == "okok" && "1".equals(ssion_level)){ %>
                        <li class="admin">
                            <a href="${pageContext.request.contextPath}/admin/member/list.do" target="_blank">관리자</a>
                        </li>
                        <%} %>
                    </ul>
                </ul>
                <!--메인메뉴end-->
            </nav>
            <!--모바일 메인 메뉴 end-->


            <!--배너 5칸-->
            <nav class="main_banner">
                <ul class="banner_con">
                    <li class="col-sm-2 banner_01">
                        <h3 class="notosans">신입생 선발</h3>
                        <!--신입생 모집 종료시 사용  onclick="alert('신입생 지원 모집이 종료되었습니다.');return false;"-->
                        <a href="${pageContext.request.contextPath}/user/member_re/check.do">
                            <p>전문가와 함께하는 진로상담 게시판입니다.</p>
                        </a>
                    </li>
                    <li class="col-sm-2 banner_02">
                        <h3 class="notosans">융합과학 프로젝트</h3>
                        <a href="${pageContext.request.contextPath}/user/program/101/list.do">
                            <p>초등학생에서 고등학생까지 다양한 프로그램 운영 및 지원 !</p>
                        </a>
                    </li>
                    <li class="col-sm-2 banner_03">
                        <h3 class="notosans">온라인 학습 멘토링</h3>
                        <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">
                            <p>KAIST 학생들과 수학, 과학, 영어 분야 온라인학습 튜터링</p>
                        </a>
                    </li>
                    <li class="col-sm-2 banner_04">
                        <h3 class="notosans">전문가 멘토링</h3>
                        <a href="${pageContext.request.contextPath}/user/mentoring/list.do">
                            <p>관련분야 전문가와 멘토교사가 함께 맞춤형 멘토링 지원</p>
                        </a>
                    </li>
                    <li class="col-sm-2 banner_05">
                        <h3 class="notosans">또래 멘토링</h3>
                        <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">
                            <p>관련분야 전문가와 멘토교사가 함께 맞춤형 멘토링 지원</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!--배너 5칸 end-->
        </div>
        <!--상단&중간 메뉴 end-->

        <!--메뉴 bg-->
        <div class="menu_bg"></div>
        <div class="m_menu_bg"></div>
        <!--메뉴 bg end-->
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>  

<style>
	.tabs .tab-contents ul li{
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
	    	<%@ include file="../../include/menu.jsp" %>

    <!-- 본문 -->
<div class="content">
    <div class="sub_cont_wrap">

        <!-- 타이틀 -->
        <div class="font_noto all_tit_30">프로그램소개</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">학생프로그램<i class="las la-angle-right"></i>체험진로탐색프로그램<i class="las la-angle-right"></i><b class="blue_01">프로그램소개</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="row">
            <div class="col-sm-5 max_img img_gab">
                <img src="${pageContext.request.contextPath}/resources/img/2022/sub_01_img_01.jpg" alt="이미지" class="b_rad_10">
            </div>
            <div class="col-sm-0"></div>
            <div class="col-sm-7">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>개요</div>
                학생의 진로와 적성을 고려하여, 멘토교사와 학생이 함께 다양한 진로탐색 및 멘토링, 현장체험 학습 및 문화체험 등을 통해 자신의 진로 설계 및 탐색 기회 제공.
                <div class="line_gab_30"></div>
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>진로탐색 체험 프로그램 주요 내용</div>
                <div class="garo_li txt_just">
                    <div class="le">진로탐색 및 멘토링</div>
                    <div class="ri">정부출연구소 견학, 대학생 멘토링 및 또래 멘토링으로 학생들의 맞춤형 진로탐색 및 멘토링 제공</div>
                    <div class="le">현장체험학습</div>
                    <div class="ri">미래 직업탐색 및 지역특화 산업현장 체험으로 학생들이 미래 직업을 실제로 체험할 수 있도록 기업체 방문과 산업현장 방문으로 운영</div>
                    <div class="le">문화체험</div>
                    <div class="ri">공연, 뮤지컬 관람이나 발명 및 특허교육과 같은 다양한 문화행사와 공개 교육을 학생과 멘토교사가 자율적으로 참여할 수 있는 기회 제공</div>
                    <div class="le box_01">※중요</div>
                    <div class="ri">2회 중 1회는 반드시 진로탐색 및 멘토링과 현장체험학습 프로그램 중에서 실시</div>
                </div>
            </div>
        </div>

        <div class="line_gab_30"></div>

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>체험 진로탐색 프로그램 예시</div>
        <table class="table table-bordered">
        <tbody>
        <tr class="align_c cell_bg">
            <th>구분</th>
            <th>프로그램</th>
            <th>내용</th>
            <th>장소</th>
        </tr>
        <tr>
            <td rowspan="3">진로탐색 및 멘토링</td>
            <td>1.정부출연 연구소 견학</td>
            <td>
                - 정출연 견학<br>
                - 최신 연구 동향 파악<br>
                - 전문가와 진로멘토링
            </td>
            <td>대덕특구 연구단지</td>
        </tr>
        <tr>
            <td>2.대학생 멘토링</td>
            <td>
                - 대학 홍보 도우미와 함께 캠퍼스 투어<br>
                - 대학 생활에 대한 안내 및 진로 멘토링
            </td>
            <td>방문대학</td>
        </tr>
        <tr>
            <td>3.또래 멘토링</td>
            <td>
                - 과학고/영재고/국제고/외고 학생들과의 멘토링
            </td>
            <td>각학교</td>
        </tr>
        <tr>
            <td rowspan="2">현장체험학슴</td>
            <td>4.미래직업 체험</td>
            <td>
                - 기업 탐방(LG, 한화, 구글, SK, 넷마블, MS 등)<br>
                - 미래 직업 체험
            </td>
            <td>방문기업</td>
        </tr>
        <tr>
            <td>5.지역특화 산업현장 체험</td>
            <td>
                - 지역 특화 산업현장 체험<br>
                - 미래 직업 체험
            </td>
            <td>해당지역</td>
        </tr>
        <tr>
            <td rowspan="2">문화체험</td>
            <td>6.문화체험</td>
            <td>
                - 뮤지컬, 영화관람, 스포츠 경기 관람 등
            </td>
            <td>해당지역</td>
        </tr>
        <tr>
            <td>7.발명 및 특허교육</td>
            <td>
                - KAIST IP영재기업인 오픈 강좌 참여<br>
                - 자율적 참여, 멘토교사 지도
            </td>
            <td>IP영재기업인 홈페이지</td>
        </tr>
        </tbody>
        </table>
        <div class="green_02 t_pad_15">체험 진로탐색은 지역별 학교급에 따라 공동 운영 가능</div>

    </div>
</div>
<!-- 본문 끝 -->
    
    <!-- 오른쪽 시작 -->
		<%@ include file="../../include/right.jsp" %>
	<!--  오른쪽 끝 -->
	<!-- 하단 -->
		<div class="footer">
		    <div class="container">
		        <div class="link">
		            <span><a href="">센터소개</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이용약관</a></span><span class="gab">ㅣ</span>
		            <span><a href="">개인정보처리방침</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이메일무단수집거부</a></span>
		        </div>
		        <div class="all_copy">
		            <span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</span><span class="gab">ㅣ</span>
		            <span>TEL : 042-350-6227</span><span class="gab">ㅣ</span>
		            <span>FAX : 042-350-6224</span><span class="gab">ㅣ</span>
		            <span>E-MAIL : giftedup@kaist.ac.kr</span>
		        </div>
		        <div class="copy">
		            <span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
		        </div>
		    </div>
		</div>
		<!-- 하단 --> 
    </div>
    <!--본문 end-->
    
</body>
</html>

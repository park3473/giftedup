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
        <div class="font_noto all_tit_30">창의융합캠프소개</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">학생프로그램<i class="las la-angle-right"></i>창의융합캠프<i class="las la-angle-right"></i><b class="blue_01">창의융합캠프소개</b></span>
        </div>
        <!-- 타이틀끝 -->

        <div class="line_gab_15"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>개요</div>
        창의융합캠프는 영재키움 프로젝트에 참가하는 학생들이 방학 중 KAIST에 집합하여, 2박 3일간 협동학습을 통해 창의적 문제해결능력을 향상시키는 프로그램
		<div class="line_bnk_15"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>(일정) 여름방학 중 2박 3일</div>
        <table class="table table-bordered">
        <tbody>
        <tr class="align_c cell_bg">
            <th>회차</th>
            <th>기간</th>
            <th>대상</th>
            <th>장소</th>
            <th>인원</th>
        </tr>
        <tr>
            <td>1차</td>
            <td>여름방학 중 2박 3일</td>
            <td>초등학생</td>
            <td>KAIST 본원</td>
            <td>약 250명</td>
        </tr>
        <tr>
            <td>2차</td>
            <td>여름방학 중 2박 3일</td>
            <td>중,고등학생</td>
            <td>KAIST 본원</td>
            <td>약 250명</td>
        </tr>
        </tbody>
        </table>

        <div class="line_gab_30"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>교육내용</div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>명사 특강, KAIST 대학생과 함께 하는 융합프로젝트 및 진로멘토링, 인문학 특강 등으로 구성</div>
        - (명사특강) 전문가에게 듣는 최첨단 과학기술의 세계 및 초청 특강<br>
        - (인문학) 전문 강사와 함께 하는 인문학 프로그램 및 토크콘서트<br>
        - (진로멘토링) KAIST 대학생 및 전문가와 함께 하는 진로 멘토링<br>
        - (융합과학 프로젝트) 담당 멘토 선생님과 함께하는 STEAM 프로젝트 수행 등
		<div class="line_bnk_15"></div>

        <!-- 운영방안 -->
        <div class="kaist font_noto f_wet_03">
            <div class="flexbox txt_just">
                <div class="item box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">운영방법</div>
                    학교급별(1차 초등, 2차 중고등)로 구분하여 총 2회 실시, KAIST 대학생을 멘토로 지정 (멘토 1명당 학생 8~10명을 배정)하여 지도 및 운영 지원
                </div>
                <div class="item box_05">
                    <div class="all_tit_20 b_pad_10 green_02">지원사항</div>
                    권역별 버스 지원(일부지역 버스 지원 불가) 및 학생만 참가하는 프로그램으로 멘토교사는 학생이 참가할 수 있도록 안내
                </div>

            </div>
        </div>
        <!-- 운영방안 끝-->

        <div class="line_gab_30"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>캠프 프로그램 예시</div>
        <table class="table table-bordered">
        <tbody>
        <tr class="align_c cell_bg">
            <th style="width:15%">시간</th>
            <th>1일차</th>
            <th>2일차</th>
            <th>3일차</th>
        </tr>
        <tr>
            <td class="align_c">07:00 ~ 09:00</td>
            <td rowspan="2">대전 KAIST학생이동</td>
            <td>기상 및 아침식사</td>
            <td>기상 및 아침식사</td>
        </tr>
        <tr>
            <td class="align_c">09:00 ~ 11:30</td>
            <td rowspan="2">인문학과의 만남</td>
            <td>도전골든벨</td>
        </tr>
        <tr>
            <td class="align_c">11:30 ~ 12:30</td>
            <td>등록 및 멘토 배정</td>
            <td>설문조사 및 폐회</td>
        </tr>
        <tr>
            <td class="align_c">12:30 ~ 13:30</td>
            <td>점심 식사</td>
            <td>점심 식사</td>
            <td>점심 식사</td>
        </tr>
        <tr>
            <td class="align_c">13:30 ~ 14:00</td>
            <td>개회식 및 안전교육</td>
            <td rowspan="2">인문학 토크 콘서트</td>
            <td rowspan="8">귀가</td>
        </tr>
        <tr>
            <td class="align_c">14:00 ~ 15:30</td>
            <td>Magic Science 특강</td>
        </tr>
        <tr>
            <td class="align_c">15:30 ~ 17:00</td>
            <td>명사특강</td>
            <td rowspan="2">
                융합과학프로젝트(초,중등)<br>
                자기소개서 작성법(고등)
            </td>
        </tr>
        <tr>
            <td class="align_c">17:00 ~ 17:30</td>
            <td rowspan="2">캠퍼스 투어</td>
        </tr>
        <tr>
            <td class="align_c">17:30 ~ 18:00</td>
            <td rowspan="2">미식가 프로그램</td>
        </tr>
        <tr>
            <td class="align_c">18:00 ~ 19:00</td>
            <td>저녁식사</td>
        </tr>
        <tr>
            <td class="align_c">19:00 ~ 21:00</td>
            <td>KAIST 대학생 진로멘토링</td>
            <td>전문가 진로멘토링</td>
        </tr>
        <tr>
            <td class="align_c">21:00 ~ 22:00</td>
            <td>숙소 이동 및 점호</td>
            <td>숙소 이동 및 점호</td>
        </tr>
        </tbody>
        </table>

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

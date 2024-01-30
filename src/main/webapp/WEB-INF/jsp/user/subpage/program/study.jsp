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
            <span class="all_sort">학생프로그램<i class="las la-angle-right"></i>영재교육프로그램<i class="las la-angle-right"></i><b class="blue_01">프로그램소개</b></span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>프로그램별 주요 운영 방안</div>

        <!-- 운영방안 -->
        <div class="kaist font_noto f_wet_03">
            <div class="flexbox txt_just">
                <div class="item box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">찾아가는 영재교육 프로그램</div>
                    멘토교사가 연간 교육계획서 작성(지도 및 멘토링)하고, KAIST 과학영재교육연구원에서 운영 지원. 고등학생의 경우는 코칭 프로그램과 팀 프로젝트로 운영
                </div>
                <div class="item box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">창의융합캠프</div>
                    2박 3일간 KAIST 집합 캠프, 1차는 초등대상, 2차는 중․고등학생 대상으로 운영. 고등학생의 경우 R&E 집중연구 예정
                </div>
                <div class="item box_05">
                    <div class="all_tit_20 b_pad_10 green_02">체험․진로탐색 프로그램</div>
                    멘토교사가 학생의 진로 적성을 파악하여 맞춤형 진로체험 및 문화체험 프로그램을 자율적으로 참여
                </div>
            </div>
        </div>
        <!-- 운영방안 끝-->

        <div class="line_gab_30"></div>
        <div class="row">
            <div class="col-sm-6">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>멘토교사와 학생이 함께하는 자기 설계 영재교육 프로그램</div>
                <div class="garo_li txt_just">
                    <div class="le">목적</div>
                    <div class="ri">학생의 관심 분야 및 수준 등을 고려하여 멘토교사가 학생과 함께 자기설계 영재교육 프로그램 설계 및 운영</div>
                    <div class="le">운영</div>
                    <div class="ri">멘토교사 개별 운영 또는 영재교사연구회를 통해 공동 운영 가능</div>
                    <div class="le">교육일정</div>
                    <div class="ri">교육 일정(날짜와 시간 및 장소)은 학생과 멘토교사 자유롭게 정하여 교육에 참여함</div>
                    <div class="le">교육내용</div>
                    <div class="ri">학생-멘토교사 자기 설계 프로그램 운영, 학생의 특성, 흥미, 적성 등을 멘토교사가 파악한 후, 학생에게 맞춤형으로 영재교육 운영</div>
                    <div class="le box_01">※예시</div>
                    <div class="ri">진로 및 학업 성향 검사 결과 상담(진로성향검사, 학업성향검사 등), 학습 멘토링(수학, 과학 심화 학습),정서 멘토링 융합과학 프로젝트 등(KAIST에서 프로그램 제공 가능)</div>
                </div>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-5">
			    <div class="line_mog_30"></div>
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>전문가가 찾아가는 영재교육 프로그램</div>
                <div class="garo_li txt_just">
                    <div class="le">목적</div>
                    <div class="ri">학생의 진로와 적성을 고려하여, 영재교육기관, 출연(연), 대학, 의료계, 법조계 등의 전문가와 함께 하는 영재교육 프로그램 제공</div>
                    <div class="le">교육일정</div>
                    <div class="ri">교육 일정(날짜와 시간 및 장소)은 멘토교사와 전문가가 정한 날짜에 참여</div>
                    <div class="le">운영방법</div>
                    <div class="ri">학생의 진로와 적성을 고려한 전문가와 함께 1:1 또는 지역별로 학교급에 따라 공동으로 멘토링 실시</div>
                </div>
            </div>
        </div>

        <div class="line_gab_30"></div>

        <!-- 표 -->
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>영재키움 프로젝트 연간 교육 과정</div>
        <table class="table table-bordered">
        <tbody>
        <tr class="align_c">
            <th colspan="2">항목</th>
            <th>내용</th>
            <th>시간</th>
            <th>비고</th>
        </tr>
        <tr>
            <td colspan="2">영재키움 프로젝트<br>오리엔테이션</td>
            <td>
                - 대상: 학생, 멘토교사 신규 참여자<br>
                - 일정: 20.5월 예정<br>
                - 내용: 영재키움 프로젝트안내, 멘토링 활동 안내 등<br>
                - 장소: 대전 KAIST
            </td>
            <td class="align_c">-</td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="4" class="align_c">역량기반<br>영재교육<br>프로그램</td>
            <td rowspan="2" class="cell_bg">찾아가는<br>영재교육</td>
            <td class="align_lt cell_bg">
                <p>학생-멘토 자기설계 영재교육 프로그램</p>
                - 대상 : 학생, 멘토교사<br>
                - 내용 : 학생-멘토교사 자기설계 영재교육<br>
                - 예시 : 진로적성 검사, 상담, 학습지도, 자율연구, 융합과학프로젝트, 학습멘토링 등
            </td>
            <td rowspan="3" class="cell_bg align_c">24</td>
            <td rowspan="3" class="cell_bg align_c">멘토교사-학생<br>1:1 자율운영</td>
        </tr>
        <tr>
            <td class="cell_bg">
                <p>전문가와 함께하는 영재교육 프로그램</p>
                대상 : 학생, 멘토교사, 전문가<br>
                내용 : 관련 분야 전문가와 멘토교사가 함께 학생 맞춤형 멘토링 지원
            </td>
        </tr>
        <tr>
            <td class="cell_bg">체험·진로<br>탐색 프로그램</td>
            <td class="cell_bg">
                - 대상 : 학생, 멘토교사<br>
                - 진로탐색, 현장체험 학습, 문화체험, 온라인학습멘토링 등
            </td>
        </tr>
        <tr>
            <td>창의융합<br>캠프</td>
            <td >
                - 대상 : 학생<br>
                - 일정 : 2020년 여름방학 중 2박 3일<br>
                - 내용 : 특강 및 다양한 프로그램<br>
                - 장소 : 대전 KAIST 본원
            </td>
            <td class="align_c">24</td>
            <td class="align_c">KAIST에서 실시</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td>총 시간</td>
            <td class="align_c">48</td>
            <td></td>
        </tr>
        </tbody>
        </table>
        <!-- 표끝 -->

    </div>
</div>
    
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

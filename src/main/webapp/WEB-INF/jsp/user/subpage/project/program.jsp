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
        <div class="font_noto all_tit_30">주요프로그램</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">영재키움프로젝트<i class="las la-angle-right"></i><b class="blue_01">주요프로그램</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>영재키움프로젝트</div>
        <div class="txt_just">잠재력과 재능이 충분히 발휘될 수 있도록, 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 영재키움 프로젝트 사업입니다.</div>
        <div class="kaist font_noto f_wet_03">
            <div class="flexbox txt_just">
                <div class="item_03 box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">맞춤형 교육지원(1:1 교사 멘토링)</div>
                    학생의 특성을 고려하여 집중적으로 지원이 필요한 부분을 교사와 함께 고민하고 해결 할 수 있도록 지원합니다.
                </div>
                <div class="item_03 box_05">
                    <div class="all_tit_20 b_pad_10 green_02">맞춤형 교육프로그램</div>
                    역량 중심의 영재 교육프로그램을 멘토교사와 KAIST가 함께 운영합니다.
                </div>

            </div>
        </div>

        <div class="line_gab_30"></div>

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
        <div class="t_pad_15">※ 찾아가는 영재교육 및 체험・진로탐색 프로그램은 24시간 내에서 학생과 멘토교사가 자유롭게 수행(단, 한 프로그램에 집중되지 않도록 주의)</div>

        <div class="line_gab_30"></div>

        <div class="row kaist">
            <div class="col-sm-6">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>영재키움 참가학생은</div>
                <div class="b_pad_15">아래 조건을 충족하는 학생 지원 자격을 통해 추천합니다.</div>
                <div class="box_06">
                    ① 교육급여 수급자<br>
                    ② 도서·벽지에 거주하는자<br>
                    ③ 특수교육 대상자<br>
                    ④ 행정구역상 읍·면 지역에 거주하는 자 등<br>
                    ⑤ 사회·경제적 이유로 교육기회의 격차가 발생하였다고 인정되는자
                </div>
                <div class="t_pad_15"></div>
                ※ 1차년도는 초등학교 4학년에서 고등학교 1학년 선발, 최소 3년간 프로그램 지원예정('18년 고1학년 →' 20년 고3학년까지 확대)<br>
                ※ 선발분야는 수학, 과학, 정보, 발명, 인문사회(예술, 체육 제외)
                <div class="line_bnk_15"></div>
            </div>
            <div class="col-sm-6">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>영재키움 멘토교사는</div>
                <div class="b_pad_15">참가학생과 적극적으로 소통하여 지원할 의지가 있는 교사를 추천합니다.</div>
                <div class="box_06">
                    <b>멘토교사의 역할</b><br>

                    ① 영재키움 참가 학생을 위한 영재교육 프로그램 운영 및 참여<br>
                    ② 영재키움 참가 학생의 학습, 진로, 정서 발달을 위한 상담 실시<br>
                    ③ 영재키움 참가 학생의 멘토링 활동 사항 관리
                </div>
            </div>
        </div>

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

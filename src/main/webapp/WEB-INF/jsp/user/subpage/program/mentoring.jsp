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

<style type="text/css">
.mento_img{bottom:100px;right:0}
@media only screen and (max-width:1024px) {

/* 서브페이지 오른쪽 처리 */
.right{display:none}

.mento_img{display:none}
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
        <div class="font_noto all_tit_30">또래멘토링소개</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">학생프로그램<i class="las la-angle-right"></i>체험진로탐색프로그램<i class="las la-angle-right"></i><b class="blue_01">또래멘토링소개</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <!-- 운영방안 -->
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>과학고 및 영재학교 또래멘토링</div>
        <div class="kaist font_noto f_wet_03">
            <div class="flexbox txt_just">
                <div class="item box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">프로그램명</div>
                    과학고 및 영재학교 또래 멘토링
                </div>
                <div class="item box_05">
                    <div class="all_tit_20 b_pad_10 green_02">프로그램 운영목적</div>
                    “영재키움 프로젝트”의 참여학생이 이공계 영재교육의 산실인 과학고 및 영재학교를 방문하여 해당교의 재학생과의 멘토링을 함으로써 진로를 탐색하고 학업에 대한 동기부여를 목적으로 함
                </div>
                <div class="item box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">학교방문기간</div>
                    추후 안내 예정
                </div>
                <div class="item box_04">
                    <div class="all_tit_20 b_pad_10 blue_01">방문규모일정</div>
                    학교의 여건에 따라 방문 팀의 수와 일정 결정
                </div>
            </div>
        </div>
        <!-- 운영방안 끝-->

        <div class="line_gab_30"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>체험 진로탐색 프로그램 예시</div>
        <table class="table table-bordered">
        <tbody>
        <tr class="align_c cell_bg">
            <th rowspan="2" style="width:7%">구분</th>
            <th colspan="2">영재키움프로젝트 참가 팀</th>
            <th colspan="2">과학고/영재고</th>
            <th rowspan="2">KAIST 과학영재 교육연구원</th>
        </tr>
        <tr class="align_c">
            <th>참여학생</th>
            <th style="width:20%">멘토교사</th>
            <th>담당교사</th>
            <th>멘토학생</th>
        </tr>
        <tr>
            <td class="align_c">신청</td>
            <td>멘토교사에게 희망학교 멘토링 요청</td>
            <td>과학고/영재학교 담당교사에게 최소 1개월 전에 이메일 및 전화로 멘토링 및 견학 신청</td>
            <td></td>
            <td></td>
            <td rowspan="3">일정조율 및 운영지원</td>
        </tr>
        <tr>
            <td class="align_c">준비</td>
            <td></td>
            <td></td>
            <td>
                - 멘토링 및 견학 일정 조율 및 접수<br>
                - 멘토링 운영 학생 선정
            </td>
            <td>
                1365:자원봉사 포털에 접속하여 봉사 신청
            </td>
        </tr>
        <tr>
            <td class="align_c">방문</td>
            <td>희망 학교 방문</td>
            <td>희망 학교 방문</td>
            <td></td>
            <td>
                멘토링 및 견학 운영<br>
                (멘토링 1시간, 견학1시간, 내외운영)
            </td>
        </tr>
        <tr>
            <td class="align_c">완료</td>
            <td></td>
            <td>
                - 영재키움 홈페이지의 포트폴리오<br>
                - 작성페이지에서 멘토링 및 견학<br>
                프로그램 운영 결과 기록
            </td>
            <td></td>
            <td></td>
            <td>
                - 멘토학생 봉사내용 확인 및<br>
                - 시간 인정(2시간)
            </td>
        </tr>
        </tbody>
        </table>

        <div class="line_gab_30"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>주체별 또래 멘토링 참여/운영 방법</div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>참여 학생(영재키움 프로젝트 참여 학생)</div>
        - 영재키움 프로젝트 참여 학생으로, 초등학교 4학년부터 고등학교 1학년까지의 학생(이 프로그램의 참여는 초등학교 4학년부터 중학교 3학년까지의 학생을 권장함)<br>
        - 멘토 교사에게 방문을 원하는 학교를 제안
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>멘토교사</div>
        - 영재키움 프로젝트 참여 교사로, 참여 학생의 요구 수렴 및 방문 학교 섭외<br>
        - 방문 희망학교의 담당교사와 연락하여 일정 조율 및 방문 확정<br>
        - 참여 학생을 인솔하여 학교 방문(방문학교 목록은 붙 참조)<br>
        - 또래 멘토링 운영결과를 영재키움 프로젝트의 포트폴리오 작성페이지에 기록
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>담당교사</div>
        - 과학고/영재학교의 교원으로 멘토 교사가 학교방문을 요청할 경우 일정 조율<br>
        - 해당 학교에서 운영할 멘토링 및 견학을 지도할 학생을 선발<br>
        - 방문 희망 멘토 교사에게 확정된 일시와 장소, 멘토학생 등의 정보를 안내
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>멘토학생(과학고/영재학교 재학생)</div>
        - 1365(자원봉사포털)를 이용하여 봉사 신청(세부 신청 방법은 부록1 참조)<br>
        - 과학고/영재학교의 학생으로 멘토링 및 견학 운영<br>
        - 멘토링 및 견학의 운영 시간은 각 1시간 내외 총 2시간 내외로 운영
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>KAIST 과학영재교육연구원(사업주관 기관 담당자)</div>
        - 프로그램 일정조율 및 운영 지원<br>
        - 1365(자원봉사포털)를 이용하여 멘토학생 봉사내용 확인 및 봉사시수 승인<br>
        - 담당자 연락처: KAIST 과학영재교육연구원 김희목 연구원(042-350-6223, giftedup@kaist.ac.kr)
		 <div class="pos_r">
			<div class="max_img align_c pos_a mento_img"><img src="${pageContext.request.contextPath}/resources/img/2022/mento_img_01.jpg" alt="이미지"></div>
	    </div>
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
					<p><span>TEL : </span>서울・강원・제주권역 (서울대학교) : 02-880-4477~8, 경기・인천권역 (인천대학교) : 032-835-4915, 충청・호남권역 (대전대학교) : 042-226-0701(혹은 0705), 경상권역 (부산대학교) : 051-510-1840~2</p>
		            
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

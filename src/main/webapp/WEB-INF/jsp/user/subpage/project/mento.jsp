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
    
    thead {background-color:#89b5d4; color:white;}
.table-striped tbody tr:nth-of-type(odd) {background-color: #e4f2f9;}
.div_2 {margin:0 20px 0 20px;}
.col_sm_3 .tit {border-bottom: 1px #cccccc solid;}
.row {margin-right: 0px; margin-left: 0px;}
.kaist .item_03, .kaist .item_05 {flex-basis: 360px;}
.kaist .item_03 {padding:20px; color: rgba(0,0,0,.5);}

@media only screen and (max-width:767px) {
.div_2 {margin:10px 0 10px 0;}
}
@media only screen and (max-width:1024px) {
.table-flow {width:100%;}
.overflow_scroll {overflow:scroll;}
.txt-nowrap {white-space: nowrap;}

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
        <div class="font_noto all_tit_30">교사 프로그램</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움 프로젝트는 멘토교사의 역량 강화를 위해 다양한 프로그램을 운영하고 있습니다</span>
            <span class="all_sort">영재키움 프로젝트<i class="las la-angle-right"></i><b class="blue_01">교사 프로그램</b></span>
        </div>
        <div class="line_gab_15"></div>

        


        <div class="row kaist">
        <div class="col-sm-12 p-0 m-0">
            <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>대표 멘토교사제 운영</div>
            <div class="row col_sm_3 txt-brk text-center">
            <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;" data-aos="fade-up" data-aos-delay="300">
            <div class="tit all_tit_20 font_noto text-justify" style="border-bottom:none;">&middot; 17개 시도별로 대표 멘토교사제를 운영하여 영재키움 프로젝트 멘토링 프로그램 개발, 신규 멘토교사 멘토링 활동 지원 및 교사 연구회 등을 운영</div>
            </div>
            </div>
        </div>  
        </div>

        <div class="line_gab_30"></div>
        <div class="row kaist">
        <div class="col-sm-12 p-0 m-0">
            <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>창의융합 캠프</div>
            <div class="row col_sm_3 txt-brk text-center">
            <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;" data-aos="fade-up" data-aos-delay="300">
            <div class="tit all_tit_20 font_noto text-justify" style="border-bottom:none;">
            &middot; 소외계층 영재교육 활성화를 위한 우수사례 발굴 및 영재교육 발전방안 도출<br>
            &middot; 성과발표회 때 지역별 멘토교사 사례 발표 및 공유
            </div>
            </div>
            </div>
        </div>  
        </div>

        
        <div class="line_gab_30"></div>

        <!-- 표 시작 -->
        <div class="row kaist">
            <div class="col-sm-12 p-0 m-0">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>권역별 중앙컨설팅</div>
                <div class="row col_sm_3 txt-brk text-center mb-3">
                <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;" data-aos="fade-up" data-aos-delay="300">
                <div class="tit all_tit_20 font_noto text-justify" style="border-bottom:none;">
                &middot; 멘토링 진행과정의 애로사항 해소하고 멘토링 역량 함양하기 위해 멘토교사간 사례 공유 및 현장 중심의 개선과제 도출<br>
                &middot; (상반기) 17개 권역별 오프라인 중앙컨설팅, (하반기) 온라인
                </div>
                </div>
                </div>
                <div class="font-weight-bold">2022년 상반기 중앙컨설팅 세부일정(안)</div>
                        <div class="overflow_scroll">
                            <table class="table table-striped table-borderd text-center txt-nowrap table-flow mt-3 table-bordered">
                                <thead>
                                    <tr>
                                        <td>시간</td>
                                        <td>주요내용</td>
                                        <td>담당자</td>
                                        <td>비고</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>5’</td>
                                        <td class="text-justify">참석자 소개 및 인사</td>
                                        <td>사회자</td>
                                        <td>공통</td>
                                    </tr>
                                    <tr>
                                        <td>30’</td>
                                        <td class="text-justify">2022년 영재키움 프로젝트 운영 안내<br>2022년 하반기 KAIST 주관 주요 행사 안내<br>기타 안내사항 공지</td>
                                        <td>사회자</td>
                                        <td>공통</td>
                                    </tr>
                                    <tr>
                                        <td>20’</td>
                                        <td class="text-justify">학교급별 논의(대표 멘토교사 주관)<br>&middot; 멘토링 우수사례 공유, 멘토링 애로사항 및 개선사항 논의</td>
                                        <td>대표 멘토교사</td>
                                        <td>분반</td>
                                    </tr>
                                    <tr>
                                        <td>20’</td>
                                        <td class="text-justify">컨설팅 실시<br>&middot; 학교급별 우수사례 및 논의결과 발표<br>&middot; 컨설팅 요구사항 발표<br>&middot; 컨설팅 요구사항 중심으로 맞춤형 컨설팅 실시</td>
                                        <td>컨설팅단</td>
                                        <td>공통</td>
                                    </tr>
                                    <tr>
                                        <td>5’</td>
                                        <td class="text-justify">총평 및 폐회</td>
                                        <td>사회자</td>
                                        <td>공통</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
            </div>                
        </div>
        <!-- 표 끝 -->
        
        <div class="line_gab_30"></div>
        <!-- 표 시작 -->
        <div class="row kaist">
            <div class="col-sm-12 p-0 m-0">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>멘토교사 직무연수</div>
                <div class="row col_sm_3 txt-brk text-center mb-3">
                <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;" data-aos="fade-up" data-aos-delay="300">
                <div class="tit all_tit_20 font_noto text-justify" style="border-bottom:none;">
                &middot; (개요) 영재키움 프로젝트 멘토교사의 역량 강화 지원을 위한 직무연수 개최<br>
                &middot; (시수) 15시간(1학점), 직무연수(실시간 연수 1일 3시간, 온라인 연수 10시간, 과제 2시간)
                </div>
                </div>
                </div>
                <div class="font-weight-bold">운영내용</div>
                        <div class="overflow_scroll">
                            <table class="table table-striped table-borderd text-center txt-nowrap table-flow mt-3 table-bordered">
                                <thead>
                                    <tr>
                                        <td>방법</td>
                                        <td>실시간 온라인 연수(7.9,토)</td>
                                        <td>온라인 연수(7.9-7.31)</td>
                                        <td>과제(7.31까지)</td>
                                        <td>이수증(8월중)</td>
                                    </tr>
                                </thead>
                                <tbody style="border-bottom: 1px solid #dee2e6;">
                                    <tr>
                                        <td>내용</td>
                                        <td class="text-justify">3시간 실시간 연수(Zoom) <br>&middot; AI 융합 영재를 위한 지도방법 탐색하기<br>(강신옥 대표 교사) <br>&middot; 더 넓은 세상이 선물하는 더 넓은 생각<br>(박성호 작가)</td>
                                        <td>총 10차시 영재교육 강의 중<br> 5차시 이상 강의 수강</td>
                                        <td>소외계층 영재를 위한<br> 나만의 멘토링 방법 과제 제출</td>
                                        <td>연수 이수증 발급</td>
                                    </tr>
                                    <tr>
                                        <td>시수</td>
                                        <td>3시간</td>
                                        <td>10시간(1차시/2시간*5차시)</td>
                                        <td>2시간</td>
                                        <td>-</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
            </div>                
        </div>
        <!-- 표 끝 -->


        <div class="line_gab_30"></div>
        <div class="row kaist">
        <div class="col-sm-12 p-0 m-0">
            <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>성과발표회</div>
            <div class="row col_sm_3 txt-brk text-center">
            <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;" data-aos="fade-up" data-aos-delay="300">
            <div class="tit all_tit_20 font_noto text-justify" style="border-bottom:none;">
            &middot; 1년간의 영재키움 프로젝트 성과를 공유하고자 멘토교사 대상 성과발표회 개최<br>
            &middot; 특강, 멘토링 우수사례 발표, 17개 시도별 주요 성과 발표 및 성과자료 전시 등<br>
            &middot; 매년 1월 성과 발표회 개최
            </div>
            </div>
            </div>
        </div>  
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
		            <span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</span><span class="gab">ㅣ</span>
		            <span>TEL : 042-350-6223</span><span class="gab">ㅣ</span>
		            <span>FAX : 042-350-8660</span><span class="gab">ㅣ</span>
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

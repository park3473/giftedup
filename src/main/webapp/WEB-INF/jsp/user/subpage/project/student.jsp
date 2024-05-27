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
.row_1 {margin-right: 0px; margin-left: 0px;}
.kaist .item_03, .kaist .item_05 {flex-basis: 360px;}
.kaist .item_03 {padding:30px; color: rgba(0,0,0,.5);}

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
        <div class="font_noto all_tit_30">학생 프로그램</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">영재키움 프로젝트<i class="las la-angle-right"></i><b class="blue_01">학생 프로그램</b></span>
        </div>
        <div class="line_gab_15"></div>

        <!-- 표 -->
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>역량기반 영재교육 과정</div>
        <span>맞춤형 영재 성장지원 프로그램(연간 48시간 운영)</span>
        <div class="overflow_scroll">
        <table class="table table-striped table-borderd text-center txt-nowrap table-flow mt-3 table-bordered">
            <thead>
                <tr class="text-center">
                    <th>구분</th>
                    <th>주요내용</th>
                    <th>시간</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody class="text-center" style="border-bottom:1px solid #dee2e6">
                <tr>
                    <td rowspan="4">맞춤형 영재 <br> 성장지원 프로그램</td>
                    <td class="text-justify">1:1 멘토 교사 멘토링
                        <br><span>&middot; 학생의 관심 분야 및 수준을 고려하여 멘토 교사를 통한 1:1 자기 설계 영재 교육 프로그램</span>
                        <br><span>&middot; 진로탐색, 현장 체험 학습, 상담 및 문화체험 활동</span>
                    </td>
                    <td rowspan="5">24시간</td>
                    <td rowspan="5">1:1 멘토 교사지원</td>
                </tr>
                <tr>
                    <td class="text-justify">쌤과 함께*(前 창의융합 커뮤니케이터)
                        <br><span>&middot; 진로탐색, 정서함양 및 학습지원 등의 온라인 멘토링 프로그램 <p class="blue_01 font-bold font-14">* 타지역 교원의 강의를 학생이 신청 &middot; 수강할 수 있는 프로그램</p></span>
                    </td>
                </tr>
                <tr class="text-justify">
                    <td>지역특화 멘토링 프로그램
                        <br><span>&middot; 과기특성화대학과 연계하여 멘토링 프로그램 운영</span>
                    </td>
                </tr>
                <tr class="text-justify">
                    <td>전문가 온라인 정서 상담 프로그램
                        <br><span>&middot; 과학고 및 영재학교의 전문상담교사가 온라인 정서 상담</span>
                    </td>
                </tr>
                <tr>
                    <td>진로탐색 프로그램</td>
                    <td class="text-justify">학교방문프로그램
                        <br><span>&middot; 과학고, 영재학교, 마이스터고, 대학 방문을 통한 진로탐색</span>
                    </td>
                </tr>
                <tr>
                    <td>창의융합 캠프</td>
                    <td class="text-justify">창의융합 캠프 (KAIST)
                        <br><span>&middot; 진로 설계 및 창의적 문제해결력 향상을 위한 캠프</span>
                        <br><span>&middot; (초등)온라인 캠프, (중등)집합 캠프</span>
                        <p class="blue_01 font-bold font-14">※ 캠프 프로그램을 모두 참여한 경우에만 시수 인정</p>
                    </td>
                    <td rowspan="2">24시간</td>
                    <td rowspan="2">KAIST 지원</td>
                </tr>
                <tr>
                    <td>온라인 학습 멘토링</td>
                    <td class="text-justify">KAIST 온라인 학습 지원
                        <br><span>&middot; KAIST 대학생의 온라인 학습 지원</span>
                        <br><span>&middot; 연간 수학 24시간. 과학 12시간 예정</span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>계</td>
                    <td>48시간</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        </div>
        <!-- 표 끝 -->
    

        <div class="line_gab_30"></div>

        <div class="kaist">
            <div class="row">
            <div class="col-sm-12">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>개인별 포트폴리오 관리</div>
                <div class="b_pad_15">참여 학생들이 직접 교육프로그램 참여 이력 및 소감 작성, 담당 멘토교사가 내용 확인 및 피드백을 통해 체계적인 기록관리</div>
                <div class="row_1 row col_sm_3 txt-brk text-center">
                <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;padding:30px" data-aos="fade-up" data-aos-delay="300">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_05.png">
                <div class="tit all_tit_20 font_noto">[학생-멘토교사]<br>멘토링 활동</div>
                <div class="sul">
                    <div class="all_blit">멘토링 활동 프로그램 참여</div>
                </div>
                </div>
                <div class="div_2 col-md col-12 aos-init aos-animate pt-3 pb-3" style="background-color:rgba(0,89,156,.1); border-radius:10px;padding:30px" data-aos="fade-up" data-aos-delay="300">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_06.png">
                <div class="tit all_tit_20 font_noto">[학생]<br>포트폴리오 작성</div>
                <div class="sul">
                    <div class="all_blit">멘토링 활동 포트폴리오 작성</div>
                    <div class="all_blit">학생이 홈페이지에서 작성</div>
                    <div class="all_blit">모든 활동에 대해 작성</div>
                </div>
                </div>
                <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;padding:30px" data-aos="fade-up" data-aos-delay="300">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_07.png">
                <div class="tit all_tit_20 font_noto">[교사]<br>포트폴리오 확인</div>
                <div class="sul">
                    <div class="all_blit">학생이 작성한 포트폴리오 확인</div>
                    <div class="all_blit">피드백 작성</div> 
                </div>
                </div>
                </div>
            </div>
            </div>
        </div>

        <div class="line_gab_30"></div>

        <div class="row kaist">
        <div class="col-sm-12">
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>맞춤형 영재성장 지원 프로그램</div>
        <div class="kaist font_noto f_wet_03">
            <div class="flexbox text-justify">
                <div class="item_03 box_05">
                    <div class="all_tit_20 b_pad_10 green_02">1:1 멘토 교사 멘토링</div>
                    <span>&middot; 학생의 관심 분야 및 수준을 고려하여 멘토 교사를 통한 1:1 자기 설계 영재 교육 프로그램</span> <br>
                    <span>&middot; 진로탐색, 현장 체험 학습, 상담 및 문화체험 활동</span>
                </div>
                <div class="item_03 box_04">
                    <div class="all_tit_20 b_pad_10 green_02">창의융합 커뮤니케이터</div>
                    <span>&middot; 진로탐색, 정서함양 및 학습지원 등의 온라인 멘토링 프로그램 <br><p class="blue_01 font-14" style="line-height: 20px;">* 타지역 교원의 강의를 학생이 신청‧수강할 수 있는 프로그램</p></span>
                </div>
                <div class="item_03 box_05">
                    <div class="all_tit_20 b_pad_10 green_02">지역특화 전문가 멘토링 프로그램</div>
                    <span>&middot; 과기특성화대학과 연계하여 전문가 멘토링 프로그램 운영(권역별로 실시), 자신의 지역이 아니어도 참여 가능</span>
                </div>
            </div>
        </div>
        </div>
        </div>
        
        <div class="line_gab_30"></div>

        <div class="row kaist">
        <div class="col-sm-12">
            <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>과학고 영재학교 방문 프로그램</div>
            <div class="row_1 row col_sm_3 txt-brk text-center">
            <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;padding-top:30px" data-aos="fade-up" data-aos-delay="300">
            <div class="tit all_tit_20 font_noto" style="border-bottom:none;">과학고, 영재학교, 마이스터고, 대학 방문 진로탐색</div>
            </div>
            </div>
        </div>  
        </div>

        <div class="line_gab_30"></div>
        <div class="row kaist">
        <div class="col-sm-12">
            <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>창의융합 캠프</div>
            <div class="row_1 row col_sm_3 txt-brk text-center">
            <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;padding-top:30px" data-aos="fade-up" data-aos-delay="300">
            <div class="b_pad_15 mb-2">진로 설계 및 창의적 문제해결력 향상을 위한 캠프, (초등) 온라인 캠프, (중ㆍ고등) 집합 캠프
            <br><span class="blue_01 font-bold font-14">※ 캠프 프로그램을 모두 참여한 경우에만 시수 인정</span>
            </div>
            </div>
            </div>
        </div>  
        </div>


        <div class="line_gab_30"></div>

        <div class="row kaist">
            <div class="col-sm-12">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>온라인 학습멘토링</div>
                <div class="row_1 row col_sm_3 txt-brk text-center">
                <div class="col-md col-12 aos-init aos-animate pt-3" style="background-color:rgba(0,89,156,.05); border-radius:10px;padding-top:30px" data-aos="fade-up" data-aos-delay="300">
                <div class="tit all_tit_20 font_noto">KAIST 온라인 학습 지원</div>
                <div class="sul mb-3">
                    <div class="all_blit">KAIST 대학생의 온라인 학습 지원, 수학, 과학 수업을 격주로 3시간씩 진행, 독서프로그램</div>
                </div>
                </div>
                </div>
            </div>                
        </div>


        <div class="line_gab_30"></div>
        <!-- 표 시작 -->
        <div class="row kaist">
            <div class="col-sm-12">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>2022년 학생 대상 프로그램 일정(안)</div>
                <div class="overflow_scroll">
                    <table class="table table-striped table-borderd text-center txt-nowrap table-flow mt-3 table-bordered">
                        <thead>
                            <tr>
                                <td>순</td>
                                <td>내용</td>
                                <td>일정</td>
                                <td>장소</td>
                                <td>비고</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>온라인 학습멘토링</td>
                                <td>1차 : 22.04.30(토) - 22.07.09(토)<br>
                                    2차 : 22.08.20(토) - 23.01.28(토)
                                </td>
                                <td>영재키움 홈페이지 / ZOOM</td>
                                <td>http://www.giftedup.org</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>(초등)창의융합캠프</td>
                                <td>22.07.25(월) - 22.07.27(수)</td>
                                <td>온라인</td>
                                <td>COVID-19 상황을 고려하여 온라인 캠프 운영</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>(중&middot;고등)창의융합캠프</td>
                                <td>22.08.02.(화) - 22.08.03.(수)</td>
                                <td>오프라인</td>
                                <td>KAIST 문지캠퍼스</td>
                            </tr>
                            <tr>
                                <td rowspan="4">4</td>
                                <td rowspan="4">전문가 멘토링 데이</td>
                                <td>22.09.24.(토)</td>
                                <td>충청</td>
                                <td rowspan="4">선생님 프로그램 有, <br> 본인 지역이 아니라도 참석 가능</td>
                            </tr>
                            <tr>
                                <td>22.10.08.(토)</td>
                                <td>경기ㆍ강원</td>
                            </tr>
                            <tr>
                                <td>22.10.15.(토)</td>
                                <td>경상</td>
                            </tr>
                            <tr>
                                <td>22.10.22.(토)</td>
                                <td>전라</td>
                            </tr>
                            <tr style="border-bottom:1px solid #dee2e6;">
                                <td>5</td>
                                <td>쌤과함께(前 창의융합커뮤니케이터)</td>
                                <td>22.09. - 22.12.</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                        </tbody>

                    </table>
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

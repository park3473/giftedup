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
        <div class="font_noto all_tit_30">영재키움 프로젝트 추진방향</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">영재키움 프로젝트<i class="las la-angle-right"></i><b class="blue_01">영재키움 프로젝트 추진방향</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>추진방향</div>
        <!-- <div class="txt_just">영재키움 프로젝트는 환경에 상관없이 잠재력과 재능이 충분히발휘될 수 있도록 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 사업입니다.</div> -->

        <div class="kaist font_noto f_wet_03">
            <div class="flexbox text-center">
                <div class="item_03 box_03">
                    <div class="all_tit_20 b_pad_10 blue_01 font-28">비전</div>
                    희망하는 모든 학생에게 영재교육 기회 제공
                </div>
                <div class="col-12 font-22">
                <i class="las la-angle-double-up"></i>
                </div>
                <div class="item_03 box_05 font-18">
                    <div class="all_tit_20 b_pad_10 green_02 font-28">목표</div>
                    맞춤형 교육 지원을 통한 영재교육 대상자의 잠재력 및 재능 계발
                </div>
                <div class="col-12 font-22">
                <i class="las la-angle-double-up"></i>
                </div>
            </div>
        </div>

        

        <div class="line_gab_20"></div>

        <div class="row col_sm_3 txt-brk">
            <div class="col-sm-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_03.png">
                <div class="tit all_tit_20 font_noto">맞춤형 영재교육 프로그램 운영</div>
                <div class="sul">
                    <div class="all_blit">오리엔테이션</div>
                    <div class="all_blit">역량기반 영재교육 프로그램 운영</div>
                    <div class="all_blit">학업역량 강화를 위한 학습멘토링 운영</div>
                    <div class="all_blit">KAIST 멘토단 운영</div>
                </div>
            </div>
            <div class="col-sm-3 gray aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_01.png">
                <div class="tit all_tit_20 font_noto">맞춤형 교육을 위한 멘토링 운영</div>
                <div class="sul">
                    <div class="all_blit">대표 멘토교사제 운영</div>
                    <div class="all_blit">멘토교사 직무 연수 운영</div>
                    <div class="all_blit">중앙 컨설팅단 운영</div>
                    <div class="all_blit">멘토교사 연구회 운영</div>
                    <div class="all_blit">창의융합 커뮤니케이터 운영</div>
                </div>
            </div>
            <div class="col-sm-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_02.png">
                <div class="tit all_tit_20 font_noto">교육성과 체계적 관리</div>
                <div class="sul">
                    <div class="all_blit">개인별 포트폴리오</div>
                    <div class="all_blit">교육 효과성 검증</div>
                </div>
            </div>
            
            <div class="col-sm-3 gray aos-init aos-animate" data-aos="fade-up" data-aos-delay="400">
                <img src="${pageContext.request.contextPath}/resources/img/2022/ic_ico_04.png">
                <div class="tit all_tit_20 font_noto">사업관리 및 성과 공유 체계 구축</div>
                <div class="sul end">
                    <div class="all_blit">사업의 효율적 관리를 위한 지문위원회 구성 &middot; 운영</div>
                    <div class="all_blit">사업성과 평가 및 공유 &middot; 확산</div>
                    <div class="all_blit">긍정적 인식 확산을 위한 홍보 활성화</div>
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

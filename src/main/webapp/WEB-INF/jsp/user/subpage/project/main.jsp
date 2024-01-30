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
        <div class="font_noto all_tit_30">영재키움 프로젝트 소개</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">영재키움 프로젝트<i class="las la-angle-right"></i><b class="blue_01">영재키움 프로젝트 소개</b></span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>영재키움 프로젝트란?</div>
        <div class="txt_just txt-brk">교육부와 KAIST 과학영재교육연구원이 사회 ㆍ경제적 여건과 관계없이 잠재력과 재능이 충분히 발휘될 수 있도록, 보다 적극적인 도움이 필요한 영재교육 대상자를 선발하여 맞춤형 교육을 지원하는 프로그램</div>
        <div class="garo_li">
        <div class="le blue_01 font-14 mt-3" style="text-align:justify;">대상자: 영재교육진흥법시행령 제12조 2항에 의거 교육급여수급자, 도서·벽지에 거주하는 자, 특수교육 대상자, 행정구역상 읍 ·면 지역에 거주하는자 등, 그밖에 사회·경제적 이유로 교육기회의 격차가 발생하였다고 인정되는자</div>
        </div>

        <div class="line_gab_30"></div>
        <div class="row">
            <div class="col-12">
                <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>영재키움 프로젝트 특징</div>
                <div class="txt_just txt-brk">학생과 멘토교사를 1:1로 매칭하여 학생의 잠재력이 최대한 계발될 수 있도록 맞춤형 교육 프로그램 지원</div>
                <div class="mt-3">
                    <img style="width:100%;" src="${pageContext.request.contextPath }/resources/img/sub-1-1.jpg" alt="">
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

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
        <div class="font_noto all_tit_30">오시는길</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">영재키움프로젝트<i class="las la-angle-right"></i><b class="blue_01">오시는길</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>오시는 길</div>
        <div class="txt_just b_pad_15">오시는 빠르고 편한길을 안내해드립니다. 방문하시기전에 기타 궁금한 사항이 있으시면 아래의 연락처로 안내를 받으신 후 오시면 오시는 길이 좀더 편리합니다.</div>



    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3211.7076090942833!2d127.39651041556478!3d36.39207169826551!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356549e5fde31e29%3A0x65bf2de7ed4fe983!2z64yA7KCE6rSR7Jet7IucIOycoOyEseq1rCDrrLjsp4DroZwgMTkz!5e0!3m2!1sko!2skr!4v1655687353426!5m2!1sko!2skr" width="100%" height="450" style="border:0;border-radius:15px;padding-bottom:20px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>



        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>주소 및 연락처</div>

			주소 : (34051) 대전광역시 유성구 문지로 193번지 (문지동 103-6) KAIST 문지캠퍼스 학부동 F618호<br>

            전화번호 : 042-350-6227<br>

            팩스번호 : 042-350-6224<br>

            전자우편 : giftedup@kaist.ac.kr
        <div class="" style="background-color:pink;">
            <img style="width:100%;" src="http://basic.inctcokr.gethompy.com/giftedup/contents/img/kakao.jpg" alt="">
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

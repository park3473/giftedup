<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
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
	    	<%@ include file="../include/menu.jsp" %>

    <!-- 본문 -->
<div class="content">
    <div class="sub_cont_wrap">

        <!-- 타이틀 -->
        <div class="font_noto all_tit_30">게시판제목</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">1차분류<i class="las la-angle-right"></i>2차분류<i class="las la-angle-right"></i><b class="blue_01">3차분류</b></span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>게시판 목록</div>
        <table class="table table-bordered align_c">
        <tbody>
        <tr class="cell_bg">
            <th>순번</th>
            <th>프로그램명</th>
            <th>신청기간</th>
            <th>체험기간</th>
            <th>신청하기</th>
        </tr>
        <tr>
            <td>1</td>
            <td class="align_c">프로그램명 리스트</td>
            <td>22.01.01 ~ 22.01.15</td>
            <td>22.02.01 ~ 22.02.15</td>
            <td>신청</td>
        </tr>
        <tr>
            <td>1</td>
            <td class="align_c">프로그램명 리스트</td>
            <td>22.01.01 ~ 22.01.15</td>
            <td>22.02.01 ~ 22.02.15</td>
            <td>신청</td>
        </tr>
        </tbody>
        </table>



<div class="page_list">
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item active"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul>
</div>



    </div>
</div>
<!-- 본문 끝 -->
    
    <!-- 오른쪽 시작 -->
		<%@ include file="../include/right.jsp" %>
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
    <script>

    function searchBtnClick() {
        
        URL = './list.do';
        URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

    function view(id) {

        var URL = './'+id+'/update.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
    }
</script>
</body>
</html>

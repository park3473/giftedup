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
        <div class="font_noto all_tit_30">신규참가자 지원안내</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">모집<i class="las la-angle-right"></i><b class="blue_01">신규 참가자 지원</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>지원안내</div>
        <div class="txt_just green_02">신규 참가자 지원기간은 <b>2023년 4월 10일부터 4월 28일</b>까지입니다.<br>4월 27일부터 28일까지는 많은 인원이 몰려 지원이 다소 어려울 수 있으니 4월 26일까지 많은 지원 부탁드립니다.</div>
        <div class="yellow_02 txt_just">전화상담은 불가능하오니 카카오톡 플러스친구 '영재키움프로젝트' 로 상담 부탁드립니다.</div>
        <div class="pad_10"></div>
        <div class="txt_just">영재키움 프로젝트에 신규로 참가하기 위해서는 아래 '온라인 지원서'에 정보를 입력해야 합니다.</div>
        <div class="yellow_02 txt_just">(※ 온라인 지원서 자료입력은 유형에 따라 작성자가 다릅니다. 아래 유형 설명을 참고하여 작성하여 주시고, 상세한 것은 "신규 참가자 모집안내"를 확인하여 주시기 바랍니다.)</div>

        <div class="kaist font_noto f_wet_03">
            <div class="flexbox txt_just">
                <div class="item_03 box_04">
                    <p class="gift_btn_01"><a href="${pageContext.request.contextPath }/resources/upload/member_re/2023/23년도 영재키움 선발 참가자 모집안내.pdf">PDF보기</a></p>
                    <div class="all_tit_20 b_pad_10 blue_01">23년도 영재키움 신규 참가자 모집안내</div>
                    모집안내를 확인하여 1) 서명이 필요한 서류, 2) 지원 자격, 3) 증빙서류를 준비해주세요.
                </div>
                <div class="item_03 box_05">
                    <p class="gift_btn_01"><a href="${pageContext.request.contextPath }/resources/upload/member_re/2023/신청자%20지원%20자격%20및%20증빙서류%20안내.jpg">보기</a></p>
                    <div class="all_tit_20 b_pad_10 green_02">신청자 지원자격 및 증빙서류 안내</div>
                    신청자는 자신의 지원자격을 확인하고 해당 지원자격별로 증빙서류를 준비해주시기 바랍니다.
                </div>
                <div class="item_03 box_05">
                    <p class="gift_btn_01"><a href="${pageContext.request.contextPath }/resources/upload/member_re/2023/학교장추천 심의회 회의록 양식.hwp">다운로드</a></p>
                    <div class="all_tit_20 b_pad_10 green_02">학교장추천 심의회 회의록 양식</div>
                    신청자는 자신의 지원자격을 확인하고 해당 지원자격별로 증빙서류를 준비해주시기 바랍니다.(학교장 추천 유형에 한함)
                </div>
                <div class="item_03 box_05">
                    <p class="gift_btn_01"><a href="${pageContext.request.contextPath }/resources/upload/member_re/2023/서약서 및 확인서 양식.hwp">다운로드</a></p>
                    <div class="all_tit_20 b_pad_10 green_02">서약서 및 확인서 양식</div>
                    서약서 및 확인서를 인쇄하시어 서명하신 후 지원서 제출시에 제출 바랍니다.
                </div>
                <div class="item_03 box_05">
                    <p class="gift_btn_01"><a href="${pageContext.request.contextPath }/resources/upload/member_re/2023/카이스트영재키움_2023년도_신입생_신청안내.ppt">PPT다운로드</a></p>
                    <div class="all_tit_20 b_pad_10 green_02">신청안내</div>
                    신청 안내 메뉴얼 확인하여 신청 부탁드립니다.
                </div>
                <div class="item_04 box_05">
                    <p class="gift_btn_02"><a onclick="configCheck()">지원하기</a></p>
                    <br>
                    2023년도 영재키움 신입생 신청은 PC에 최적화 되어있습니다. 아래에 유형별 지원 방법을 확인 후 지원해주세요.
                </div>
            </div>
        </div>

        <div class="line_gab_30"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>'온라인 지원서' 작성 방법</div>
        <div class="txt_just green_02 b_pad_15">※ 아래 3가지 유형 중 해당되는 유형에 따라 온라인 지원서를 작성해주시고, 지원서류를 첨부하여 주시기 바랍니다</div>

        <div class="overflow_scroll">
        <table class="table table-bordered txt-nowrap">
        <tbody>
        <tr class="align_c cell_bg">
            <th style="width:8%">유형</th>
            <th >내용</th>
            <th style="width:8%">작성자</th>
            <th>온라인 지원서 작성 및 지원서류 제출 방법</th>
        </tr>
        <tr>
            <td class="align_c">유형1</td>
            <td>멘토교사와 학생이 모두 처음 신청하는 경우로 사전에 결정(매칭)된 경우</td>
            <td class="align_c">멘토교사</td>
            <td>
                - 온라인 지원서 작성시 멘토교사, 학생 정보 모두 입력<br>
                - 멘토교사가 담당 학생에 대한 지원서류와 증빙서류를 취합하여 제출
            </td>
        </tr>
        <tr>
            <td class="align_c">유형2</td>
            <td>멘토교사가 사전에 매칭되지 않아서, 신규로 학생만 지원하는 경우</td>
            <td class="align_c">학생</td>
            <td>
                - 학생이 학생 관련 지원서류와 증빙서류를 제출(학생관련 자료만 제출)<br>
                - KAIST에서 멘토교사 매칭 예정
            </td>
        </tr>
        <tr>
            <td class="align_c">유형3</td>
            <td>① 기존 참여 교사였으나 학생 진학 등의 이유로 매칭되지 않은 경우<br>② 기존 참여 학생(멘티)의 멘토를 희망하는 교사<br>③ 신규교사</td>
            <td class="align_c">멘토교사</td>
            <td>
                - 멘토교사 정보 입력<br>
                - KAIST에서 멘티 학생 매칭 예정
            </td>
        </tr>
        </tbody>
        </table>

        <div class="line_bnk_15"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>지원서류 및 증빙서류 목록</div>
        <div class="overflow_scroll">
        <table class="table table-bordered align_c txt-nowrap">
        <tbody>
        <tr class="cell_bg">
            <th rowspan="2" style="width: 10%;">순번</th>
            <th rowspan="2" style="width: 30%;">목록</th>
            <th rowspan="2" style="width: 9%;">부수</th>
            <th rowspan="2">작성자</th>
            <th colspan="3">유형별 제출 목록</th>
        </tr>
        <tr>
            <th>유형1</th>
            <th>유형2</th>
            <th>유형3</th>
        </tr>
        <tbody>
        <tr>
            <td>서식1</td>
            <td class="align_l">보호자 서약서</td>
            <td>1부</td>
            <td class="align_l">보호자</td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-times color_b"></i></td>
        </tr>
        <tr>
            <td>서식2</td>
            <td class="align_l">지원자 서약서</td>
            <td>1부</td>
            <td class="align_l">학생</td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-times color_b"></i></td>
        </tr>
        <tr>
            <td>서식3</td>
            <td class="align_l">학교장 확인서</td>
            <td>1부</td>
            <td class="align_l">유형1-담임교사/유형2-학생(담임교사에게 요청)</td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-times color_b"></i></td>
        </tr>
        <tr>
            <td>증빙서류</td>
            <td class="align_l">지원자격에 대한 해당 증빙서류(참고 2에서 확인)</td>
            <td>1부</td>
            <td class="align_l">관공서 및 학교에서 발급</td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-check-circle"></i></td>
            <td><i class="las la-times color_b"></i></td>
        </tr>
        </tbody>
        </table>
        </div>
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

<script>
	function configCheck(){
		
		$.ajax({
		    url : '/user/member_re/configcheck.do',
		    type : 'POST',
		    data : ({
		       TYPE : '1' ,
		       YEAR : '2023'
		    }),
		    success : function(data , status , xhr){
		     	console.log(data);
		    	if(data == 'TRUE'){
		    		location.href='/user/member_re/check.do'	
		    	}else{
		    		alert('2023년도 신청 기간이 아닙니다.')
		    	}
		    	
		    },
		    error : function(error , status){
		        
		    }
		})
		
	}
</script>


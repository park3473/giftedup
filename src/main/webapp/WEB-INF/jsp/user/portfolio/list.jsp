<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
</head>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>

<style>
.tabs .tab-contents ul li {
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
		<%@ include file="../include/menu.jsp"%>

		<!-- 본문 -->
		<div class="content">
			<div class="sub_cont_wrap">

				<!-- 타이틀 -->
				<div class="font_noto all_tit_30">기본정보수정</div>
				<div class="t_pad_15">
					<span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여
						맞춤형 교육을 지원합니다.</span> <span class="all_sort">마이페이지<i
						class="las la-angle-right"></i><b class="blue_01">기본정보수정</b></span>
				</div>
				<div class="line_gab_15"></div>
				<!-- 타이틀끝 -->

				<section id="new_sub" class="sub_wrap">
					<div id="new_sub_area" class="sub_area">
						<div id="new_sub_con" class="sub_con">
							<div class="sub_size">
								<!-- 교사 comm list start -->
 					<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>포트폴리오</p>
                                </div>
                                <div class="info_wrap">
                                    <div class="member_seach_form">
                                        <div class="member_01_wrap mr-0">
                                            <form>
                                                <div class="form_01">
                                                    <div class="page_seach">
                                                        <select id="YEAR" name="YEAR">
                                                            <option value="">학년도선택</option>
                                                            <%-- <c:forEach var="item" items="${model.YEARLIST.list}" varStatus="status">
                                                            <option value="${item.YEAR}" <c:if test="${model.beforeDomain.YEAR == item.YEAR}">selected</c:if>>${item.YEAR}년</option>
                                                            </c:forEach> --%>
                                                            <option value="2020">2020</option>
                                                            <option value="2021">2021</option>
                                                            <option value="2022">2022</option>
                                                        </select>
                                                        <label class="blind" for="YEAR">학년도선택</label>
                                                        <select name="SEARCH_TYPE" id="SEARCH_TYPE">
                                                            <option VALUE="ALL"          <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL'}">selected</c:if>>전체</option>
                                                            <option VALUE="NAME"         <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>학생 명</option>
                                                            <option VALUE="SCHOOL_NAME"  <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_NAME'}">selected</c:if>>학교 명</option>
                                                            <option VALUE="SCHOOL_YEAR"  <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_YEAR'}">selected</c:if>>학년</option>
                                                            <option VALUE="SEX"          <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SEX'}">selected</c:if>>성별</option>
                                                            <option VALUE="SUPPORT_AREA" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SUPPORT_AREA'}">selected</c:if>>지원영역</option>
                                                            <option VALUE="PHONE"        <c:if test="${model.beforeDomain.SEARCH_TYPE == 'PHONE'}">selected</c:if>>연락처</option>
                                                        </select>
                                                        <label class="blind" for="SEARCH_TYPE"></label>
                                                        <input style="width: 191px;" type="text" name="SEARCH_TEXT" id="SEARCH_TEXT" value="${model.SEARCH_TEXT}">
                                                        <label class="blind" for="SEARCH_TEXT"></label>
                                                        <button type="submit" value="검색" onClick="searchBtnClick()">검색</button>
                                                        <a class="w_btn" href="./list.do">새로고침</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="info_wrap">
                                        <div class="title mr-0">
                                            <h2>학생 포트폴리오 목록</h2>
                                        </div>
                                        <table class="txt project_txt">
                                            <caption class="blind">포트폴리오 관리</caption>
                                            <tr>
                                                <th class="sch_year">학년도</th>
                                                <th class="name">학생 명</th>
                                                <th class="school">학교 명</th>
                                                <th class="process">학년/반</th>
                                                <th class="sex">성별</th>
                                                <th class="support">지원영역</th>
                                                <th class="phone">학생연락처</th>
                                                <th class="claim-stat">포트폴리오</th>
                                            </tr>
                                            <c:forEach var="item" items="${model.list}" varStatus="status">
	                                            <tr>
	                                                <td>${item.YEAR}</td>
	                                                <td>${item.NAME}</td>
	                                                <td>${item.SCHOOL_NAME}</td>
	                                                <td>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '4'}">초등학교<br>4학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '5'}">초등학교<br>5학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '6'}">초등학교<br>6학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '7'}">중학교<br>1학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '8'}">중학교<br>2학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '9'}">중학교<br>3학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '10'}">고등학교<br>1학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '11'}">고등학교<br>2학년</c:if>
	                                                    <c:if test="${item.MATCHING_SCHOOL_YEAR == '12'}">고등학교<br>3학년</c:if>
	                                                    / ${item.SCHOOL_GROUP}반
	                                                </td>
	                                                <td>${item.SEX}</td>
	                                                <td>${item.SUPPORT_AREA}</td>
	                                                <td>${item.PHONE}</td>
	                                                <td><a href="./detail/list.do?YEAR=${item.YEAR }&MEMBER_ID=${item.MEMBER_ID}" class="td_list_btn">관리보기</a></td>
	                                            </tr>
                                            </c:forEach>
                                            <c:if test="${empty model.list}">
                                            	<tr>
	                                                <td colspan="8">검색 결과가 없습니다.</td>
	                                            </tr>
                                            </c:if>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
							</div>
						</div>
					</div>
				</section>



			</div>
		</div>
		<!-- 본문 끝 -->

		<!-- 오른쪽 시작 -->
		<%@ include file="../include/right.jsp"%>
		<!--  오른쪽 끝 -->
		<!-- 하단 -->
		<div class="footer">
			<div class="container">
				<div class="link">
					<span><a href="">센터소개</a></span><span class="gab">ㅣ</span> <span><a
						href="">이용약관</a></span><span class="gab">ㅣ</span> <span><a href="">개인정보처리방침</a></span><span
						class="gab">ㅣ</span> <span><a href="">이메일무단수집거부</a></span>
				</div>
				<div class="all_copy">
					<span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트
						과학영재교육연구원(34051)</span><span class="gab">ㅣ</span> <span>TEL :
						042-350-6227</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-6224</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
	</div>
	<!--본문 end-->
	<script type="text/javascript">
	/*현재 신청한 학생 목록 가져오기*/
	function GetZoom(COMM_MENTO){
		$.ajax({
			type : "POST",
			url : "./GetZoom.do?",
			cache : false,
			data : ({
				ZOOM_MEMBER_ID : COMM_MENTO
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
				alert("입장하실 zoom 회의실 번호는 : "+data[0].ZOOM_MT_ID+"이며 \n입장 비밀번호는 "+data[0].ZOOM_MT_PW+"입니다.");
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	}
	
	
	$('.check_personnel').click(function() {
		console.log($(this).attr('comm_idx'));
		var COMM_IDX = $(this).attr('comm_idx');

		$.ajax({
			type : "POST",
			url : "./studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	})
	
	
	function getView(COMM_IDX){
		location.href='${pageContext.request.contextPath}/user/mypage/communicator/view.do?COMM_IDX='+COMM_IDX+'';
	}
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
	
	
</body>
</html>

<script>
    
    /*
    $("#YEAR").change(function() {

        $.ajax({
            type : "GET",
            url : './getProgramList.do?YEAR='+$(this).val(),
            cache : false,
            data : "",
            success: function(result) {
                $('#IDX').html(result);
            }
        });
    });
    */
    
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
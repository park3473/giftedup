<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                    <c:if test="${ssion_member_type == '1' }">
                                    <p>현재 참여가능한 강의</p>
                                    </c:if>
                                    <c:if test="${ssion_member_type == '2' }">
                                    <p>현재 모집중인 강의</p>
                                    </c:if>
                                </div>
                                <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_seach">
                                            <form>
                                            	
                                            	<%--
                                            	22년도 X
                                            	 <select id="COMM_LOCAL" name="COMM_LOCAL">
                                                    <option value="">지역</option>
                                                    <option value="서울" <c:if test="${model.beforeDomain.COMM_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                    <option value="부산" <c:if test="${model.beforeDomain.COMM_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                    <option value="대구" <c:if test="${model.beforeDomain.COMM_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                    <option value="인천" <c:if test="${model.beforeDomain.COMM_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                    <option value="광주" <c:if test="${model.beforeDomain.COMM_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                    <option value="대전" <c:if test="${model.beforeDomain.COMM_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                    <option value="울산" <c:if test="${model.beforeDomain.COMM_LOCAL == '울산'}">selected</c:if>>울산</option>
                                                    <option value="세종" <c:if test="${model.beforeDomain.COMM_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                    <option value="경기도" <c:if test="${model.beforeDomain.COMM_LOCAL == '경기도'}">selected</c:if>>경기도</option>
                                                    <option value="강원도" <c:if test="${model.beforeDomain.COMM_LOCAL == '강원도'}">selected</c:if>>강원도</option>
                                                    <option value="충청북도" <c:if test="${model.beforeDomain.COMM_LOCAL == '충청북도'}">selected</c:if>>충청북도</option>
                                                    <option value="충청남도" <c:if test="${model.beforeDomain.COMM_LOCAL == '충청남도'}">selected</c:if>>충청남도</option>
                                                    <option value="전라북도" <c:if test="${model.beforeDomain.COMM_LOCAL == '전라북도'}">selected</c:if>>전라북도</option>
                                                    <option value="전라남도" <c:if test="${model.beforeDomain.COMM_LOCAL == '전라남도'}">selected</c:if>>전라남도</option>
                                                    <option value="경상북도" <c:if test="${model.beforeDomain.COMM_LOCAL == '경상북도'}">selected</c:if>>경상북도</option>
                                                    <option value="경상남도" <c:if test="${model.beforeDomain.COMM_LOCAL == '경상남도'}">selected</c:if>>경상남도</option>
                                                    <option value="제주도" <c:if test="${model.beforeDomain.COMM_LOCAL == '제주도'}">selected</c:if>>제주도</option>
                                                </select> --%>
                                                
                                                <select id="COMM_TYPE" name="COMM_TYPE">
                                                    <option value="">분야</option>
                                                    <option value="수학" <c:if test="${model.beforeDomain.COMM_TYPE == '수학'}">selected</c:if>>수학</option>
                                                    <option value="과학" <c:if test="${model.beforeDomain.COMM_TYPE == '과학'}">selected</c:if>>과학</option>
                                                    <option value="융합" <c:if test="${model.beforeDomain.COMM_TYPE == '수과학'}">selected</c:if>>수과학</option>
                                                    <option value="정보" <c:if test="${model.beforeDomain.COMM_TYPE == '정보'}">selected</c:if>>정보</option>
                                                    <option value="발명" <c:if test="${model.beforeDomain.COMM_TYPE == '발명'}">selected</c:if>>발명</option>
                                                    <option value="인문" <c:if test="${model.beforeDomain.COMM_TYPE == '인문'}">selected</c:if>>인문</option>
                                                	<option value="기타" <c:if test="${model.beforeDomain.COMM_TYPE == '기타'}">selected</c:if>>기타</option>
                                                </select>
                                            	
                                            	<input style="width: 191px;" class="datecalendar" type="text" name="COMM_DAY" id="COMM_DAY" value="${fn:substring(model.beforeDomain.COMM_START_TM,0,16 )}" placeholder="날짜 선택" autocomplete="off">
                                            	
                                                <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                                    <option value="ALL">전체</option>
                                                    <option value="COMM_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'COMM_NAME'}">selected</c:if>>강좌 명</option>
                                                    <option value="COMM_MENTO_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'COMM_MENTO_NAME'}">selected</c:if>>강사 명</option>
                                                </select>
                                                <label class="blind" for="SEARCH_TYPE">검색조건</label>
                                                <input type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT"  />
                                                <label class="blind" for="SEARCH_TEXT">검색창</label>
                                                <button type="button" name="seach" value="검색" onClick="searchBtnClick()">검색</button>
                                                <button type="button" style="background-color:#0092aa;margin-left:10px" name="seach" value="새로고침" onClick="location.href='./list.do'">새로고침</button>
                                            </form>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->
                                <table class="txt comm_student_now_txt">
                                    <tr>
                                        <th class="comm_index">순번</td>
                                        <th class="comm_name">강좌 명</td>
                                        <th class="comm_personnel">강의 신청 현황</td>
                                        <!-- 22년도 준비물 X
                                         <th class="comm_supplies">준비물</td> -->
                                        <th class="comm_date">강의 일시</td>
                                        <th class="comm_stat">수업 참여</td>
                                        <th class="comm_mento">교사 명</td>
                                        <th class="comm_school_year">대상 학년</th>
                                    </tr>
                                    <c:if test="${model.List.size() != 0 }">
                                    <c:forEach var="item" items="${model.List}" varStatus="status">
                                    <tr class="comm_tr">
                                        <td class="comm_index">${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td class="comm_name" style="color:#009dc4"  onclick="getView(${item.COMM_IDX})">${item.COMM_NAME }</td>
                                        <td class="comm_personnel">정원(${item.COMM_PERSONNEL } 명) / 
                                        	<c:if test="${item.COMM_PERSONNEL_CNT != '' }">신청 (${item.COMM_PERSONNEL_CNT } 명)</c:if>
                                        	<c:if test="${item.COMM_PERSONNEL_CNT == '' }">신청 (0 명)</c:if>
                                        </td>
                                        <%--
                                        22년도 준비물 X
                                         <td class="comm_supplies">
                                        	<c:if test="${item.COMM_SUPPLIES == 'true'}">
                                        		O
                                        	</c:if>
                                        	<c:if test="${item.COMM_SUPPLIES == 'false' }">
                                        		X
                                        	</c:if>
                                        </td> --%>
                                        <td class="comm_date">${fn:substring(item.COMM_START_TM,0,16)} ~ ${fn:substring(item.COMM_END_TM,10,16) }</td>
                                        <td class="comm_stat">
                                        	<c:if test="${item.COMM_STAT == '1' }">
                                        		접수 중
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '2' }">
                                        		접수 마감
                                        	</c:if>
                                        </td>
                                        <td class="comm_mento">${item.COMM_MENTO_NAME }</td>
                                       	<td class="comm_school_year">
                                       		<p onclick="toggleDisplay(this)">대상 학년 확인<span><img src="${pageContext.request.contextPath }/resources/img/sub/down_arrow.png" alt="다운"></span></p>
                                       		<ul id="comm_school_year_ul" class="comm_school_year_ul" style="display:none">
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '4') > -1}">active</c:if>" id="comm_school_year_li">초 4학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '5') > -1}">active</c:if>" id="comm_school_year_li">초 5학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '6') > -1}">active</c:if>" id="comm_school_year_li">초 6학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '7') > -1}">active</c:if>" id="comm_school_year_li">중 1학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '8') > -1}">active</c:if>" id="comm_school_year_li">중 2학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '9') > -1}">active</c:if>" id="comm_school_year_li">중 3학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '10') > -1}">active</c:if>" id="comm_school_year_li">고 1학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '11') > -1}">active</c:if>" id="comm_school_year_li">고 2학년</li>
                                       			<li class="comm_school_year_li <c:if test="${fn:indexOf(item.COMM_SCHOOL_YEAR, '12') > -1}">active</c:if>" id="comm_school_year_li">고 3학년</li>
                                       			
                                       		</ul>
                                       	</td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${model.List.size() == 0 }">
                                    <tr>
                                    	<td colspan="8">현재 강의가 없습니다.</td>
                                    </tr>
                                    </c:if>
                                </table>
                            </div>
                            
                             <!--페이지 넘버-->
                                <nav class="paging_number">
                                    <ul class="page">

										<c:if test="${model.page > 0}"> 
											<c:if test="${model.itempagestart-model.itemCount > 0}">
								                 <%-- <li id="first_a"><a href="javascript:pageChanged(0, 0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li> --%>
								                 <li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
											</c:if>
											<c:if test="${model.itempagestart-model.itemCount <= 0}">
												<%-- <li id="first_a"><a href="javascript:pageChanged(0,0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li> --%>
												<li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
											</c:if>
										</c:if>
							
										<c:if test="${model.page <= 0}">
											  <%-- <li id="first_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li> --%>
										      <li id="prev_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
										</c:if>
										
										<c:if test="${model.itempageend > 0}">
											<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
												<c:choose>
													<c:when test="${model.page == i }">
														<li class="number page_active"><a href="#">${i+1}</a></li>
													</c:when>
													<c:otherwise>
														<li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
							
										<c:if test="${model.itempageend == 0}">
											<li class="number">1</li>
										</c:if>
										<c:if test="${model.itempageend < 0}">
											<li class="number">1</li>
										</c:if>
										
										<c:if test="${model.itemcount < model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
										<c:if test="${model.itemcount >= model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if><%-- 
							
										<fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemcount)==0? ((model.itemtotalcount/model.itemcount)-1) : (model.itemtotalcount / model.itemcount)}" integerOnly="true" />
										<c:choose>
											<c:when	test="${model.itemcount < model.itemcount/(page+1)}">
											<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
												
											</c:when>
											<c:otherwise>
											<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
											</c:otherwise>
										</c:choose> --%>
										
										</ul>
                                </nav>
                                <!--페이지 넘버 end-->
                            
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

<script type="text/javascript">

$.datetimepicker.setLocale('ko');
$('.datecalendar').datetimepicker({
    format:'Y.m.d',
    lang: "ko",
    timepicker:false
});

function pageChanged(page, endpage)
{
	if (page < 0) 
	{
		page = 0;
	}
	if (endpage < 0){
		endpage = 0;
	}
	if (page >= endpage) {
		page = endpage;
	}
	
	
	var URL = "list.do?PAGE="+page;

	if('${model.beforeDomain.ITEM_COUNT}}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	/* 
	22년도 X
	if($('#COMM_LOCAL').val() != ''){
		URL = URL + "&COMM_LOCAL=" + $('#COMM_LOCAL').val(); 
	} */
	if($('#COMM_TYPE').val() != ''){
		URL = URL + "&COMM_TYPE=" + $('#COMM_TYPE').val(); 
	}
	if($('#COMM_DAY').val() != ''){
		URL = URL + "&COMM_START_TM=" + $('#COMM_DAY').val(); 
	}
	if($('#SEARCH_TEXT').val() != ''){
		URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val() + "&SEARCH_TEXT=" + $('#SEARCH_TEXT').val();
	}
	
	location.href = URL;
}


function searchBtnClick() {

	var URL = "list.do?PAGE=0";

	if('${model.beforeDomain.ITEM_COUNT}}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	/*
	22년도 X
	if($('#COMM_LOCAL').val() != ''){
		URL = URL + "&COMM_LOCAL=" + $('#COMM_LOCAL').val(); 
	} */
	if($('#COMM_TYPE').val() != ''){
		URL = URL + "&COMM_TYPE=" + $('#COMM_TYPE').val(); 
	}
	if($('#COMM_DAY').val() != ''){
		URL = URL + "&COMM_START_TM=" + $('#COMM_DAY').val(); 
	}
	if($('#SEARCH_TEXT').val() != ''){
		URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val() + "&SEARCH_TEXT=" + $('#SEARCH_TEXT').val();
	}
	
	location.href = URL;

}
	/*현재 신청한 학생 목록 가져오기*/
	
	function getView(COMM_IDX){
		location.href='${pageContext.request.contextPath}/user/communicator/view.do?COMM_IDX='+COMM_IDX+'';
	}
	
	$('.comm_school_year').click(function(target){
		console.log(target);
		console.log($(this));
        console.log($(this).find('.comm_school_year_ul').css('display'));
		if($(this).find('.comm_school_year_ul').css('display') == 'none'){
			$(this).find('.comm_school_year_ul').slideDown();
			$(this).find('.comm_school_year_ul').addClass('open');
			
		}else if($(this).find('.comm_school_year_ul').css('display') == 'block'){
			$(this).find('.comm_school_year_ul').slideUp();
			$(this).find('.comm_school_year_ul').removeClass('open');
		}
	})

	function toggleDisplay(clickedElement) {
    const nextElement = clickedElement.nextElementSibling;
    if (nextElement.style.display === 'none' || nextElement.style.display === '') {
      nextElement.style.display = 'block';
    } else {
      nextElement.style.display = 'none';
    }
  }
	
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">

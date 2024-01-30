 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp" %>
</head>

<body>
    <!--헤더-->
	<%@ include file="../../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>교사지역별그룹관리</span>
                            </div>
							<form action="./insert.do?" method="post" name="updateform" id="updateform">
                            <div class="member_seach_form">
                                <div class="member_01_wrap">
                                    <form>
                                        <div class="form_01">
                                            <div class="page">
                                                <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT }" name="ITEM_COUNT" id="ITEM_COUNT">
                                                <span>/ 페이지</span>
                                            </div>
                                            <div class="page_seach">
                                            	<select ID="LEVEL" NAME="LEVEL">
                                                    <option value="">회원등급</option>
                                                    <option value="1" <c:if test="${model.beforeDomain.LEVEL == '1'}">selected</c:if>>관리자</option>
                                                    <option value="1" <c:if test="${model.beforeDomain.LEVEL == '9'}">selected</c:if>>대표멘토교사</option>
                                                    <option value="8" <c:if test="${model.beforeDomain.LEVEL == '8'}">selected</c:if>>교사</option>
                                                    <option value="11" <c:if test="${model.beforeDomain.LEVEL == '11'}">selected</c:if>>학생</option>
                                                    <option value="10" <c:if test="${model.beforeDomain.LEVEL == '10'}">selected</c:if>>일반회원</option>
                                                </select>
                                            
                                                <select ID="LOCATION" NAME="LOCATION">
                                               		<option value="">지역선택</option>
			                                        <option value="서울" <c:if test="${model.beforeDomain.LOCATION == '서울'}">selected</c:if>>서울</option>
			                                        <option value="부산" <c:if test="${model.beforeDomain.LOCATION == '부산'}">selected</c:if>>부산</option>
			                                        <option value="대구" <c:if test="${model.beforeDomain.LOCATION == '대구'}">selected</c:if>>대구</option>
			                                        <option value="인천" <c:if test="${model.beforeDomain.LOCATION == '인천'}">selected</c:if>>인천</option>
			                                        <option value="광주" <c:if test="${model.beforeDomain.LOCATION == '광주'}">selected</c:if>>광주</option>
			                                        <option value="대전" <c:if test="${model.beforeDomain.LOCATION == '대전'}">selected</c:if>>대전</option>
			                                        <option value="울산" <c:if test="${model.beforeDomain.LOCATION == '울산'}">selected</c:if>>울산</option>
			                                        <option value="세종" <c:if test="${model.beforeDomain.LOCATION == '세종'}">selected</c:if>>세종</option>
			                                        <option value="경기도" <c:if test="${model.beforeDomain.LOCATION == '경기도'}">selected</c:if>>경기도</option>
			                                        <option value="강원도" <c:if test="${model.beforeDomain.LOCATION == '강원도'}">selected</c:if>>강원도</option>
			                                        <option value="충청북도" <c:if test="${model.beforeDomain.LOCATION == '충청북도'}">selected</c:if>>충청북도</option>
			                                        <option value="충청남도" <c:if test="${model.beforeDomain.LOCATION == '충청남도'}">selected</c:if>>충청남도</option>
			                                        <option value="전라북도" <c:if test="${model.beforeDomain.LOCATION == '전라북도'}">selected</c:if>>전라북도</option>
			                                        <option value="전라남도" <c:if test="${model.beforeDomain.LOCATION == '전라남도'}">selected</c:if>>전라남도</option>
			                                        <option value="경상북도" <c:if test="${model.beforeDomain.LOCATION == '경상북도'}">selected</c:if>>경상북도</option>
			                                        <option value="경상남도" <c:if test="${model.beforeDomain.LOCATION == '경상남도'}">selected</c:if>>경상남도</option>
			                                        <option value="제주도" <c:if test="${model.beforeDomain.LOCATION == '제주도'}">selected</c:if>>제주도</option>
                                                </select>
 												<select ID="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                               		<option value="ALL">전체</option>
                                                    <option value="NAME" <c:if test="${model.beforeDomain.NAME == 'NAME'}">selected</c:if>>성명</option>
                                                    <option value="MEMBER_ID" <c:if test="${model.beforeDomain.MEMBER_ID == 'MEMBER_ID'}">selected</c:if>>회원아이디</option>
                                                    <option value="SCHOOL_NAME" <c:if test="${model.beforeDomain.SCHOOL_NAME == 'SCHOOL_NAME'}">selected</c:if>>소속학교</option>
                                                    <option value="PHONE" <c:if test="${model.beforeDomain.PHONE == 'PHONE'}">selected</c:if>>연락처</option>
                                                </select>                                                
                                                <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="내용을 입력해주세요.">
                                                <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                <a class="w_btn" href="javascript:location.reload()">새로고침</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="member_02_wrap">
                                    <form>
                                        <select id="LEVEL2" name="LEVEL2">
                                            <option value="">회원등급선택</option>
                                            <option value="1">관리자</option>
   											<option value="9">대표멘토교사</option>
                                            <option value="8">교사</option>
                                            <option value="11">학생</option>
                                            <option value="10">일반회원</option>
                                        </select>
                                        <button type="button" onClick="levelChangedArr()" value="일괄변경">일괄변경</button>
                                    </form>
                                    <form>
                                        <div>
                                            <input type="radio" name="excelDownType" value="MEMBER" checked>
                                            <label>회원목록선택</label>
                                        </div>
                                        <!-- 
                                        <div>
                                            <input type="radio" name="excelDownType" value="INFO_AGREEMENT">
                                            <label>개인정보동의서</label>
                                        </div>
                                         -->
                                        <button type="button" value="파일출력" onClick="excelDown()">파일출력</button>
                                    </form>
                                </div>
                                <!-- 문자 발송  -->
                                <div class="member_03_wrap">
                                    <form>
                                        <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span> / 2000byte)</span>
                                        <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                        <input type="checkbox" id="RESERVATION" name="RESERVATION">

                                        <input class="datecalendar2" type="text"  value="" id="RESERVATION_TM" name="RESERVATION_TM" readonly style="DISPLAY: none;">
                                        <input  type="text"  value="" id="RESERVATION_TM2" name="RESERVATION_TM2" readonly>
<%--                                         <span><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" /></span> --%>

                                        <button type="button" onClick="javascript:smssend('local_group_member')" value="문자발송">문자발송</button>
                                        <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/local_group_member/list.do">발송내역</a>
                                    </form>
                                </div>
                                <!-- 문자 종료  -->
                            </div>
							</form>

                            <div class="table_wrap">
                                <table>
                                    <tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="number">번호</th>
                                        <th class="name_id">아이디</th>
                                        <th class="name">교사 이름</th>
                                        <th class="sex">성별</th>
                                        <th class="phone">연락처</th>
                                        <th class="area">지역</th>
                                        <th class="rating">회원등급</th>
                                        <th class="admin">직급</th>
                                        <!-- 
                                        <th class="L-login">최종로그인</th>
                                        <th class="infor">개인정보 동의일</th>
                                         -->
                                        <!-- <th class="join">가입일</th> -->
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.MEMBER_ID}" data-memberid="${item.MEMBER_ID}"  data-phone="${item.PHONE}"></td>
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td>${item.MEMBER_ID}</td>
                                        <td>${item.NAME}</td>
                                        <td>
                                        	<c:if test="${item.SEX == '남자'}">남자</c:if>
                                        	<c:if test="${item.SEX == '여자'}">여자</c:if>
										</td>
                                        <td>${item.PHONE}</td>
                                        <td>${item.LOCATION}</td>
                                        <td>
	                                       	<c:if test="${item.LEVEL == '1'}">관리자</c:if>
	                                       	<c:if test="${item.LEVEL == '9'}">대표멘토교사</c:if>
	                                       	<c:if test="${item.LEVEL == '8'}">교사</c:if>
	                                       	<c:if test="${item.LEVEL == '11'}">학생</c:if>
	                                       	<c:if test="${item.LEVEL == '10'}">일반회원</c:if>
										</td>
										<td>${item.SCHOOL_JIGGEUB}</td>
										<!-- 
                                        <td class="final_login">${fn:substring(item.LOGIN_TM,0,19)}</td>
                                        <td class="info">${fn:substring(item.INFO_AGREEMENT_TM,0,19)}</td>
										 -->
                                    </tr>
                                    </c:forEach>
                                    
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register">
                                        <a href="${pageContext.request.contextPath}/admin/local_group/list.do">그룹장리스트</a>
                                    </li>
                                    <li class="delete">
                                        <a href="javascript:deleteArrClick()">삭제하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!--관리자 버튼 end-->
                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <%@ include file="../../include/pageing.jsp" %>
                            </nav>
                            <!--페이지 넘버 end-->
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
	<%@ include file="../../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

</body></html>

<%@ include file="../../include/footerJs.jsp" %>

<script>

function deleteArrClick()
{
	
	cnt =  0;
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			cnt = cnt + 1;
			deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
		}

	}); 
	
	if(deleteArrIdx == "")
	{
		alert("대상자를 선택 하여 주세요.");
		return;
	}
	
	var URL = './deleteArr.do?MEMBER_ID='+ deleteArrIdx;
	console.log(URL);
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : "",
		success: function(result)
		{
			var s = result.indexOf("true");
			console.log(s);
			if(s != -1)
			{
				var moveUrl = "?SEARCH_TEXT="+encodeURI('${model.boforeDomain.SEARCH_TEXT}');
		    	moveUrl = moveUrl + "&SEARCH_TYPE="+encodeURI('${model.boforeDomain.SEARCH_TYPE}');
		    	
		    	if("${model.boforeDomain.page}" != "")
		    	{
		    		moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
		    	}
		    	
				idchk = true;
				location.href = './list.do'+moveUrl;
				return;
			}else 
			{
				alert('실패하였습니다.');
				return;
			}
		}
	});
}

$(document).on("click", "#chk_calc_all", function(e) {

    if ($(this).prop('checked')) {
        $('input[name="chk_calc"]').prop('checked', true);
    } else {
        $('input[name="chk_calc"]').prop('checked', false);
    }
});

function searchBtnClick()
{
	
	URL = './list.do';
	URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
	
	if($('#ITEM_COUNT').val() == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
	}
	
	
	URL = URL + "&LEVEL="+$('#LEVEL').val();
	URL = URL + "&TYPE=2";
	URL = URL + "&LOCATION=" + encodeURI($('#LOCATION').val());
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}



function levelChangedArr()
{
	if($('#LEVEL2').val() == "")
	{
		alert('회원등급을 선택 해주세요.');
		return;	
	}
	
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
		}

	}); 
	
	if(deleteArrIdx == "")
	{
		alert("대상자를 선택 하여 주세요.");
		return;
	}
	
	var URL = '../member/TypeToTextUpdateArr.do?';
	
	//var formData = $("#updateform").serialize();
	var formData = "SEARCH_TYPE=LEVEL";
		formData += "&SEARCH_TEXT="+$('#LEVEL2').val();
		formData += "&MEMBER_ID="+deleteArrIdx;
	
	
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공하였습니다.');
				//$('.modal').click();
				window.location.reload();	
			}else
			{
				alert('실패 하였습니다.');
				//$('.modal').click();
				
			}
		}
	});
}



function excelDown()
{
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			deleteArrIdx = deleteArrIdx + "'"+$(this).data("id") + "',";
		}

	}); 
	
	
	var st = $(":input:radio[name=excelDownType]:checked").val();
	//console.log(st);
	
	location.href = '../member/'+st+'/excelDown.do?MEMBER_ID='+deleteArrIdx;
	
}



</script>
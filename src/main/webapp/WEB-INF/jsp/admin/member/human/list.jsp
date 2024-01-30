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
                                <span>휴먼회원관리</span>
                            </div>
							
                            <div class="member_seach_form">

                                <div class="member_01_wrap">
                                    <form>
                                        <div class="form_01">
                                            <div class="page">
                                                <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT }" name="ITEM_COUNT" id="ITEM_COUNT">
                                                <span>/ 페이지</span>
                                            </div>
                                            <div class="page_seach">
                                                <span>휴면처리일</span>
                                                <input class="datecalendar" type="text" value="${model.beforeDomain.START_TM}" ID="START_TM" NAME="START_TM">
                                                <!-- <a href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력"></a> -->
                                                <span>~</span>
                                                <input class="datecalendar" type="text" value="${model.beforeDomain.END_TM}" ID="END_TM" NAME="END_TM">
                                                <!-- <a href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력"></a> -->
                                                <select ID="LEVEL" NAME="LEVEL">
                                                    <option value="">회원등급</option>
                                                    <option value="1" <c:if test="${model.beforeDomain.LEVEL == '1'}">selected</c:if>>관리자</option>
                                                    <option value="1" <c:if test="${model.beforeDomain.LEVEL == '9'}">selected</c:if>>대표멘토교사</option>
                                                    <option value="8" <c:if test="${model.beforeDomain.LEVEL == '8'}">selected</c:if>>교사</option>
                                                    <option value="11" <c:if test="${model.beforeDomain.LEVEL == '11'}">selected</c:if>>학생</option>
                                                    <option value="10" <c:if test="${model.beforeDomain.LEVEL == '10'}">selected</c:if>>일반회원</option>
                                                </select>
                                                <select ID="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                               		<option value="ALL">전체</option>
                                                    <option value="NAME" <c:if test="${model.beforeDomain.NAME == 'NAME'}">selected</c:if>>성명</option>
                                                    <option value="MEMBER_ID" <c:if test="${model.beforeDomain.MEMBER_ID == 'MEMBER_ID'}">selected</c:if>>회원아이디</option>
                                                    <option value="SCHOOL_NAME" <c:if test="${model.beforeDomain.SCHOOL_NAME == 'SCHOOL_NAME'}">selected</c:if>>소속학교</option>
                                                    <option value="PHONE" <c:if test="${model.beforeDomain.PHONE == 'PHONE'}">selected</c:if>>전화번호</option>
                                                </select>
                                                <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="내용을 입력해주세요.">
                                                <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                <a class="w_btn" href="./list.do">새로고침</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                            </div>



                            <div class="table_wrap">
                                <table>
                                    <tr>
                                       <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="number">번호</th>
                                        <th class="name_id">아이디</th>
                                        <th class="name">이름</th>
                                        <th class="rating">등급</th>
                                        <th class="L-login">최종로그인</th>
                                        <th class="join">회원가입일</th>
                                        <th class="join">휴먼처리일</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.MEMBER_ID}" data-phone="${item.PHONE}"></td>
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td>${item.MEMBER_ID} </td>
                                        <td>${item.NAME}</td>
                                        <td>
                                           	<c:if test="${item.LEVEL == '1'}">관리자</c:if>
	                                       	<c:if test="${item.LEVEL == '9'}">대표멘토교사</c:if>
	                                       	<c:if test="${item.LEVEL == '8'}">교사</c:if>
	                                       	<c:if test="${item.LEVEL == '11'}">학생</c:if>
	                                       	<c:if test="${item.LEVEL == '10'}">일반회원</c:if>
                                        </td>
                                        <td>${fn:substring(item.LOGIN_TM,0,19)}</td>
                                        <td>${fn:substring(item.CREATE_TM,0,19)}</td>
                                        <td>${fn:substring(item.DORMANCY_TM,0,19)}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="Excel">
                                        <a href="javascript:restoreArrClick()">회원복구하기</a>
                                    </li>
                                    <li class="modify">
                                        <a href="javascript:excelDown()">엑셀출력</a>
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



<script>
$( document ).ready(function() {
	var oldVal = "";
	$("#sms_text").on("change keyup paste", function() {
	    var currentVal = $(this).val();
	    if(currentVal == oldVal) {
	        return;
	    }
	 
	    oldVal = currentVal;
	    $('#sms_text_size').text(oldVal.length);
	});
	$("#RESERVATION").change(function(){
        if($("#RESERVATION").is(":checked")){
            $("#RESERVATION_TM").show();
            $("#RESERVATION_TM2").hide();

        }else{
        	$("#RESERVATION_TM").hide();
        	$("#RESERVATION_TM2").show();
        }
    });
});

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
		alert('회원을 선택 해주세요.');
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
				alert('성공 하였습니다.');
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
	
	
	URL = URL + "&LEVEL="+$('#LEVEL').val();;
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	
	URL = URL + "&START_TM=" + $('#START_TM').val();
	URL = URL + "&END_TM=" + $('#END_TM').val();
	location.href = URL;
}




function restoreArrClick()
{

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
		alert('회원을 선택 해주세요.');
		return;	
	}
	
	var URL = '../TypeToTextUpdateArr.do?';
	
	//var formData = $("#updateform").serialize();
	var formData = "SEARCH_TYPE=DORMANCY";
	formData += "&SEARCH_TEXT=0";
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
				window.location.reload();

			}else
			{
				alert('실패 하였습니다.');
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
	if(deleteArrIdx == "")
	{
		alert('회원을 선택 해주세요.');
		return;	
	}
	
	
	var st = $(":input:radio[name=excelDownType]:checked").val();
	//console.log(st);
	
	location.href = '../human/excelDown.do?MEMBER_ID='+deleteArrIdx;
	
}


</script>
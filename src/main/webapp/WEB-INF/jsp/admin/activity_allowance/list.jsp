 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %> 
</head>

<body>
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
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
                                <span>활동수당 신청관리</span>
                            </div>

                            <div class="member_seach_form">
                                <div class="member_01_wrap mr-0">
                                    <form>
                                        <div class="form_01">
                                            <div class="page">
                                                <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT}" name="ITEM_COUNT" id="ITEM_COUNT">
                                                <span>/ 페이지</span>
                                            </div>
                                            <div class="page_seach">
                                                <select id="STATUS" name="STATUS">
                                                    <option value="">상태변경</option>
                                                    <option value="0" <c:if test="${model.beforeDomain.STATUS == '0'}">selected</c:if>>신청</option>
                                                    <option value="1" <c:if test="${model.beforeDomain.STATUS == '1'}">selected</c:if>>지급</option>
                                                    <option value="-1" <c:if test="${model.beforeDomain.STATUS == '-1'}">selected</c:if>>미지급</option>
                                                </select>
                                                <select  id="SEARCH_TYPE" name="SEARCH_TYPE">
                                                    <option VALUE="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL'}">selected</c:if>>전체</option>
                                                    <option value="MEMBER_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'MEMBER_NAME'}">selected</c:if>>교사명</option>
                                                    <option value="BANK_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'BANK_NAME'}">selected</c:if>>은행명</option>
                                                    <option value="BANK_ACCOUNT" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'BANK_ACCOUNT'}">selected</c:if>>예금주</option>
                                                </select>
                                                <input style="width: 191px;" type="text" name="SEARCH_TEXT" id="SEARCH_TEXT" value="${model.beforeDomain.SEARCH_TEXT}">
                                                <button type="submit" value="검색" onClick="searchBtnClick()">검색</button>
                                                <a class="w_btn" href="./list.do">새로고침</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="area_select">
                                <form>
                                    <select id="STATUS2" name="STATUS2">
                                        <option value="">상태변경</option>
                                        <option value="0">신청</option>
                                        <option value="1">지급</option>
                                        <option value="-1">미지급</option>
                                    </select>
                                    <button type="button" onClick="adminAuthChangedArr()" value="일괄변경">상태일괄변경</button>
                                </form>
                            </div>

                            <div class="table_wrap">
                                <div class="title">
                                    <h2>활동수당 신청자 목록</h2>
                                </div>
                                <table>
                                    <tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="name">교사명</th>
                                        <th class="regi_number">주민등록번호</th>
                                        <th class="school">학교명</th>
                                        <th class="sex">성별</th>
                                        <th class="phone">연락처</th>
                                        <th class="bank">은행명</th>
                                        <th class="bank_number">계좌번호</th>
                                        <th class="bank_name">예금주</th>
	                                    <!-- <th class="bank_file">통장</th> -->
                                        <th class="stat">상태</th>
                                        <!-- <th class="claim-day">신청일</th> -->
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.IDX}" data-phone="${item.PHONE}"></td>
                                        <td>${item.MEMBER_NAME}</td>
                                        <td>${item.MEMBER_NUMBER}</td>
                                        <td>${item.SCHOOL_NAME}</td>
                                        <td>${item.SEX}</td>
                                        <td>${item.PHONE}</td>
                                        <td>${item.BANK_NAME}</td>
                                        <td>${item.BANK_NUMBER}</td>
                                        <td>${item.BANK_ACCOUNT}</td>
                                        <!--
                                        <td>
                                        	<c:if test="${item.FILES != '' && item.FILES != null}">
	                                       	<a href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/activity/${item.FILES}')"><img src="${pageContext.request.contextPath}/resources/img/admin/attached_file.png" alt=""></a>
	                                       	</c:if>
                                        </td>
                                        -->
                                        <td>
	                                        <c:if test="${item.STATUS == '0' }">신청</c:if>
	                                        <c:if test="${item.STATUS == '1' }">지급</c:if>
	                                        <c:if test="${item.STATUS == '-1' }">미지급</c:if>
	                                        <c:if test="${item.STATUS == '' || item.STATUS == null}">신청</c:if>
                                        </td>
                                        <!-- <td>${fn:substring(item.CREATE_TM,0,19)}</td> -->
                                    </tr>
                                    </c:forEach>
                                   
                                </table>
                            </div>



                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="modify">
                                        <a href="javascript:excelDown()">엑셀파일 출력</a>
                                    </li>
                                    <!-- <li class="register adm_w_btn">
                                        <a href="#">수정하기</a>
                                    </li>
                                     -->
                                    <li class="delete">
                                        <a href="javascript:deleteArrClick()">삭제하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!--관리자 버튼 end-->




                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <ul class="page">
                                    <%@ include file="../include/pageing.jsp" %>
                                </ul>
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
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/program.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

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
	if(deleteArrIdx == '')
	{
		alert('삭제할 대상을를 선택 하여 주세요');
		return;
	}
	var URL = './deleteArr.do?IDX='+ deleteArrIdx;
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

	URL = URL + "&STATUS=" + $('#STATUS').val();
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
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
	
	URL = './excelDown.do?MEMBER_ID='+deleteArrIdx;

	URL = URL + "&STATUS=" + $('#STATUS').val();
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}

$("#YEAR").change(function() {

    $.ajax({
		type : "GET",
		url : './getProgramList.do?YEAR='+$(this).val(),
		cache : false,
		data : "",
		success: function(result)
		{
			$('#IDX').html(result);
		}
	});


});



function adminAuthChangedArr()
{
	if($('#STATUS2').val() == "")
	{
		alert('인증상태를 선택 해주세요.');
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
	
	var URL = './TypeToTextUpdateArr.do?';
	
	var formData = "SEARCH_TYPE=STATUS";
	formData += "&SEARCH_TEXT="+$('#STATUS2').val();
	formData += "&IDX="+deleteArrIdx;
	

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
				location.reload();
			}else
			{
				alert('실패 하였습니다.');
			}
		}
	});
}


</script>
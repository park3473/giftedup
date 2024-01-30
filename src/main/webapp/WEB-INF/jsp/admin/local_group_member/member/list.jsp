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
                                <span>교사 지역별 그룹관리</span>
                            </div>
							<form action="./insert.do?" method="post" name="updateform" id="updateform">
                            <div class="member_seach_form">
                                <!-- 문자 발송  -->
                                <div class="member_03_wrap">
                                    <form>
                                        <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span> / 2000byte)</span>
                                        <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                        <input type="checkbox" id="RESERVATION" name="RESERVATION">

                                        <input class="datecalendar" type="text"  value="" id="RESERVATION_TM" name="RESERVATION_TM" readonly style="DISPLAY: none;">
                                        <input  type="text"  value="" id="RESERVATION_TM2" name="RESERVATION_TM2" readonly>
<%--                                         <span><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" /></span> --%>
                                        <button type="button" onClick="javascript:smssend('local_group_member2')" value="문자발송">문자발송</button>
                                        <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/local_group_member2/list.do">발송내역</a>
                                    </form>
                                </div>
                                <!-- 문자 종료  -->
                            </div>
							</form>
                            <div class="table_wrap">
                                <div class="title">
                                    <h2>관리교사 목록</h2>
                                </div>
                                <table>
                                    <tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="area">지역</th>
                                        <th class="name">성명</th>
                                        <th class="sex">성별</th>
                                        <th class="name_id">아이디</th>
                                        <th class="affi">소속</th>
                                        <th class="admin">직급</th>
                                        <th class="phone">연락처</th>
                                        <th class="map">지도(명)</th>
                                        <th class="eval">평가(건)</th>
                                        <th classs="regi">등록일</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.MEMBER_ID}" data-memberid="${item.MEMBER_ID}"  data-phone="${item.PHONE}"></td>
                                        <td>${item.LOCATION}</td>
                                        <td>${item.NAME}</td>
                                        <td>
                                        	<c:if test="${item.SEX == '남자'}">남자</c:if>
                                        	<c:if test="${item.SEX == '여자'}">여자</c:if>
										</td>
                                        <td>${item.MEMBER_ID}</td>
                                        <td>${item.SCHOOL_NAME}</td>
                                        <td>${item.SCHOOL_JIGGEUB}</td>
                                        <td>${item.PHONE}</td>
                                        <td>${item.PROFESSOR_CNT}</td>
                                        <td>${item.PORTFOLIO_CNT}</td>
                                        <td>${fn:substring(item.CREATE_TM,0,19)}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="delete">
                                        <a href="javascript:deleteArrClick('${item.LOCAL_GROUP_IDX}')">삭제하기</a>
                                    </li>
                                </ul>
                            </div>
                            
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

function deleteArrClick(idx)
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
	URL = URL + "&TYPE=" + $('#TYPE').val();
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
	var st = $(":input:radio[name=excelDownType]:checked").val();
	console.log(st);
	
	
}
$("#LOCATION").change(function() {

	
	var URL =  "./list.do?LOCATION=" + encodeURI($(this).val());
	
	location.href = URL;

});



</script>
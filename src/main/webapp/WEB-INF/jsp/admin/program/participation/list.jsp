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


                    <!--본문 내용-->
      <section class="adm_sc_txt">
          <div class="sc_con">
              <div class="title">
                  <span></span>
                 
                  <span>프로그램 참여현황 관리</span>
              </div>

              <div class="member_seach_form">
                  <div class="member_01_wrap">
                      <form>
                          <div class="form_01">
                              <div class="page">
                                  <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT}" name="ITEM_COUNT" id="ITEM_COUNT">
                                  <span>/ 페이지</span>
                              </div>
                              <div class="page_seach">
                                  <select id="YEAR" name="YEAR">
                                      <option value="">학년도선택</option>
                                      <c:forEach var="item" items="${model.YEARLIST.list}" varStatus="status">
                                      <option value="${item.YEAR}" <c:if test="${model.beforeDomain.YEAR == item.YEAR}">selected</c:if>>${item.YEAR}년</option>
                                      </c:forEach>
                                  </select>
                                  <select id="IDX" name="IDX">
                                      <option value="">프로그램명 선택</option>
                                      <c:forEach var="item" items="${model.PROGRAM.list}" varStatus="status">
                                      <option value="${item.IDX}" <c:if test="${model.beforeDomain.IDX == item.IDX}">selected</c:if>>${item.NAME}</option>
                                      </c:forEach>
                                  </select>
                                  <select id="ATTEND" name="ATTEND">
                                      <option value="">신청 여부</option>
                                      <option value="1" <c:if test="${model.beforeDomain.ATTEND == '1'}">selected</c:if>>참석</option>
                                      <option value="0" <c:if test="${model.beforeDomain.ATTEND == '0'}">selected</c:if>>불참</option>

                                  </select>
                                  <select name="SEARCH_TYPE" id="SEARCH_TYPE">
                                      <option VALUE="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL'}">selected</c:if>>전체</option>
                                      <option VALUE="NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>프로그램명</option>
                                                                            <option VALUE="PHONE" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'PHONE'}">selected</c:if>>학생 연락처</option>
                                      <option VALUE="MEMBER_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'MEMBER_NAME'}">selected</c:if>>신청자</option>
                                  </select>
                                  <input style="width: 191px;" type="text" value="${model.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT">
                                  <button type="submit" value="검색" onClick="searchBtnClick()">검색</button>
                                  <a class="w_btn" href="./list.do">새로고침</a>
                              </div>
                          </div>
                          
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
<%--                           <span><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" /></span> --%>

                          <button type="button" onClick="javascript:smssend('program')" value="문자발송">문자발송</button>
                          <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/program/list.do">발송내역</a>
                      </form>
                  </div>
                  <!-- 문자 종료  -->
              </div>

              <div class="table_wrap">
                  <div class="title">
                      
                      <h2>
                      		프로그램 참여현황 관리
                      </h2>
                      
                  </div>
                  <table>
                  	<tr>
                          <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
							<th class="program_name">프로그램 구분</th>
                          <th class="program_name">프로젝트명</th>
                          <th class="claim">신청자</th>
                          <th class="phone">학생연락처</th>
                          <th class="school">학교</th>
                          <th class="claim-stat">참석여부</th>
                          <th class="claim-day">신청일</th>
                      </tr>
                  	<c:forEach var="item" items="${model.list}" varStatus="status">
                      <tr>
                          <td><input type="checkbox" value="${item.IDX2}" name="chk_calc" data-id="${item.IDX2}" data-memberid="${item.MEMBER_ID}" data-phone="${item.PHONE}"></td>
                          <td>
                              <h2>
                                    <c:if test="${item.TYPE == '101'}">융합과학 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '102'}">창의융합캠프 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '103'}">멘토링데이 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '104'}">고등자율연구 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '105'}">발명 및 특허교육 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '106'}">기타 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '201'}">교사연수 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '202'}">중앙 컨설팅 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '203'}">성과 발표회 프로그램 목록</c:if>
                                    <c:if test="${item.TYPE == '204'}">발대식 프로그램 목록</c:if>
                               </h2>
                                    
                              
                          </td>
                          
                          <td>${item.NAME}</td>
                          <td>${item.MEMBER_NAME}</td>
                          <td>${item.PHONE}</td>
                          <td>${item.SCHOOL_NAME}</td>
                          
                          <td>
                          <c:if test="${item.ATTEND == '1'}">참석</c:if>
                          <c:if test="${item.ATTEND != '1'}">불참</c:if>
                          </td>
                          
                          
                          <td>${fn:substring(item.CREATE_TM,0,11)}</td>
                      </tr>
                     </c:forEach>
                  </table>
              </div>
              <!--관리자 버튼-->
              <div class="adm_btn_wrap">
                  <ul>
                  	  <!-- 
                      <li class="modify">
                          <a href="./insert.do">프로그램 등록</a>
                      </li>
                      <li class="register adm_w_btn">
                          <a href="javascript:updateClick();">수정하기</a>
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
                      <%@ include file="../../include/pageing.jsp" %>
                  </ul>
              </nav>
              <!--페이지 넘버 end-->
          </div>
      </section>
                    <!--본문 내용 end-->


    <!--푸터-->
    <footer>
	<%@ include file="../../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->
    

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/starts.js"></script>
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
		alert('회원을 선택 해주세요.');
		return;	
	}
	
	
	var URL = './0/detail/deleteArr.do?IDX='+ deleteArrIdx;
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
				alert('성공하였습니다.');
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
	URL = URL + "&TYPE=" + $('#TYPE').val();
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}


function excelDown()
{
	var st = $(":input:radio[name=excelDownType]:checked").val();
	console.log(st);
	
	
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


</script>
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
                                <c:if test="${model.TYPE >= '100' && model.TYPE <= '199'}">
                                <span>학생 프로그램관리</span>
                                </c:if>
                                <c:if test="${model.TYPE >= '200' && model.TYPE <= '299'}">
                                <span>교사프로그램관리</span>
                                </c:if>
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
                                                <select name="SEARCH_TYPE" id="SEARCH_TYPE">
                                                    <option VALUE="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL'}">selected</c:if>>전체</option>
                                                    <option VALUE="NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>프로그램명</option>
                                                    <option VALUE="MEMO" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'MEMO'}">selected</c:if>>프로그램 내용</option>
                                                </select>
                                                <input style="width: 191px;" type="text" value="" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="내용을 입력해주세요.">
                                                <button type="submit" value="검색" onClick="searchBtnClick()">검색</button>
                                                <a class="w_btn" href="./list.do">새로고침</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="table_wrap">
                                <div class="title">
                                    
                                    <h2>
                                    <c:if test="${model.TYPE == '101'}">융합과학 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '102'}">창의융합캠프 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '103'}">멘토링데이 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '104'}">자율연구 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '105'}">발명 및 특허교육 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '106'}">기타 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '201'}">교사연수 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '202'}">중앙 컨설팅 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '203'}">성과 발표회 프로그램 목록</c:if>
                                    <c:if test="${model.TYPE == '204'}">발대식 프로그램 목록</c:if>
                                    </h2>
                                    
                                </div>
                                <table>
                                	<tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="sch_year">학년도</th>
                                        <th class="program_name">프로그램명</th>
                                        <th class="program_name">과정</th>
                                        
                                        <th class="join">신청기간</th>
                                        <!-- 체험기간 탭 -->
                                        <c:if test="${model.TYPE != '1'}">
                                        <th class="join">체험기간</th>
                                        </c:if>
                                        <!-- 체험기간 탭 end -->
                                        <th class="join">생성일</th>
                                        
                                    </tr>
                                	<c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.IDX2}" name="chk_calc" data-id="${item.IDX}"  data-memberid="${item.MEMBER_ID}" data-phone="${item.PHONE}"></td>
                                        <td>${item.YEAR}</td>
                                        <td><a href="./${item.IDX}/detail/list.do">${item.NAME}</a></td>
                                        <td>
                                           <c:if test="${item.SCHOOL_YEAR == '24'}">전체</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '23'}">초등학교</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '22'}">중학교</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '21'}">고등학교</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '4'}">초등학교4학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '5'}">초등학교5학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '6'}">초등학교6학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '7'}">중학교1학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '8'}">중학교2학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '9'}">중학교3학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '10'}">고등학교1학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '11'}">고등학교2학년</c:if>
                                           <c:if test="${item.SCHOOL_YEAR == '12'}">고등학교3학년</c:if>
                                        </td>
                                        <td>${fn:substring(item.START_TM,0,11)}~${fn:substring(item.END_TM,0,11)}</td>
                                        <!-- 체험기간 탭 -->
                                        
                                        <c:if test="${model.TYPE != '1'}">
                                        <td>${fn:substring(item.EXPERIENCE_START_TM,0,11)}~${fn:substring(item.EXPERIENCE_END_TM,0,11)}</td>
                                        </c:if>
                                        
                                        <!-- 체험기간 탭 end -->
                                        <td>${fn:substring(item.CREATE_TM,0,19)}</td>
                                    </tr>
                                   </c:forEach>
                                </table>
                            </div>
                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="modify">
                                        <a href="./insert.do">프로그램 등록</a>
                                    </li>
                                    <li class="register adm_w_btn">
                                        <a href="javascript:excelDown()">엑셀출력</a>
                                    </li>
                                    <li class="register adm_w_btn">
                                        <a href="javascript:updateClick();">수정하기</a>
                                    </li>
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
	
	
	URL = URL + "&LEVEL="+$('#LEVEL').val();;
	URL = URL + "&TYPE=" + $('#TYPE').val();
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}


function excelDown()
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
		alert('다운로드  대상을를 선택 하여 주세요');
		return;
	}
	
	/* if(cnt > 1)
	{
		alert('한개만 선택 하여 주세요');
		return;
	} */
	
	location.href = './excelDown.do?IDX='+deleteArrIdx;
	
	
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

function updateClick()
{
	cnt =  0;
	var deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			cnt = cnt + 1;
			deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
		}

	}); 
	
	
	if(deleteArrIdx == ''){
		alert('수정할 데이터 체크 선택해주세요.');
		return;
	}
	
	deleteArrIdx = deleteArrIdx.substring(0, deleteArrIdx.length - 1);
	
	var moveUrl = "?SEARCH_TEXT="+encodeURI('${model.boforeDomain.SEARCH_TEXT}');
	moveUrl = moveUrl + "&SEARCH_TYPE="+encodeURI('${model.boforeDomain.SEARCH_TYPE}');
	
	if("${model.boforeDomain.page}" != "")
	{
		moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
	}
	
	idchk = true;
	location.href = './'+deleteArrIdx+'/update.do'+moveUrl;
	
	
}

</script>
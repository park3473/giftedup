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
                                <span>문자 메세지 이력</span>
                            </div>
							<form action="./insert.do?" method="post" name="updateform" id="updateform">
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="number">번호</th>
                                        <th class="program_name">사용자 아이디</th>
                                        <th class="obs">전화번호</th>
                                        <th class="name">내용</th>
                                        <th class="name">상태</th>
                                        <th class="join">생성일</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.IDX}"  >
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td>${item.MEMBER_ID}</td>
                                        <td>${item.PHONE}</td>
                                        <td>${item.MESSAGE}</td>
                                        <td>
                                        <c:if test="${item.STATUS == '0'}">대기</c:if>
                                        <c:if test="${item.STATUS == '1'}">발송완료</c:if>
                                        <c:if test="${item.STATUS == '-1'}">실패</c:if>
                                        </td>
                                        <td>
                                            ${fn:substring(item.CREATE_TM,0,11)}
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
 							<!--관리자 버튼-->
                            <div class="page_seach">
                                <div>
                                    <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                        <option value="ALL">전체</option>
                                        <option value="MEMBER_ID" <c:if test="${model.SEARCH_TYPE == 'MEMBER_ID'}">selected</c:if>>작성자</option>
                                        <option value="MESSAGE"  <c:if test="${model.SEARCH_TYPE == 'MESSAGE'}">selected</c:if>>메세지</option>
                                        <option value="PHONE" <c:if test="${model.SEARCH_TYPE == 'PHONE'}">selected</c:if>>전화번호</option>
                                    </select>
                                    <input style="width: 191px;" type="text" value="${model.SEARCH_TEXT }" name="SEARCH_TEXT" id="SEARCH_TEXT" >
                                    <button type="button" value="검색" onClick="searchBtnClick()">검색</button>
                                </div>
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                	</ul>
                                </div>
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
    
    <c:if test="${fn:indexOf(requestURI, '/sms_log/program/list.do') > -1}">
        <script src="${pageContext.request.contextPath}/resources/js/admin/starts.js"></script>
    </c:if>

    <c:if test="${fn:indexOf(requestURI, '/sms_log/program/list.do') == -1}">
        <script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
    </c:if>    
    
    
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
	
	var URL = '../deleteArr.do?IDX='+ deleteArrIdx;
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
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}




</script>
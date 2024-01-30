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
                                
                                <span>설문조사 관리</span>
                            </div>
							<form action="./insert.do?" method="post" name="updateform" id="updateform">
                            <div class="table_wrap">
								<table>
                                    <tr>
				                        <th class="number">번호</th>
				                        <th class="program_name">제목</th>
				                        <th class="join">기간</th>
				                        <th class="claim">참여현황</th>
				                        <th class="claim">진행상황</th>
				                        <th class="claim-day">설정툴</th>
				                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
		                                <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
				                        <td><a href="./survey_questionnaire/${item.IDX}/list.do">${item.TITLE }</a></td>
				                        <td>${fn:substring(item.START_TM ,0,11)} ~ ${fn:substring(item.END_TM ,0,11)}</td>
				                        <td>${item.ANSWER_CNT}</td>
				                        
				                        <td>
				                            <c:if test="${item.START_TM_STEP == 1 && item.END_TM_STEP == 1}">
                                       		진행중
	                                       </c:if>
	                                       
	                                       <c:if test="${item.START_TM_STEP == 0 && item.END_TM_STEP == 1}">
	                                       	진행예정
	                                       </c:if>
	                                       
	                                       <c:if test="${item.START_TM_STEP == 1 && item.END_TM_STEP == 0}">
	                                       	마감
	                                       </c:if>
				                        </td>
				                        
				                        <td class="delete_list_btn">
				                        	<div class="modify_btn">
				                                <a href="./${item.IDX}/detail.do">보기</a>
				                            </div>
				                            <div class="modify_btn">
				                                <a href="./${item.IDX}/update.do">수정</a>
				                            </div>
				                            <div class="delete_btn">
				                                <a href="./${item.IDX}/delete.do">삭제</a>
				                            </div>
				                        </td>
                                    </tr>
                                    </c:forEach>
                                    
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="page_seach">
                                
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
  
                                    <li class="delete">
                                        <a href="./insert.do">등록</a>
                                    </li>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/starts.js"></script>
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
	if(deleteArrIdx == ''){
		alert('삭제할 데이터 체크 선택해주세요.');
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

$("#bootstrap-data-table tr").click(function(){     
    console.log($(this).data("id"));
    if($(this).data("role") == 'button')
    {
    	var URL = './'+$(this).data("id")+'/update.do?';
    	URL = URL + "PAGE=${model.beforeDomain.PAGE}";
    	URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
    	URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
    	location.href = URL;
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
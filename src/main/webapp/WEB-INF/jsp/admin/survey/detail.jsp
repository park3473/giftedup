 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin_5.css">
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
				                <span>설문조사 상세</span>
				            </div>
				
				            <div class="member_register_wrap">
				                <div class="member_input_wrap" id="member_input_wrap">
				                    <div class="stats_box_wrap">
				                        <h3 class="starts_view_title"><span><img src="${pageContext.request.contextPath}/resources/img/admin/question_img.png" alt="물음표버튼"></span>${model.pageDomain.TITLE}<span class="starts_view_title_bl">(총 <span>${model.pageDomain.SURVEY_CNT}</span>명 참여하셨습니다.)</span></h3>
				                        <div class="stats_box">
				                            ${model.pageDomain.CONTENT}
				                        </div>
				                    </div>
				
				                    <!-- 질문 1 시작 -->
				                   <c:forEach var="item" items="${model.QUESTIONNAIRE.list}" varStatus="status">
				                    <div class="stats_box_wrap">
				                        <h6><!-- <span>${status.index+1}.</span> -->${item.TITLE}</h6>
				                        <div class="stats_box">
				                            
				                           
				                            <c:forEach var="item2" items="${model.QUESTION.list}" varStatus="status2">
				                            <c:if test="${item2.SURVEY_QUESLIONNAIRE_IDX == item.IDX}">
				                            <div class="stats_qs">
				                                <p class="stats_box_q">${status2.index+1}) ${item2.QUESTION}</p>
				                                <ul class="stats_box_a">
					                             	<c:forEach var="item3" items="${model.QUESTIONSELECT.list}" varStatus="status3">       
													<c:if test="${item3.SURVEY_QUESTION_IDX == item2.IDX}">
					                                    <c:if test="${item2.TYPE == 'RADIO'}">
					                                    <li><input type="radio" name="list[${status2.index}].SELECT_ITEM"/> ${item3.SELECT_ITEM} <span><b>${item3.SELECT_CNT}</b>명 선택</span></li>
					                                    </c:if>
					                                    
					                                    <c:if test="${item2.TYPE == 'CHECKBOX'}">
					                                    <li><input type="checkbox" name="list[${status2.index}].SELECT_ITEM"/> ${item3.SELECT_ITEM} <span><b>${item3.SELECT_CNT}</b>명 선택</li>
					                                    </c:if>
					                                 </c:if>
					                                 </c:forEach>	
				                                    
			                                    	<c:forEach var="item4" items="${model.QUESTIONANSWER.list}" varStatus="status4">
			                                    		<c:if test="${item2.IDX == item4.SURVEY_QUESTION_IDX}">
			                                    			<li><input type="text" value="${item4.SURVEY_TEXT }"/></li>
			                                    		</c:if>
			                                    	</c:forEach>
				                                </ul>
				                            </div>
				                            </c:if>
				                            </c:forEach>
				                        </div>
				                    </div>
				                    </c:forEach>
				                    <!-- 질문 1 끝 -->
				                </div>
				            </div>
				
				            <!--저장하기 버튼-->
				            <div class="register_btn_area stats_btn_area">
				                <div class="register_btn_con">
				                    <a class="cancel" href="../list.do">리스트</a>
				                    <a class="cancel" href="javascript:showPrint();">인쇄</a>
				                    <a class="cancel" href="./excelDown.do">엑셀출력</a>
				                </div>
				            </div>
				            <!--저장하기 버튼 end-->
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
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

function showPrint()
{
	 var initBody = document.body.innerHTML;
     window.onbeforeprint = function(){
         document.body.innerHTML = document.getElementById('member_input_wrap').innerHTML;
     }
     window.onafterprint = function(){
         document.body.innerHTML = initBody;
     }
     window.print();    
}


</script>
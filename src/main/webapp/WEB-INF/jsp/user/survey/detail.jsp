 	<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	

<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="../include/head.jsp" %>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <!--추가 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
</head>

<body>
    <header id="new_hd" class="hd_wrap">
	<%@ include file="../include/header.jsp" %> 
	
	 <!-- 본문 -->
      <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
           <%@ include file="../include/menu_sub.jsp" %> 
      </section>
      
    </header>



    <!-- 본문 -->
      
  

	<form action="./detail.do?" method="post" name="updateform" id="updateform">
    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                
                	<!-- 메뉴바 -->
                	<nav class="right_nav_wrap">
                		<div class="title">
                			<c:if test="${
                                        fn:indexOf(requestURI, '/notices_data/1/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/2/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/3/') > -1
                                        || fn:indexOf(requestURI, '/user/survey/') > -1
                                        || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1
                                        }"><h2>커뮤니티</h2></c:if>
                		</div>
                		<ul>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}"><li><a href="${pageContext.request.contextPath}//user/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}"><li><a href="${pageContext.request.contextPath}/user/member_re/insert.do">신입생 선발 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                		</ul>
                	</nav>
                	<!-- 메뉴바  end-->
                
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>설문조사</p>
                                </div>




                                <div class="member_register_wrap">
                                    <div class="member_input_wrap">
                                        <div class="stats_box_wrap">
                                            <div class="starts_view_title">
                                                <span><img src="${pageContext.request.contextPath}/resources/img/admin/question_img.png" alt="물음표버튼"></span>
                                                <span>${model.pageDomain.TITLE}</span>
                                                <span class="starts_view_title_bl">(총 <span class="span_b">256</span>명 참여하셨습니다.)</span>
                                            </div>
                                            <div class="stats_box">
                                               ${model.pageDomain.CONTENT}
                                            </div>
                                        </div>

                                        <!-- 질문 1 시작 -->
                                        <c:forEach var="item" items="${model.QUESTIONNAIRE.list}" varStatus="status">
				                  		<div class="stats_box_wrap">
				                        <h6><span>${status.index+1}.</span>${item.TITLE}</h6>
				                        <div class="stats_box">
				                            
				                           
				                            <c:forEach var="item2" items="${model.QUESTION.list}" varStatus="status2">
				                            <c:if test="${item2.SURVEY_QUESLIONNAIRE_IDX == item.IDX}">
				                            
				                            <input type="hidden" name="list[${status2.index}].IDX" value=""/>
				                            <input type="hidden" name="list[${status2.index}].SURVEY_IDX" value="${item2.SURVEY_IDX}"/>
				                            <input type="hidden" name="list[${status2.index}].SURVEY_QUESTION_IDX" value="${item2.IDX}"/>
				                            
				                            
				                            <div class="stats_qs">
				                                <p class="stats_box_q">${status2.index+1}) ${item2.QUESTION}</p>
				                                <ul class="stats_box_a">

			                                    <c:if test="${item2.TYPE == 'TEXT'}">
			                                    			                                    <li>
			                                    	<c:set var="textInput" value="0" />
			                                    	<c:forEach var="item4" items="${model.QUESTIONANSWER.list}" varStatus="status4">
                                                  	<c:if test="${item4.SURVEY_QUESTION_IDX == item2.IDX}">
                                                  	<c:set var="textInput" value="1" />
                                                  	<input type="text" name="list[${status2.index}].SURVEY_TEXT" value="${item4.SURVEY_TEXT}"/>
                                                  	
                                                  	</c:if> 
                   									</c:forEach>
                   									
                   									<c:if test="${textInput == 0}"><input type="text" name="list[${status2.index}].SURVEY_TEXT" value=""/></c:if>
                   									
			                                    </li>
			                                    
			                                    
			                                    </c:if>				                                    
				                             	<c:forEach var="item3" items="${model.QUESTIONSELECT.list}" varStatus="status3">       
												<c:if test="${item3.SURVEY_QUESTION_IDX == item2.IDX}">
				                                    <c:if test="${item2.TYPE == 'RADIO'}">
				                                    <li><input type="radio" value="${item3.IDX}" name="list[${status2.index}].SURVEY_SELECT"
				                                    
				                                    <c:forEach var="item4" items="${model.QUESTIONANSWER.list}" varStatus="status4">
                                                  	<c:if test="${item4.SURVEY_SELECT == item3.IDX+''}">checked </c:if> 
                   									</c:forEach>
                   								
				                                    />${item3.SELECT_ITEM}</li>
				                                    </c:if>
				                                    <c:if test="${item2.TYPE == 'CHECKBOX'}">
				                                    <li><input type="checkbox" value="${item3.IDX}" name="list[${status2.index}].SURVEY_SELECT"
				                                    
				                                    <c:forEach var="item4" items="${model.QUESTIONANSWER.list}" varStatus="status4">
                                                  	<c:if test="${item4.SURVEY_SELECT == item3.IDX+''}">checked </c:if> 
                   									</c:forEach>
                   									
				                                    />${item3.SELECT_ITEM}</li>
				                                    </c:if>
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

                                <!--보드 검색_버튼-->
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                        <a class="delete" href="javascript:insertClick();">작성완료</a>
                                        <a class="register" href="javascript:history.back();">취소하기</a>
                                    </div>
                                </div>
                                <!--보드 검색_버튼 end-->

                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    </form>
    
    <!--본문 내용 end-->

    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
	<%@ include file="../include/footer.jsp" %> 
    </footer>
	<%@ include file="../include/footerJs.jsp" %> 
</body></html>
<script>
function insertClick()
{
	$('#updateform').submit();
	
}


var len ='${fn:length(model.QUESTIONANSWER.list)}'
if(len > 0)
{
	swal({
		  title: "알림",
		  text: "이미 참여한 설문입니다. 수정하시겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-success",
		  cancelButtonText: " 아니오",
		  confirmButtonText: "네",
		  closeOnConfirm: true,
		},
		function(isConfirm){
			if (isConfirm) {
			    return true;
			  } else {
			    history.back();
			  }
		});

}



</script>
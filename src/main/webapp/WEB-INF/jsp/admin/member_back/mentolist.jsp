<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
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
                                <span>회원목록관리</span>
                                
                            </div>
                            <form action="./insert.do?" method="post" name="updateform" id="updateform">
                                <div class="member_seach_form">
                                    <div class="member_01_wrap">
                                        <form>
                                            <div class="form_01">
                                                <div class="page_seach">
                                                    
                                                    <select ID="TYPE" NAME="TYPE">
                                                        <option value="">회원구분</option>
                                                        <option value="2" <c:if test="${model.beforeDomain.TYPE == '2'}">selected</c:if>>교사</option>
                                                        <option value="1" <c:if test="${model.beforeDomain.TYPE == '1'}">selected</c:if>>학생</option>
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
                                    
                                    
                                    <!-- 문자 발송  -->
                                    <div class="member_03_wrap">
                                        <form>
                                            <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span> / 2000byte)</span>
                                            <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                            <input type="checkbox" id="RESERVATION" name="RESERVATION"  >
                                            <input class="datecalendar2" type="text"  value="" id="RESERVATION_TM" name="RESERVATION_TM" readonly style="DISPLAY: none;">
                                            <input  type="text"  value="" id="RESERVATION_TM2" name="RESERVATION_TM2" readonly>
                                            <%-- <span><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" /></span> --%>
                                            
                                            <button type="button" onClick="javascript:smssend('member')" value="문자발송">문자발송</button>
                                            <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/member/list.do">발송내역</a>
                                        </form>
                                    </div>
                                    <!-- 문자 종료  -->
                                </div>
                            </form>

                            <div class="table_wrap">
                                <table>
                                    <tr>
                                        <th class="number">순번</th>
                                        <th class="name">멘토이름</th>
                                        <th class="name_id">아이디</th>
                                        <th class="phone">휴대전화</th>
										<th class="school_name">소속 학교</th>
                                    </tr>
                                    
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td><a href="./${item.MEMBER_ID}/update.do">${item.NAME}</a></td>
                                        <td><a href="./${item.MEMBER_ID}/update.do">${item.MEMBER_ID}</a></td>
                                        <td>${item.PHONE}</td>
                                        <td>${item.SCHOOL_NAME }</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                           
                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <ul class="page">

									<c:if test="${model.page > 0}"> 
										<c:if test="${model.itempagestart-model.itemCount > 0}">
							                 <li id="first_a"><a href="javascript:pageChanged(0, 0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
							                 <li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
										</c:if>
										<c:if test="${model.itempagestart-model.itemCount <= 0}">
											<li id="first_a"><a href="javascript:pageChanged(0,0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
											<li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
										</c:if>
									</c:if>
						
									<c:if test="${model.page <= 0}">
										  <li id="first_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
									      <li id="prev_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
									</c:if>
									
									<c:if test="${model.itempageend > 0}">
										<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
											<c:choose>
												<c:when test="${model.page == i }">
													<li class="number page_active"><a href="#">${i+1}</a></li>
												</c:when>
												<c:otherwise>
													<li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:if>
						
									<c:if test="${model.itempageend == 0}">
										<li class="number">1</li>
									</c:if>
									<c:if test="${model.itempageend < 0}">
										<li class="number">1</li>
									</c:if>
									
									<c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
										<li id="next_a"><a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
									</c:if>
									<c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
										<li id="next_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
									</c:if>
						
									<c:choose>
										<c:when	test="${model.itemCount < model.itemtotalcount/(page+1)}">
										<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
											
										</c:when>
										<c:otherwise>
										<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
										</c:otherwise>
									</c:choose>
									
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
<script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

</body>

</html>

<%@ include file="../include/footerJs.jsp" %>


<script>
    
function searchBtnClick() {
    URL = '${requestURI}';
    URL = URL + "?PAGE=0";
    URL = URL + "&TYPE=" + $('#TYPE').val();
    URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();

    URL = URL + "&EXP_DATA="+$('#EXP_DATA').val().substring(2,4);
    
    URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
    URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
    location.href = URL;
}


function pageChanged(page, endpage)
{
	if (page < 0) 
	{
		page = 0;
	}
	if (endpage < 0){
		endpage = 0;
	}
	if (page >= endpage) {
		page = endpage;
	}
	
	
	var URL = "${requestURI}?PAGE="+page;

	

	URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
	URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';


	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	
	
	if('${model.beforeDomain.TYPE}' != ''){
		URL = URL + "&TYPE=" + '${model.beforeDomain.TYPE}';
	}
	
	
	
	if('${model.beforeDomain.LOCATION}' != ''){
		URL = URL + "&LOCATION=" + '${model.beforeDomain.LOCATION}';
	}
	
	if('${model.beforeDomain.SCHOOL_YEAR}' != ''){
		URL = URL + "&SCHOOL_YEAR=" + '${model.beforeDomain.SCHOOL_YEAR}';
	}
	
	
	if('${model.beforeDomain.SCHOOL_NAME}' != ''){
		URL = URL + "&SCHOOL_NAME=" + '${model.beforeDomain.SCHOOL_NAME}';
	}
	
	if('${model.beforeDomain.EXP_DATA}' != ''){
		URL = URL + "&EXP_DATA=" + '${model.beforeDomain.EXP_DATA}';
	}
	
	location.href = URL;
}

</script>

<div id="iframe2" style="display:none">
    <iframe id="iframeDiv" src="#" width="750" height="800" left="300" top="150"></iframe>
</div>
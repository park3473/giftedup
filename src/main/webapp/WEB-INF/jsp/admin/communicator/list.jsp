<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %> 
        <link href="${pageContext.request.contextPath}/resources/css/admin/member_re_list.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
    <!--헤더-->
    <%@ include file="../include/header.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
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
                                <span>커뮤니케이터 리스트</span>
                            </div>
                            <form action="list.do?" method="get">
                                <div class="member_re_seach_form">
                                    <div class="member_re_01_wrap">
                                        <form>
                                            <div class="form_01">
                                                <div class="page_seach">
                                                    <select style="width:60px" id="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                                        <option value="ALL">전체</option>
                                                        <option value="COMM_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'COMM_NAME'}">selected</c:if>>강좌 명</option>
                                                        <option value="COMM_MENTO_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'COMM_MENTO_NAME'}">selected</c:if>>강좌 멘토 이름</option>
                                                    </select>
                                                    
                                                    <select ID="COMM_TYPE" name="COMM_TYPE">
                                                    	<option value="">강의 분야 전체</option>
                                                    	<option value="수학" <c:if test="${model.beforeDomain.COMM_TYPE == '수학'}">selected</c:if>>수학</option>
                                                    	<option value="과학" <c:if test="${model.beforeDomain.COMM_TYPE == '과학'}">selected</c:if>>과학</option>
                                                    	<option value="융합" <c:if test="${model.beforeDomain.COMM_TYPE == '융합'}">selected</c:if>>융합</option>
                                                    	<option value="정보" <c:if test="${model.beforeDomain.COMM_TYPE == '정보'}">selected</c:if>>정보</option>
                                                    	<option value="인문" <c:if test="${model.beforeDomain.COMM_TYPE == '인문'}">selected</c:if>>인문</option>
                                                    	<option value="에술" <c:if test="${model.beforeDomain.COMM_TYPE == '예술'}">selected</c:if>>예술</option>
                                                    	<option value="기타" <c:if test="${model.beforeDomain.COMM_TYPE == '기타'}">selected</c:if>>기타</option>
                                                    </select>
													
													<select ID="COMM_TIME" name="COMM_TIME">
														<option value="">강좌 시간</option>
														<option value="1" <c:if test="${model.beforeDomain.COMM_TIME == '1'}">selected</c:if>>오전</option>
														<option value="2" <c:if test="${model.beforeDomain.COMM_TIME == '2'}">selected</c:if>>오후</option>
													</select>
													
													<select ID="COMM_STAT" name="COMM_STAT">
														<option value="">강좌 현황</option>
														<option value="0" <c:if test="${model.beforeDomain.COMM_STAT == '0'}">selected</c:if>>개설완료</option>
														<option value="1" <c:if test="${model.beforeDomain.COMM_STAT == '1'}">selected</c:if>>접수중</option>
														<option value="2" <c:if test="${model.beforeDomain.COMM_STAT == '2'}">selected</c:if>>접수마감</option>
														<option value="3" <c:if test="${model.beforeDomain.COMM_STAT == '3'}">selected</c:if>>강의준비</option>
														<option value="4" <c:if test="${model.beforeDomain.COMM_STAT == '4'}">selected</c:if>>강의중</option>
														<option value="5" <c:if test="${model.beforeDomain.COMM_STAT == '5'}">selected</c:if>>강의완료</option>
													</select>
													
													<select ID="COMM_SUPPLIES" name="COMM_SUPPLIES">
														<option value="">준비물 여부</option>
														<option value="true" <c:if test="${model.beforeDomain.COMM_SUPPLIES == 'true'}">selected</c:if>>필요</option>
														<option value="false" <c:if test="${model.beforeDomain.COMM_SUPPLIES == 'false'}">selected</c:if>>불필요</option>
													</select>
													
													<select ID="COMM_YEAR" name="COMM_YEAR">
														<option value="">준비물 여부</option>
														<option value="2021" <c:if test="${model.beforeDomain.COMM_YEAR == '2021'}">selected</c:if>>2021</option>
														<option value="2022" <c:if test="${model.beforeDomain.COMM_YEAR == '2022'}">selected</c:if>>2022</option>
														<option value="2023" <c:if test="${model.beforeDomain.COMM_YEAR == '2023'}">selected</c:if>>2023</option>
													</select>
													
													<input style="width: 191px;" class="datecalendar" type="text" name="COMM_DAY" id="COMM_DAY" value="${fn:substring(model.beforeDomain.COMM_START_TM,0,16 )}" placeholder="날짜 선택" autocomplete="off">
													
                                                    <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="검색할 내용을 입력해주세요.">
                                                    <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                    <a class="w_btn" href="./list.do">새로고침</a>
                                                    <button type="button" onClick="AllExcelDown()" value="출력">출력</button>
                                                    
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <!-- 신입생 테이블 -->
                                <div class="table_wrap">
                                    <table id="gcTable" class="tablesorter">
                                        <thead>
                                            <tr>
                                               <th class="COMM_INDEX">
                                               		순번
                                               </th>
                                               <th class="COMM_NAME">
                                               		강좌명
                                               </th>
                                               <th class="COMM_SUPPLIES">
                                               		준비물 여부
                                               </th>
                                               <th class="COMM_PERSONNEL">
                                               		학생 수
                                               </th>
                                               <th class="COMM_STAT">
                                               		상태
                                               </th>
                                               <th class="COMM_DATE">
                                               		강좌 시작 시간
                                               </th>
                                               <th class="COMM_MENTO">
                                               		멘토 교사 아이디
                                               </th>
                                               <th class="COMM_MENTO_NAME">
                                               		멘토 교사 명
                                               </th>
                                               <th class="COMM_TYPE">
                                               		강좌 분야
                                               </th>
                                               <th class="COMM_TIME">
                                               		강좌 시간
                                               </th>
                                               <th class="COMM_EXCEL">
                                               		엑셀 다운
                                               </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${model.list}" varStatus="var">
                                            <tr onclick="comm_view(${item.COMM_IDX});">
                                            	<td class="COMM_IDX" style="display:none">
                                            		${item.COMM_IDX }
                                            	</td>
                                                <td class="COMM_INDEX">
                                                	${model.itemtotalcount - (var.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}
                                                </td>
                                                <td class="COMM_NAME">
                                                	${item.COMM_NAME }
                                                </td>
                                                <td class="COMM_SUPPLIES">
                                                	<c:if test="${item.COMM_SUPPLIES == 'true' }">
                                                		필요
                                                	</c:if>
                                                	<c:if test="${item.COMM_SUPPLIES == 'false' }">
                                                		불필요
                                                	</c:if>
                                                </td>
                                                <td class="COMM_PERSONNEL">
                                                	${item.COMM_PERSONNEL }
                                                </td>
                                                <td class="COMM_STAT">
                                                	<c:choose>
                                                		<c:when test="${item.COMM_STAT == '0' }">
                                                			개설완료
                                                		</c:when>
                                                		<c:when test="${item.COMM_STAT == '1' }">
                                                			접수중
                                                		</c:when>
                                                		<c:when test="${item.COMM_STAT == '2' }">
                                                			접수마감
                                                		</c:when>
                                                		<c:when test="${item.COMM_STAT == '3' }">
                                                			준비중
                                                		</c:when>
                                                		<c:when test="${item.COMM_STAT == '4' }">
                                                			강의중
                                                		</c:when>
                                                		<c:when test="${item.COMM_STAT == '5' }">
                                                			종료
                                                		</c:when>
                                                	</c:choose>
                                                </td>
                                                <td class="COMM_DATE">
                                                	${item.COMM_START_TM }
                                                </td>
                                                <td class="COMM_MENTO">
                                                	${item.COMM_MENTO }
                                                </td>
                                                <td class="COMM_MENTO_NAME">
                                               		${item.COMM_MENTO_NAME }
                                               </td>
                                                <td class="COMM_TYPE">
                                                	${item.COMM_TYPE }
                                                </td>
                                                <td class="COMM_TIME">
                                                	<c:if test="${item.COMM_TIME == '1' }">
                                                		오전
                                                	</c:if>
                                                	<c:if test="${item.COMM_TIME == '2' }">
                                                		오후
                                                	</c:if>
                                                </td>
                                                <td id="COMM_EXCEL_DOWN" onclick="event.cancelBubble=true">
                                                	<button type="button" onclick="location.href='./SelectExcel.do?COMM_IDX=${item.COMM_IDX}&COMM_NAME=${item.COMM_NAME }'">상세 출력</button>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
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
										
										<c:if test="${model.itemcount < model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
										<c:if test="${model.itemcount >= model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
							
										<fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemcount)==0? ((model.itemtotalcount/model.itemcount)-1) : (model.itemtotalcount / model.itemcount)}" integerOnly="true" />
										<c:choose>
											<c:when	test="${model.itemcount < model.itemtotalcount/(page+1)}">
											<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
												
											</c:when>
											<c:otherwise>
											<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
											</c:otherwise>
										</c:choose>
										
										</ul>
                                </nav>
                                <!--페이지 넘버 end-->

                            </form>
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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/program.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.table2excel.js" type="text/javascript"></script>

</body>

</html>

<%@ include file="../include/footerJs.jsp" %>
<script>
//Page 관련
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
	
	
	var URL = "list.do?PAGE="+page;

	if('${model.beforeDomain.ITEM_COUNT}}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
    URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
    if($('#COMM_TYPE').val() != ''){
    	URL = URL + "&COMM_TYPE=" + $('#COMM_TYPE').val();	
    }
    if($('#COMM_TIME').val() != ''){
    	URL = URL + "&COMM_TIME=" + $('#COMM_TIME').val();	
    }
    if($('#COMM_DAY').val() != ''){
    	URL = URL + "&COMM_START_TM=" + $('#COMM_DAY').val();
    }
    if($('#COMM_STAT').val() != ''){
    	URL = URL + "&COMM_STAT=" + $('#COMM_STAT').val();
    }
    if($('#COMM_SUPPLIES').val() != ''){
    	URL = URL + "&COMM_SUPPLIES=" + $('#COMM_SUPPLIES').val();
    }
	location.href = URL;
}

//Search 관련

function searchBtnClick() {
        URL = './list.do';
        URL = URL + "?PAGE=0";
        
        if('${model.beforeDomain.ITEM_COUNT}}' == '')
    	{
    		URL = URL + "&ITEM_COUNT=" + '10';
    	}else
    	{
    		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
    	}
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        
        if($('#COMM_TYPE').val() != ''){
        	URL = URL + "&COMM_TYPE=" + $('#COMM_TYPE').val();	
        }
        if($('#COMM_TIME').val() != ''){
        	URL = URL + "&COMM_TIME=" + $('#COMM_TIME').val();	
        }
        if($('#COMM_DAY').val() != ''){
        	URL = URL + "&COMM_START_TM=" + $('#COMM_DAY').val();
        }
        if($('#COMM_STAT').val() != ''){
        	URL = URL + "&COMM_STAT=" + $('#COMM_STAT').val();
        }
        if($('#COMM_SUPPLIES').val() != ''){
        	URL = URL + "&COMM_SUPPLIES=" + $('#COMM_SUPPLIES').val();
        }
        location.href = URL;
    }
    
    
    function comm_view(COMM_IDX){
    	location.href ='${pageContext.request.contextPath}/admin/program/communicator/update.do?COMM_IDX='+COMM_IDX+'';
    }
    
    function AllExcelDown(){
    	var URL = './AllExcel.do?';
    	if($('#COMM_TYPE').val() != ''){
        	URL = URL + '&COMM_TYPE=' + $('#COMM_TYPE').val();	
        }
        if($('#COMM_TIME').val() != ''){
        	URL = URL + '&COMM_TIME=' + $('#COMM_TIME').val();	
        }
        if($('#COMM_DAY').val() != ''){
        	URL = URL + '&COMM_START_TM=' + $('#COMM_DAY').val();
        }
        if($('#COMM_STAT').val() != ''){
        	URL = URL + '&COMM_STAT=' + $('#COMM_STAT').val();
        }
        if($('#COMM_SUPPLIES').val() != ''){
        	URL = URL + '&COMM_SUPPLIES=' + $('#COMM_SUPPLIES').val();
        }
        if($('#COMM_YEAR').val() != ''){
        	URL = URL + '&COMM_YEAR=' + $('#COMM_YEAR').val();
        }
        
        location.href= URL;
        
    }
    
</script>
<script>

$.datetimepicker.setLocale('ko');
$('.datecalendar').datetimepicker({
    format:'Y.m.d',
    lang: "ko",
    timepicker:true
});


</script>
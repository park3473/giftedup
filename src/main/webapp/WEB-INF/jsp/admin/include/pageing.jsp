<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

			<fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemCount)==0? ((model.itemtotalcount/model.itemCount)-1) : (model.itemtotalcount / model.itemCount)}" integerOnly="true" />
			<c:choose>
				<c:when	test="${model.itemCount < model.itemtotalcount/(page+1)}">
				<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
					
				</c:when>
				<c:otherwise>
				<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
				</c:otherwise>
			</c:choose>
			
			</ul>
		
<script>			
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

	
	if('${model.beforeDomain.ITEM_COUNT}}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	

	URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
	URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';
	
	
	
	if('${model.beforeDomain.LEVEL}' != ''){
		URL = URL + "&LEVEL=" + '${model.beforeDomain.LEVEL}';
	}
	if('${model.beforeDomain.RESULT}' != ''){
		URL = URL + "&RESULT=" + '${model.beforeDomain.RESULT}';
	}
	

	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	
	if('${model.beforeDomain.SCHOOL_TYPE}' != ''){
		URL = URL + "&SCHOOL_TYPE=" + '${model.beforeDomain.SCHOOL_TYPE}';
	}
	
	if('${model.beforeDomain.TYPE}' != ''){
		URL = URL + "&TYPE=" + '${model.beforeDomain.TYPE}';
	}
	
	if('${model.beforeDomain.START_TM}' != ''){
		URL = URL + "&START_TM=" + '${model.beforeDomain.START_TM}';
	}
	if('${model.beforeDomain.END_TM}' != ''){
		URL = URL + "&END_TM=" + '${model.beforeDomain.END_TM}';
	}
	
	
	if('${model.beforeDomain.ENROLLMENT_STATUS}' != ''){
		URL = URL + "&ENROLLMENT_STATUS=" + '${model.beforeDomain.ENROLLMENT_STATUS}';
	}
	
	if('${model.beforeDomain.SUPPORT_GROUP}' != ''){
		URL = URL + "&SUPPORT_GROUP=" + '${model.beforeDomain.SUPPORT_GROUP}';
	}
	
	
	if('${model.beforeDomain.YEAR}' != ''){
		URL = URL + "&YEAR=" + '${model.beforeDomain.YEAR}';
	}
	
	if('${model.beforeDomain.LOCATION}' != ''){
		URL = URL + "&LOCATION=" + '${model.beforeDomain.LOCATION}';
	}
	
	if('${model.beforeDomain.SCHOOL_YEAR}' != ''){
		URL = URL + "&SCHOOL_YEAR=" + '${model.beforeDomain.SCHOOL_YEAR}';
	}
	
	if('${model.beforeDomain.UP}' != ''){
		URL = URL + "&UP=" + '${model.beforeDomain.UP}';
	}
	
	
	if('${model.beforeDomain.DOWN}' != ''){
		URL = URL + "&DOWN=" + '${model.beforeDomain.DOWN}';
	}
	
	if('${model.beforeDomain.SEX}' != ''){
		URL = URL + "&SEX=" + '${model.beforeDomain.SEX}';
	}
	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	if('${model.beforeDomain.SCHOOL_NAME}' != ''){
		URL = URL + "&SCHOOL_NAME=" + '${model.beforeDomain.SCHOOL_NAME}';
	}
	
	location.href = URL;
}


</script>
	
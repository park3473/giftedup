 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<li>
	<span class="list_t">교육기간</span>
  	<input class="input_size mr" type="text" name="START_TM2" id="START_TM2" value="${model.pageDomain.START_TM}" disabled="disabled">
	<!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
	<span class="mr-rt-05">~</span>
	<input class="input_size mr" type="text" name="END_TM2" id="END_TM2" value="${model.pageDomain.END_TM}" disabled="disabled">
	<!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
</li>


<c:if test="${model.pageDomain.BUS_STATION != '' && model.pageDomain.BUS_STATION != null }">
<li>
    <span class="list_t">장소</span>
    <input class="input_size mr" type="text" name="PLACE2" id="PLACE2" disabled="disabled" value="${model.pageDomain.BUS_STATION}">
</li>
</c:if>
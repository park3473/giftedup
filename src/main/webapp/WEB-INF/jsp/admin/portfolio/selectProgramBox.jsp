 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<option value="">프로그램명 선택</option>
<c:forEach var="item" items="${model.list}" varStatus="status">
<option value="${item.IDX}">${item.NAME}</option>
</c:forEach>
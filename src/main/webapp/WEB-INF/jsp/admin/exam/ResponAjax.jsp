 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${model.callType == 'member' }">
	<table id="member_table">
		<thead>
			<tr>
				<th style="width: 98px">아이디</th>
				<th style="width: 98px">이름</th>
				<th style="width: 98px">번호</th>
				<th style="width: 98px">타입</th>
				<th style="width: 98px">학교</th>
				<th style="width: 98px">등록</th>
			</tr>
		<thead>
		<tbody>
			<c:forEach var="item" items="${model.member}" varStatus="status">
				<tr>
					<td>${item.member_id }</td>
					<td>${item.name}</td>
					<td>${item.phone}</td>
					<td><c:choose>
							<c:when test="${item.type == '1'}">학생</c:when>
							<c:when test="${item.type == '2'}">교사</c:when>
						</c:choose></td>
					<td>${item.school_name}</td>
					<td>
						<button type="button" onclick="insertAjax(this)" data-member_id="${item.member_id }" data-name="${item.name }" data-phone="${item.phone }" data-type="${item.type }" data-school_name="${item.school_name }" >등록</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>


<c:if test="${model.callType == 'respondents' }">
	<table id="respondents_table">
		<thead>
			<tr>
				<th style="width: 98px">아이디</th>
				<th style="width: 98px">이름</th>
				<th style="width: 98px">번호</th>
				<th style="width: 98px">타입</th>
				<th style="width: 98px">학교</th>
				<th style="width: 98px">응답여부</th>
				<th style="width: 98px">삭제</th>
			</tr>
		<thead>
		<tbody>
			<c:forEach var="item" items="${model.respondents}" varStatus="status">
				<tr>
					<td>${item.member_id }</td>
					<td>${item.name}</td>
					<td>${item.phone}</td>
					<td><c:choose>
							<c:when test="${item.type == '1'}">학생</c:when>
							<c:when test="${item.type == '2'}">교사</c:when>
						</c:choose></td>
					<td>${item.school_name}</td>
					<td>${item.respondents }</td>
					<td>
						<button type="button" onclick="deleteAjax(this)" data-idx="${item.idx }" data-member_id="${item.member_id }" data-name="${item.name }" data-phone="${item.phone }" data-type="${item.type }" data-school_name="${item.school_name }" >삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>


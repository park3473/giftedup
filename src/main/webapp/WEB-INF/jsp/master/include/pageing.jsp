<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="add_bt_wrap">
	<div class="text-center">
		<ul class="pagination pagination-sm">
			<c:if test="${model.page > 0}">
				<c:if test="${model.itempagestart-model.itemCount > 0}">

					<li><a
						href="javascript:pageChanged(${model.itempagestart-model.itemCount}, ${model.itempageend});"
						class="go_first"><i class="fa fa-angle-double-left"></i>&nbsp;처음</a></li>

				</c:if>
				<c:if test="${model.itempagestart-model.itemCount <= 0}">

					<li><a
						href="javascript:pageChanged(0, 0);"
						class="go_first"><i class="fa fa-angle-double-left"></i>&nbsp;처음</a></li>
				</c:if>

				<li class="angle-left"><a
					href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"
					class="go_prev"><i class="fa fa-angle-left"></i>&nbsp;이전</a></li>
			</c:if>

			<c:if test="${model.page <= 0}">
				<li><a href="#" class="go_first">
				<i class="fa fa-angle-double-left"></i>&nbsp;처음</a></li>
				<li class="angle-left"><a href="#" class="go_prev">
				<i class="fa fa-angle-left"></i>&nbsp;이전</a></li>
			</c:if>


			<c:if test="${model.itempageend > 0}">
				<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
					<c:choose>
						<c:when test="${page == i }">
							<li><a href="javascript:pageChanged(${i}, ${model.itempageend});" style="color: blue;font-weight:bold">${i+1}</a></li>
						</c:when>

						<c:otherwise>
							<li><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>





			<c:if test="${model.itempageend == 0}">
				<li><a href="javascript:pageChanged(0,0});">1</a></li>
			</c:if>
			<c:if test="${model.itempageend < 0}">
				<li><a href="javascript:pageChanged(0,0});">0</a></li>
			</c:if>

			<li class="angle-right"><c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">

					<a href="javascript:pageChanged(${model.page+1}, ${model.itempageend});"
						class="go_next">다음&nbsp;<i class="fa fa-angle-right"></i></a></li>
			</c:if>
			<c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">

				<a href="#" class="go_next">다음
				&nbsp;<i class="fa fa-angle-right"></i></a>
				</li>
			</c:if>


			<fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemCount)==0? ((model.itemtotalcount/model.itemCount)-1) : (model.itemtotalcount / model.itemCount)}" integerOnly="true" />
			<c:choose>
				<c:when	test="${model.itemCount < model.itemtotalcount/(page+1)}">
					<li><a href="javascript:pageChanged(${model.itempageend}, ${model.itempageend});"
					class="go_last">마지막&nbsp;<i class="fa fa-angle-double-right"></i></a></li>
				</c:when>
				<c:otherwise>
					 <li><a href="#"
					class="go_last">마지막&nbsp;<i class="fa fa-angle-double-right"></i></a></li> 
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
	

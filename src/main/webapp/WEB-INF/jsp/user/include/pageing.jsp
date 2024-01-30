<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page_list">
<ul class="pagination justify-content-center">
    <c:if test="${model.page > 0}"> 
    <c:if test="${model.itempagestart-model.itemCount > 0}">
    <li id="prev_a" class="page-item">
        <a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});" class="page-link">
        	◁
        </a>
    </li>
    </c:if>
    <c:if test="${model.itempagestart-model.itemCount <= 0}">
    <li id="prev_a" class="page-item">
        <a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});" class="page-link">
            ◁
        </a>
    </li>
    </c:if>
    </c:if>

    <c:if test="${model.page <= 0}">
    <li id="prev_a" class="page-item">
        <a href="#" class="page-link">
            ◁
        </a>
    </li>
    </c:if>

    <c:if test="${model.itempageend > 0}">
    <c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
    <c:choose>
    
    <c:when test="${model.page == i }">
    <li class="number active page-item"><a href="#" class="page-link">${i+1}</a></li>
    </c:when>
    
    <c:otherwise>
    <li class="number page-item"><a href="javascript:pageChanged(${i}, ${model.itempageend});" class="page-link">${i+1}</a></li>
    </c:otherwise>
    
    </c:choose>
    </c:forEach>
    </c:if>

    <c:if test="${model.itempageend == 0}">
	    <li class="number page-item active">
		    <a class="page-link">
		       1
		   	</a>
	    </li>
    </c:if>
    <c:if test="${model.itempageend < 0}">
	    <li class="number page-item active">
			<a class="page-link">
		       1
		   	</a>
		</li>
    </c:if>

    <c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
    <li id="next_a" class="page-item">
        <a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});" class="page-link">
            ▷
        </a>
    </li>
    </c:if>
    <c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
    <li id="next_a" class="page-item">
        <a href="#" class="page-link">
            ▷
        </a>
    </li>
    </c:if>

    <fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemCount)==0? ((model.itemtotalcount/model.itemCount)-1) : (model.itemtotalcount / model.itemCount)}" integerOnly="true" />
</ul>
</div>

<script>			
    function pageChanged(page, endpage) {
        if (page < 0) {
            page = 0;
        }
        
        if (endpage < 0) {
            endpage = 0;
        }
        
        if (page >= endpage) {
            page = endpage;
        }

        var URL = "list.do?PAGE="+page;

        if('${model.beforeDomain.ITEM_COUNT}}' == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
        }

        URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
        URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';

        <c:if test="${model.beforeDomain.LEVEL != ''}">
            URL = URL + "&LEVEL=" + '${model.beforeDomain.LEVEL}';
        </c:if>

        <c:if test="${model.beforeDomain.TYPE != ''}">
            URL = URL + "&TYPE=" + '${model.beforeDomain.TYPE}';
        </c:if>

        <c:if test="${model.beforeDomain.START_TM != ''}">
            URL = URL + "&START_TM=" + '${model.beforeDomain.START_TM}';
        </c:if>
        
        <c:if test="${model.beforeDomain.END_TM != ''}">
            URL = URL + "&END_TM=" + '${model.beforeDomain.END_TM}';
        </c:if>

        <c:if test="${model.beforeDomain.ENROLLMENT_STATUS != ''}">
            URL = URL + "&ENROLLMENT_STATUS=" + '${model.beforeDomain.ENROLLMENT_STATUS}';
        </c:if>

        <c:if test="${model.beforeDomain.SUPPORT_GROUP != ''}">
            URL = URL + "&SUPPORT_GROUP=" + '${model.beforeDomain.SUPPORT_GROUP}';
        </c:if>

        <c:if test="${model.beforeDomain.YEAR != ''}">
            URL = URL + "&YEAR=" + '${model.beforeDomain.YEAR}';
        </c:if>

        <c:if test="${model.beforeDomain.LOCATION != ''}">
            URL = URL + "&LOCATION=" + '${model.beforeDomain.LOCATION}';
        </c:if>
        
        location.href = URL;
    }
</script>
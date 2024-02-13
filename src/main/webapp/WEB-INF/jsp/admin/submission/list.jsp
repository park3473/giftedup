<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
</head>

<style>
	#bootstrap-data-table tr th{
	
	text-align: center;
		
	}
</style>

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
                                <span>참여 게시판 관리</span>
                            </div>
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="number">번호</th>
                                        <th class="member_id">회원 아이디</th>
                                        <th class="name">회원 성명</th>
                                        <th class="status">상태</th>
                                        <th class="create_tm">제출일</th>
                                        <th class="view">비고</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.idx}"  >
                                        <td>${model.itemtotalcount - (status.index + model.page *  model.itemcount)}</td>
                                        <td>${item.member_id }</td>
                                        <td>${item.name }</td>
                                        <td>
                                        	<c:choose>
                                        		<c:when test="${item.status == '0' }">제출</c:when>
                                        		<c:when test="${item.status == '1' }">불합격</c:when>
                                        		<c:when test="${item.status == '2' }">합격</c:when>
                                        	</c:choose>
                                        </td>
                                        <td>${fn:substring(item.create_tm , 0 , 11)}</td>
                                        <td>
                                        	<button type="button" onclick="location.href='/admin/submission/update.do?idx=${item.idx}&award_idx=${item.award_idx }'">상세보기</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="page_seach">
                                <div>
                                    <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                        <option value="ALL">전체</option>
                                        <option value="type" <c:if test="${model.before.SEARCH_TYPE == 'member_id'}">selected</c:if>>회원 아이디</option>
                                        <option value="type" <c:if test="${model.before.SEARCH_TYPE == 'name'}">selected</c:if>>회원 성명</option>
                                    </select>
                                    <input style="width: 191px;" type="text" value="${model.before.SEARCH_TEXT }" name="SEARCH_TEXT" id="SEARCH_TEXT" >
                                    <button type="button" value="검색" onClick="searchBtnClick()">검색</button>
                                </div>
                            </div>

                            <!--관리자 버튼 end-->
							<!--페이지 넘버-->
                            <nav class="paging_number">
                                <%@ include file="../include/pageing.jsp" %>
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

</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    $(".adm_menu_con > li").eq(7).find(".sub_menu_con").show();
    $(".adm_menu_con > li").eq(7).css({
        backgroundColor: "#fff"
    });
});

function searchBtnClick(){
	
	 URL = './list.do';
     URL = URL + "?PAGE=0";
     URL = URL + "&ITEM_COUNT=" + '10';

     URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
     URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();

	location.href = URL;
	
}

</script>

</html>


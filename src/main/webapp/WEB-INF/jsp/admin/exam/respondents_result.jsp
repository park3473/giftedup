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
    <link href="https://cdn.jsdelivr.net/npm/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet"> 
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
                                <span>응답 결과 관리</span>
                                
                            </div>
                            <input type="text" id="search-field" placeholder="Search data...">
                            <div class="table_wrap">
                            	<div id="member-table"></div>
                            </div>
                            
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
 <script src="https://cdn.jsdelivr.net/npm/tabulator-tables/dist/js/tabulator.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    $(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
    $(".adm_menu_con > li").eq(6).css({
        backgroundColor: "#fff"
    });
});

var table = new Tabulator("#member-table", {
    height: "auto",
    layout: "fitColumns",
    pagination: "local", // 페이지네이션 사용 설정
    paginationSize: 50, // 페이지 당 행의 수
    columns: [
    	{title: "응답자 번호", field: "IDX", visible: false},
        {title: "응답자 아이디", field: "MEMBER_ID", align: "center" ,  minWidth : 200},
        {title: "응답자 성명", field: "NAME", align: "center" ,  minWidth : 200},
        {title: "응답자 전화번호", field: "PHONE", align: "center" ,  minWidth : 200},
        {title: "응답자 학교명", field: "SCHOOL_NAME", align: "center" ,  minWidth : 200},
        {title: "상세보기", field: "actions", align: "center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<button onclick='viewDetails(\"" + cell.getRow().getData().IDX + "\")'>상세 보기</button>";
        } ,  minWidth : 200},
    ]
});

//=====================================================================================================
function Respondents(IDX , MEMBER_ID , NAME , PHONE , SCHOOL_NAME) {
    this.IDX = IDX;
	this.MEMBER_ID = MEMBER_ID;
    this.NAME = NAME;
    this.PHONE = PHONE;
    this.SCHOOL_NAME = SCHOOL_NAME;
}

var respondent = [];
// 가정: model.list는 위 SQL 쿼리에 의해 반환된 결과물의 리스트입니다.
<c:forEach var="item" items="${model.ResultList}" varStatus="status">
	respondent.push(new Respondents(
		`${item.IDX}`,	
    	`${item.MEMBER_ID}`,
    	`${item.NAME}`,
    	`${item.PHONE}`,
    	`${item.SCHOOL_NAME}`,
    ));
</c:forEach>
//=====================================================================================================
document.addEventListener("DOMContentLoaded", function() {  
	// 초기 데이터 설정
	    table.setData(respondent);
	});
	
//검색 기능
document.getElementById("search-field").addEventListener("keyup", function() {
var searchValue = this.value.toLowerCase(); // 검색어를 소문자로 변환
table.setFilter(customFilter); // 사용자 정의 필터 적용

function customFilter(data) {
    // 검색 대상 필드를 확인하고, 대소문자를 구분하지 않는 검색을 수행합니다.
    // 데이터가 없는 경우를 대비하여 문자열로 변환 전에 검사합니다.
    return (data.MEMBER_ID && data.MEMBER_ID.toString().toLowerCase().includes(searchValue)) ||
           (data.NAME && data.NAME.toString().toLowerCase().includes(searchValue)) ||
           (data.PHONE && data.PHONE.toString().toLowerCase().includes(searchValue)) ||
           (data.SCHOOL_NAME && data.SCHOOL_NAME.toString().toLowerCase().includes(searchValue));
    }
});

// 상세 보기 버튼 클릭 이벤트 처리
window.viewDetails = function(idx) {
    alert("상세 정보 보기: " + idx);
};

</script>

</html>


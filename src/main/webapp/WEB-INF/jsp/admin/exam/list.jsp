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
                                <span>설문조사 관리</span>
                                
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
    paginationSize: 10, // 페이지 당 행의 수
    columns: [
        {title: "번호", field: "IDX", visible: false },
        {title: "No", field: "INDEX", minWidth : 100},
        {title: "설문조사 명", field: "NAME", minWidth : 200},
        {title: "시작일시", field: "START_TM", minWidth : 200},
        {title: "종료일시", field: "END_TM", minWidth : 200},
        {title: "응답 리스트", field: "actions", align: "center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<button onclick='resultListGet(\"" + cell.getRow().getData().IDX + "\")'>응답 리스트</button>";
        } ,  minWidth : 200},
        {title: "결과물 출력", field: "actions", align: "center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<button onclick='total_excelDown(\"" + cell.getRow().getData().IDX + "\",\"" + cell.getRow().getData().NAME + "\")'>결과물 출력</button>";
        } ,  minWidth : 200},
        {title: "응답자 관리", field: "actions", align: "center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<button onclick='respondents(\"" + cell.getRow().getData().IDX + "\")'>응답자 관리</button>";
        } ,  minWidth : 200},
        {title: "설문조사 관리", field: "actions", align: "center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<button onclick='ViewDetails(\"" + cell.getRow().getData().IDX + "\")'>설문조사 관리</button>";
        } ,  minWidth : 200},
        {title: "통계", field: "actions", align: "center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<button onclick='status(\"" + cell.getRow().getData().IDX + "\",0)'>통계</button>";
        } ,  minWidth : 200}
    ]
});

//=====================================================================================================
function Exam(INDEX , IDX , NAME , START_TM , END_TM ) {
	this.INDEX = INDEX;
    this.IDX = IDX;
    this.NAME = NAME;
    this.START_TM = START_TM;
    this.END_TM = END_TM;
}
//=====================================================================================================
var exam = [];
// 가정: model.list는 위 SQL 쿼리에 의해 반환된 결과물의 리스트입니다.
<c:forEach var="item" items="${model.list}" varStatus="status">
    exam.push(new Exam(
    	`${status.index + 1}`,
    	`${item.IDX}`,
    	`${item.NAME}`,
    	<c:if test="${item.START_TM == ''}">
    		``
    	</c:if>
    	<c:if test="${item.START_TM != ''}">
    		`${fn:substring(item.START_TM,0,11)}`
    	</c:if>
    	,
    	<c:if test="${item.END_TM == ''}">
    		``
    	</c:if>
    	<c:if test="${item.END_TM != ''}">
    		`${fn:substring(item.END_TM,0,11)}`
    	</c:if>,
    ));
</c:forEach>
//=====================================================================================================
	
document.addEventListener("DOMContentLoaded", function() {  
	// 초기 데이터 설정
	    table.setData(exam);
	});
	
//검색 기능
document.getElementById("search-field").addEventListener("keyup", function() {
var searchValue = this.value.toLowerCase(); // 검색어를 소문자로 변환
table.setFilter(customFilter); // 사용자 정의 필터 적용

function customFilter(data) {
    // 검색 대상 필드를 확인하고, 대소문자를 구분하지 않는 검색을 수행합니다.
    // 데이터가 없는 경우를 대비하여 문자열로 변환 전에 검사합니다.
    return (data.NAME && data.NAME.toString().toLowerCase().includes(searchValue)) ||
           (data.START_TM && data.START_TM.toString().toLowerCase().includes(searchValue)) ||
           (data.END_TM && data.END_TM.toString().toLowerCase().includes(searchValue));
    }
});

function test(){
	
	$.ajax({
	    url : '/admin/exam/result/excel.do',
	    type: 'POST',
	    data : {idx : '9' , name : '영재키움 트래킹'},
	    dataType : 'json',
	    success : function(data){
	    	console.log('data : ' + data.filePath);
	    	var result = confirm('해당 엑셀 파일을 다운로드 받으시겠습니까?');
	    	if(result){
	    		window.location.href = data.filePath;
	    	}
	    },
	    error: function(xhr, status, error){
	        console.log('Error:', xhr.status); // HTTP 상태 코드
	        console.log('Status:', status); // 에러 상태
	        console.log('Error Thrown:', error); // 에러 메시지
	    }

	})
	
}

function status(idx , category){
	
	location.href='/admin/exam/status.do?idx='+idx+'&category='+category;
	
}


</script>

</html>


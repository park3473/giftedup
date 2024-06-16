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
<style>
        /* 테이블 스타일 */
        .tabulator .tabulator-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }

        .tabulator .tabulator-header .tabulator-col {
            text-align: center;
            font-weight: bold;
        }

        .tabulator .tabulator-row {
            background-color: #ffffff;
            border-bottom: 1px solid #dee2e6;
        }

        .tabulator .tabulator-row:nth-child(even) {
            background-color: #f8f9fa;
        }

        .tabulator .tabulator-cell {
            padding: 10px;
            text-align: center;
        }

        .tabulator .tabulator-row:hover {
            background-color: #e9ecef;
        }

        .tabulator .tabulator-selected {
            background-color: #d1e7dd;
            color: #495057;
        }
        .tabulator-footer-contents button{
        	color : black !important;
        	opacity: 1 !important;
        }
        .tabulator .tabulator-footer .tabulator-paginator{
        	text-align : center !important;
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
                            <div class="member_seach_form">
                                <div class="member_01_wrap" style="margin-bottom:0px">
                                    <form>
                                        <div class="form_01">
                                            <div class="page_seach">
                                            	<label for="ITEM_COUNT" style="margin-right: 10px;">페이지 수</label>
                                            	<input style="width: 44px; margin-right: 10px" type="number" value="20" id="ITEM_COUNT" name="ITEM_COUNT" onchange="changeITEMCOUNT()">
                                            	<label for="start_tm" style="margin-right: 10px;">시작일시</label>
                                            	<input type="date" name="start_tm" id="start_tm" onchange="searchTable()" >
                                            	<label for="end_tm" style="margin-right: 10px;">종료일시</label>
                                            	<input type="date" name="end_tm" id="end_tm" onchange="searchTable()" >
                                                <input style="width: 191px;" type="text" value="" name="search-field" id="search-field" placeholder="검색내용을 입력해주세요.">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="page_seach">
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
	                                    <li class="delete">
	                                        <a href="/admin/exam/insert.do" >설문조사 생성</a>
	                                    </li>
	                                    <!-- 임시 -->
	                                    <li class="delete">
	                                        <a href="#" id="download-xlsx" onclick="respondentsExcelDown()">엑셀 다운로드</a>
	                                    </li>
	                                </ul>
                                </div>
                            </div>
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
  <script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.20/jspdf.plugin.autotable.min.js"></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
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
    paginationSize: 20, // 페이지 당 행의 수
    columns: [
        {title: "번호", field: "IDX", visible: false },
        {title: "No", field: "INDEX", hozAlign:"center" , minWidth : 80},
        {title: "설문조사 명", hozAlign:"center" , field: "NAME", minWidth : 200},
        {title: "시작일시", field: "START_TM", hozAlign:"center" , sorter:"date" , minWidth : 150},
        {title: "종료일시", field: "END_TM", hozAlign:"center" , sorter:"date" , minWidth : 150},
        {title: "응답 리스트", field: "actions", hozAlign:"center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<a onclick='resultListGet(\"" + cell.getRow().getData().IDX + "\")'>응답 리스트</a>";
        } ,  minWidth : 200},
        {title: "결과물 출력", field: "actions", hozAlign:"center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<a onclick='total_excelDown(\"" + cell.getRow().getData().IDX + "\",\"" + cell.getRow().getData().NAME + "\")'>결과물 출력</a>";
        } ,  minWidth : 200},
        {title: "응답자 관리", field: "actions", hozAlign:"center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<a onclick='respondents(\"" + cell.getRow().getData().IDX + "\")'>응답자 관리</a>";
        } ,  minWidth : 200},
        {title: "설문조사 관리", field: "actions", hozAlign:"center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<a onclick='ViewDetails(\"" + cell.getRow().getData().IDX + "\")'>설문조사 관리</a>";
        } ,  minWidth : 200},
        {title: "통계", field: "actions", hozAlign:"center", formatter: function(cell, formatterParams) {
            var value = cell.getValue();
            return "<a onclick='status(\"" + cell.getRow().getData().IDX + "\",0)'>통계</a>";
        } ,  minWidth : 100}
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
    		`${fn:substring(item.START_TM,0,10)}`
    	</c:if>
    	,
    	<c:if test="${item.END_TM == ''}">
    		``
    	</c:if>
    	<c:if test="${item.END_TM != ''}">
    		`${fn:substring(item.END_TM,0,10)}`
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
    return (data.NAME && data.NAME.toString().toLowerCase().includes(searchValue)) ||
           (data.START_TM && data.START_TM.toString().toLowerCase().includes(searchValue)) ||
           (data.END_TM && data.END_TM.toString().toLowerCase().includes(searchValue));
    }
});

function total_excelDown(idx , name){
	
	$.ajax({
	    url : '/admin/exam/result/excel.do',
	    type: 'POST',
	    data : {idx : idx , name : name},
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

function test2(idx , name){
	
	$.ajax({
	    url : '/admin/exam/respondents/excelDown.do',
	    type: 'POST',
	    data : {exam_idx : idx , name : name},
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

function resultListGet(idx){
	location.href='/admin/exam/respondents/result.do?exam_idx='+idx;
}

function respondents(idx){
	
	location.href='/admin/exam/respondents/list.do?exam_idx='+idx;
	
}

function status(idx , category){
	
	location.href='/admin/exam/status.do?idx='+idx+'&category='+category;
	
}
document.getElementById("download-xlsx").addEventListener("click", function(){
    var data = table.getData();
    
    
    var ws = XLSX.utils.json_to_sheet(data);
    ws['!cols'] = [
        {wch:20}, // 첫 번째 열의 너비를 20 문자 폭으로 설정
        {wch:30}, // 두 번째 열의 너비를 30 문자 폭으로 설정
        {wch:30}, // 두 번째 열의 너비를 30 문자 폭으로 설정
        {wch:30}, // 두 번째 열의 너비를 30 문자 폭으로 설정
        {wch:30}, // 두 번째 열의 너비를 30 문자 폭으로 설정
    ];
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
    XLSX.writeFile(wb, "TableData.xlsx");
});

function changeITEMCOUNT(){
	var newSize = parseInt(document.getElementById("ITEM_COUNT").value);
    table.setPageSize(newSize);
}

//검색 함수
function searchTable() {
    var startTm = document.getElementById("start_tm").value;
    var endTm = document.getElementById("end_tm").value;
    table.setFilter(customFilter2, {startTm: startTm, endTm: endTm});
}

//사용자 정의 필터
function customFilter2(data, filterParams) {
    var startTmMatch = !filterParams.startTm || data.START_TM === filterParams.startTm;
    var endTmMatch = !filterParams.endTm || data.END_TM === filterParams.endTm;

    return startTmMatch && endTmMatch;
}

//trigger download of data.xlsx file
/*
document.getElementById("download-xlsx").addEventListener("click", function(){
    table.download("xlsx", "data.xlsx", {sheetName:"My Data",columns:["INDEX","NAME","START_TM","END_TM"]});
});
*/

//trigger download of data.pdf file
/*
document.getElementById("download-pdf").addEventListener("click", function(){
	let originalData = table.getData(); // Tabulator에서 데이터 추출
	let filteredData = originalData.map(row => ({
	    name: row.name, // 필요한 열만 포함
	    age: row.age
	}));
    table.download("pdf", "data.pdf", {
        orientation:"portrait", //set page orientation to portrait
        title:"Example Report", //add title to report
        column:["index","name"],
        jsPDF: {
            unit: "mm", //set units to mm
            format: [420, 297], // A3
        },
        autoTable: function (doc) {
        	doc.addFileToVFS('/resources/ttf/NotoSansKR-VariableFont_wght.ttf');
        	doc.addFont('/resources/ttf/NotoSansKR-VariableFont_wght.ttf', 'NotoSansKR', 'normal');
            doc.setFontSize(10);
            return {
                styles: {
                    font: "NotoSansKR",
                    fontStyle: "normal",
                    fontSize: 10,
                },
                theme: 'striped',
                margin: { top: 35 },
            }
        }
    });
});
*/
</script>

</html>


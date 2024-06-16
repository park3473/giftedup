<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
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
        .tabulator .tabulator-footer .tabulator-page.active{
        	color : #d00 !important;
        }
    </style>
</head>

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
                                <span>회원목록관리</span>
                                
                            </div>
                            <div class="member_seach_form">
                                <div class="member_01_wrap" style="margin-bottom:0px">
                                    <form>
                                        <div class="form_01">
                                            <div class="page_seach">
                                            	<input style="width: 44px; margin-right: 10px" type="number" value="50" id="ITEM_COUNT" name="ITEM_COUNT" onchange="changeITEMCOUNT()">
                                                <select class="input_size" id="ADDRESS_LOCAL" NAME="ADDRESS_LOCAL" onchange="searchTable()">
                                                    <option value="">지역 선택</option>
                                                    <option value="서울">서울</option>
                                                    <option value="경기">경기</option>
                                                    <option value="인천">인천</option>
                                                    <option value="강원">강원</option>
                                                    <option value="대전">대전</option>
                                                    <option value="세종">세종</option>
                                                    <option value="충남">충남</option>
                                                    <option value="충북">충북</option>
                                                    <option value="광주">광주</option>
                                                    <option value="전남">전남</option>
                                                    <option value="전북">전북</option>
                                                    <option value="부산">부산</option>
                                                    <option value="경남">경남</option>
                                                    <option value="대구">대구</option>
                                                    <option value="경북">경북</option>
                                                    <option value="제주">제주</option>
                                                </select>
                                                <select class="input_size" id="LEVEL" NAME="LEVEL" onchange="searchTable()">
                                                    <option value="">레벨 선택</option>
                                                    <option value="교사" >교사</option>
                                                    <option value="학생" >학생</option>
                                                </select>
                                                <input style="width: 191px;" type="text" value="" name="search-field" id="search-field" placeholder="검색내용을 입력해주세요.">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- 문자 발송  -->
                                    <div class="member_03_wrap">
                                        <form>
                                            <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span> / 2000byte)</span>
                                            <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                            <button type="button" onClick="javascript:smssend('member')" value="문자발송">문자발송</button>
                                        </form>
                                    </div>
                                    <!-- 문자 종료  -->
                            </div>
                            <div class="table_wrap">
                            	<div id="member-table"></div>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register">
                                        <a href="${pageContext.request.contextPath}/admin/matching/insert.do">등록하기</a>
                                    </li>
                                    <li class="register">
                                        <a href="${pageContext.request.contextPath}/admin/member/test/excelDown.do">엑셀출력하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!--관리자 버튼 end-->
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


<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/tabulator-tables/dist/js/tabulator.min.js"></script>

</body>

<script>

	var isRestoringValue = false;


	var table = new Tabulator("#member-table", {
	    height: "auto",
	    layout: "fitColumns",
	    pagination: "local", // 페이지네이션 사용 설정
	    paginationSize: 50, // 페이지 당 행의 수
	    columns: [
	    	{title: "호" , field : "IDX" , frozen : true , minWidth : 50},
	        {title: "아이디", field: "MEMBER_ID", frozen:true},
	        {title: "이름", field: "NAME", editor: "input" ,  minWidth : 200},
	        {title: "구분", field: "LEVEL", editor: "list", editorParams: {values: ["교사", "학생"]} ,  minWidth : 100},
	        {title: "성별", field: "SEX", editor: "list", editorParams: {values: ["남자", "여자"]} ,  minWidth : 100},
	        {title: "생년월일", field: "BIRTH", editor: "input" ,  minWidth : 150},
	        {title: "전화번호", field: "PHONE", editor: "input" ,  minWidth : 200},
	        {title: "지역", field: "ADDRESS_LOCAL" ,  minWidth : 100 ,  editor: "list", editorParams: {values: ["강원" , "경기" , "경남" , "경북" , "광주" , "대구" , "대전" , "부산" , "서울" , "세종" , "울산" , "인천" , "전남" , "전북" , "제주" , "충남" , "충북"]}},
	        {title: "학교 이름", field: "SCHOOL_NAME", editor: "input" ,  minWidth : 200},
	        {title: "상세보기", field: "actions", align: "center", formatter: function(cell, formatterParams) {
	            var value = cell.getValue();
	            return "<button onclick='viewDetails(\"" + cell.getRow().getData().StudentID + "\")'>상세 보기</button>";
	        } ,  minWidth : 200},
	    ]
	});

	//=====================================================================================================
	function Member(IDX , MEMBER_ID , NAME , LEVEL , SEX , BIRTH , PHONE , ADDRESS_LOCAL , SCHOOL_NAME) {
	    this.IDX = IDX;
	    this.MEMBER_ID = MEMBER_ID;
	    this.NAME = NAME;
	    this.LEVEL = LEVEL;
	    this.SEX = SEX;
	    this.BIRTH = BIRTH;
	    this.PHONE = PHONE;
	    this.ADDRESS_LOCAL = ADDRESS_LOCAL;
	    this.SCHOOL_NAME = SCHOOL_NAME;
	}

	//=====================================================================================================
	var member = [];
	// 가정: model.list는 위 SQL 쿼리에 의해 반환된 결과물의 리스트입니다.
	<c:forEach var="item" items="${model.list}" varStatus="status">
	    member.push(new Member(
	    	`${status.index + 1}`,
	    	`${item.MEMBER_ID}`,
	    	`${item.NAME}`,
	    	<c:choose>
		    		<c:when test="${item.LEVEL == '8'}">`교사`</c:when>
		    		<c:when test="${item.LEVEL == '11'}">`학생`</c:when>
		    		<c:when test="${item.LEVEL == '1'}">`최고관리자`</c:when>
		    		<c:when test="${item.LEVEL == '2'}">`지역관리자`</c:when>
		    </c:choose>,
	    	`${item.SEX}`,
	    	`${item.BIRTH}`,
	    	`${item.PHONE}`,
	    	`${item.ADDRESS_LOCAL}`,
	    	`${item.SCHOOL_NAME}`
	    ));
	</c:forEach>
	//=====================================================================================================
    
	document.addEventListener("DOMContentLoaded", function() {
		
		table.on("cellEdited", function(cell) {
			
			if (isRestoringValue) return;
			
		    var data = cell.getRow().getData(); // 편집된 행의 데이터를 가져옵니다.
		    var fieldName = cell.getField(); // 편집된 셀의 필드명
		    var value = cell.getValue(); // 편집된 셀의 값
		    var idx; // 수정된 IDX를 저장할 변수
		    var oldValue = cell.getOldValue();

		    idx = data.MEMBER_ID;

		    // 필드명을 서버에 전송할 형식으로 변경
		    var serverFieldName = fieldName;

		    console.log("수정된 idx: " + idx + ", 필드: " + serverFieldName + ", 값: " + value + ", 원래값=" + oldValue);

		    var result = confirm('수정할 아이디 : ' + idx + '\n' + '수정될 필드명 : ' + fieldName + '\n' + '수정될 값 : ' + value + '\n을 수정하시겠습니까?');
	    	
		    if (!result) {
                // 아니오를 클릭했을 때, 원래 값으로 되돌림
                isRestoringValue = true; // 복원 중임을 표시
                cell.setValue(oldValue, true); // 원래 값으로 되돌림
                isRestoringValue = false; // 복원 완료 표시
                return;
            }
		    
		    // AJAX 호출 예제
		    updateAjax(idx, serverFieldName, value , oldValue);
		});  
		// 초기 데이터 설정
	    table.setData(member);
	});

	// 검색 기능
    document.getElementById("search-field").addEventListener("keyup", function() {
    	var searchValue = this.value.toLowerCase(); // 검색어를 소문자로 변환
        var level = document.getElementById("LEVEL").value;
        var addressLocal = document.getElementById("ADDRESS_LOCAL").value;
    	
        table.setFilter(customFilter, {searchValue: searchValue, level: level, addressLocal: addressLocal}); // 사용자 정의 필터 적용
    
	});
	// 상세 보기 버튼 클릭 이벤트 처리
    window.viewDetails = function(member_id) {
        alert("상세 정보 보기: " + member_id);
    };
    
    function updateAjax(idx, fieldName, value , original) {
    	
        // AJAX 요청 구현
        console.log("AJAX 요청: IDX=" + idx + ", 필드=" + fieldName + ", 값=" + value);
        
        alert('수정되었습니다.');
        // 실제 AJAX 요청 코드 추가
        //필드는 search_type 으로 수정값은 search_text 로 넣어서 보내기
       /* $.ajax({
    	  url : '/admin/member/test/update.do',
    	  type : 'POST',
    	  data : ({
    		  MEMBER_ID : idx,
    		  SEARCH_TYPE : fieldName,
    		  SEARCH_TEXT : value
    	  }),
    	  success : function(xhr , status , success){
    		  console.log('success');
    	  },
    	  error : function(xhr , status , error){
    		  console.log('error');
    	  }
    	   
       }); */
        
        
    }
    
    function changeITEMCOUNT(){
    	var newSize = parseInt(document.getElementById("ITEM_COUNT").value);
        table.setPageSize(newSize);
    }
    
	 // 검색 및 필터링 함수
    function searchTable() {
        var searchValue = document.getElementById("search-field").value.toLowerCase();
        var level = document.getElementById("LEVEL").value;
        var addressLocal = document.getElementById("ADDRESS_LOCAL").value;

        table.setFilter(customFilter, {searchValue: searchValue, level: level, addressLocal: addressLocal});
    }

    // 사용자 정의 필터
    function customFilter(data, filterParams) {
        var searchValueMatch = !filterParams.searchValue || (
            (data.MEMBER_ID && data.MEMBER_ID.toString().toLowerCase().includes(filterParams.searchValue)) ||
            (data.ADDRESS_LOCAL && data.ADDRESS_LOCAL.toString().toLowerCase().includes(filterParams.searchValue)) ||
            (data.NAME && data.NAME.toString().toLowerCase().includes(filterParams.searchValue)) ||
            (data.BIRTH && data.BIRTH.toString().toLowerCase().includes(filterParams.searchValue)) ||
            (data.SEX && data.SEX.toString().toLowerCase().includes(filterParams.searchValue)) ||
            (data.SCHOOL_NAME && data.SCHOOL_NAME.toString().toLowerCase().includes(filterParams.searchValue))
        );
        var levelMatch = !filterParams.level || data.LEVEL === filterParams.level;
        var addressLocalMatch = !filterParams.addressLocal || data.ADDRESS_LOCAL === filterParams.addressLocal;

        return searchValueMatch && levelMatch && addressLocalMatch;
    }
    
</script>

</html>

<%@ include file="../include/footerJs.jsp" %>
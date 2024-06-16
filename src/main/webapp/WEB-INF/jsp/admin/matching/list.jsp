<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
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
                                <span>${model.beforeDomain.YEAR }년도 매칭 관리</span>
                            </div>
                            
                            <div class="member_seach_form">
                                <div class="member_01_wrap" style="margin-bottom:0px">
                                    <form>
                                        <div class="form_01">
                                            <div class="page_seach">
                                            	<input style="width: 44px; margin-right: 10px" type="number" value="50" id="ITEM_COUNT" name="ITEM_COUNT" onchange="changeITEMCOUNT()">
                                                <select class="input_size" id="SCHOOL_YEAR" NAME="SCHOOL_YEAR" onchange="searchTable()">
                                                    <option value="">학년 선택</option>
                                                    <option value="초등학교4학년" >초등학교4학년</option>
                                                    <option value="초등학교5학년" >초등학교5학년</option>
                                                    <option value="초등학교6학년" >초등학교6학년</option>
                                                    <option value="중학교1학년" >중학교1학년</option>
                                                    <option value="중학교2학년" >중학교2학년</option>
                                                    <option value="중학교3학년" >중학교3학년</option>
                                                    <option value="고등학교1학년">고등학교1학년</option>
                                                    <option value="고등학교2학년">고등학교2학년</option>
                                                    <option value="고등학교3학년">고등학교3학년</option>
                                                </select>
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
                                                <select class="input_size" id="CATE" NAME="CATE" onchange="searchTable()">
                                                    <option value="">기준 선택</option>
                                                    <option value="기존" >기존</option>
                                                    <option value="신규" >신규</option>
                                                </select>
                                                <input style="width: 191px;" type="text" value="" name="search-field" id="search-field" placeholder="검색내용을 입력해주세요.">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="table_wrap">
                            	<div id="member-table"></div>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register">
                                    	<a href="#" onclick="MatchingInsertModal();">등록하기</a>
                                        <!-- <a href="${pageContext.request.contextPath}/admin/matching/insert.do">등록하기</a> -->
                                    </li>
                                    <li class="register">
                                        <a href="${pageContext.request.contextPath}/admin/matching/excelDown.do?YEAR=${model.beforeDomain.YEAR }">엑셀출력하기</a>
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

	<div class="member_modal_wrap" id="memberReMoal">
		<div class="member_modal_con member_input_wrap" style="width : 1050px">
			<div class="modal_title">
			<h2>매칭 등록</h2>
			</div>
			<div id="matchingInsertTable" class="table_wrap" style="max-height:300px;overflow:scroll">
				<table>
					<thead>
					<tr>
						<td>학생 명</td>
						<td>교사 명</td>
						<td>학교 명</td>
					</tr>
					</thead>
					<tbody id="matchingInsertTableTbody">
						<tr>
							<td id="studentName"></td>
							<td id="MentoName"></td>
							<td id="SchoolName"></td>
							<input type="hidden" value="" id="studentId">
							<input type="hidden" value="" id="MentoId">
							<input type="hidden" value="" id="SchoolYear">
						</tr>
					</tbody>
				</table>
			</div>
			<div class="member_btn adm_btn_wrap mr-0">
				<ul id="step_button">
					<li class="register modal_close"><a href="javascript:MemberModelFadeOut()">취소</a></li>
					<li class="register modal_upload" id="matching_upload_step_1">
						<a href="javascript:MatchingSearch('11')">학생 찾기</a>
					</li>
					<li class="register modal_upload" id="matching_upload_step_1">
						<a href="javascript:MatchingSearch('8')">교사 찾기</a>
					</li>
					<li class="register modal_upload" id="matching_upload_step_1">
						<a href="javascript:MatchingInsert()">매칭등록</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

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
	var table = new Tabulator("#member-table", {
	    height: "auto",
	    layout: "fitColumns",
	    pagination: "local", // 페이지네이션 사용 설정
	    paginationSize: `50`, // 페이지 당 행의 수
	    columns: [
	        {title: "학생 기본 아이디", field: "StudentIDX", visible: false , frozen:true},
	        {title: "학생 구분" , field : "StudentCATE" , frozen : true , minWidth : 100},
	        {title: "학생 지역", field: "Student_ADDRESS_LOCAL" ,  minWidth : 100 , frozen:true ,  editor: "list", editorParams: {values: ["강원" , "경기" , "경남" , "경북" , "광주" , "대구" , "대전" , "부산" , "서울" , "세종" , "울산" , "인천" , "전남" , "전북" , "제주" , "충남" , "충북"]}},
	        {title: "학생 아이디", field: "StudentID",  minWidth : 150 , frozen:true},
	        {title: "학생 이름", field: "StudentName", editor: "input" ,  minWidth : 200 , frozen:true},
	        {title: "학생 생년월일", field: "StudentBIRTH", editor: "input" ,  minWidth : 150},
	        {title: "성별", field: "StudentSEX", editor: "select", editorParams: {values: ["남자", "여자"]} ,  minWidth : 100},
	        {title: "학교 이름", field: "StudentSCHOOL_NAME", editor: "input" ,  minWidth : 200},
	        {title: "학년", field: "StudentSCHOOL_YEAR", editor: "list" , editorParams : {values : ["초등학교4학년","초등학교5학년","초등학교6학년","중학교1학년","중학교2학년","중학교3학년","고등학교1학년","고등학교2학년","고등학교3학년"]} ,  minWidth : 200 },
	        {title: "지원 영역", field: "StudentSUPPORT_AREA", editor: "input" ,  minWidth : 100},
	        {title: "학생 전화번호", field: "StudentPHONE", editor: "input" ,  minWidth : 200},
	        {title: "부모님 전화번호", field: "StudentPARENTS_PHONE", editor: "input" ,  minWidth : 200},
	        {title: "지원 자격", field: "StudentELIGIBILITY", editor: "input" ,  minWidth : 200},
	        {title: "주소", field: "StudentADDRESS", editor: "input" ,  minWidth : 200},
	        {title: "상세 주소", field: "StudentADDRESS_DETAIL", editor: "input" ,  minWidth : 200},
	        // Assuming fields to differentiate between student and teacher, as some names are duplicated.
	        {title: "교사 아이디", field: "TeacherID", minWidth : 200},
	        {title: "교사 이름", field: "TeacherName", editor: "input" ,  minWidth : 200},
	        {title: "교사 지역", field: "Teacher_ADDRESS_LOCAL", editor: "input" ,  minWidth : 200},
	        {title: "교사 학교 이름", field: "Teacher_SCHOOL_NAME", editor: "input" ,  minWidth : 200},
	        {title: "교사 성별", field: "Teacher_SEX", editor: "list", editorParams: {values: ["남자", "여자"]} ,  minWidth : 200},
	        {title: "교사 전화번호", field: "Teacher_PHONE", editor: "input" ,  minWidth : 200},
	        {title: "교사 이메일", field: "Teacher_EMAIL", editor: "input" ,  minWidth : 200},
	        {title: "상세보기", field: "actions", align: "center", formatter: function(cell, formatterParams) {
	            var value = cell.getValue();
	            return "<button onclick='viewDetails(\"" + cell.getRow().getData().StudentID + "\")'>상세 보기</button>";
	        } ,  minWidth : 200},
	    ]
	});

	//=====================================================================================================
	function Member(StudentNUM , StudentCATE , StudentIDX, Student_ADDRESS_LOCAL, StudentID , StudentName, StudentBIRTH, StudentSEX, StudentSCHOOL_NAME, StudentSCHOOL_YEAR, StudentSUPPORT_AREA, StudentPHONE, StudentPARENTS_PHONE, StudentELIGIBILITY, StudentADDRESS, StudentADDRESS_DETAIL, TeacherID, TeacherName, Teacher_ADDRESS_LOCAL, Teacher_SCHOOL_NAME, Teacher_SEX, Teacher_PHONE, Teacher_EMAIL) {
	    this.StudentNUM = StudentNUM;
		this.StudentCATE = StudentCATE;
		this.StudentIDX = StudentIDX;
	    this.Student_ADDRESS_LOCAL = Student_ADDRESS_LOCAL;
	    this.StudentID = StudentID;
	    this.StudentName = StudentName;
	    this.StudentBIRTH = StudentBIRTH;
	    this.StudentSEX = StudentSEX;
	    this.StudentSCHOOL_NAME = StudentSCHOOL_NAME;
	    this.StudentSCHOOL_YEAR = StudentSCHOOL_YEAR;
	    this.StudentSUPPORT_AREA = StudentSUPPORT_AREA;
	    this.StudentPHONE = StudentPHONE;
	    this.StudentPARENTS_PHONE = StudentPARENTS_PHONE;
	    this.StudentELIGIBILITY = StudentELIGIBILITY;
	    this.StudentADDRESS = StudentADDRESS;
	    this.StudentADDRESS_DETAIL = StudentADDRESS_DETAIL;
	    this.TeacherID = TeacherID;
	    this.TeacherName = TeacherName;
	    this.Teacher_ADDRESS_LOCAL = Teacher_ADDRESS_LOCAL;
	    this.Teacher_SCHOOL_NAME = Teacher_SCHOOL_NAME;
	    this.Teacher_SEX = Teacher_SEX;
	    this.Teacher_PHONE = Teacher_PHONE;
	    this.Teacher_EMAIL = Teacher_EMAIL;
	}

	//=====================================================================================================
	var member = [];
	// 가정: model.list는 위 SQL 쿼리에 의해 반환된 결과물의 리스트입니다.
	<c:if test="${model.list.size() > 1}">
		var memberSize = `${model.list.size()}`;
		<c:forEach var="item" items="${model.list}" varStatus="status">
		    member.push(new Member(
		    	`${status.index + 1}`,
		    	<c:choose>
		    		<c:when test="${fn:indexOf(item.StudentID, '${model.beforeDomain.YEAR }') > -1}">`기존`</c:when>
		    		<c:when test="${fn:indexOf(item.StudentID, '${model.beforeDomain.YEAR }') == -1}">`신규`</c:when>
		    	</c:choose>
		    	,
		        `${item.StudentID}`,
		        `${item.Student_ADDRESS_LOCAL}`,
		        `${item.StudentID}`,
		        `${item.StudentName}`,
		        `${item.StudentBIRTH}`,
		        `${item.StudentSEX}`,
		        `${item.StudentSCHOOL_NAME}`,
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '4'}">`초등학교4학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '5'}">`초등학교5학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '6'}">`초등학교6학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '7'}">`중학교1학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '8'}">`중학교2학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '9'}">`중학교3학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '10'}">`고등학교1학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '11'}">`고등학교2학년`</c:when>
		        </c:choose>
		        <c:choose>
		        	<c:when test="${item.StudentSCHOOL_YEAR == '12'}">`고등학교3학년`</c:when>
		        </c:choose>
		        ,
		        `${item.StudentSUPPORT_AREA}`,
		        `${item.StudentPHONE}`,
		        `${item.StudentPARENTS_PHONE}`,
		        `${item.StudentELIGIBILITY}`,
		        `${item.StudentADDRESS}`,
		        `${item.StudentADDRESS_DETAIL}`,
		        `${item.TeacherID}`,
		        `${item.TeacherName}`,
		        `${item.TeacherADDRESS_LOCAL}`,
		        `${item.TeacherSCHOOL_NAME}`,
		        `${item.TeacherSEX}`,
		        `${item.TeacherPHONE}`,
		        `${item.TeacherEMAIL}`
		    ));
		</c:forEach>
	</c:if>
	//=====================================================================================================
    
	document.addEventListener("DOMContentLoaded", function() {
		
		table.on("cellEdited", function(cell) {
		    var data = cell.getRow().getData(); // 편집된 행의 데이터를 가져옵니다.
		    var fieldName = cell.getField(); // 편집된 셀의 필드명
		    var value = cell.getValue(); // 편집된 셀의 값
		    var idx; // 수정된 IDX를 저장할 변수

		    // 수정된 필드명에 따라 IDX 설정
		    if (fieldName.startsWith("Student")) {
		        idx = data.StudentID;
		    } else if (fieldName.startsWith("Teacher")) {
		        idx = data.TeacherID;
		    }

		    // 필드명을 서버에 전송할 형식으로 변경
		    var serverFieldName = fieldName.replace("Student", "").replace("Teacher", "").toLowerCase();
		    switch (serverFieldName) {
		        case "_address_local":
		            serverFieldName = "address_local";
		            break;
		        case "name":
		            serverFieldName = "name";
		            break;
		        case "birth":
		            serverFieldName = "birth";
		            break;
		        case "sex":
		        case "_sex":
		            serverFieldName = "sex";
		            break;
		        case "school_name":
		        case "_school_name":
		            serverFieldName = "school_name";
		            break;
		        case "school_year":
		            serverFieldName = "school_year";
		            break;
		        case "support_area":
		            serverFieldName = "support_area";
		            break;
		        case "phone":
		        case "_phone":
		            serverFieldName = "phone";
		            break;
		        case "parents_phone":
		            serverFieldName = "parents_phone";
		            break;
		        case "eligibility":
		            serverFieldName = "eligibility";
		            break;
		        case "address":
		            serverFieldName = "address";
		            break;
		        case "address_detail":
		            serverFieldName = "address_detail";
		            break;
		        case "email":
		            serverFieldName = "address_detail";
		            break;
		    }

		    console.log("수정된 idx: " + idx + ", 필드: " + serverFieldName + ", 값: " + value);

		    // AJAX 호출 예제
		    updateAjax(idx, serverFieldName, value);
		});  
	// 초기 데이터 설정
	    table.setData(member);
	});

	// 검색 기능
    document.getElementById("search-field").addEventListener("keyup", function() {
    var searchValue = this.value.toLowerCase(); // 검색어를 소문자로 변환
    table.setFilter(customFilter); // 사용자 정의 필터 적용

    	function customFilter(data) {
        // 검색 대상 필드를 확인하고, 대소문자를 구분하지 않는 검색을 수행합니다.
        // 데이터가 없는 경우를 대비하여 문자열로 변환 전에 검사합니다.
        return (data.StudentID && data.StudentID.toString().toLowerCase().includes(searchValue)) ||
               (data.Student_ADDRESS_LOCAL && data.Student_ADDRESS_LOCAL.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentName && data.StudentName.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentBIRTH && data.StudentBIRTH.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentSEX && data.StudentSEX.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentSCHOOL_NAME && data.StudentSCHOOL_NAME.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentSCHOOL_YEAR && data.StudentSCHOOL_YEAR.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentSUPPORT_AREA && data.StudentSUPPORT_AREA.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentPHONE && data.StudentPHONE.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentPARENTS_PHONE && data.StudentPARENTS_PHONE.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentELIGIBILITY && data.StudentELIGIBILITY.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentADDRESS && data.StudentADDRESS.toString().toLowerCase().includes(searchValue)) ||
               (data.StudentADDRESS_DETAIL && data.StudentADDRESS_DETAIL.toString().toLowerCase().includes(searchValue)) ||
               (data.TeacherID && data.TeacherID.toString().toLowerCase().includes(searchValue)) ||
               (data.TeacherName && data.TeacherName.toString().toLowerCase().includes(searchValue)) ||
               (data.Teacher_ADDRESS_LOCAL && data.Teacher_ADDRESS_LOCAL.toString().toLowerCase().includes(searchValue)) ||
               (data.Teacher_SCHOOL_NAME && data.Teacher_SCHOOL_NAME.toString().toLowerCase().includes(searchValue)) ||
               (data.Teacher_SEX && data.Teacher_SEX.toString().toLowerCase().includes(searchValue)) ||
               (data.Teacher_PHONE && data.Teacher_PHONE.toString().toLowerCase().includes(searchValue)) ||
               (data.Teacher_EMAIL && data.Teacher_EMAIL.toString().toLowerCase().includes(searchValue));
	    }
	});
	// 상세 보기 버튼 클릭 이벤트 처리
    window.viewDetails = function(member_id) {
        alert("상세 정보 보기: " + member_id);
    };
    
    function updateAjax(idx, fieldName, value) {
    	
    	var result = confirm('수정할 아이디 : ' + idx + '\n' + '수정될 필드명 : ' + fieldName + '\n' + '수정될 값 : ' + value + '\n을 수정하시겠습니까?');
    	
    	if(!result){
    		return;
    	}
    	
        // AJAX 요청 구현
        console.log("AJAX 요청: IDX=" + idx + ", 필드=" + fieldName + ", 값=" + value);
        // 실제 AJAX 요청 코드 추가
        //필드는 search_type 으로 수정값은 search_text 로 넣어서 보내기
       $.ajax({
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
    	   
       });   
    }
    
    function changeITEMCOUNT(){
    	var newSize = parseInt(document.getElementById("ITEM_COUNT").value);
        table.setPageSize(newSize);
    }
    
 	// 검색 함수
    function searchTable() {
        var schoolYear = document.getElementById("SCHOOL_YEAR").value;
        var addressLocal = document.getElementById("ADDRESS_LOCAL").value;
        var cate = document.getElementById("CATE").value;

        table.setFilter(customFilter2, {schoolYear: schoolYear, addressLocal: addressLocal, cate: cate});
    }

    // 사용자 정의 필터
    function customFilter2(data, filterParams) {
        var schoolYearMatch = !filterParams.schoolYear || data.StudentSCHOOL_YEAR === filterParams.schoolYear;
        var addressLocalMatch = !filterParams.addressLocal || data.Student_ADDRESS_LOCAL === filterParams.addressLocal;
        var cateMatch = !filterParams.cate || data.StudentCATE === filterParams.cate;

        return schoolYearMatch && addressLocalMatch && cateMatch;
    }
    
    function MatchingInsertModal(){
    	
    	$('#memberReMoal').fadeIn(300);
    	
    }
    
    function MemberModelFadeOut(){
    	
    	document.getElementById('studentName').textContent = '';
        document.getElementById('SchoolName').textContent = '';
        document.getElementById('studentId').textContent = '';
        document.getElementById('SchoolYear').textContent = '';
        document.getElementById('MentoName').textContent = '';
        document.getElementById('MentoId').textContent = '';
    	$('#memberReMoal').fadeOut(300);
    	
    }
    
    function MatchingSearch(SearchLevel){
    	
    	var EXP_DATA = '${model.beforeDomain.YEAR }';
    	
    	EXP_DATA = EXP_DATA.substring(EXP_DATA,2);
    	
    	$.ajax({
    		url : '/admin/matching/memberSearch.do',
    		type : 'POST',
    		data : ({
    			LEVEL : SearchLevel,
    			EXP_DATA : EXP_DATA
    		}),
    		success : function(data , status , success){
    			console.log(data);
    			showSearchResults(data, SearchLevel);
    		},
    		error : function(xhr , error){
    			console.log('error');
    		}
    		
    	})
    	
    }
    
    function showSearchResults(data, SearchLevel) {
        var columns = [
            {title: "멤버 아이디", field: "MEMBER_ID"},
            {title: "이름", field: "NAME"},
            {title: "학교명", field: "SCHOOL_NAME"},
            {
                title: "선택",
                field: "actions",
                formatter: function(cell) {
                    var rowData = cell.getRow().getData();
                    var rowDataString = JSON.stringify(rowData).replace(/"/g, '&quot;');
                    return '<button onclick="selectMember(' + rowDataString + ', \'' + SearchLevel + '\')">선택</button>';
                }
            }
        ];

        Swal.fire({
            title: '검색 결과',
            html: `
                <input type="text" id="search-field2" class="swal2-input" placeholder="검색">
                <div id="matching-table" style="margin-top: 20px;"></div>
            `,
            width: 800,
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            didOpen: () => {
                var table = new Tabulator("#matching-table", {
                    data: data,
                    layout: "fitColumns",
                    pagination: "local", // 페이지네이션 사용 설정
            	    paginationSize: `10`, // 페이지 당 행의 수
                    columns: columns
                });

                document.getElementById("search-field2").addEventListener("keyup", function() {
                    var searchValue = this.value.toLowerCase();
                    table.setFilter(customFilter);

                    function customFilter(data) {
                        return (data.MEMBER_ID && data.MEMBER_ID.toString().toLowerCase().includes(searchValue)) ||
                               (data.NAME && data.NAME.toString().toLowerCase().includes(searchValue)) ||
                               (data.SCHOOL_NAME && data.SCHOOL_NAME.toString().toLowerCase().includes(searchValue)) ||
                               (data.SCHOOL_YEAR && data.SCHOOL_YEAR.toString().toLowerCase().includes(searchValue));
                    }
                });
            }
        });
    }

    function selectMember(data, SearchLevel) {
        if (SearchLevel === '11') {
            document.getElementById('studentName').textContent = data.NAME;
            document.getElementById('SchoolName').textContent = data.SCHOOL_NAME;
            document.getElementById('studentId').textContent = data.MEMBER_ID;
            document.getElementById('SchoolYear').textContent = data.SCHOOL_YEAR;
        } else if (SearchLevel === '8') {
            document.getElementById('MentoName').textContent = data.NAME;
            document.getElementById('MentoId').textContent = data.MEMBER_ID;
        }
        Swal.close();
    }
    
    function MatchingInsert(){
    	
    	if(document.getElementById('studentName').textContent == '' ||
        document.getElementById('SchoolName').textContent == '' || 
        document.getElementById('studentId').textContent == '' ||
        document.getElementById('SchoolYear').textContent == '' ||
        document.getElementById('MentoName').textContent == '' ||
        document.getElementById('MentoId').textContent == ''){
    		alert('해당 학생 , 교사 데이터를 입력후 등록해주세요.');
    		return;
    	}
    	
    	var result = confirm('해당 매칭등록을 진행하시겠습니까?');
    	
    	if(!result){
    		return;
    	}
    	
    	var MAT_YEAR = '${model.beforeDomain.YEAR }';
    	
    	$.ajax({
    		url : '/admin/matching/InsertAjax.do',
    		type : 'POST',
    		data : ({
                SCHOOL_NAME : document.getElementById('SchoolName').textContent,
                MEMBER_ID : document.getElementById('studentId').textContent,
                SUPPORT_GROUP : document.getElementById('SchoolYear').textContent,
                PROFESSOR_MEMBER_ID : document.getElementById('MentoId').textContent,
                YEAR : MAT_YEAR
    		}),
    		success : function(result , status , success){
    			console.log('matching success');
    			console.log(result);
    			alert('해당 매칭이 등록되었습니다.');
    			 // Ensure result is an array
    	        if (!Array.isArray(result)) {
    	            result = [result];
    	        }

    	        result.forEach(function(item) {
    	            // Ensure all necessary fields are present
    	            var newItem = {
    	                StudentADDRESS: item.StudentADDRESS || '',
    	                StudentADDRESS_DETAIL: item.StudentADDRESS_DETAIL || '',
    	                StudentBIRTH: item.StudentBIRTH || '',
    	                StudentCATE: item.StudentCATE || '',
    	                StudentELIGIBILITY: item.StudentELIGIBILITY || '',
    	                StudentID: item.StudentID || '',
    	                StudentIDX: item.StudentIDX || '',
    	                StudentNUM: item.StudentNUM || '',
    	                StudentName: item.StudentName || '',
    	                StudentPARENTS_PHONE: item.StudentPARENTS_PHONE || '',
    	                StudentPHONE: item.StudentPHONE || '',
    	                StudentSCHOOL_NAME: item.StudentSCHOOL_NAME || '',
    	                StudentSCHOOL_YEAR: item.StudentSCHOOL_YEAR || '',
    	                StudentSEX: item.StudentSEX || '',
    	                StudentSUPPORT_AREA: item.StudentSUPPORT_AREA || '',
    	                Student_ADDRESS_LOCAL: item.Student_ADDRESS_LOCAL || '',
    	                Teacher_ADDRESS_LOCAL: item.TeacherADDRESS_LOCAL || '',
    	                Teacher_EMAIL: item.TeacherEMAIL || '',
    	                TeacherID: item.TeacherID || '',
    	                TeacherName: item.TeacherName || '',
    	                Teacher_PHONE: item.TeacherPHONE || '',
    	                Teacher_SCHOOL_NAME: item.TeacherSCHOOL_NAME || '',
    	                Teacher_SEX: item.TeacherSEX || '',
    	                actions: item.actions || ''
    	            };
    	            
    	         	// Set StudentCATE based on StudentID and currentYear
    	           	if (item.StudentID.startsWith('${model.beforeDomain.YEAR }')) {
		                newItem.StudentCATE = '신규';
		            } else {
		                newItem.StudentCATE = '기존';
		            }
    	            // Set StudentSCHOOL_YEAR label
    	            switch (item.StudentSCHOOL_YEAR) {
    	                case '4':
    	                    newItem.StudentSCHOOL_YEAR = '초등학교4학년';
    	                    break;
    	                case '5':
    	                    newItem.StudentSCHOOL_YEAR = '초등학교5학년';
    	                    break;
    	                case '6':
    	                    newItem.StudentSCHOOL_YEAR = '초등학교6학년';
    	                    break;
    	                case '7':
    	                    newItem.StudentSCHOOL_YEAR = '중학교1학년';
    	                    break;
    	                case '8':
    	                    newItem.StudentSCHOOL_YEAR = '중학교2학년';
    	                    break;
    	                case '9':
    	                    newItem.StudentSCHOOL_YEAR = '중학교3학년';
    	                    break;
    	                case '10':
    	                    newItem.StudentSCHOOL_YEAR = '고등학교1학년';
    	                    break;
    	                case '11':
    	                    newItem.StudentSCHOOL_YEAR = '고등학교2학년';
    	                    break;
    	                case '12':
    	                    newItem.StudentSCHOOL_YEAR = '고등학교3학년';
    	                    break;
    	                default:
    	                    newItem.StudentSCHOOL_YEAR = item.StudentSCHOOL_YEAR;
    	                    break;
    	            }
    	         	
    	         	
    	            table.addRow(newItem);
    	        });
    	        
    	        MemberModelFadeOut();
    	        
    		},
    		error : function(xhr , error){
    			console.log('matching error');
    		}
    	})
    	
    }
    
</script>

</html>

<%@ include file="../include/footerJs.jsp" %>
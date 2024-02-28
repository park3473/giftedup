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
                                <span>테스트 회원목록관리</span>
                                
                            </div>
                            <input type="text" id="search-field" placeholder="Search data...">
                            <div class="table_wrap">
                            	<div id="member-table"></div>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register">
                                        <a href="${pageContext.request.contextPath}/admin/member/insert.do">등록하기</a>
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
	var table = new Tabulator("#member-table", {
	    height: "auto",
	    layout: "fitColumns",
	    pagination: "local", // 페이지네이션 사용 설정
	    paginationSize: 10, // 페이지 당 행의 수
	    columns: [
	        {title: "학생 기본 아이디", field: "StudentIDX", visible: false , frozen:true},
	        {title: "호" , field : "StudentNUM" , frozen : true , minWidth : 50},
	        {title: "학생 구분" , field : "StudentCATE" , frozen : true , minWidth : 100},
	        {title: "학생 지역", field: "Student_ADDRESS_LOCAL" ,  minWidth : 100 , frozen:true ,  editor: "select", editorParams: {values: ["강원" , "경기" , "경남" , "경북" , "광주" , "대구" , "대전" , "부산" , "서울" , "세종" , "울산" , "인천" , "전남" , "전북" , "제주" , "충남" , "충북"]}},
	        {title: "학생 아이디", field: "StudentID",  minWidth : 150 , frozen:true},
	        {title: "학생 이름", field: "StudentName", editor: "input" ,  minWidth : 200 , frozen:true},
	        {title: "학생 생년월일", field: "StudentBIRTH", editor: "input" ,  minWidth : 150},
	        {title: "성별", field: "StudentSEX", editor: "select", editorParams: {values: ["남자", "여자"]} ,  minWidth : 100},
	        {title: "학교 이름", field: "StudentSCHOOL_NAME", editor: "input" ,  minWidth : 200},
	        {title: "학년", field: "StudentSCHOOL_YEAR", editor: "select" , editorParams : {values : ["초등학교4학년","초등학교5학년","초등학교6학년","중학교1학년","중학교2학년","중학교3학년","고등학교1학년","고등학교2학년","고등학교3학년"]} ,  minWidth : 200 },
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
	        {title: "교사 성별", field: "Teacher_SEX", editor: "select", editorParams: {values: ["남자", "여자"]} ,  minWidth : 200},
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
	<c:forEach var="item" items="${model.list}" varStatus="status">
	    member.push(new Member(
	    	`${status.index + 1}`,
	    	<c:choose>
	    		<c:when test="${fn:indexOf(item.StudentID, '2023') > -1}">`신규`</c:when>
	    		<c:when test="${fn:indexOf(item.StudentID, '2023') == -1}">`기존`</c:when>
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
</script>

</html>

<%@ include file="../include/footerJs.jsp" %>
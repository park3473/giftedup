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
		
	table.on("cellEdited", function (cell) {
	var data = cell.getRow().getData(); // 편집된 행의 데이터를 가져옵니다.
	           console.log(data);
			   alert('수정된 idx : '+ data.StudentIDX + '\n'+'수정 데이터 : ' + cell.getValue())
	        });    
	// 초기 데이터 설정
	    table.setData(member);
	});

	// 검색 기능
    document.getElementById("search-field").addEventListener("keyup", function() {
        var searchValue = this.value;
        table.setFilter(customFilter); // 사용자 정의 필터 적용

        function customFilter(data){
            return data.name.includes(searchValue) || data.member_id.includes(searchValue) || data.sex.includes(searchValue) || data.phone.includes(searchValue) || data.type.includes(searchValue);
        }
    });
	// 상세 보기 버튼 클릭 이벤트 처리
    window.viewDetails = function(member_id) {
        alert("상세 정보 보기: " + member_id);
    };
</script>

</html>

<%@ include file="../include/footerJs.jsp" %>
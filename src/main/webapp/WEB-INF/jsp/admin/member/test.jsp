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
                                <span>회원목록관리</span>
                                
                            </div>
                            <input type="text" id="search-field" placeholder="Search data...">
                            <div class="table_wrap">
                            	<div id="member-table"></div>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                	<li class="register" id="member_excel">
                                        <a href="#">현재 테이블 엑셀 다운로드</a>
                                    </li>
                                    <li class="register" id="member_excel">
                                        <a href="#">회원 엑셀 업로드</a>
                                    </li>
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

</html>

<%@ include file="../include/footerJs.jsp" %>

<script>
    var table = new Tabulator("#member-table", {
        height: "auto",
        layout: "fitColumns",
        pagination: "local", // 페이지네이션 사용 설정
        paginationSize: 10, // 페이지 당 행의 수
        columns: [
            {title: "이름", field: "name", editor: "input"},
            {title: "아이디", field: "member_id", editor: "input"},
            {title: "성별", field: "sex", editor: "select", editorParams: {values: ["남자", "여자"]}},
            {title: "연락처", field: "phone", editor: "input"},
            {title: "회원구분", field: "type", editor: "select", editorParams: {values: ["교사", "학생"]}},
			{title: "상세보기", field: "actions", align: "center", formatter: function(cell, formatterParams) {
                var value = cell.getValue();
                return "<button onclick='viewDetails(\"" + cell.getRow().getData().member_id + "\")'>상세 보기</button>";
            }},
        ]
    });


	//=====================================================================================================
	function Member(member_id , name , sex , phone , type){
	
		this.member_id = member_id;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.type = type;
		
	}

	//=====================================================================================================
	var member = [];
	<c:forEach var="item" items="${model.list}" varStatus="status">
	member.push(new Member(
			'${item.MEMBER_ID}',
			'${item.NAME}',
			'${item.SEX}',
			'${item.PHONE}',
			<c:if test="${item.TYPE == '1'}">
			'학생',
			</c:if>
			<c:if test="${item.TYPE == '2'}">
			'교사',
			</c:if>
			));
	</c:forEach>
	//=====================================================================================================
    
	document.addEventListener("DOMContentLoaded", function() {
		
	table.on("cellEdited", function (cell) {
	var data = cell.getRow().getData(); // 편집된 행의 데이터를 가져옵니다.
	           console.log(data);
			   alert('수정된 아이디 : '+ data.member_id + '\n'+'수정 데이터 : ' + cell.getValue())
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
<script>
    
    $('a[href="#"]').click(function(e) {
        e.preventDefault();
    });

    $('#fileDownBtn1').click(function(e) {

        var url = '${pageContext.request.contextPath}/resources/files/member_explanation.pptx'; 
        location.href = url;
    });
    
    $('#fileDownBtn2').click(function(e) {
        var url = '${pageContext.request.contextPath}/resources/files/member_explanation.xls'; 
        location.href = url;
    });
    
    var uploadCheckBtn = false;
    function memberXlexUpload() {
        if(uploadCheckBtn == false) {
            uploadCheckBtn = true;
            $('#memberExcelform').submit();	
        }else {
            alert('처리중입니다.');	
        }
    }
    
    function membercomparingUpload() {
        $('#membercomparingExcelform').submit();	
    }


    function update() {
        cnt =  0;
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                cnt = cnt + 1;
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == '') {
            alert('수정할 대상을를 선택 하여 주세요');
            return;
        }

        deleteArrIdx = deleteArrIdx.substring(0, deleteArrIdx.length-1);
        location.href = './'+deleteArrIdx+'/update.do';
    }

    function deleteArrClick() {
        cnt =  0;
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                cnt = cnt + 1;
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == '') {
            alert('삭제할 대상을를 선택 하여 주세요');
            return;
        }

        var URL = './deleteArr.do?MEMBER_ID='+ deleteArrIdx;
        console.log(URL);
        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : "",
            success: function(result) {
                var s = result.indexOf("true");
                console.log(s);
                if(s != -1) {
                    alert('삭제되었습니다.');
                    
                    var moveUrl = "?SEARCH_TEXT="+encodeURI('${model.boforeDomain.SEARCH_TEXT}');
                    moveUrl = moveUrl + "&SEARCH_TYPE="+encodeURI('${model.boforeDomain.SEARCH_TYPE}');

                    if("${model.boforeDomain.page}" != "") {
                        moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
                    }

                    idchk = true;
                    location.href = './list.do'+moveUrl;
                    return;
                }else {
                    alert('실패하였습니다.');
                    return;
                }
            }
        });
    }

    $(document).on("click", "#chk_calc_all", function(e) {

        if ($(this).prop('checked')) {
            $('input[name="chk_calc"]').prop('checked', true);
        } else {
            $('input[name="chk_calc"]').prop('checked', false);
        }
    });

    function searchBtnClick() {
        URL = './list.do';
        URL = URL + "?PAGE=0";
        
        if($('#ITEM_COUNT').val() == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
        }
		URL = URL + "&LEVEL=" + $('#LEVEL').val();
        URL = URL + "&TYPE=" + $('#TYPE').val();
        URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();

        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

    function levelChangedArr() {
        if($('#LEVEL2').val() == "") {
            alert('회원등급을 선택 해주세요.');
            return;	
        }

        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == "") {
            alert('회원을 선택 해주세요.');
            return;	
        }

        var URL = './TypeToTextUpdateArr.do?';

        //var formData = $("#updateform").serialize();
        var formData = "SEARCH_TYPE=LEVEL";
        formData += "&SEARCH_TEXT="+$('#LEVEL2').val();
        formData += "&MEMBER_ID="+deleteArrIdx;
        

        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    //$('.modal').click();
                    window.location.reload();
                }else {
                    alert('실패 하였습니다.');
                    //$('.modal').click();
                }
            }
        });
    }

    function dormancyUpdate() {
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {
            var chk = $(this).is(":checked");
            console.log(chk);
            if(chk == true) {
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }
        }); 

        if(deleteArrIdx == "") {
            alert('회원을 선택 해주세요.');
            return;	
        }

        var URL = './TypeToTextUpdateArr.do?';

        //var formData = $("#updateform").serialize();
        var formData = "SEARCH_TYPE=DORMANCY";
        formData += "&SEARCH_TEXT=1";
        formData += "&MEMBER_ID="+deleteArrIdx;

        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    window.location.reload();	
                }else {
                    alert('실패 하였습니다.');
                }
            }
        });
    }

    function excelDown() {
        deleteArrIdx = "";
        var member_id = "";
        var cnt = 0;
        $("input[name=chk_calc]").each(function() {
            var chk = $(this).is(":checked");
            console.log(chk);
            if(chk == true) {
                deleteArrIdx = deleteArrIdx + "'"+$(this).data("id") + "',";
                member_id = $(this).data("id");
                cnt = cnt + 1;
            }
        }); 

       
        var st = $(":input:radio[name=excelDownType]:checked").val();
        //console.log(st);

        if("INFO_AGREEMENT" == st) {
            if(cnt != 1) {
                alert('한개만 선택 하여 주세요');
                return;
            }else {
                $('#iframe2').show();
                $('#iframeDiv').attr('src', '${pageContext.request.contextPath}/admin/member/'+member_id+'/infoPdf.do');

                setTimeout(function() {
                    $('#iframe2').hide();
                }, 500);

                //window.open('./'+member_id+'/infoPdf.do','팝업창','width=750, height=800, left=300, top=150');
            }
        }else {
            location.href = './'+st+'/excelDown.do?MEMBER_ID='+deleteArrIdx;	
        }
    }
    
    function Info_AgreementUpdate() {
        deleteArrIdx = "";
        var member_id = "";
        var cnt = 0;
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
                member_id = $(this).data("id");
                cnt = cnt + 1;
            }

        }); 


        if(cnt == 0) {
            swal({
                title: "알림",
                text: "정말로 전체 회원을 초기화 하시겠습니까?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-success",
                cancelButtonText: " 아니오",
                confirmButtonText: "네",
                closeOnConfirm: true,
            },function(isConfirm){
                if (isConfirm) {
                    var url = '${pageContext.request.contextPath}/admin/member/info_AgreementUpdate.do';
                    $.ajax({
                        type : "GET",
                        url : url,
                        cache : false,
                        success: function(result) {
                            if(result.indexOf("true") > -1) {
                                alert('성공하였습니다.');
                                window.location.reload();	
                            }else {
                                alert('실패 하였습니다.');
                            }
                        }
                    });
                    return true;
                } else {
                }
            });
        }else {
            swal({
                title: "알림",
                text: cnt + "명의 회원을 초기화 하시겠습니까?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-success",
                cancelButtonText: " 아니오",
                confirmButtonText: "네",
                closeOnConfirm: true,
            },function(isConfirm){
                if (isConfirm) {
                    var URL = './TypeToTextUpdateArr.do?';
                    //var formData = $("#updateform").serialize();
                    var formData = "SEARCH_TYPE=INFO_AGREEMENT";
                    formData += "&SEARCH_TEXT=0";
                    formData += "&MEMBER_ID="+deleteArrIdx;

                    $.ajax({
                        type : "POST",
                        url : URL,
                        cache : false,
                        data : formData,
                        success: function(result) {
                            if(result.indexOf("true") > -1) {
                                alert('성공하였습니다.');
                                window.location.reload();

                            }else {
                                alert('실패 하였습니다.');
                            }
                        }
                    });

                    return true;
                } else {

                }
            });
            
        }   
    }

    function schoolNumberUpdate() {
        var url = '${pageContext.request.contextPath}/admin/member/schoolNumberUpdate.do';
        $.ajax({
            type : "GET",
            url : url,
            cache : false,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    window.location.reload();	
                }else {
                    alert('실패 하였습니다.');
                }
            }
        });
    }

    function memberModal(){
        $("#member_excel > a").click(function(){
            $(".member_modal_wrap").fadeIn(300);
        });

        $(".modal_close > a").click(function(){
            $(".member_modal_wrap").fadeOut(300);
        });
    }
    memberModal();

</script>

<div id="iframe2" style="display:none">
    <iframe id="iframeDiv" src="#" width="750" height="800" left="300" top="150"></iframe>
</div>
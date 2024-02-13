<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ckeditor필요한 부분 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.css">
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style>
	/*admin css 와 ckeditor css 충돌나서 바꿔버림*/
	.member_input_wrap .member_input button {
    margin-left: 0px !important;
	}
	.member_input_wrap .member_input textarea {
    	width: 100%;
    	height: 100%;
    	padding: 0px;
    }
</style>
<!-- ckeditor필요한 부분 -->

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
                	<div>
                    <form action="./update.do" method="post" name="insertForm" id="insertForm">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden" name="idx" value="${model.view.idx }" />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>${model.view.name}-참여자 상세보기</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                    	<c:forEach var="item" items="${model.detailList}" varStatus="status">
                                        <li>
                                            <span class="list_t">${item.require_name}</span>
                                            <input class="input_title" type="text" id="respond" name="respond" value="${item.respond }">
                                        </li>
                                        </c:forEach>
                                        <c:forEach var="item" items="${model.fileList}" varStatus="status">
                                        <li>
                                            <span class="list_t">제출 파일</span>
                                            <input class="input_size file_update_list" type="text" name="fileName" id="fileName_${model.award.file_cnt - model.fileListSize + status.index + 1}" readonly="readonly" data-file-path="${item.file}" value="">
                                            <a href="/fileDown.do?path=/resources/upload/submission/${item.file}">파일다운로드</a>
                                        </li>
                                        </c:forEach>
                                        <li>
                                        	<span class="list_t">추가입력</span>
                                        	<textarea name="description" id="editor">${model.view.content }</textarea>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!--저장하기 버튼-->
                        <div class="register_btn_area">
                            <div class="register_btn_con">
                                <c:if test="${model.view.status ne '2'}">
								    <a class="storage" href="javascript:statusClick('2')">합격</a>
								</c:if>
								<c:if test="${model.view.status ne '1'}">
								    <a class="storage" href="javascript:statusClick('1')">불합격</a>
								</c:if>
								<c:if test="${model.view.status ne '0'}">
								    <a class="storage" href="javascript:statusClick('0')">대기</a>
								</c:if>
                                <a class="cancel" href="javascript:history.back()">취소하기</a>
                            </div>
                        </div>
                        <!--저장하기 버튼 end-->
                        </form>
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
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<script type="module" >
import editor from '/resources/ckeditor2/editor.js'

window.ckeditorInstance;

    $(document).ready(function () {
		let editorInstance1;
        editor("#editor").then(editor => {
			window.ckeditorInstance = editor;
        	// some code..
            // then 이후에 받은 editor를 다른 변수로 받아주시는 편이 좋습니다!
        })
    })
</script>
<script type="text/javascript">

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(7).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(7).css({
	    backgroundColor: "#fff"
	});
	
	$.datetimepicker.setLocale('ko');
	$('.datecalendar2').datetimepicker({
	    format:'Y.m.d',
	    lang: "ko",
	    timepicker:true
	});
	
});

document.addEventListener('DOMContentLoaded', function () {
    // 모든 입력 필드를 찾아 처리
    document.querySelectorAll('.file_update_list').forEach(function(input) {
        // data-file-path 속성에서 URL 인코딩된 파일 경로를 가져옵니다.
        var encodedFilePath = input.getAttribute('data-file-path');
        // 파일 경로의 인코딩된 부분을 디코딩합니다.
        var decodedFileName = decodeURIComponent(encodedFilePath.substring(13));
        // 디코딩된 파일명을 입력 필드의 값으로 설정합니다.
        input.value = decodedFileName;
    });
});

function statusClick(status){
	
	switch (status) {
	case '0':
		var result = confirm('정말 해당 참여자를 대기 시키겠습니까?');
		break;
	case '1':
		var result = confirm('정말 해당 참여자를 불합격 시키겠습니까?');
		break;
	case '2':
		var result = confirm('정말 해당 참여자를 합격 시키겠습니까?');
		break;
	}
	
	if(!result){
		return;
	}
	
	var idx = '${model.view.idx }';
	
	$.ajax({
		url : '/admin/submission/status.do',
		type : 'POST',
		data : ({
			idx : idx,
			status : status
		}),
		success : function(xhr , status , success){
		
			alert('처리 완료되었습니다.');
			location.reload();
			
		},
		error : function(xhr , status , error){
			console.log('error');
		}
	})
	
	
	
}


</script>


</body>
</html>
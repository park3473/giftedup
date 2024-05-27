<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <form action="./insert.do" method="post" name="insertForm" id="insertForm">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>참여 게시판 등록</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                        <li>
                                            <span class="list_t">참여 게시판 명</span>
                                            <input class="input_title" type="text" id="title" name="title">
                                        </li>
                                        <li>
                                            <span class="list_t">시작 일시</span>
                                            <input class="input_size datecalendar2" type="text" id="start" name="start" autocomplete="off" readonly="readonly">
                                        </li>
                                        <li>
                                            <span class="list_t">종료 일시</span>
                                            <input class="input_size datecalendar2" type="text" id="end" name="end" autocomplete="off" readonly="readonly">
                                        </li>
                                        <!-- 필수사항 들어가는 부분  -->
                                        <li id="requirementList">
										    <span class="list_t">필수 정보</span>
										    <button type="button" id="addRequirement">필수 정보 추가</button>
										</li>
                                        <li>
                                        	<span class="list_t">등록 파일 갯수</span>
                                        	<select name="file_cnt">
                                        		<option value="">선택해주세요</option>
                                        		<c:forEach var="item" begin="1" end="10">
													<option value="${item}">${item}</option>
												</c:forEach>
                                        	</select>
                                        </li>
                                        <li>
                                        	<span class="list_t">설명</span>
                                        	<textarea name="description" id="editor"></textarea>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!--저장하기 버튼-->
                        <div class="register_btn_area">
                            <div class="register_btn_con">
                                <a class="storage" href="javascript:insertClick()"> 저장</a>
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

function insertClick()
{

	if($('#title').val() == '')
	{
		alert('제목을 입력 하여 주세요');
		return;
	}
	if($('[name=file_cnt]').val() == '')
	{
		alert('파일 갯수를 선택 하여 주세요');
		return;
	}

	$('[name=description]').val(ckeditorInstance.getData());
	var formData = $("#insertForm").serialize();
	
	$.ajax({
		url : '/admin/award/insert.do',
		type : 'POST',
		data : formData,
		dataType : 'json',
		success: function(data , status , success) {
            
            console.log('success : ' + data);
            
            var cnt = $(".require").length;
            
            if(cnt > 0){
                //필수값 전송
                $(".require").each(function(index) {
                    var requireName = $(this).find('input[name="require_name"]').val();
                    var requireContent = $(this).find('input[name="require_content"]').val();

                    $.ajax({
                    	url : '/admin/award/require/insert.do',
                		type : 'POST',
                		data : ({
                			award_idx : data,
                			require_name : requireName,
                			require_content : requireContent
                		}),
                		success: function(status , success) {
                			
                			console.log('success_require : ' + index);
                			
                		},
                		error : function (xhr , status , error){
                			
                			console.log('error_require : ' + index);
                			
                		}
                    })
                    
                });	
                
                alert('참여 게시판 등록이 완료되었습니다.');
                location.href='/admin/award/list.do';
                
            }
            
            
        },
        error: function(xhr, status, error) {
            
            console.log('error');
        }
	})
	
	
}

$(document).ready(function () {
    var requirementIndex = 0; // 필수 정보 인덱스 초기화

    // 필수 정보 추가
    $('#addRequirement').click(function () {
        var requirementHtml = '<li id="requirement_' + requirementIndex + '" class="require">' +
                                  '<span class="list_t">필수 정보'+'</span>' +
                                  '<label>필수값 이름</label><input type="text" name="require_name">' +
                                  '<label>필수값 설명</label><input type="text" name="require_content">' +
                                  '<button type="button" onclick="removeRequirement(\'requirement_' + requirementIndex + '\')">삭제</button>' +
                              '</li>';
        $('#requirementList').before(requirementHtml);
        requirementIndex++;
    });
});

// 필수 정보 삭제 함수
function removeRequirement(requirementId) {
    $('#' + requirementId).remove();
}

</script>


</body>
</html>
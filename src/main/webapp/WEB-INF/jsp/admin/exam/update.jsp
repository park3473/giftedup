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
                    <form action="./update.do" method="post" name="updateForm" id="updateForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden" name="idx" value="${model.view.idx }"  />
                        <input type="hidden" name="onoff" value="${model.view.onoff }" />
                        <input type="hidden" name="start_tm" value="" />
                        <input type="hidden" name="end_tm" value="" />
                        <input type="hidden" name="category" value="0"  />
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>진단 수정</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                        <li>
                                            <span class="list_t">설문 폼 명</span>
                                            <input class="input_title" type="text" id="name" name="name" value="${model.view.name }">
                                        </li>
                                        <li>
                                        	<span class="list_t">설명</span>
                                        	<input class="input_size mr" type="text" name="coment" id="coment" value="${model.view.coment }"/>
                                        </li>
                                        <li>
                                        	<span class="list_t">개요</span>
                                        	<textarea name="content" id="editor">${model.view.content }</textarea>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                         <!--저장하기 버튼-->
                        <div class="register_btn_area" data-type="${model.view.onoff }">
                            <div class="register_btn_con">
                            	<c:if test="${model.view.onoff == '0' }">
                                <a class="storage" onclick="updateClick()">설문 폼 수정</a>
                                <a class="cancel" onclick="deleteClick()">삭제하기</a>
                                <a class="storage" onclick="startClick()">설문 시작</a>
                                </c:if>
                                <c:if test="${model.view.onoff == '1' }">
                                <a class="storage" onclick="endClick()">설문 종료</a>
                                </c:if>
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

```

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

</body>

</html>
<script type="module" >
	import editor from '/resources/ckeditor2/editor.js'
    $(document).ready(function () {
        editor("#editor").then(editor => {
        	// some code..
            // then 이후에 받은 editor를 다른 변수로 받아주시는 편이 좋습니다!
        })
    })
</script>
<script type="text/javascript">

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(6).css({
	    backgroundColor: "#fff"
	});
});


function updateClick(){
	
	console.log('수정하기');
	
	$('form[name=updateForm]').submit();
	
}

function deleteClick(){
	
	console.log('삭제하기');
	var result = confirm('해당 자가진단을 정말 삭제하시겠습니까?\n 삭제된 데이터는 복구가 불가능합니다.');
	if(result){
		
		console.log('삭제');
		$('form[name=updateForm]').attr('action', './delete.do');
		$('form[name=updateForm]').submit();
		
	}else{
		
		console.log('삭제 안함');
		
	}
	
}

function startClick(){
	
	console.log('시작하기');
	var result = confirm('해당 설문을 시작하시겠습니까?\n시작한 설문은 종료하기 전까지 수정이 불가능합니다.');
	if(result){
		
		console.log('시작하기전 날짜 설정');
		Swal.fire({
	        title: '설문 시작하기',
	        html: `<p>설문 시작일</p><input type="date" id="start-date" class="swal2-input" placeholder="시작일자">
	        		<p>설문 종료일</p><input type="date" id="end-date" class="swal2-input" placeholder="종료일자">`,
	        confirmButtonText: '시작하기',
	        focusConfirm: false,
	        preConfirm: () => {
	            const startDate = document.getElementById('start-date').value;
	            const endDate = document.getElementById('end-date').value;
	            return { startDate: startDate, endDate: endDate };
	        }
	    }).then((result) => {
	        if (result.isConfirmed) {
	            console.log('진단 시작:', result.value.startDate, '부터', result.value.endDate, '까지');
	            $('[name=start_tm]').val(result.value.startDate);
		        $('[name=end_tm]').val(result.value.endDate);
		        $('[name=onoff]').val('1');
		        
		        ExamStart();
	            
	        }
	        
	    });
		
	}else{
		console.log('시작프로세스 cancel');
	}
	
}

function endClick(){

	console.log('종료하기');
	var result = confirm('해당 자가진단을 종료하시겠습니까?');
	if(result){
		
		$('[name=start_tm]').val('');
		$('[name=end_tm]').val('');
		$('[name=onoff]').val('0');
		updateClick();
		
	}else{
		console.log('시작프로세스 cancel');
	}
	
}

function ExamStart(){
	
	var exam_idx = '${model.view.idx}';
	
	$.ajax({
		url : '/admin/exam/respondents/listCnt.do',
		type : 'POST',
		cache : false,
		data : ({
			exam_idx : exam_idx
		}),
		dataType : "json",
		success: function(result , status , success){
			console.log('result : ' + result);
			
			if(result > 0){
				
				alert('응답자 수 : ' + result);
				
				var idx = $('[name=idx]').val();
				var start_tm = $('[name=start_tm]').val();
		        var end_tm = $('[name=end_tm]').val();
		        var onoff = $('[name=onoff]').val();
				
		        console.log('update start');
		        
				$.ajax({
					url : '/admin/exam/updateApi.do',
					type : 'POST',
					data : ({
						idx : idx,
						start_tm : start_tm,
						end_tm : end_tm,
						onoff : onoff
					}),
					success: function(status , success){
						console.log('success');
						
						alert('응답자 문자전송 및 시작 완료.');
						
						location.href='./list.do';
						
					},
					error : function(status , error){
						console.log('error');	
					}
				})
				
				
			}else{
				
				alert('응답자 를 등록해주세요.');
				alert('응답자 수 : ' + result);
			}
			
			
		},
		error : function(status , error){
			console.log('error');
		}
	});

	
}


</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
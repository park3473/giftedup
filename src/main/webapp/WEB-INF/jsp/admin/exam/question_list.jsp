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
</head>
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
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
                                <span>설문 리스트</span>
                            </div>
                            
                            <!--관리자 버튼-->
                            <div class="page_seach">
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                    <li class="delete">
                                        <a href="#" onclick="SeqUpdate()">설문 순서 저장</a>
                                    </li>
                                    <li class="delete">
                                        <a href="#" onclick="sort('${model.exam_idx}')">문제 재정렬</a>
                                    </li>
                                    <li class="delete">
                                        <a href="#" id="question_btn">문제 등록</a>
                                    </li>
                                </ul>
                                </div>
                            </div>
                            <!--관리자 버튼 end-->
                            
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="number">문항 번호</th>
                                        <th class="name">제목</th>
                                        <th class="type">문제 유형</th>
                                        <th class="create_tm">생성일시</th>
                                        <th class="update_tm">수정일시</th>
                                        <th class="setting">비고</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.idx}" class="question_list" data-seq="${item.seq }" data-idx="${item.idx }">
                                        <td>${item.seq }</td>
                                        <td>${item.NAME }</td>
                                        <td>${item.TYPE }</td>
                                        <td>
                                            ${fn:substring(item.create_tm,0,11)}
                                        </td>
                                        <td>
                                            ${fn:substring(item.update_tm,0,11)}
                                        </td>
                                        <td>
                                        	<button type="button"  onclick="question_list_delete('${item.idx}')" data-idx="${item.idx }">연결 해제</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
            
           	<!-- 매칭 모달 -->
			<div class="matching_modal_wrap">
				<div class="matching_modal_con">
					<div class="matching_table_con">
						<table id="matching_table" class="display" style="width: 100%">
							<thead>
								<tr>
									<th style="width: 98px">선택</th>
									<th style="width: 200px">제목</th>
									<th style="width: 98px">타입</th>
									<th style="width: 98px">답변형태</th>
								</tr>
							<thead>
							<tbody>
								<c:forEach var="item" items="${model.question_list}" varStatus="status">
									<tr>
										<td>
											<input id="question_${status.index}"  name="question"  type="radio" value="${item.idx}" question_name="${item.name }"  class="radio_input">
										</td>
										<td>${item.name}</td>
										<td>${item.type}</td>
										<td>
											<c:choose>
												<c:when test="${item.select_type == '1'}">객관식</c:when>
												<c:when test="${item.select_type == '2'}">체크박스</c:when>
												<c:when test="${item.select_type == '3'}">답변형</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="member_btn adm_btn_wrap mr-0">
						<ul>
							<li class="register modal_close">
								<a href="#">취소</a>
							</li>
							<li class="register modal_upload">
								<a href="javascript:questionCheck()">선택하기</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 매칭 모달 end-->
            
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
 	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script>
$(document).ready(function() {
    // bootstrap-data-table 내의 행을 정렬 가능하게 만듭니다.
    $("#bootstrap-data-table tbody").sortable({
    	items: "tr:not(:first-child)", // 첫 번째 행을 제외
        placeholder: "ui-state-highlight", // 드래그 중인 항목의 스타일 지정
        update: function(event, ui) {
            // 순서가 변경될 때마다 실행될 함수
            updateSeq(); // 문항 번호 업데이트 함수 호출
        }
    }).disableSelection();

    // 문항 번호(seq) 업데이트 함수
    function updateSeq() {
        $("#bootstrap-data-table tbody tr").each(function(index) {
            $(this).find("td:first").text(index); // 첫 번째 열(문항 번호) 업데이트
            $(this).attr('data-seq',index);
        });
    }
});

function SeqUpdate(){
	
	var result = confirm('해당 설문 정렬을 저장하시겠습니까?');
	if(!result){
		return;
	}
	if($("#bootstrap-data-table tbody tr").length < 2){
		alert('정렬할 설문이 없습니다.');
		return;
	}
	$("#bootstrap-data-table tbody tr:gt(0)").each(function(index) {
	    console.log($(this).attr('data-seq'));
	    console.log($(this).attr('data-idx'));
	    
	    var seq = $(this).attr('data-seq');
	    var idx = $(this).attr('data-idx');
	    
	    $.ajax({
	    	url : '/admin/exam/question_list/update.do',
	    	type : 'POST',
	    	data : ({
	    		seq : seq,
	    		idx : idx
	    	}),
	    	success : function(xhr , status , success){
	    		console.log(index + '번째 success');
	    	},
	    	error : function(xhr , status , error){
	    		console.log(index + '번째 error');
	    	}
	    	
	    });

	    
	});
	
	alert('순서가 저장되었습니다.');
    location.reload();
	
}

</script>
<script>
$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(6).css({
	    backgroundColor: "#fff"
	});
});

function question_modal(){
	$('#matching_table').DataTable({
		lengthChange: false,
		language: {
		    paginate: {
		      next: '<a href="#" class="next_btn"><i class="fas fa-chevron-right"></i></a>',
		      previous: '<a href="#" class="pre_btn"><i class="fas fa-chevron-left"></i></a>'  
		    }
		  }
	});
	
	$("#question_btn").click(function(){
		$(".matching_modal_wrap").fadeIn(300);
	});
	
	$(".modal_close").click(function(){
		$(".matching_modal_wrap").fadeOut(300);
	});
}
question_modal();

function questionCheck(){
	
	var result = confirm('해당 문제를 연결하시겠습니까?')
	
	if(!result){
		return;
	}
	
	var exam_idx = '${model.exam_idx}';
	 var seq = '';
	   if($('.question_list').length <= 0){
		   seq = 1;
	   }else{
		   seq = parseInt($('.question_list:last td')[0].innerHTML) + 1;
	   }
	   var question_idx = $("input[name=question]:checked").val();
	
	$.ajax({
		url : '/admin/exam/question_list/insert.do',
		type : 'POST',
		data : ({
			question_idx : question_idx,
			exam_idx : exam_idx,
			seq : seq
		}),
		success : function(){
			
			console.log('success');
			alert('연결되었습니다.');
			location.reload();
			
		},
		error : function(){
		
			console.log('error');
			
		}
	})
	
}

function sort(exam_idx){

    var result = confirm('해당 문제 리스트를 재정렬 하시겠습니까?');
    if(!result){
        return
    }
    
    if($('.question_list').length <= 0){
		   alert('재정렬 할 리스트가 없습니다.');
	  }
   
    $.ajax({
        url : '/admin/question_list/sort.do',
        type : 'POST',
        data : ({
            exam_idx : exam_idx
        }),
        success : function(xhr , status , success){
            console.log('success');
            alert('완료되었습니다.');
            location.reload();
        },
        error : function(xhr , status , error){
            console.log('error');
        }
    })

}

function question_list_delete(idx){

    var result = confirm('정말 해당 문제 연결을 해제 하시겠습니까?');
    
    if(!result){
        return;
    }
    console.log(idx);
    $.ajax({
        url : '/admin/exam/question_list/delete.do',
        type : 'POST',
        data : ({
            idx : idx
        }),
        success : function(status , success , xhr){
            console.log('success');
            location.reload();
        },
        error : function(status , error , xhr){
            console.log('error');
        }
    })

}

</script>

</html>


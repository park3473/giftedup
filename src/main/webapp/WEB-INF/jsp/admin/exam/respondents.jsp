 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %>
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
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
                    <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>응답자 관리</span>
                            </div>
							<div class="page_seach">
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                    <li class="delete">
                                        <a href="#" onclick="respondentsSave()">응답자 저장</a>
                                    </li>
                                </ul>
                                </div>
                            </div>
                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
 								<input type="hidden"  name="csrf" value="${CSRF_TOKEN}"/>
                                    <div class="title">
                                        <h2>응답자 관리</h2>
                                    </div>
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
											<li class="group_list_area" id="group_list_area">
												<div class="teacher_list" style="width:700px !important;">
													<h2>등록 가능 응답자 목록</h2>
													<div id="search_box" style="padding: 10px; display: flex; align-items: center;">
												    <div class="year_select" style="margin-right: 20px;">
													   	<label for="year">연도 선택:</label>
													 	<select name="member_year" id="year" style="border: 1px solid #ccc; border-radius: 5px;">
													 		<option value="">선택해주세요</option>
													 		<option value="2019">2019</option>
															<option value="2020">2020</option>
															<option value="2021">2021</option>
															<option value="2022">2022</option>
															<option value="2023">2023</option>
															<option value="2024">2024</option>
														</select>
													</div>
													<div class="type_select">
													        <label for="type">타입 선택:</label>
													        <select name="member_type" id="type" style="border: 1px solid #ccc; border-radius: 5px;">
													            <option value="">선택해주세요</option>
													            <option value="1">학생</option>
													            <option value="2">교사</option>
													        </select>
													</div>
													<div style="flex-grow : 1;text-align:right">
													   	<button type="button" onclick="member_list()">리스트업</button>
													</div>
													</div>
													<div id="member_table_box">
														<table id="member_table">
															<thead>
																<tr>
																	<th style="width: 98px">아이디</th>
																	<th style="width: 98px">이름</th>
																	<th style="width: 98px">번호</th>
																	<th style="width: 98px">타입</th>
																	<th style="width: 98px">학교</th>
																	<th style="width: 98px">등록</th>
																</tr>
															<thead>
															<tbody>
																<c:forEach var="item" items="${model.member}" varStatus="status">
																	<tr>
																		<td>${item.member_id }</td>
																		<td>${item.name}</td>
																		<td>${item.phone}</td>
																		<td>
																			<c:choose>
																				<c:when test="${item.type == '1'}">학생</c:when>
																				<c:when test="${item.type == '2'}">교사</c:when>
																			</c:choose>
																		</td>
																		<td>${item.school_name}</td>
																		<td>
																			<button type="button" onclick="insertAjax(this)" data-member_id="${item.member_id }" data-name="${item.name }" data-phone="${item.phone }" data-type="${item.type }" data-school_name="${item.school_name }">등록</button>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
												<div class="group_list" style="width:700px !important;">
													<h2>등록한 응답자 목록</h2>
													<div>
														<table id="respondents_table">
															<thead>
																<tr>
																	<th style="width: 98px">아이디</th>
																	<th style="width: 98px">이름</th>
																	<th style="width: 98px">번호</th>
																	<th style="width: 98px">타입</th>
																	<th style="width: 98px">학교</th>
																	<th style="width: 98px">삭제</th>
																</tr>
															<thead>
															<tbody>
																<c:forEach var="item" items="${model.respondents}" varStatus="status">
																	<tr>
																		<td>${item.member_id }</td>
																		<td>${item.name}</td>
																		<td>${item.phone}</td>
																		<td>
																			<c:choose>
																				<c:when test="${item.type == '1'}">학생</c:when>
																				<c:when test="${item.type == '2'}">교사</c:when>
																			</c:choose>
																		</td>
																		<td>${item.school_name}</td>
																		<td>
																			<button type="button" onclick="deleteAjax(this)" data-idx="${item.idx }" data-member_id="${item.member_id }" data-name="${item.name }" data-phone="${item.phone }" data-type="${item.type }" data-school_name="${item.school_name }" >삭제</button>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</li>
										</ul>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                    
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

	<div style="display:none" id="insert_list_box">
		<ul id="insert_list">
		</ul>
	</div>
	
	<div style="display:none" id="delete_list_box">
		<ul id="delete_list">
		</ul>
	</div>

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
</body>

<script type="text/javascript">

$(document).ready(function() {
	$(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(6).css({
	    backgroundColor: "#fff"
	});
	
	$('#member_table').DataTable({
		lengthChange: false,
		language: {
		    paginate: {
		      next: '<a href="#" class="next_btn"><i class="fas fa-chevron-right"></i></a>',
		      previous: '<a href="#" class="pre_btn"><i class="fas fa-chevron-left"></i></a>'  
		    }
		  }
	});
	
	$('#respondents_table').DataTable({
		lengthChange: false,
		language: {
		    paginate: {
		      next: '<a href="#" class="next_btn"><i class="fas fa-chevron-right"></i></a>',
		      previous: '<a href="#" class="pre_btn"><i class="fas fa-chevron-left"></i></a>'  
		    }
		  }
	});
	
	
});

function member_list(){
	
	if($('[name=member_year]').val() == '' && $('[name=member_type]').val() == ''){
		alert('년도 혹은 타입을 선택후 검색해주세요.');
		return;
	}
	
	var member_id = $('[name=member_year]').val();
	var type = $('[name=member_type]').val();
	var exam_idx = '${model.before.exam_idx}';
	
	$.ajax({
		url : '/admin/exam/respondents/Ajaxlist.do',
		type : 'POST',
		data : ({
			exam_idx : exam_idx,
			member_id : member_id,
			type : type,
			calltype : 'member',
		}),
		success: function(result , status , success)
		{
			
			$('#member_table_box').html(result);
			
			$('#member_table').DataTable({
				lengthChange: false,
				language: {
				    paginate: {
				      next: '<a href="#" class="next_btn"><i class="fas fa-chevron-right"></i></a>',
				      previous: '<a href="#" class="pre_btn"><i class="fas fa-chevron-left"></i></a>'  
				    }
				  }
			});
			
		}
	});
	
	
}


function insertAjax(element) {
	
    var row = $(element).closest('tr').clone();
    row.find("button").attr("onclick", "deleteAjax(this)");
    row.find("button").text("삭제");
    $('#respondents_table').DataTable().row.add(row).draw();
    $('#member_table').DataTable().row($(element).closest('tr')).remove().draw(); // 행을 삭제
 	// data- 속성을 사용하여 정보를 가져옴
    var memberId = $(element).data('member_id');
    var name = $(element).data('name');
    var phone = $(element).data('phone');
    var type = $(element).data('type');
    var schoolName = $(element).data('school_name');
	
    // 새로운 <li> 요소 생성 (data- 속성 포함)
    var newItem = $(`<li data-member_id="`+memberId+`" data-name="`+name+`" data-phone="`+phone+`" data-type="`+type+`" data-school_name="`+schoolName+`">`+memberId+`</li>`);

    // #insert_list 내부에 새로운 <li> 추가
    $('#insert_list').append(newItem);
    
}

function deleteAjax(element) {
	
    $('#respondents_table').DataTable().row($(element).closest('tr')).remove().draw(); // 행을 삭제
 	// data- 속성을 사용하여 정보를 가져옴
    var idx = $(element).data('idx');
 	var memberId = $(element).data('member_id');
    var name = $(element).data('name');
    var phone = $(element).data('phone');
    var type = $(element).data('type');
    var schoolName = $(element).data('school_name');
	
    var liElement = $('li[data-member_id="'+memberId+'"]');
    
    if(liElement.length > 0) {
    	$('li[data-member_id="'+memberId+'"]').remove();
    }
    
    // 새로운 <li> 요소 생성 (data- 속성 포함)
    var newItem = $(`<li data-idx="`+idx+`" data-member_id="`+memberId+`" data-name="`+name+`" data-phone="`+phone+`" data-type="`+type+`" data-school_name="`+schoolName+`">`+memberId+`</li>`);

    // #insert_list 내부에 새로운 <li> 추가
    $('#delete_list').append(newItem);
    
}

function respondentsSave(){
	
	var result = confirm('해당 응답자를 저장하시겠습니까?');
	
	if(!result){
		return;
	}
	
	var insert_cnt = $("#insert_list li").length;
	var delete_cnt = $("#delete_list li").length;
	
	if(insert_cnt <= 0 && delete_cnt <= 0){
		alert('해당 변경되는 응답자가 없습니다.');
		return;
	}
	
	if(insert_cnt > 0){
		$("#insert_list li").each(function(index) {
			var memberId = $(this).data('member_id');
		    var name = $(this).data('name');
		    var phone = $(this).data('phone');
		    var type = $(this).data('type');
		    var schoolName = $(this).data('school_name');
		    var exam_idx = '${model.before.exam_idx}';
		    
		    $.ajax({
				url : '/admin/exam/respondents/insert.do',
				type : 'POST',
				data : ({
					exam_idx : exam_idx,
					member_id : memberId,
					name : name,
					phone : phone,
					type : type,
					school_name : schoolName
				}),
				success: function(status , success){
					console.log('success : ' + index);
				},
				error : function(status , error){
					console.log('error : ' + index);
				}
			});
		    
		});	
	}
	
	if(delete_cnt > 0){
		$("#delete_list li").each(function(index) {
			var idx = $(this).data('idx');
		 	var memberId = $(this).data('member_id');
		    var name = $(this).data('name');
		    var phone = $(this).data('phone');
		    var type = $(this).data('type');
		    var schoolName = $(this).data('school_name');
		    
		    if(idx != 'undefined' && idx != null && idx != '') {
		    
		    	$.ajax({
					url : '/admin/exam/respondents/delete.do',
					type : 'POST',
					data : ({
						idx : idx
					}),
					success: function(status , success){
						console.log('success : ' + index);
					},
					error : function(status , error){
						console.log('error : ' + index);
					}
				});
		    	
		    }
		    
		    
		});
	}
	
	alert('응답자가 저장되었습니다.');
	location.reload();
	
	
}


	
</script>

</html>
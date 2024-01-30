<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<link href="${pageContext.request.contextPath}/resources/css/admin/member_re_list.css" rel="stylesheet" type="text/css">
<head>

<!--css-->
<link rel="stylesheet" href="/resources/css/admin/jquery.datetimepicker.css">
    <%@ include file="../include/head.jsp" %> 
</head>

<body>
	<%@ include file="../include/header.jsp" %>

    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                      <form action="./update.do" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" /> <!-- Spring security 사용하기 때문에 csrf 토큰 필요!! -->
                        <input type="hidden"  name="IDX" value="${model.pageDomain.IDX}" />
                        	<div class="member_re_01_wrap">
                                <form>
                                    <div class="form_01">
                                        <div class="page_seach">   
                                            <select ID="DCMNT_TYPE" class="select_size" NAME="SEARCH_TYPE">
                                                <c:forEach var="item" items="${model.types }" varStatus="var">
                                                    <option value="${item.DCMNT_TYPE }" <c:if test="${model.beforeDomain.DCMNT_TYPE == item.DCMNT_TYPE}">selected</c:if>>${item.DCMNT_TYPE }</option>
                                                </c:forEach>
                                            </select>
                                            <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                            <a class="w_btn" href="${pageContext.request.contextPath}/admin/member_re/dcmnt.do">새로고침</a>
                                            <button type="button" value="추가" class="insert" onclick="$('#insert_modal').css('display','block')">서류 추가</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        	<div class="table_wrap">
                                <table id="gcTable" class="tablesorter">
		                        	<thead>
		                        		<tr>
		                        			<th>
		                        				지원 자격
		                        			</th>
		                        			<th>
		                        				서류 명
		                        			</th>
		                        			<th colspan="2">
		                        				기타
		                        			</th>
		                        		</tr>
		                        	</thead>
	                          		<tbody>
	                                   <c:forEach var="item" items="${model.list}" varStatus="var">
		                                    <tr>
		                                    	<td>
		                                    		${item.DCMNT_TYPE}
		                                    	</td>
		                                    	<td>
		                                    		${item.DCMNT_NAME}
		                                    	</td>
		                                    	<td>
		                                    		<button type="button" class="update" id="dsadsa" value="${item.DCMNT_IDX}" data-type="${item.DCMNT_TYPE }" data-name="${item.DCMNT_NAME }">수정</button>
		                                    	</td>
		                                    	<td>
		                                    		<button type="button" class="delete" value="${item.DCMNT_IDX }">삭제</button>
		                                    	</td>
		                                    </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                           </div>
                        </form>
                    </section>
                    <!--본문 끝!-->
            
                </div>
            </div>
        </div>
    </section>
	 <!--서류 수정 modal 시작-->
	<div class="modal_fade docu_modal" id="update_modal">
		<div class="modal_content">
            <div class="modal_docu_box">
                <form  id="dcmnt_update" action="./dcmnt_update.do">
                    <ul class="docu_add_box">
                        <li>
                            <p>서류명</p>
                            <select ID="select_update_dcmnt_type" class="docu_select_size" NAME="SEARCH_TYPE">
                                <c:forEach var="item" items="${model.types }" varStatus="var">
                                    <option value="${item.DCMNT_TYPE }">
                                        ${item.DCMNT_TYPE }
                                    </option>
                                </c:forEach>
                            </select>
                        </li>
                        <li>
                            <p>서류 종류</p>
                            <input type="text" id="update_dcmnt_name" class="docu_select_size" name="DCMNT_NAME" value="">
                        </li>
                        <li><input type="hidden" id="update_dcmnt_idx" name="DCMNT_IDX" value=""> </li>
                    </ul>
                </form>
            </div>
            <div class="docu_modal_btn">
                <button type="button" class="docu_btn docu_btn_01" onclick="javascript:update_dcmnt()">저장</button>
                <button type="button" class="docu_btn docu_btn_02" id="modal_close" class="modal_close" onclick="$('#update_modal').css('display','none');">취소</button>
            </div>
		</div>
	</div>

	<!--서류 수정 modal 끝-->
	<!--서류 추가 modal 시작-->
	<div class="modal_fade" id="insert_modal">
		<div class="modal_content">
			<div class="modal_docu_box">
				<form  id="dcmnt_insert" action="./dcmnt_insert.do">
					<ul class="docu_add_box">
						<li>
							<p>지원자격</p>
							<select id="select_insert_dcmnt_type" class="docu_select_size" name="DCMNT_TYPE">
								<c:forEach var="item" items="${model.types }" varStatus="var">
									<option value="${item.DCMNT_TYPE }">
										${item.DCMNT_TYPE }
									</option>
								</c:forEach>
							</select>
						</li>
						<li>
							<div class="docu_insert_box">
								<div class="docu_insert_txt">
									<input type="checkbox" id="Direct" name="Direct_input"><label>직접 입력</label>
								</div>
								<input type="text" id="Direct_input" class="docu_select_size" name="DCMNT_TYPE1" value="" style="display:none">
							</div>
						</li>
						<li>
							<p>서류 명</p>
							<input type="text" id="insert_dcmnt_name" class="docu_select_size" name="DCMNT_NAME" value="">
						</li>
						<li><input type="hidden" id="insert_dcmnt_idx" name="DCMNT_IDX" value=""> </li>
					</ul>
				</form>
			</div>
			<div class="docu_modal_btn">
				<button type="button" class="docu_btn docu_btn_01" onclick="javascript:insert_dcmnt()">저장</button>
				<button type="button" class="docu_btn docu_btn_02" id="modal_close" class="modal_close" onclick="$('#insert_modal').css('display','none');">취소</button>
			</div>
		</div>
	</div>

	<!--서류 추가 modal 끝-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>
</html>

<script src="/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

<!--부트스트랩 js-->
<script src="/resources/js/bootstrap/bootstrap.js"></script>
<script>


	function searchBtnClick()
	{
		
		URL = './dcmnt.do';
	
	    URL = URL + "?DCMNT_TYPE="+$('#DCMNT_TYPE').val();
	
	    location.href = URL;
	}
	//서류 modal창 열기
	$(document).ready(function(){
		$('.update').click(function(){
			var type = $(this).attr('data-type');
			var name = $(this).attr('data-name');
			var idx = $(this).val();
			$('#select_update_dcmnt_type').val(type).prop("selected",true);
			$('#update_dcmnt_name').val(name);
			$('#update_dcmnt_idx').val(idx);
			$('#update_modal').css('display','block');
		})
		$('.delete').click(function(){
			var result = confirm("정말 현 서류를 삭제하시겠습니까???");
			var DCMNT_IDX = $(this).val();
			if(result){
				$.ajax({
					type : "POST",
					url : "./dcmnt_delete.do",
					cache : false,
					data : ({
						DCMNT_IDX : DCMNT_IDX
					}),
					dataType : "json",
					success : function(data,status,xhr){
						alert(data);
						alert("전송 성공");
					}
				});
				alert("삭제하였습니다."+DCMNT_IDX);
				location.href="./dcmnt.do";
			}else{
				return;
			}
		})
	})
	//서류 추가 ajax 보내기
	function insert_dcmnt(){
		if(($('#insert_dcmnt_type').val() != '')&&($('#insert_dcmnt_name').val() != '')){
			alert("서류 종류 : "+$('[name=DCMNT_TYPE]').val()+"서류 명 : "+$('#insert_dcmnt_name').val() + "서류 번호 :" +$('#insert_dcmnt_idx').val());
			var DCMNT_TYPE = $('[name=DCMNT_TYPE]').val();
			var DCMNT_NAME = $('#insert_dcmnt_name').val();
			var DCMNT_IDX = $('#insert_dcmnt_idx').val();
			$.ajax({
				type : "POST",
				url : "./dcmnt_insert.do",
				cache : false,
				data : ({
					DCMNT_TYPE : DCMNT_TYPE,
					DCMNT_NAME : DCMNT_NAME,
				}),
				dataType : "json",
				success : function(data,status,xhr){
					alert(data);
					alert("전송 성공");
				}
			});
			$('#insert_modal').css('display','none');
		}else{
			alert("확인 요구!");
			return;
		}
		alert("전송 완료!");
		location.href="./dcmnt.do";
	}
	
	
	
	//서류 수정 ajax 보내기
	function update_dcmnt(){
		if(($('#update_dcmnt_type').val() != '')&&($('#update_dcmnt_name').val() != '')&&($('#update_dcmnt_idx').val() != '')){
			alert("서류 종류 : "+$('#select_update_dcmnt_type').val()+"서류 명 : "+$('#update_dcmnt_name').val() + "서류 번호 :" +$('#update_dcmnt_idx').val());
			var DCMNT_TYPE = $('#select_update_dcmnt_type').val();
			var DCMNT_NAME = $('#update_dcmnt_name').val();
			var DCMNT_IDX = $('#update_dcmnt_idx').val();
			$.ajax({
				type : "POST",
				url : "./dcmnt_update.do",
				cache : false,
				data : ({
					DCMNT_TYPE : DCMNT_TYPE,
					DCMNT_NAME : DCMNT_NAME,
					DCMNT_IDX : DCMNT_IDX,
				}),
				dataType : "json",
				success : function(data,status,xhr){
					alert(data);
					alert("전송 성공");
				}
			});
			$('#update_modal').css('display','none');
		}else{
			alert("확인 요구!");
			return;
		}
		alert("전송 완료!");
		location.href="./dcmnt.do";
	}
	
	$(function() {
		$.datetimepicker.setLocale('ko');
	    jQuery('.datecalendar').datetimepicker({
	        format: 'Y.m.d',
	        lang: "ko",
	        timepicker: false
	    });
	});
	
	
	//서류 직접 입력
	$("input:checkbox[name=Direct_input]").click(function() {
		if($('input:checkbox[name=Direct_input]').is(':checked') == true){
			$('#Direct_input').css('display','inline-block');
			$('#select_insert_dcmnt_type').css('display','none');
			$('#Direct_input').attr('name','DCMNT_TYPE');
			$('#select_insert_dcmnt_type').attr('name','DCMNT_TYPE1');
		}else{
			$('#Direct_input').css('display','none');
			$('#select_insert_dcmnt_type').css('display','inline-block');
			$('#Direct_input').attr('name','DCMNT_TYPE1');
			$('#select_insert_dcmnt_type').attr('name','DCMNT_TYPE');
		}
	});
	
	
</script>

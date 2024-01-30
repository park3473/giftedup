
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp"%>
</head>

<body>
	<!--헤더-->
	<%@ include file="../../include/header.jsp"%>
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
								<span></span> <span>교사 프로그램 관리</span>
							</div>

							<div class="table_wrap">
								<div class="title">
									<h2>
										<span class="orange_c">2019학년도</span> <span class="purple_c">${model.MEMBER.pageDomain.SCHOOL_TYPE }
											${model.MEMBER.pageDomain.SCHOOL_YEAR }학년</span>의 <span class="orange_c">${model.MEMBER.pageDomain.NAME }</span> 학생의 <span
											class="purple_c">포트폴리오 관리</span> 페이지 입니다.
									</h2>
								</div>
								<table>
									<tr>
										<th class="check"><input type="checkbox" value=""></th>
										<th class="subject">과목</th>
										<th class="claim-day">교육시간</th>
										<th class="area">장소</th>
										<th class="claim-stat">수정</th>
										<!-- <th>삭제</th>
										<th>출력</th> -->
									</tr>
									<c:forEach var="item" items="${model.list}" varStatus="status">
										<tr>
											<td><input type="checkbox" value=""></td>
											<td>${item.PROGRAM_NAME }</td>
											<td>${fn:substring(item.START_TM,0,11)}~${fn:substring(item.END_TM,0,11)}</td>
											<td>${item.PLACE}</td>
											<td><input class="td_list_btn" type="button" value="수정하기" onClick="updateClick('${item.IDX}')"></td>
											<!--
											<td class="td_05">
											<input class="td_list_btn"	type="button" value="삭제하기" onClick="deleteClick('${item.IDX}')"></td>
											<td class="td_05"><input class="td_list_btn"
												type="button" value="출력하기"></td>
												-->
										</tr>
									</c:forEach>

								</table>
							</div>

							<!--관리자 버튼
							<div class="adm_btn_wrap teacher_btn">
								<ul>
									<li class="modify"><a href="#">포트폴리오 작성</a></li>
								</ul>
							</div>
							-->
							<!--관리자 버튼 end-->

							<!--페이지 넘버-->
							<nav class="paging_number">
								<ul class="page">
									<%@ include file="../../include/pageing.jsp"%>
								</ul>
							</nav>
							<!--페이지 넘버 end-->
							<!--포트폴리오_모달창-->
							
							<div class="modal_bg"></div>
							<!--학번수동발급_모달창 end-->
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
		<%@ include file="../../include/footer.jsp"%>
	</footer>
	<!--푸터 end-->


	<!--  JQuery  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/admin/program.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body>
</html>



<script>
	$(document).ready(function() {
		var oldVal = "";
		$("#sms_text").on("change keyup paste", function() {
			var currentVal = $(this).val();
			if (currentVal == oldVal) {
				return;
			}

			oldVal = currentVal;
			$('#sms_text_size').text(oldVal.length);
		});
		$("#RESERVATION").change(function(){
	        if($("#RESERVATION").is(":checked")){
	            $("#RESERVATION_TM").show();
	            $("#RESERVATION_TM2").hide();

	        }else{
	        	$("#RESERVATION_TM").hide();
	        	$("#RESERVATION_TM2").show();
	        }
	    });
	});

	function deleteArrClick() {

		cnt = 0;
		deleteArrIdx = "";
		$("input[name=chk_calc]").each(function() {

			var chk = $(this).is(":checked");

			console.log(chk);

			if (chk == true) {
				cnt = cnt + 1;
				deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
			}

		});
		if(deleteArrIdx == '')
		{
			alert('삭제할 대상을를 선택 하여 주세요');
			return;
		}
		var URL = './deleteArr.do?IDX=' + deleteArrIdx;
		console.log(URL);
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : "",
			success : function(result) {
				var s = result.indexOf("true");
				console.log(s);
				if (s != -1) {
					var moveUrl = "?SEARCH_TEXT="
							+ encodeURI('${model.boforeDomain.SEARCH_TEXT}');
					moveUrl = moveUrl + "&SEARCH_TYPE="
							+ encodeURI('${model.boforeDomain.SEARCH_TYPE}');

					if ("${model.boforeDomain.page}" != "") {
						moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
					}

					idchk = true;
					location.href = './list.do' + moveUrl;
					return;
				} else {
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

	function insertClick() {

		if ($('#NAME').val() == '') {
			alert('프로그램명을 입력 하여 주세요');
			return;
		}

		$('#updateform').submit();
	}
	function deleteClick(idx) {
		var URL = './deleteArr.do?IDX=' + idx;
		console.log(URL);
		$
				.ajax({
					type : "POST",
					url : URL,
					cache : false,
					data : "",
					success : function(result) {
						var s = result.indexOf("true");
						console.log(s);
						if (s != -1) {
							var moveUrl = "?MEMBER_ID=${model.beforeDomain.MEMBER_ID}&SEARCH_TEXT="
									+ encodeURI('${model.boforeDomain.SEARCH_TEXT}');
							moveUrl = moveUrl
									+ "&SEARCH_TYPE="
									+ encodeURI('${model.boforeDomain.SEARCH_TYPE}');

							if ("${model.boforeDomain.page}" != "") {
								moveUrl = moveUrl
										+ "&page=${model.boforeDomain.page}";
							}

							idchk = true;
							location.href = './list.do' + moveUrl;
							return;
						} else {
							alert('실패하였습니다.');
							return;
						}
					}
				});
	}

	function deleteClick(idx) {
		var URL = './update.do?IDX=' + idx;
		console.log(URL);
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : "",
			success : function(result) {

			}
		});
	}

	function updateClick(idx) {
		var URL = './' + idx + '/update.do';
		console.log(URL);
		location.href = URL;

	}
</script>
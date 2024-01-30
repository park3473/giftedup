 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

                    <!--본문 내용-->
                    <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                    <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>교사지역별 그룹관리</span>
                            </div>

                            <div class="member_group_wrap">
                                <div class="title">
                                    <h2>그룹장 정보입력</h2>
                                </div>
                                <div class="group_input_wrap">
                                    <div class="group_input_area">
                                        <div class="group_input_con">
                                            <span>그룹관리자</span>
                                            <input type="text" placeholder="아이디입력" id="MEMBER_ID" name="MEMBER_ID" value="${model.LOCAL_GROUP_IDX}">
                                            <span>OR</span>
                                            
                                            <!-- 
                                            <select id="GROUPLIST" NAME="GROUPLIST">
                                             	<option>선택하여주세요</option>
                                            	<c:forEach var="item" items="${model.GROUPLIST.list}" varStatus="status">
                                                <option value="${item.MEMBER_ID}" <c:if test="${item.MEMBER_ID == model.LOCAL_GROUP_IDX}">selected</c:if>>${item.NAME}(${item.SCHOOL_NAME})</option>
                                                </c:forEach>
                                            </select>
                                             -->
                                            <button type="button" id="maching_btn" onClick="#">검색</button>
                                            <!-- <button type="button" id="inquiry_btn" onClick="idCheck()">선택</button> -->
                                            
                                            <span class="relate_c">직접 아이디를 입력하거나 성명을 검색해주세요.</span>
                                        </div>
                                    </div>
                                    <div class="group_list_area" id="AjaxContent">
                                        
                                    </div>
                                </div>
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <!-- <a class="storage" href="#">등록하기</a> 
                                    -->
                                    <a class="cancel" href="./list.do">뒤로가기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
							<div class="matching_modal_wrap">
                            	<div class="matching_modal_con">

                           			<div class="matching_table_con">
                            			<table id="matching_table">
                            				<thead>
	                            				<tr>
	                            					<th>아이디</th>
	                            					<th>이름</th>
	                            					<th>시도명</th>
	                            					<th>소속학교명</th>
	                            					<th>성별</th>
	                            					<th>비고</th>
	                            				</tr>
                            				<thead>
                            				<tbody>
                            					<c:forEach var="item" items="${model.GROUPLIST.list}" varStatus="status">
			                                        <tr>
		                            					<td>${item.MEMBER_ID}</td>
		                            					<td>${item.NAME}</td>
		                            					<td>${item.ADDRESS_LOCAL}</td>
		                            					<td>${item.SCHOOL_NAME}</td>
		                            					<td>${item.SEX}</td>
	                            						<td><input id="member2_${status.index}" name="member2" type="radio" value="${item.MEMBER_ID}" class="radio_input"></td>
	                            					</tr>
	                            				
			                                       
			                                    </c:forEach>
	                            				
                            				</tbody>
                            			</table>
                           			</div>
                           			<div class="member_btn adm_btn_wrap mr-0">
	                            		<ul>
	                            			<li class="register modal_close" ><a href="#">취소</a></li>
	                            			<li class="register modal_upload" ><a href="javascript:memberCheck()">선택하기</a></li>
	                            		</ul>
	                            	</div>
                            	</div>
                            </div>
                        </div>
                    </section>
                    </form>
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
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
</body></html>

<script type="text/javascript">

$("#GROUPLIST").change(function() {
	$('#MEMBER_ID').val($(this).val());
});
function memberCheck()
{
	var memberId =  $("input[name=member2]:checked").val();
	 $('#MEMBER_ID').val(memberId);
	 $('#GROUPLIST').val(memberId);
	 idCheck();
	 $(".matching_modal_wrap").fadeOut(300);
	 
}



$(document).ready(function()
{
	 $("input:radio[name=TYPE]").click(function(){
	        if($("input[name=TYPE]:checked").val() == "1"){
	        	location.href='./insert.do?TYPE=1';
	        }else if($("input[name=TYPE]:checked").val() == "2"){
	        	location.href='./insert.do?TYPE=2';					
	        }
	        $("input[name=radio]:checked")
	    });
	 
	if('${model.LOCAL_GROUP_IDX}' != "")
	{
		 $.ajax({
				type : "GET",
				url : './idCheck.do?MEMBER_ID=${model.LOCAL_GROUP_IDX}',
				cache : false,
				data : "",
				success: function(result)
				{
					$('#AjaxContent').html(result);
				}
			});
	}

	 
	 
});

	/*$("#YEAR").change(function() {

	    $.ajax({
			type : "GET",
			url : './getMemviewView.do?MEMBER_ID='+$(this).val(),
			cache : false,
			data : "",
			success: function(result)
			{
				$('#IDX').html(result);
			}
		});
	});
	*/
	function insertClick()
	{
		if($('#MEMBER_ID').val() == '')
		{
			alert('아이디를 입력 하여 주세요');
			return;
		}
		
		$('#updateform').submit();
	}
	function idCheck()
	{
		if($('#MEMBER_ID').val() == '')
		{
			alert('아이디를 입력 하여 주세요');
			return;
		}
		
		 $.ajax({
				type : "GET",
				url : './idCheck.do?MEMBER_ID='+$('#MEMBER_ID').val(),
				cache : false,
				data : "",
				success: function(result)
				{
					$('#AjaxContent').html(result);
				}
			});

	}
	
	function matching_modal(){
		$('#matching_table').DataTable({
			lengthChange: false,
			language: {
			    paginate: {
			      next: '<a href="#" class="next_btn"><i class="fas fa-chevron-right"></i></a>',
			      previous: '<a href="#" class="pre_btn"><i class="fas fa-chevron-left"></i></a>'  
			    }
			  }
		});
		
		$("#maching_btn").click(function(){
			$(".matching_modal_wrap").fadeIn(300);
		});
		
		$(".modal_close").click(function(){
			$(".matching_modal_wrap").fadeOut(300);
		});
	}
	matching_modal();
</script>
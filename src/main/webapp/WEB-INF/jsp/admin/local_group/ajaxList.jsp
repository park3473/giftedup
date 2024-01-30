 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

										<span>관리교사</span>
                                        <div class="teacher_list">
                                            <h2>미등록 교사 목록</h2>
                                            <div>
			                                    <select ID="LOCATION" NAME="LOCATION">
													<option value="">지역선택</option>
			                                        <option value="서울" <c:if test="${model.pageDomain.LOCATION == '서울'}">selected</c:if>>서울</option>
			                                        <option value="부산" <c:if test="${model.pageDomain.LOCATION == '부산'}">selected</c:if>>부산</option>
			                                        <option value="대구" <c:if test="${model.pageDomain.LOCATION == '대구'}">selected</c:if>>대구</option>
			                                        <option value="인천" <c:if test="${model.pageDomain.LOCATION == '인천'}">selected</c:if>>인천</option>
			                                        <option value="광주" <c:if test="${model.pageDomain.LOCATION == '광주'}">selected</c:if>>광주</option>
			                                        <option value="대전" <c:if test="${model.pageDomain.LOCATION == '대전'}">selected</c:if>>대전</option>
			                                        <option value="울산" <c:if test="${model.pageDomain.LOCATION == '울산'}">selected</c:if>>울산</option>
			                                        <option value="세종" <c:if test="${model.pageDomain.LOCATION == '세종'}">selected</c:if>>세종</option>
			                                        <option value="경기도" <c:if test="${model.pageDomain.LOCATION == '경기도'}">selected</c:if>>경기도</option>
			                                        <option value="강원도" <c:if test="${model.pageDomain.LOCATION == '강원도'}">selected</c:if>>강원도</option>
			                                        <option value="충청북도" <c:if test="${model.pageDomain.LOCATION == '충청북도'}">selected</c:if>>충청북도</option>
			                                        <option value="충청남도" <c:if test="${model.pageDomain.LOCATION == '충청남도'}">selected</c:if>>충청남도</option>
			                                        <option value="전라북도" <c:if test="${model.pageDomain.LOCATION == '전라북도'}">selected</c:if>>전라북도</option>
			                                        <option value="전라남도" <c:if test="${model.pageDomain.LOCATION == '전라남도'}">selected</c:if>>전라남도</option>
			                                        <option value="경상북도" <c:if test="${model.pageDomain.LOCATION == '경상북도'}">selected</c:if>>경상북도</option>
			                                        <option value="경상남도" <c:if test="${model.pageDomain.LOCATION == '경상남도'}">selected</c:if>>경상남도</option>
			                                        <option value="제주도" <c:if test="${model.pageDomain.LOCATION == '제주도'}">selected</c:if>>제주도</option>
			                                      </select>
			                                    <ul>
	                                             <c:forEach var="item" items="${model.MEMBER_NOT.list}" varStatus="status">
	                                                <li><a href="javascript:selectItem('add_', '${item.MEMBER_ID}')" id="add_${item.MEMBER_ID}">${item.NAME} (${item.SCHOOL_NAME})</a></li>
	                                             </c:forEach>
	                                            </ul>
                                            </div>
                                        </div>
                                        <div class="group_btn">
                                            <div class="group_btn_con">
                                                <a href="javascript:selectAdd()">등록 <span><img src="${pageContext.request.contextPath}/resources/img/admin/rt_arrow.png" alt="등록"></span></a>
                                                <a href="javascript:selectDelete()">삭제 <span><img src="${pageContext.request.contextPath}/resources/img/admin/lt_arrow.png" alt="삭제"></span></a>
                                            </div>
                                        </div>
                                        <div class="group_list">
                                            <h2>등록 교사 목록</h2>
                                            <ul>
                                            <c:forEach var="item" items="${model.MEMBER2.list}" varStatus="status">
                                            	<li><a href="javascript:selectItem('delete_', '${item.MEMBER_ID}')" id="delete_${item.MEMBER_ID}">${item.NAME} (${item.SCHOOL_NAME})</a></li>
                                            </c:forEach>
                                            </ul>
                                        </div>
                                        
                                        
<script>

function selectDelete()
{
	if($('#LOCATION').val() == "")
	{
		alert('지역을 선택 해주세요.');
		return;	
	}
	
	var arr = [];
	
	<c:forEach var="item" items="${model.MEMBER2.list}" varStatus="status">
	arr.push("${item.MEMBER_ID}");
	</c:forEach>
	
	var arridx = '';
	for(i = 0; i < arr.length; i++)
	{
		if($('#delete_'+arr[i]).hasClass("select_active") === true)
		{
			arridx = arridx + arr[i] +','
		}
		console.log(arridx)	;
	}
	
	console.log(arridx)	;
	var URL = '../local_group_member/${model.LOCAL_GROUP_IDX}/deleteArr.do?MEMBER_ID='+ arridx;
	URL += "&LOCAL_GROUP_IDX=${model.LOCAL_GROUP_IDX}";
	URL += "&LOCATION="+$('#LOCATION').val();
	console.log(URL);
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : "",
		success: function(result)
		{
			var s = result.indexOf("true");
			console.log(s);
			if(s != -1)
			{
				
				location.href = './insert.do?LOCAL_GROUP_IDX=${model.LOCAL_GROUP_IDX}';
				return;
			}else 
			{
				alert('실패하였습니다.');
				return;
			}
		}
	});
}

function selectAdd()
{
	
	if($('#LOCATION').val() == "")
	{
		alert('지역을 선택 해주세요.');
		return;	
	}
	
	
	var arr = [];
	
	<c:forEach var="item" items="${model.MEMBER_NOT.list}" varStatus="status">
	arr.push("${item.MEMBER_ID}");
	</c:forEach>
	
	var arridx = '';
	for(i = 0; i < arr.length; i++)
	{
		if($('#add_'+arr[i]).hasClass("select_active") === true)
		{
			arridx = arridx + arr[i] +','
		}
		console.log(arridx)	;
	}
	
	
	var URL = './insert.do?MEMBER_ID='+ arridx;
	URL += "&LOCAL_GROUP_IDX=${model.LOCAL_GROUP_IDX}";
	URL += "&LOCATION="+$('#LOCATION').val();
	console.log(URL);
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : "",
		success: function(result)
		{
			var s = result.indexOf("true");
			console.log(s);
			if(s != -1)
			{
				location.href = './insert.do?LOCAL_GROUP_IDX=${model.LOCAL_GROUP_IDX}';
				return;
			}else 
			{
				alert('실패하였습니다.');
				return;
			}
		}
	});
	
	
	console.log(arridx)	;
	
}

function selectItem(type, id)
{
	if($('#'+type+id).hasClass("select_active") === true)
	{
		$('#'+type+id).removeClass( 'select_active' );
	}else
	{
		$('#'+type+id).addClass( 'select_active' );
	}
}


$("#LOCATION").change(function() {

    $.ajax({
		type : "GET",
		url : './getLOCATION.do?LOCAL_GROUP_IDX=${model.LOCAL_GROUP_IDX}&LOCATION='+$(this).val(),
		cache : false,
		data : "",
		success: function(result)
		{
			location.href = './insert.do?LOCAL_GROUP_IDX=${model.LOCAL_GROUP_IDX}';
		}
	});


});
	

</script>                                        
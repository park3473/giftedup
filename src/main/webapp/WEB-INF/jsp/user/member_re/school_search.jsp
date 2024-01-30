<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>학교검색</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table {
	border-collapse: collapse;
}

.table01 {
	border: 1px solid #cdcdcd;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	width: 90%;
	margin: 10px 5%
}

.table01 thead th {
	height: 35px;
	border-left: 1px solid #f7f7f7;
	background-position: left top;
	background-repeat: repeat-x;
	color: #46688b;
	line-height: 18px;
}

.table01 tbody th {
	padding: 5px;
	border-left: 1px solid #cdcdcd;
	border-right: 1px solid #cdcdcd;
	border-bottom: 1px solid #cdcdcd;
	font-weight: normal;
}

.table01 tbody td {
	padding: 5px;
	border-left: 1px solid #cdcdcd;
	border-right: 1px solid #cdcdcd;
	border-bottom: 1px solid #cdcdcd;
}
</style>
<script type="text/javascript">
<!--
	function selSchool(school_code, school_name) {
		var form1 = opener.document.form1;
		form1.school_code.value = school_code;
		form1.school_name.value = school_name;
		self.close();
	}
//-->
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
</head>
<%
	String TYPE_DATA = request.getParameter("TYPE_DATA") != null? request.getParameter("TYPE_DATA") : "no";
	pageContext.setAttribute("TYPE_DATA",TYPE_DATA);
%>
<body leftmargin="0" topmargin="0" style="background-color: #FFF">
	<div style="width: 900px; margin: 30px 20px; overflow: hidden">
		<div style="width: 460px; float: left; margin-bottom: 10px">
			<h2>학교 검색</h2>
		</div>
		<div
			style="width: 810px; float: left; background-color: e2ecef; text-align: center" onkeyup="searchBtnClick1();">
			<form name="search_form" action="/list.do" onsubmit="searchBtnClick(); return false;" method="POST"
				style="margin: 20px 0">
				<input type="text"  id="SCHOOL_SEARCH_TEXT" name="SCHOOL_SEARCH_TEXT" value="" style="width: 200px; height: 25px; margin-right: 10px; vertical-align: middle; ime-mode: active">
				<button type="button" onclick="searchBtnClick();">검색</button>
			</form>
		</div>
		<div
			style="width: 815px; height: 300px; background-color: #f6f6f6; float: left; margin-top: 10px">
			<div
				style="width: 800px; height: 288px; padding-bottom: 20px; border: 1px solid #dbdbdb; background-color: #fff; box-sizing: border-box; margin: 6px; overflow: auto;">
				<p
					style="text-align: center; font-size: 15px; color: #336699; font-weight: bold; margin: 15px 0; letter-spacing: -1px">검색결과
					중 본인의 학교를 선택해주세요.</p>
				<table cellpadding="0" cellspacing="0" border="0" class="table01">
					<caption style="display: none">학교검색</caption>
					<colgroup>
						<col width="15%">
						<col width="30%">
						<col width="40%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr bgcolor="e7e8e9">
							<th scope="col">학교급</th>
							<th scope="col">학교명</th>
							<th scope="col">학교 주소</th>
							<th scope="col">확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model.list}" varStatus="status">
							<tr>
								<td id="SCHOOL_TYPE_${item.SCHOOL_ID }" value="${item.SCHOOL_TYPE }">${item.SCHOOL_TYPE}</td>
								<td><input type="hidden" id="SCHOOL_NAME_${item.SCHOOL_ID }" value="${item.SCHOOL_NAME}">${item.SCHOOL_NAME}</td>
								<td id="SCHOOL_ADDRESS_${item.SCHOOL_ID }" value="${item.SCHOOL_ADDRESS }">${item.SCHOOL_ADDRESS}</td>
								<input type="hidden" id="SCHOOL_LOCATION_${item.SCHOOL_ID }" name="SCHOOL_LOCATION" value="${item.SCHOOL_LOCATION}">
								<td><button class="school_test" type="button" onclick="school_check('${item.SCHOOL_ID}')" >확인</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	window.resizeTo(900,600);
	
	function school_check(ID){
		/* 개발 opener = 부모창 */
		
		var type_data = '${TYPE_DATA}';
		
		var name = $('#SCHOOL_NAME_'+ID).attr('value');
		var location = $('#SCHOOL_LOCATION_'+ID).attr('value');
		var type = $('#SCHOOL_TYPE_'+ID).attr('value');
		var address = $('#SCHOOL_ADDRESS_'+ID).attr('value');
		
		console.log(name);
		console.log(location);
		console.log(type);
		console.log(address);
		
		if(type_data == 'no' || type_data == 'no-mento'){
		
			opener.document.getElementById("SCHOOL_NAME").value = name;
			
			if(type_data == 'no'){
				opener.document.getElementById("SCHOOL_TYPE").value = type;	
			}
			opener.document.getElementById("SCHOOL_LOCATION").value = location;
			opener.document.getElementById("SCHOOL_ADDRESS").value = address;
			
		}else{
			
			var form = opener.document.getElementById(type_data+'_insertform');
			
			
			form.getElementsByClassName("SCHOOL_NAME")[0].value = name;
			
			if(type_data == 'mento'){
			
				
			}else{
				
				form.getElementsByClassName("SCHOOL_TYPE")[0].value = type;
				
			}
			
			form.getElementsByClassName("SCHOOL_LOCATION")[0].value = location;
			form.getElementsByClassName("SCHOOL_ADDRESS")[0].value = address;
			
		}
		
		window.close();
	}
	
	
	function searchBtnClick(){
        URL = '${pageContext.request.contextPath}/user/member_re/school_search.do?TYPE_DATA=${TYPE_DATA}';
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SCHOOL_SEARCH_TEXT').val());
        
       	console.log(URL);
        
        location.href = URL;
    }
	
	function searchBtnClick1(){
		if(window.event.keyCode == 13){
			searchBtnClick();
		}
	}
</script>
</html>


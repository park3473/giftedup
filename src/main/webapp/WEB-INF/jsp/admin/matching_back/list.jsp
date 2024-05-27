 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %> 
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
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>교사-학생 매칭관리</span>
                            </div>

                            <div class="member_seach_form">
                                <div class="member_01_wrap" style="margin-bottom:0px">
                                    <form>
                                        <div class="form_01">
                                            <div class="page">
                                                <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT }" id="ITEM_COUNT" name="ITEM_COUNT">
                                                <span>/ 페이지</span>
                                            </div>
                                            <div class="page_seach">
                                                <select id="YEAR" name="YEAR">
                                                    <option value="">학년도선택</option>
                                                    <c:forEach var="item" items="${model.YEARLIST.list}" varStatus="status">
                                                    <option value="${item.YEAR}" <c:if test="${model.beforeDomain.YEAR == item.YEAR}">selected</c:if>>${item.YEAR}년</option>
                                                    </c:forEach>
                                                </select>
 												<select class="input_size" id="SUPPORT_GROUP" NAME="SUPPORT_GROUP">
                                                    <option value="">학년 선택</option>
                                                    <option value="4"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '11'}">selected</c:if>>고등학교2학년</option>
                                                    <option value="12"  <c:if test="${model.beforeDomain.SUPPORT_GROUP == '12'}">selected</c:if>>고등학교3학년</option>
                                                </select>
                                               
                                                <select ID="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                               		<option value="ALL">전체</option>
                                                    <option value="MEMBER_ID" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'MEMBER_ID'}">selected</c:if>>회원아이디</option>
                                                    <option value="PROFESSOR_MEMBER_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'PROFESSOR_MEMBER_NAME'}">selected</c:if>>지도교사</option>
                                                    <option value="SCHOOL_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_NAME'}">selected</c:if>>소속학교</option>
                                                </select>
                                                <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="내용을 입력해주세요.">
                                                <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                <a class="w_btn" href="javascript:location.reload()">새로고침</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- 
                                <div class="member_02_wrap mr-0">
                                    <form class="wth-10 float-none mr-0">
                                        <select ID="PROFESSOR_MEMBER_ID2" NAME="PROFESSOR_MEMBER_ID2">
	                                        <option value="">멘토교사 선택</option>
	                                        <c:forEach var="item" items="${model.MEMBER.list}" varStatus="status">
	                                        <option value="${item.MEMBER_ID}">${item.NAME}(${item.SCHOOL_NAME})</option>
	                                        </c:forEach>
                                        </select>
                                        <button type="button" value="멘토교사변경" onclick="selectArrChanged('PROFESSOR_MEMBER_ID')">멘토교사 변경</button>
                                        
                                      
                                        
                                        <span class="relate_b">변경하고자 하는 학생을 선택 후 변경</span>
                                    </form>
                                </div>
                                -->
                            </div>

                            <div class="table_wrap">
                                <table>
                                    <tr>
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="name">학생 이름</th>
                                        <th class="name_id">아이디</th>
                                        <th class="sch_year">학년도</th>
                                        <th class="process">학년</th>
                                        <th class="phone">휴대전화</th>
                                        <th class="school">소속학교</th>
                                        <th class="mentor">멘토교사</th>
                                        <!-- <th>관찰교사</th> -->
                                        <!-- <th class="study_stat">재학상태</th> -->
                                        <th class="eval">관리</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.MEMBER_ID}" data-memberid="${item.MEMBER_ID}"  data-phone="${item.PHONE}"></td>
                                        <td>${item.NAME }</td>
                                        <td>${item.MEMBER_ID }</td>
                                        <td>${item.YEAR }학년</td>
                                        <td>
	                                         <c:if test="${item.SUPPORT_GROUP == '4'}">초등학교4학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '5'}">초등학교5학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '6'}">초등학교6학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '7'}">중학교1학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '8'}">중학교2학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '9'}">중학교3학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '10'}">고등학교1학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '11'}">고등학교2학년</c:if>
	                                         <c:if test="${item.SUPPORT_GROUP == '12'}">고등학교3학년</c:if>
                                        </td>
                                        <td>${item.PHONE }</td>
                                        <td>${item.SCHOOL_NAME }</td>
                                        <td>${item.PROFESSOR_MEMBER_NAME }</td>
                                       
                                        <td><button type="button" onclick="location.href='./${item.MEMBER_ID }/update.do?YEAR=${item.YEAR}'">관리하기</button></td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register adm_w_btn">
                                        <a href="${pageContext.request.contextPath}/admin/matching/insert.do?YEAR=${CheckYear}">등록하기</a>
                                    </li>
                                    <li class="register">
                                        <a href="javascript:update()">수정하기</a>
                                    </li>
                                    <li class="delete">
                                        <a href="javascript:deleteArrClick()">삭제하기</a>
                                    </li>
                                </ul>
                            </div>
                            <!--관리자 버튼 end-->


                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <%@ include file="../include/pageing.jsp" %>
                            </nav>
                            <!--페이지 넘버 end-->
                            <!--학번수동발급_모달창-->
                            <div class="classM_modal_wrap modal_wrap">
                                <div class="classM_modal_con modal_con">
                                    <ul class="excel_modal_txt">
                                        <li>
                                            <span class="i-circle"></span>
                                            <span class="modal_txt">학번 수동 발급 파일은 학적 목록을 다운로드(이미 발급된 학번은 제외)한 후 샘플 파일을 참고하여 작성해 주세요.</span>
                                        </li>
                                        <li>
                                            <span class="i-circle"></span>
                                            <span class="modal_txt">학번 수동발급 파일은 엑셀(xls)로 작성해야 하며 제목행을 지우고 저장한 후 업로드해주세요</span>
                                        </li>
                                        <li>
                                            <span class="i-circle"></span>
                                            <span class="modal_txt">학번 수동 발급 후 반드시 중복 또는 정상등록 여부를 확인해 주세요. </span>
                                        </li>
                                    </ul>
                                    <form>
                                        <ul class="excel_modal_form">
                                            <li>
                                                <span class="modal_t">학년도＊</span>
                                                <select class="input_size mr">
                                                    <option>선택해주세요</option>
                                                    <option>선택해주세요</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="modal_t">파일＊</span>
                                                <button>파일선택</button>
                                                <span class="relate_b mr-0">선택된 파일 없음</span>
                                                <button>샘플파일</button>
                                                <button>중복관리</button>
                                                <span class="relate_c">엑셀 파일만 업로드 가능</span>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="modal_btn_wrap">
                                    <div class="modal_btn_con">
                                        <a class="check" href="#">확인</a>
                                        <a class="cancel" href="#">취소하기</a>
                                    </div>
                                </div>
                            </div>
                            <!--학번수동발급_모달창 end-->
                            
                            
                            
                            
                            
                            <!--학번자동발급_모달창-->
                            <div class="classA_modal_wrap modal_wrap">
                                <div class="classA_modal_con modal_con">
                                    <ul class="excel_modal_txt classA_modal_con">
                                        <li>
                                            <span class="modal_txt">해당학생을 선택하지 않으면 전체 학번이 자동 발급됩니다. 학번을 자동발급하시겠습니까?</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="modal_btn_wrap">
                                    <div class="modal_btn_con">
                                        <a class="check" href="#">확인</a>
                                        <a class="cancel" href="#">취소하기</a>
                                    </div>
                                </div>
                            </div>
                            <!--학번자동발급_모달창 end-->
                            
                            <form action="/admin/member/matching.do?" method="post" name="matchingExcelform" id="matchingExcelform" enctype="multipart/form-data">
                                <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                <div class="member_modal_wrap">
                                    <div class="member_modal_con member_input_wrap">
                                        <div class="modal_title">
                                            <h2>회원 엑셀 업로드</h2>
                                        </div>
                                        <ul class="modal_form member_input">
                                            <li>
                                                <span class="list_t">엑셀 업로드</span>
                                                <input type="file" id="file1" name="file" accept=".xls">
                                                <span class="relate_c">양식에 맞는 엑셀을 업로드 해주세요.</span>
                                            </li>
                                        </ul>
                                        
                                        <div class="member_btn adm_btn_wrap mr-0">
                                            <ul>
                                                <li class="register modal_close" ><a href="#">취소</a></li>
                                                <li class="register modal_upload" ><a href="javascript:matchingUpload()">회원 업로드</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            
                            
                            
                            <!--엑셀일괄등록_모달창-->
                            <div class="excel_modal_wrap modal_wrap">
                                <div class="excel_modal_con modal_con">
                                    <ul class="excel_modal_txt">
                                        <li>
                                            <span class="i-circle"></span>
                                            <span class="modal_txt">일괄등록 파일은 샘플파일을 참고하여 엑셀(xls)로 작성해야하며 제목행을 지우고 저장 후 업로드해주세요.</span>
                                        </li>
                                        <li>
                                            <span class="i-circle"></span>
                                            <span class="modal_txt">일괄등록 후 반드시 중복 또는 등록여부를 확인해주세요.</span>
                                        </li>
                                        <li>
                                            <span class="i-circle"></span>
                                            <span class="modal_txt">성명+생년월일+성별로 중복검사하며 학생정보 수정은 개별 수정해주세요.</span>
                                        </li>
                                    </ul>
                                    <form>
                                        <ul class="excel_modal_form">
                                            <li>
                                                <span class="modal_t">학년도＊</span>
                                                <select class="input_size mr">
                                                    <option>선택해주세요</option>
                                                    <option>선택해주세요</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="modal_t">과정＊</span>
                                                <select class="input_size mr">
                                                    <option>선택해주세요</option>
                                                    <option>선택해주세요</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="modal_t">상태＊</span>
                                                <select class="input_size mr">
                                                    <option>선택해주세요</option>
                                                    <option>선택해주세요</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="modal_t">파일＊</span>
                                                <button>파일선택</button>
                                                <span class="relate_b mr-0">선택된 파일 없음</span>
                                                <button>샘플파일</button>
                                                <button>중복관리</button>
                                                <span class="relate_c">엑셀 파일만 업로드 가능</span>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                                <div class="modal_btn_wrap">
                                    <div class="modal_btn_con">
                                        <a class="check" href="#">확인</a>
                                        <a class="cancel" href="#">취소하기</a>
                                    </div>
                                </div>

                            </div>
                            <div class="modal_bg"></div>
                            <!--엑셀일괄등록_모달창 end-->
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    
</body></html>

<%@ include file="../include/footerJs.jsp" %>


<script>
function update()
{
	
	cnt =  0;
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			cnt = cnt + 1;
			deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
		}

	}); 
	
	if(cnt != 1)
	{
		alert('대상자의 체크박스를 확인 부탁 드립니다.');
		
		return;
	}
	
	deleteArrIdx = deleteArrIdx.substring(0, deleteArrIdx.length-1);
	location.href = './'+deleteArrIdx+'/update.do?YEAR='+${CheckYear}+'';
}

function matchingUpload(){
	$("#matchingExcelform").submit();
}

function deleteArrClick()
{
	
	cnt =  0;
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			cnt = cnt + 1;
			deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
		}

	}); 
	
	if(deleteArrIdx == '')
	{
		alert('삭제할 대상을를 선택 하여 주세요');
		return;
	}
	
	var URL = './deleteArr.do?MEMBER_ID='+ deleteArrIdx+'&YEAR='+${CheckYear};
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
				alert('삭제되었습니다.');
				var moveUrl = "?SEARCH_TEXT="+encodeURI('${model.boforeDomain.SEARCH_TEXT}');
		    	moveUrl = moveUrl + "&SEARCH_TYPE="+encodeURI('${model.boforeDomain.SEARCH_TYPE}');
		    	
		    	if("${model.boforeDomain.page}" != "")
		    	{
		    		moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
		    	}
		    	
				idchk = true;
				location.href = './list.do?YEAR='+${CheckYear};
				return;
			}else 
			{
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

function searchBtnClick()
{
	
	URL = './list.do';
	URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
	
	if($('#ITEM_COUNT').val() == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
	}
	

	
	URL = URL + "&SUPPORT_GROUP="+$('#SUPPORT_GROUP').val();;
	URL = URL + "&YEAR=" + $('#YEAR').val();
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}


function selectArrChanged(jqueryid)
{
	
	if($('#'+jqueryid+"2").val() == "")
	{
		alert('선택 해주세요.');
		return;	
	}
	
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
		}

	});
	
	if(deleteArrIdx == "")
	{
		alert('대상자를 선택하여 주세요');
		return;	
	}
	
	
	var URL = './TypeToTextUpdateArr.do?';
	
	//var formData = $("#updateform").serialize();
	var formData = "SEARCH_TYPE="+jqueryid;
	formData += "&SEARCH_TEXT="+$('#'+jqueryid+"2").val();
	formData += "&MEMBER_ID="+deleteArrIdx;
	
	
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공하였습니다.');
				location.reload();

			}else
			{
				alert('실패 하였습니다.');
			}
		}
	});
}

function excelDown()
{
	var st = $(":input:radio[name=excelDownType]:checked").val();
	console.log(st);
	
	
}

</script>
 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                                <c:if test="${model.TYPE >= '100' && model.TYPE <= '199'}">
                                <span>학생 프로그램관리</span>
                                </c:if>
                                <c:if test="${model.TYPE >= '200' && model.TYPE <= '299'}">
                                <span>교사프로그램관리</span>
                                </c:if>
                            </div>
 							<form action="../../update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
 							<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
 							<input type="hidden" name="TYPE" value="${model.pageDomain.TYPE}">
 							<input type="hidden" name="IDX" value="${model.pageDomain.IDX}">
 							<input type="hidden" name="WORKBOOK" id="WORKBOOK">
 							
 							
 							<c:if test="${model.pageDomain.TYPE == '101'}">
                            <div class="member_register_wrap">
                               
                                    <div class="title">
                                        <h2>융합과학 프로그램 수정</h2>
                                    </div>
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학년도*</span>
                                                <select class="input_size mr" id="YEAR" NAME="YEAR">
                                                    <option>선택해주세요</option>
													<option value="2020" <c:if test="${model.pageDomain.YEAR == '2020'}">selected</c:if>>2020년도</option>
                                                    <option value="2019" <c:if test="${model.pageDomain.YEAR == '2019'}">selected</c:if>>2019년도</option>
                                                    <option value="2018" <c:if test="${model.pageDomain.YEAR == '2018'}">selected</c:if> >2018년도</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">과정*</span>
                                                <select class="input_size" id="SCHOOL_YEAR" NAME="SCHOOL_YEAR">
                                                    <option value="">선택해주세요</option>
                                                    <option value="24" <c:if test="${model.pageDomain.SCHOOL_YEAR == '24'}">selected</c:if>>전체</option>
													<option value="23" <c:if test="${model.pageDomain.SCHOOL_YEAR == '23'}">selected</c:if>>초등학교</option>
                                                    <option value="22" <c:if test="${model.pageDomain.SCHOOL_YEAR == '22'}">selected</c:if>>중학교</option>
                                                    <option value="21" <c:if test="${model.pageDomain.SCHOOL_YEAR == '21'}">selected</c:if>>고등학교</option>
                                                    <option value="4" <c:if test="${model.pageDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5" <c:if test="${model.pageDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6" <c:if test="${model.pageDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7" <c:if test="${model.pageDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8" <c:if test="${model.pageDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9" <c:if test="${model.pageDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10" <c:if test="${model.pageDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11" <c:if test="${model.pageDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">프로그램명＊</span>
                                                <input class="input_title" type="text" name="NAME" id="NAME" value="${model.pageDomain.NAME}">
                                            </li>
                                            <li>
                                                <span class="list_t">신청기간＊</span>
                                                <input class="input_size mr datecalendar2" type="text" name="START_TM" value="${model.pageDomain.START_TM}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                <span>~</span>
                                                <input class="input_size mr datecalendar2" type="text" name="END_TM" value="${model.pageDomain.END_TM}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                            </li>
                                            <li>
                                                <span class="list_t">동영상주소</span>
                                                <input class="input_size" type="text" name="VIDEO" id="VIDEO" value="${model.pageDomain.VIDEO}">
                                            </li>
                                            <li>
                                                <span class="list_t">첨부파일</span>
                                                <input type="file" id="file0" name="file0"/>
                                                <!-- 
                                                <c:if test="${fn:length(model.pageDomain.FILES) > 0}"><a href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/program/${model.pageDomain.FILES}')">다운로드</a></c:if>
                                                 -->
                                                <span class="relate_c">파일이 여러개인 경우 압축해서 업로드하세요</span>
                                            </li>
                                            <li>
                                                <span class="list_t">워크북</span>
                                                <input type="file" id="file1" name="file1"/>
                                                <!-- 
                                                <c:if test="${fn:length(model.pageDomain.WORKBOOK) > 0}"><a href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/program/${model.pageDomain.WORKBOOK}')">다운로드</a></c:if>
                                                -->
                                                <span class="relate_c">파일이 여러개인 경우 압축해서 업로드하세요</span>
                                            </li>
<!--                                             <li>
                                                <span class="list_t">활성화</span>
                                                <input type="checkbox" name="activation" id="activation">
                                                <span class="relate_c">체크시 활성화 됨</span>
                                            </li> -->
                                            <li>
                                                <textarea id="MEMO" name="MEMO">${model.pageDomain.MEMO}</textarea>
                                            </li>
                                        </ul>
                                    </div>
                              
                            </div>
							</c:if>
							<c:if test="${model.pageDomain.TYPE != '101'}">
							<div style="display:none" >
							<input type="file" name="file1" id="file1">
							</div>
								<div class="member_register_wrap">
                                    <div class="title">
                                    <h2>
                                    <c:if test="${model.TYPE == '101'}">융합과학 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '102'}">창의융합캠프 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '103'}">멘토링데이 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '104'}">자율연구 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '105'}">발명 및 특허교육 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '106'}">기타 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '201'}">교사연수 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '202'}">중앙 컨설팅 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '203'}">성과 발표회 프로그램 수정</c:if>
                                    <c:if test="${model.TYPE == '204'}">발대식 프로그램 수정</c:if>
                                    </h2>
                                    </div>
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학년도*</span>
                                                <select class="input_size mr" id="YEAR" name="YEAR">
                                                    <option value="">선택해주세요</option>
													<option value="2020" <c:if test="${model.pageDomain.YEAR == '2020'}">selected</c:if>>2020년도</option>
                                                    <option value="2019" <c:if test="${model.pageDomain.YEAR == '2019'}">selected</c:if>>2019년도</option>
                                                    <option value="2018" <c:if test="${model.pageDomain.YEAR == '2018'}">selected</c:if> >2018년도</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">과정*</span>
                                                <select class="input_size" id="SCHOOL_YEAR" NAME="SCHOOL_YEAR">
                                                    <option value="">선택해주세요</option>
                                                    <option value="24" <c:if test="${model.pageDomain.SCHOOL_YEAR == '24'}">selected</c:if>>전체</option>
                                                    <option value="23" <c:if test="${model.pageDomain.SCHOOL_YEAR == '23'}">selected</c:if>>초등학교</option>
                                                    <option value="22" <c:if test="${model.pageDomain.SCHOOL_YEAR == '22'}">selected</c:if>>중학교</option>
                                                    <option value="21" <c:if test="${model.pageDomain.SCHOOL_YEAR == '21'}">selected</c:if>>고등학교</option>
                                                    <option value="4" <c:if test="${model.pageDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                    <option value="5" <c:if test="${model.pageDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                    <option value="6" <c:if test="${model.pageDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7" <c:if test="${model.pageDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                    <option value="8" <c:if test="${model.pageDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                    <option value="9" <c:if test="${model.pageDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                    <option value="10" <c:if test="${model.pageDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                    <option value="11" <c:if test="${model.pageDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">프로그램명＊</span>
                                                <input class="input_title" type="text" name="NAME" id="NAME" value="${model.pageDomain.NAME}">
                                            </li>
                                            <li  style="DISPLAY: none;">
                                                <span class="list_t">선발방법＊</span>
                                                <input type="radio" name="SELECTION" id="first" value="1" <c:if test="${model.pageDomain.SELECTION == '1'}">checked</c:if>>
                                                <label for="man">선착순</label>
                                                <input type="radio" name="SELECTION" id="draw" value="2" <c:if test="${model.pageDomain.SELECTION == '2'}">checked</c:if>>
                                                <label for="man">추첨</label>
                                            </li>
                                            <li>
                                                <span class="list_t">신청기간＊</span>
                                                <input class="input_size mr datecalendar2" type="text"  id="START_TM" NAME="START_TM" value="${model.pageDomain.START_TM}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                <span>~</span>
                                                <input class="input_size mr datecalendar2" type="text"  id="END_TM" NAME="END_TM" value="${model.pageDomain.END_TM}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                            </li>
                                            <li>
                                                <span class="list_t">체험기간＊</span>
                                                <input class="input_size mr datecalendar2" type="text"  id="EXPERIENCE_START_TM" NAME="EXPERIENCE_START_TM" value="${model.pageDomain.EXPERIENCE_START_TM}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                <span>~</span>
                                                <input class="input_size mr datecalendar2" type="text"  id="EXPERIENCE_END_TM" NAME="EXPERIENCE_END_TM" value="${model.pageDomain.EXPERIENCE_END_TM}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                            </li>
                                            <li>
                                                <span class="list_t">정원＊</span>
                                                <input class="input_size" type="text" name="SCHOOL_CNT" id="SCHOOL_CNT" value="${model.pageDomain.SCHOOL_CNT}" >
                                                <span>명</span>
                                            </li>
                                            <!--
                                            <li>
                                                <span class="list_t">참가비</span>
                                                <input class="input_size" type="text" name="SCHOOL_MONEY" id="SCHOOL_MONEY" value="${model.pageDomain.SCHOOL_MONEY}">
                                                <span>원</span>
                                            </li>
                                            <li>
                                                <span class="list_t">계좌번호</span>
                                                <input class="input_size" type="text" name="BANK_NAME" id="BANK_NAME" value="${model.pageDomain.BANK_NAME}">
                                            </li>
                                            -->
                                            <c:if test="${model.TYPE != '1'}">
                                            <li>
                                                <span class="list_t">버스탑승지</span>
                                                <input class="input_size" type="text" name="BUS_STATION" id="BUS_STATION" value="${model.pageDomain.BUS_STATION}">
                                                <input class="input_size" type="text" id="BUS_STATION2" readonly>
                                                <input type="checkbox" id="BUS_CHECKBOX" name="BUS_CHECKBOX"  <c:if test="${model.pageDomain.BUS_STATION != ''}">checked</c:if>>
                                                <span class="relate_c">체크 시 활성화됩니다.</span>
                                            </li>
                                            </c:if>
                                            <li>
                                                <span class="list_t">첨부파일</span>
                                                <input type="file" id="file0" name="file0"/>
                                                <c:if test="${fn:length(model.pageDomain.FILES) > 0}"><a href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/program/${model.pageDomain.FILES}')">다운로드</a></c:if>
                                                <span class="relate_c">파일이 여러개인 경우 압축해서 업로드하세요</span>
                                            </li>
<!--                                             <li>
                                                <span class="list_t">활성화</span>
                                                <input type="checkbox" name="activation" id="activation">
                                                <span class="relate_c">체크시 활성화 됨</span>
                                            </li> -->
                                            <li>
                                                <textarea id="MEMO" name="MEMO">${model.pageDomain.MEMO}</textarea>
                                            </li>
                                        </ul>
                                    </div>
                            </div>							
							</c:if>
						    </form>
                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con float-rt">
                                    <a class="storage" href="javascript:insertClick()">프로그램 저장</a>
                                    <a class="view_list" href="../list.do">목록보기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/program.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

</body></html>



<script>
<c:if test="${model.TYPE == '2'}">
$('#BUS_STATION').hide();
</c:if>

if($('#BUS_STATION').val() != '')
{
	$('#BUS_STATION').show();
	$('#BUS_STATION2').hide();
}

$(document).on("click", "#BUS_CHECKBOX", function(e) {

if ($(this).prop('checked')) {
	$('#BUS_STATION').show();
	$('#BUS_STATION2').hide();
} else {
	$('#BUS_STATION').hide();
	$('#BUS_STATION2').show();

}
});

function insertClick()
{
	
	if($('#NAME').val() == '')
	{
		alert('프로그램명을 입력 하여 주세요');
		return;
	}
	if($('#YEAR').val() == '')
	{
		alert('학년도를 선택 하여 주세요');
		return;
	}
	if($('#SCHOOL_YEAR').val() == '')
	{
		alert('과정을 선택 하여 주세요');
		return;
	}
	
	if($('#SCHOOL_CNT').val() == '')
	{
		alert('정원을 입력  하여 주세요');
		return;
	}
	
	if($('#SCHOOL_MONEY').val() == '')
	{
		alert('참가비를 입력 하여 주세요');
		return;
	}
	<c:if test="${model.TYPE != '1'}">
	if($('#START_TM').val() == '')
	{
		alert('신청기간을 확인 하여 주세요');
		return;
	}
	if($('#END_TM').val() == '')
	{
		alert('신청기간을 확인 하여 주세요');
		return;
	}
	
	if($('#EXPERIENCE_START_TM').val() == '')
	{
		alert('체험기간을 확인 하여 주세요');
		return;
	}
	
	if($('#EXPERIENCE_END_TM').val() == '')
	{
		alert('체험기간을 확인 하여 주세요');
		return;
	}
	
	</c:if>
	
	
	if( !($('#file1')[0].files[0] == "" || $('#file1')[0].files[0] == null 
			|| $('#file1')[0].files[0] == undefined 
			|| ( $('#file1')[0].files[0] != null && typeof value == "object" 
					&& !Object.keys($('#file1')[0].files[0]).length ) ))
	{
		
		$('#WORKBOOK').val($('#file1')[0].files[0].name);
		
	}else
	{
		console.log('파일없음');
	}
	
	$('#updateform').submit();
}


</script>
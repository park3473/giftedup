<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/program.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    // ckeditor setting
    var ckeditor_config = {
        allowedContent : true,
        resize_enabled : false, // 에디터 크기를 조절하지 않음
        enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
        shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
        toolbarCanCollapse : true,
        removePlugins : "elementspath", // DOM 출력하지 않음                        
        filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditor/file_upload.do', // 파일 업로드를 처리 할 경로 설정.
        height : '500px',
        // 에디터에 사용할 기능들 정의
        toolbar : [
            [  'Source','NewPage', 'Preview' ],
            [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
            [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript' ],
            ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
            [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], '/',
            ['Image','Link','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
            ['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize', 'ShowBlocks','-'],
            [ 'About' ] ]
    };

    var editor = null;

    jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace("COMM_SUMMARY", ckeditor_config);
    });

    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;

        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    CKEDITOR.replace('editor',{
    	contentsCss: '${pageContext.request.contextPath}/ckeditor/test.css'
    });
    
    //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';
	
    
    
</script>
<!--css-->
<link rel="stylesheet" href="/resources/css/admin/jquery.datetimepicker.css">
    <%@ include file="../include/head.jsp" %> 
</head>
<style>
	.table_wrap table tr th{
	text-align : center;
	}
	
	
	#cke_COMM_SUMMARY{
		display:none;
	}
	
</style>
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
                        <input type="hidden" name="COMM_IDX" value="${model.View.COMM_IDX }">
                        <div class="sc_con"  id="div_con">
                            <div class="title">
                                <span></span>
                                <span>커뮤니케이터 - 강좌 상세보기</span>
                            </div>

                            <div class="member_register_wrap">

                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">강좌명</span>
                                                <input class="input_address mr" type="text" name="COMM_NAME" id="COMM_NAME" placeholder="이름"  value="${model.View.COMM_NAME}" >
                                            </li>
                                            <li>
                                                <span class="list_t">강의 인원</span>
                                                <input class="input_size mr" type="text" name="COMM_PERSONNEL" id="COMM_PERSONNEL"  value="${model.View.COMM_PERSONNEL}" >
                                                /
                                                <input class="input_size mr" type="text" name="COMM_PERSONNEL_Cnt" id="COMM_PERSONNEL_Cnt"  value="${model.StudentList.size()}" readonly="readonly">
                                            </li>
                                            <li>
                                                <span class="list_t">강의 상태</span>
												<select class="input_size mr" name="COMM_STAT" id="COMM_STAT">
													<option value="0" <c:if test="${model.View.COMM_STAT == '0' }">selected="selected"</c:if>>개설완료</option>
													<option value="1" <c:if test="${model.View.COMM_STAT == '1' }">selected="selected"</c:if>>접수중</option>
													<option value="2" <c:if test="${model.View.COMM_STAT == '2' }">selected="selected"</c:if>>접수완료</option>
													<option value="3" <c:if test="${model.View.COMM_STAT == '3' }">selected="selected"</c:if>>준비중</option>
													<option value="4" <c:if test="${model.View.COMM_STAT == '4' }">selected="selected"</c:if>>강의중</option>
													<option value="5" <c:if test="${model.View.COMM_STAT == '5' }">selected="selected"</c:if>>강의완료</option>
												</select>
                                            </li>
                                            <li>
                                                <span class="list_t">강의 시간</span>
                                                <input class="input_size mr" type="text" name="COMM_START_TM" id="COMM_START_TM"  value="${fn:substring(model.View.COMM_START_TM,0,16)}" >
                                                ~
                                                <input class="input_size mr" type="text" name="COMM_END_TM" id="COMM_END_TM"  value="${fn:substring(model.View.COMM_END_TM,0,16)}" >
                                            </li>
                                            <li>
                                            	<span class="list_t">강의 교사 이름</span>
                                                <input class="input_size" type="text" name="COMM_MENTO_NAME" id="COMM_MENTO_NAME" value="${model.View.COMM_MENTO_NAME}" readonly="readonly">
                                            </li>
                                            <li>
                                            	<span class="list_t">강의 교사 아이디</span>
                                            	<input class="input_size" type="text" name="COMM_MENTO" id="COMM_MENTO" value="${model.View.COMM_MENTO}" readonly="readonly">
                                            </li>
                                            <li>
                                                <span class="list_t">강의 교사 이메일</span>
                                                <input class="input_size" type="text" name="COMM_EMAIL" id="COMM_EMAIL" value="${model.View.COMM_EMAIL}" readonly="readonly">
                                            </li>
                                            <li>
                                                <span class="list_t">강의 교사 지역</span>
                                                <input class="input_size" type="text" name="COMM_LOCAL" id="COMM_LOCAL" value="${model.View.COMM_LOCAL}" readonly="readonly">
                                            </li>
                                            <li>
                                                <span class="list_t">강의 분야</span>
                                                <select class="input_size mr" name="COMM_TYPE" id="COMM_TYPE">
                                                	<option value="수학" <c:if test="${model.View.COMM_TYPE == '수학' }">selected="selected"</c:if> >수학</option>
                                                	<option value="과학" <c:if test="${model.View.COMM_TYPE == '과학' }">selected="selected"</c:if> >과학</option>
                                                	<option value="융합" <c:if test="${model.View.COMM_TYPE == '융합' }">selected="selected"</c:if> >융합</option>
                                                	<option value="정보" <c:if test="${model.View.COMM_TYPE == '정보' }">selected="selected"</c:if> >정보</option>
                                                	<option value="인문" <c:if test="${model.View.COMM_TYPE == '인문' }">selected="selected"</c:if> >인문</option>
                                                	<option value="예술" <c:if test="${model.View.COMM_TYPE == '예술' }">selected="selected"</c:if> >예술</option>
                                                	<option value="기타" <c:if test="${model.View.COMM_TYPE == '기타' }">selected="selected"</c:if> >기타</option>
                                                </select>
                                            </li>
                                            <c:if test="${model.SuppliesList.size() > 0 }">
                                            <li class="table_wrap">
                                            	<span class="list_t">강의 준비물</span>
                                            	<table>
                                            		<thead>
                                            			<tr>
                                            				<th>준비물 명</th>
                                            				<th>준비물 링크</th>
                                            				<th>준비물 갯수</th>
                                            				<th>준비물 가격</th>
                                            			</tr>
                                            		</thead>
                                            		<tbody>
                                            			<c:forEach items="${model.SuppliesList }" var="SupList" varStatus="status">
                                            				<tr>
                                            					<td>${SupList.SUP_NAME }</td>
                                            					<c:if test="${fn:substring(SupList.SUP_LINK,0,1) == 'h'}">
                                            						<td onclick="window.open('${SupList.SUP_LINK}')">
                                            							링크 이동
                                            						</td>
                                            					</c:if>
                                            					<c:if test="${fn:substring(SupList.SUP_LINK,0,1) != 'h'}">
                                            						<td>
                                            							${SupList.SUP_LINK }
                                            						</td>
                                            					</c:if>
                                            					<td>${SupList.SUP_AMOUNT }</td>
                                            					<td>${SupList.SUP_PRICE }</td>
                                            				</tr>
                                            			</c:forEach>
                                            		</tbody>
                                            	</table>
                                            </li>
                                            </c:if>
                                            <li>
                                                <span class="list_t">강의 대상 학년</span>
                                                <input class="input_size" type="text" name="COMM_SCHOOL_YEAR" id="TEL" value="${model.View.COMM_SCHOOL_YEAR}">
                                            </li>
                                            <li>
                                                <span class="list_t">강의 교사 소속 학교</span>
                                                <input class="input_size" type="text" name="COMM_SCHOOL_NAME" id="COMM_SCHOOL_NAME" value="${model.View.COMM_SCHOOL_NAME}" readonly="readonly">
                                            </li>
                                             <li>
                                                <span class="list_t">강의 자료</span>
                                                <c:if test="${model.View.COMM_FILE != ''}">
                                                <a class="pro_file_btn" href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/communicator/${model.View.COMM_FILE}">
                                                  다운로드
                                                </a>
                                                </c:if>
                                                <c:if test="${model.View.COMM_FILE == '' }">
                                                	강의 자료 X
                                                </c:if>
                                            </li>
                                            <li>
                                            	<span class="list_t">강의 개요</span>
                                            	<a class="cke_on_btn" onclick="$('.cke_on_btn').css('display','none'); $('#cke_COMM_SUMMARY').css('display','block');">강의 개요 보기</a>
                                            	<textarea id="COMM_SUMMARY" name="COMM_SUMMARY">${model.View.COMM_SUMMARY }</textarea>
                                            </li>
                                        </ul>
                                    </div>
                                    <c:if test="${model.StudentList.size() > 0 }">
                                    <div class="title">
		                                <h2>학생 평가</h2>
		                            </div>
                                    <c:forEach items="${model.StudentList }" var="item" varStatus="status">
                                     <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학생명</span>
                                                <input class="input_size mr" type="text" name="STU_NAME" id="STU_NAME" value="${item.STU_NAME }" readonly="readonly" disabled>
                                            </li>
                                            <li>
                                                <span class="list_t">소속학교</span>
                                                <input class="input_size mr" type="text" name="STU_SCHOOL_NAME" id="STU_SCHOOL_NAME" value="${item.STU_SCHOOL_NAME }" readonly="readonly" disabled>
                                            </li>
                                            <li>
                                                <span class="list_t">학년</span>
                                                <input class="input_size mr" type="text" name="STU_SCHOOL_YEAR" id="STU_SCHOOL_YEAR" value="${item.STU_SCHOOL_YEAR }" readonly="readonly" disabled>
                                            </li>
                                            <li>
                                                <span class="list_t">학생 연락처</span>
                                                <input class="input_size mr" type="text" name="STU_PHONE" id="STU_PHONE" value="${item.STU_PHONE }" readonly="readonly" disabled>
                                            </li>
                                            <li>
                                                <span class="list_t">멘토 연락처</span>
                                                <input class="input_size mr" type="text" name="MENTO_PHONE" id="MENTO_PHONE" value="${item.MENTO_PHONE }" readonly="readonly" disabled>
                                            </li>
                                            <li>
                                                <span class="list_t">학생 평가</span>
                                                <input class="input_size mr" type="number" name="STU_EVAL" id="STU_EVAL" value="${item.STU_EVAL }" readonly="readonly" disabled>
                                            </li>
                                        </ul>
                                    </div>
                                    </c:forEach>
                                    </c:if>
                            </div>
                           </form>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>

    <!--  JQuery  -->
</body>
</html>

<script src="/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<!-- 다음 주소 검색 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--부트스트랩 js-->
<script src="/resources/js/bootstrap/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var styear = $('#STU_SCHOOL_YEAR').val();
		switch(styear){
		case '4' :
			$('#STU_SCHOOL_YEAR').val('초등학교4학년');
			break;
		case '5' :
			$('#STU_SCHOOL_YEAR').val('초등학교5학년');
			break;
		case '6' :
			$('#STU_SCHOOL_YEAR').val('초등학교6학년');
			break;
		case '7' :
			$('#STU_SCHOOL_YEAR').val('중학교1학년');
			break;
		case '8' :
			$('#STU_SCHOOL_YEAR').val('중학교2학년');
			break;
		case '9' :
			$('#STU_SCHOOL_YEAR').val('중학교3학년');
			break;
		case '10' :
			$('#STU_SCHOOL_YEAR').val('고등학교1학년');
			break;
		}
		
	})
	
	
	$(window).load(function(){
		
		jQuery(function() {
	        // ckeditor 적용
	        editor = CKEDITOR.replace("COMM_SUMMARY", ckeditor_config);
			        
	        
	    });

	});
	
	
</script>

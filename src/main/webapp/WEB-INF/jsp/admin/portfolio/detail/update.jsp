 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp" %> 
</head>

<body>
    <!--헤더-->
	<%@ include file="../../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>포트폴리오</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data" >
                                
                                 	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                 	<input type="hidden"  name="IDX" value="${model.pageDomain.IDX}" />
                                 	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                 	
                                 	<div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">과목</span>
                                                <input class="input_size mr" type="text" value="${model.pageDomain.PROGRAM_NAME }" readonly>
                                            </li>
                                            <li>
                                                <span class="list_t">교육시간</span>
                                                <input class="input_size mr datecalendar" type="text" name="START_TM" value="${fn:substring(model.pageDomain.START_TM ,0,11)}" placeholder="달력을 선택해주세요.">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                <span class="mr-rt-05">~</span>
                                                <input class="input_size mr datecalendar" type="text" name="END_TM" value="${fn:substring(model.pageDomain.START_TM ,0,11)}">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                            </li>
                                            <li>
                                                <span class="list_t">장소</span>
                                                <input class="input_size mr" type="text" name="PLACE" value="${model.pageDomain.PLACE}">
                                            </li>
                                            <li>
                                                <span class="list_t">강사</span>
                                                <input class="input_size mr" type="text" name="TEACHER" value="${model.pageDomain.TEACHER}">
                                            </li>
                                            <li>
                                                <span class="list_t">관찰내용</span>
                                                <textarea id="CONTENT" name="CONTENT" >${model.pageDomain.CONTENT}</textarea>
                                            </li>
                                            <li>
                                                <span class="list_t">프로그램 평가</span>
                                                <textarea  id="EVALUATION" name="EVALUATION" >${model.pageDomain.EVALUATION}</textarea>
                                            </li>
                                            <li>
                                                <span class="list_t">교사 평가</span>
                                                <textarea  id="EVALUATION_TACHER" name="EVALUATION_TACHER" >${model.pageDomain.EVALUATION_TACHER}</textarea>
                                            </li>
                                            <li>
                                            	<span class="list_t">파일</span>
                                                <input type="file" id="file" name="file"/>
                                                <span class="relate_c">
                                                	<c:if test="${model.pageDomain.FILES != '' && model.pageDomain.FILES != null}">
	                                            	<a href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/portfolio/${model.pageDomain.FILES}')">다운로드</a>
	                                            	</c:if>
                                                </span>
                                            </li>
                                       	</ul>
                                    </div>
                             	</form>
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:insertClick()">저장하기</a>
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
	<%@ include file="../../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/program.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

</body></html>

<script type="text/javascript">
	

	function insertClick()
	{
		
		if($('#TITLE').val() == '')
		{
			alert('제목을 입력 하여 주세요');
			return;
		}
	
		
		
		$('#updateform').submit();
	}
</script>

                               
                        
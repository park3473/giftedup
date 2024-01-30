 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
	           					<span>
	                                <c:if test="${model.CODE != 'survey'}">전수 조사 관리</c:if>
	                                <c:if test="${model.CODE == 'survey'}">설문 조사 관리</c:if>
                                </span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />

                                	
                                	
                                    <div class="member_input_wrap">
                        <ul class="member_input">
                            <li>
                                <span class="list_t">제목</span>
                                <input class="input_title" type="text" NAME="TITLE" ID="TITLE">
                            </li>
                            <li>
                                <span class="list_t">간략설명</span>
                                <input class="input_title" type="text" NAME="CONTENT" ID="CONTENT">
                            </li>
                            <li>
                                <span class="list_t">시작시간</span>
                                <input class="input_size mr datecalendar" type="text" NAME="START_TM" ID="START_TM" placeholder="달력을 선택해주세요.">
                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                            </li>
                            <li>
                                <span class="list_t">종료시간</span>
                                <input class="input_size mr datecalendar" type="text" NAME="END_TM" ID="END_TM" placeholder="달력을 선택해주세요.">
                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                            </li>
                            <li style="display:none;">
                                <span class="list_t">진행여부</span>
                                <input type="radio" name="TYPE" ID="TYPE" value="1" checked>
                                <label>이미지배너</label>
                                <input type="radio" name="TYPE" ID="TYPE2" value="2">
                                <label>플래시배너</label>
                            </li>
                            <li>
                                <span class="list_t">설문지 대상</span>
                                <input type="radio" name="TYPE_SUB" ID="TYPE_SUB0" value="0" checked>
                                <label>전체</label>
                                <input type="radio" name="TYPE_SUB" ID="TYPE_SUB1" value="1">
                                <label>학생</label>
                                <input type="radio" name="TYPE_SUB" ID="TYPE_SUB2" value="2">
                                <label>교사</label>
                            </li>
                            				<input class="input_size" type="hidden" NAME="WIDTH" ID="WIDTH" value="0">
				                            <input class="input_size" type="hidden" NAME="HEIGHT" ID="HEIGHT" value="0">
				                            <input class="input_size" type="hidden" NAME="POINT_X" ID="POINT_X" value="0">
				                            <input class="input_size" type="hidden" NAME="POINT_Y" ID="POINT_Y" value="0">
                            <!-- <li>
                                <span class="list_t">팝업창 크기</span>
                                <span>가로크기</span>
                                <input class="input_size" type="text" NAME="WIDTH" ID="WIDTH">
                                <span style="margin-right:50px;">px</span>
                                <span>세로크기</span>
                                <input class="input_size" type="text" NAME="HEIGHT" ID="HEIGHT">
                                <span>px</span>
                            </li>
                            <li>
                                <span class="list_t">팝업창 위치</span>
                                <span>왼쪽여백</span>
                                <input class="input_size" type="text" NAME="POINT_X" ID="POINT_X">
                                <span style="margin-right:50px;">px</span>
                                <span>위쪽여백</span>
                                <input class="input_size" type="text" NAME="POINT_Y" ID="POINT_Y">
                                <span>px</span>
                            </li> -->
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/starts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

</body></html>

<script type="text/javascript">


	function insertClick()
	{
		/* if($('#WIDTH').val() == '')
		{
			alert('너비를 입력 하여 주세요');
			return;
		}
		if($('#HEIGHT').val() == '')
		{
			alert('높이를 입력 하여 주세요');
			return;
		}
		 */
		if($('#TITLE').val() == '')
		{
			alert('제목을 입력 하여 주세요');
			return;
		}
	
		$('#updateform').submit();
	}
</script>
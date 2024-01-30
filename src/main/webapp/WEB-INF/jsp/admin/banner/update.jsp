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
                                <span>배너 관리</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                	<input class="input_size8" type="hidden" name="IMAGE" id="IMAGE" value="${model.pageDomain.IMAGE}">
                                	<input class="input_size8" type="hidden" name="IDX" id="IDX" value="${model.pageDomain.IDX}">
                                	<input class="input_size8" type="hidden" name="TURN" id="TURN" value="0">
                                	
                                	<input class="input_size8" type="hidden" name="WIDTH" id="WIDTH" value="1">
                                	<input class="input_size8" type="hidden" name="HEIGHT" id="HEIGHT" value="1">
                                	<input class="input_size8" type="hidden" name="TYPE" id="TYPE" value="1">
                                	
                                	
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">제목</span>
                                                <input class="input_size7" type="text" id="NAME" NAME="NAME" VALUE="${model.pageDomain.NAME}">
                                            </li>
                                          <%--   <li>
                                                <span class="list_t">배너형식</span>
                                                <input type="radio"  id="TYPE" NAME="TYPE" VALUE="1" <c:if test="${fn:indexOf(model.pageDomain.TYPE, '1') > -1}">checked</c:if>>
                                                <label>이미지배너</label>
                                                <input type="radio" id="TYPE" NAME="TYPE" VALUE="2" <c:if test="${fn:indexOf(model.pageDomain.TYPE, '2') > -1}">checked</c:if>>
                                                <label>플래시배너</label>
                                            </li> --%>
                                            <li>
                                                <span class="list_t">파일선택</span>
                                                <input class="input_size" type="file" id="file" NAME="file" VALUE="">
                                                
                                                <c:if test="${model.pageDomain.FILES != '' && model.pageDomain.FILES != null}">
                                            	<a class="relate_c" href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/banner/${model.pageDomain.FILES}')">다운로드</a>
                                            	</c:if>
                                            
                                            
                                            </li>
                                            <li>
                                                <span class="list_t">링크주소</span>
                                                <input class="input_size7" type="text" id="LINK" NAME="LINK" VALUE="${model.pageDomain.LINK}">
                                                <select class="input_size1" id="LINK_TYPE" NAME="LINK_TYPE" VALUE="${model.pageDomain.LINK_TYPE}">
                                                    <option value="">현재창</option>
                                                    <option value="_blank" <c:if test="${fn:indexOf(model.pageDomain.LINK_TYPE, '_blank') > -1}">checked</c:if>>새창</option>
                                                </select>
                                            </li>
                                       <%--      <li>
                                                <span class="list_t">너비</span>
                                                <input class="input_size" type="text" id="WIDTH" NAME="WIDTH" VALUE="${model.pageDomain.WIDTH}">
                                                <span style="margin-right:50px;">px</span>
                                            </li>
                                            <li>
                                                <span class="list_t">높이</span>
                                                <input class="input_size" type="text" id="HEIGHT" NAME="HEIGHT" VALUE="${model.pageDomain.HEIGHT}">
                                                <span style="margin-right:50px;">px</span>
                                            </li> --%>
                                            <li>
                                                <span class="list_t">시작시간</span>
                                                <input class="input_size mr datecalendar2" type="text" id="START_TM" NAME="START_TM" VALUE="${model.pageDomain.START_TM}" placeholder="달력을 선택해주세요.">
                                                <!-- <a class="mr-3" href="#"><img src="../img/admin/calendar.png" alt="달력" /></a> -->
                                                <span class="relate_c">시작시간을 엽력하세요</span>
                                            </li>
                                            <li>
                                                <span class="list_t">종료시간</span>
                                                <input class="input_size mr datecalendar2" type="text" id="END_TM" NAME="END_TM" value="${model.pageDomain.END_TM}" placeholder="달력을 선택해주세요.">
                                                
                                                <!-- <a class="mr-3" href="#"><img src="../img/admin/calendar.png" alt="달력" /></a> -->
                                                <span class="relate_c">종료시간을 엽력하세요</span>
                                            </li>
                                            <li>
                                                <span class="list_t">출력여부</span>
                                                <input type="radio"  id="USEKEY" NAME="USEKEY" VALUE="1" <c:if test="${fn:indexOf(model.pageDomain.USEKEY, '1') > -1}">checked</c:if>>
                                                <label>출력함</label>
                                                <input type="radio"  id="USEKEY2" NAME="USEKEY" VALUE="0" <c:if test="${fn:indexOf(model.pageDomain.USEKEY, '0') > -1}">checked</c:if>>
                                                <label>출력안함</label>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>

</body></html>

<script type="text/javascript">


	function insertClick()
	{
		if($('#START_TM').val() == '')
		{
			alert('너비를 입력 하여 주세요');
			return;
		}
		if($('#END_TM').val() == '')
		{
			alert('높이를 입력 하여 주세요');
			return;
		}
		
		if($('#TITLE').val() == '')
		{
			alert('제목을 입력 하여 주세요');
			return;
		}
	
		$('#updateform').submit();
	}
</script>
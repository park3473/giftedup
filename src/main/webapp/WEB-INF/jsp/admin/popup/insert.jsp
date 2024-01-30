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
                                <span>팝업관리</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform"  enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                	<input type="hidden"  name="CONTENT" value="CONTENT" />
                                	
                                	
                                	<input class="input_size8" type="hidden" name="IMAGE" id="IMAGE" value="${model.pageDomain.IMAGE}">
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                        	<li>
                                                <span class="list_t">제목</span>
                                                <input class="input_title" type="text" ID="TITLE" NAME="TITLE" VALUE="">
                                            </li>
                                            <li>
                                                <span class="list_t">파일선택</span>
                                                <input class="input_size" type="file" id="file" NAME="file" VALUE="">
                                            </li>
                                            <li>
                                                <span class="list_t">시작 기간</span>
                                                <input class="input_size datecalendar2" type="text" ID="START_TM" NAME="START_TM" VALUE="" placeholder="달력을 선택해주세요.">
                                                
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                <span class="list_t_g relate_c">시작기간을 선택해주세요.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">종료 기간</span>
                                                <input class="input_size datecalendar2" type="text" ID="END_TM" NAME="END_TM" VALUE="" placeholder="달력을 선택해주세요.">
                                               
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources//img/admin/calendar.png" alt="달력" /></a> -->
                                                <span class="list_t_g relate_c">종료기간을 선택해주세요.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">출력여부</span>
                                                <input type="radio" ID="USEKEY1" NAME="USEKEY" VALUE="1" checked>
                                                <label>출력함</label>
                                                <input type="radio" ID="USEKEY2" NAME="USEKEY" VALUE="2">
                                                <label>출력안함</label>
                                            </li>
                                            <li>
                                                <span class="list_t">출력형식</span>
                                                <input type="radio" ID="TYPE" NAME="TYPE" VALUE="1" checked>
                                                <label>레이어</label>
                                                <!-- 
                                                <input type="radio" ID="TYPE2" NAME="TYPE" VALUE="2">
                                                <label>팝업</label>
                                                 -->
                                            </li>
                                            <!-- 
                                            <li>
                                                <span class="list_t">팝업창 크기</span>
                                                <span>가로크기</span>
                                                <input class="input_size" type="text" ID="WIDTH" NAME="WIDTH" VALUE="0"> 
                                                <span style="margin-right:50px;">px</span>
                                                <span>세로크기</span>
                                                <input class="input_size" type="text" ID="HEIGET" NAME="HEIGHT" VALUE="0">
                                                <span>px</span>
                                            </li>
                                            <li>
                                                <span class="list_t">팝업창 위치</span>
                                                <span>왼쪽여백</span>
                                                <input class="input_size" type="text" ID="POINT_Y" NAME="POINT_Y" VALUE="0">
                                                <span style="margin-right:50px;">px</span>
                                                <span>위쪽여백</span>
                                                <input class="input_size" type="text" ID="POINT_X" NAME="POINT_X" VALUE="0">
                                                <span style="margin-right:50px;">px</span>

                                            </li>
                                             -->
                                            <li>
                                                <span class="list_t">링크주소</span>
                                                <input class="input_address" type="text" ID="LINKS" NAME="LINKS" VALUE=""> 
                                                <select class="input_size" ID="LINKS_TYPE" NAME="LINKS_TYPE">
                                                    <option value="">현재창</option>
                                                    <option value="_blank">새창</option>
                                                </select>
                                            </li>
                                            <!--
                                            <li>
                                                <span class="list_t">팝업내용</span>
                                                <textarea class="input_txtarea" ID="CONTENT" NAME="CONTENT" VALUE=""></textarea>
                                            </li>
                                             -->
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
		
		if($('#TITLE').val() == '')
		{
			alert('제목을 입력 하여 주세요');
			return;
		}
	
		
		
		$('#updateform').submit();
	}
</script>
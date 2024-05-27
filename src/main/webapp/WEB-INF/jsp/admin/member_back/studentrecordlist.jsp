<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
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
                                <span>회원목록관리</span>
                                
                            </div>
                            <form action="./insert.do?" method="post" name="updateform" id="updateform">
                                <div class="member_seach_form">
                                    <div class="member_01_wrap">
                                        <form>
                                            <div class="form_01">
                                            
                                                <div class="page_seach">
                                                    
                                                    <select ID="TYPE" NAME="TYPE">
                                                        <option value="">회원구분</option>
                                                        <option value="2" <c:if test="${model.beforeDomain.TYPE == '2'}">selected</c:if>>교사</option>
                                                        <option value="1" <c:if test="${model.beforeDomain.TYPE == '1'}">selected</c:if>>학생</option>
                                                    </select>
                                                    
                                                    <select ID="SCHOOL_YEAR" NAME="SCHOOL_YEAR">
                                                        <option value="">학년</option>
                                                        <option value="4" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                        <option value="5" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                        <option value="6" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                        <option value="7" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                        <option value="8" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                        <option value="9" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                        <option value="10" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                        <option value="11" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                        <option value="12" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                                    </select>

                                                    <select ID="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                                        <option value="ALL">전체</option>
                                                        <option value="NAME" <c:if test="${model.beforeDomain.NAME == 'NAME'}">selected</c:if>>성명</option>
                                                        <option value="MEMBER_ID" <c:if test="${model.beforeDomain.MEMBER_ID == 'MEMBER_ID'}">selected</c:if>>회원아이디</option>
                                                        <option value="SCHOOL_NAME" <c:if test="${model.beforeDomain.SCHOOL_NAME == 'SCHOOL_NAME'}">selected</c:if>>소속학교</option>
                                                        <option value="PHONE" <c:if test="${model.beforeDomain.PHONE == 'PHONE'}">selected</c:if>>연락처</option>
                                                    </select>
                                                    
                                                    <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="내용을 입력해주세요.">
                                                    <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                    <a class="w_btn" href="javascript:location.reload()">새로고침</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    
                                    
                                    <!-- 문자 발송  -->
                                    <div class="member_03_wrap">
                                        <form>
                                            <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span> / 2000byte)</span>
                                            <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                            <input type="checkbox" id="RESERVATION" name="RESERVATION"  >
                                            <input class="datecalendar2" type="text"  value="" id="RESERVATION_TM" name="RESERVATION_TM" readonly style="DISPLAY: none;">
                                            <input  type="text"  value="" id="RESERVATION_TM2" name="RESERVATION_TM2" readonly>
                                            <%-- <span><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" /></span> --%>
                                            
                                            <button type="button" onClick="javascript:smssend('member')" value="문자발송">문자발송</button>
                                            <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/member/list.do">발송내역</a>
                                        </form>
                                    </div>
                                    <!-- 문자 종료  -->
                                </div>
                            </form>

                            <div class="table_wrap">
                                <table>
                                    <tr>
                                        <th class="number">순번</th>
                                        <th class="name">학생이름</th>
                                        <th class="name_id">아이디</th>
                                        <th class="phone">휴대전화</th>
                                        <th class="exp_data">참여학년도</th>
                                        <th class="school_year">학년</th>
                                        <th class="school_name">소속학교</th>
                                        <th class="delete_type">비고</th>
                                    </tr>
                                    
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td><a href="./${item.MEMBER_ID}/update.do">${item.MEMBER_ID}</a></td>
                                        <td><a href="./${item.MEMBER_ID}/update.do">${item.NAME}</a></td>
                                        <td>${item.PHONE}</td>
                                        <td>
                                            20${item.EXP_DATA }
                                        </td>
                                        <td>
                                            <c:if test="${item.SCHOOL_YEAR == '4'}">초등학교4학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '5'}">초등학교5학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '6'}">초등학교6학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '7'}">중학교1학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '8'}">중학교2학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '9'}">중학교3학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '10'}">고등학교1학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '11'}">고등학교2학년</c:if>
                                            <c:if test="${item.SCHOOL_YEAR == '12'}">고등학교3학년</c:if>
                                        </td>
                                        <td>
                                        	${item.SCHOOL_NAME }
                                        </td>
                                        <td><a class="w_btn">자퇴</a></td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>



                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <%@ include file="../include/pageing.jsp" %>
                            </nav>
                            <!--페이지 넘버 end-->
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

</body>

</html>

<%@ include file="../include/footerJs.jsp" %>


<script>
    
    
    function searchBtnClick() {
        URL = '${requestURI}';
        URL = URL + "?PAGE=0";
        
        if($('#ITEM_COUNT').val() == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
        }

        URL = URL + "&LEVEL="+$('#LEVEL').val();;
        URL = URL + "&TYPE=" + $('#TYPE').val();
        URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();

        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

    function levelChangedArr() {
        if($('#LEVEL2').val() == "") {
            alert('회원등급을 선택 해주세요.');
            return;	
        }

        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == "") {
            alert('회원을 선택 해주세요.');
            return;	
        }

        var URL = './TypeToTextUpdateArr.do?';

        //var formData = $("#updateform").serialize();
        var formData = "SEARCH_TYPE=LEVEL";
        formData += "&SEARCH_TEXT="+$('#LEVEL2').val();
        formData += "&MEMBER_ID="+deleteArrIdx;
        

        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    //$('.modal').click();
                    window.location.reload();
                }else {
                    alert('실패 하였습니다.');
                    //$('.modal').click();
                }
            }
        });
    }

    function dormancyUpdate() {
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {
            var chk = $(this).is(":checked");
            console.log(chk);
            if(chk == true) {
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }
        }); 

        if(deleteArrIdx == "") {
            alert('회원을 선택 해주세요.');
            return;	
        }

        var URL = './TypeToTextUpdateArr.do?';

        //var formData = $("#updateform").serialize();
        var formData = "SEARCH_TYPE=DORMANCY";
        formData += "&SEARCH_TEXT=1";
        formData += "&MEMBER_ID="+deleteArrIdx;

        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    window.location.reload();	
                }else {
                    alert('실패 하였습니다.');
                }
            }
        });
    }

    function excelDown() {
        deleteArrIdx = "";
        var member_id = "";
        var cnt = 0;
        $("input[name=chk_calc]").each(function() {
            var chk = $(this).is(":checked");
            console.log(chk);
            if(chk == true) {
                deleteArrIdx = deleteArrIdx + "'"+$(this).data("id") + "',";
                member_id = $(this).data("id");
                cnt = cnt + 1;
            }
        }); 

       
        var st = $(":input:radio[name=excelDownType]:checked").val();
        //console.log(st);

        if("INFO_AGREEMENT" == st) {
            if(cnt != 1) {
                alert('한개만 선택 하여 주세요');
                return;
            }else {
                $('#iframe2').show();
                $('#iframeDiv').attr('src', '${pageContext.request.contextPath}/admin/member/'+member_id+'/infoPdf.do');

                setTimeout(function() {
                    $('#iframe2').hide();
                }, 500);

                //window.open('./'+member_id+'/infoPdf.do','팝업창','width=750, height=800, left=300, top=150');
            }
        }else {
            location.href = './'+st+'/excelDown.do?MEMBER_ID='+deleteArrIdx;	
        }
    }
    
    function Info_AgreementUpdate() {
        deleteArrIdx = "";
        var member_id = "";
        var cnt = 0;
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
                member_id = $(this).data("id");
                cnt = cnt + 1;
            }

        }); 


        if(cnt == 0) {
            swal({
                title: "알림",
                text: "정말로 전체 회원을 초기화 하시겠습니까?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-success",
                cancelButtonText: " 아니오",
                confirmButtonText: "네",
                closeOnConfirm: true,
            },function(isConfirm){
                if (isConfirm) {
                    var url = '${pageContext.request.contextPath}/admin/member/info_AgreementUpdate.do';
                    $.ajax({
                        type : "GET",
                        url : url,
                        cache : false,
                        success: function(result) {
                            if(result.indexOf("true") > -1) {
                                alert('성공하였습니다.');
                                window.location.reload();	
                            }else {
                                alert('실패 하였습니다.');
                            }
                        }
                    });
                    return true;
                } else {
                }
            });
        }else {
            swal({
                title: "알림",
                text: cnt + "명의 회원을 초기화 하시겠습니까?",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-success",
                cancelButtonText: " 아니오",
                confirmButtonText: "네",
                closeOnConfirm: true,
            },function(isConfirm){
                if (isConfirm) {
                    var URL = './TypeToTextUpdateArr.do?';
                    //var formData = $("#updateform").serialize();
                    var formData = "SEARCH_TYPE=INFO_AGREEMENT";
                    formData += "&SEARCH_TEXT=0";
                    formData += "&MEMBER_ID="+deleteArrIdx;

                    $.ajax({
                        type : "POST",
                        url : URL,
                        cache : false,
                        data : formData,
                        success: function(result) {
                            if(result.indexOf("true") > -1) {
                                alert('성공하였습니다.');
                                window.location.reload();

                            }else {
                                alert('실패 하였습니다.');
                            }
                        }
                    });

                    return true;
                } else {

                }
            });
            
        }   
    }

    function schoolNumberUpdate() {
        var url = '${pageContext.request.contextPath}/admin/member/schoolNumberUpdate.do';
        $.ajax({
            type : "GET",
            url : url,
            cache : false,
            success: function(result) {
                if(result.indexOf("true") > -1) {
                    alert('성공하였습니다.');
                    window.location.reload();	
                }else {
                    alert('실패 하였습니다.');
                }
            }
        });
    }

    function memberModal(){
        $("#member_excel > a").click(function(){
            $(".member_modal_wrap").fadeIn(300);
        });

        $(".modal_close > a").click(function(){
            $(".member_modal_wrap").fadeOut(300);
        });
    }
    memberModal();

</script>

<div id="iframe2" style="display:none">
    <iframe id="iframeDiv" src="#" width="750" height="800" left="300" top="150"></iframe>
</div>
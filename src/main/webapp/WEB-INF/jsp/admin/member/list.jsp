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
                                                <div class="page">
                                                    <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT }" name="ITEM_COUNT" id="ITEM_COUNT">
                                                    <span>/ 페이지</span>
                                                </div>
                                                <div class="page_seach">
                                                    <input type="hidden" id="LEVEL" name="LEVEL" value="${model.beforeDomain.LEVEL }">
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
                                    
                                    <div class="member_02_wrap">
                                        <form>
                                            <select id="LEVEL2" name="LEVEL2">
                                                <option value="">회원등급선택</option>
                                                <option value="1">관리자</option>
                                                <option value="9">대표멘토교사</option>
                                                <option value="8">교사</option>
                                                <option value="11">학생</option>
                                                <option value="10">일반회원</option>
                                                <!-- <option value="5">기타</option> -->
                                            </select>
                                            <button type="button" onClick="levelChangedArr()" value="일괄변경">일괄변경</button>
                                        </form>
                                        <form>
                                            <div>
                                                <input type="radio" name="excelDownType" value="MEMBER" checked>
                                                <label>회원목록선택</label>
                                            </div>
                                            <div>
                                                <input type="radio" name="excelDownType" value="INFO_AGREEMENT">
                                                <label>개인정보동의서</label>
                                            </div>
                                            <button type="button" value="파일출력" onClick="excelDown()">파일출력</button>
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
                                        <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th class="number">순번</th>
                                        <th class="name">이름</th>
                                        <th class="name_id">아이디</th>
                                        <th class="sex">성별</th>
                                        <th class="phone">연락처</th>
                                        <th class="sort">회원구분</th>
                                        <th class="L-login">최종로그인</th>
                                        <th class="infor">개인정보 동의일</th>
                                        <th class="join">가입일</th>
                                    </tr>
                                    
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.MEMBER_ID}" data-memberid="${item.MEMBER_ID}"  data-phone="${item.PHONE}"></td>
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td><a href="./${item.MEMBER_ID}/update.do">${item.NAME}</a></td>
                                        <td><a href="./${item.MEMBER_ID}/update.do">${item.MEMBER_ID}</a></td>
                                        <td>${item.SEX}</td>
                                        <td>${item.PHONE}</td>
                                        <td >
                                            <c:if test="${item.LEVEL == '1'}">관리자</c:if>
                                            <c:if test="${item.LEVEL == '9'}">대표멘토교사</c:if>
                                            <c:if test="${item.LEVEL == '8'}">교사</c:if>
                                            <c:if test="${item.LEVEL == '11'}">학생</c:if>
                                            <c:if test="${item.LEVEL == '10'}">일반회원</c:if>
                                            <c:if test="${item.COMM_TYPE == 'OK' }">(위쌤 강사)</c:if>
                                            <!-- <c:if test="${item.LEVEL == '5'}">기타</c:if> -->
                                        </td>
                                        <td>${fn:substring(item.LOGIN_TM,0,19)}</td>
                                        <td>${fn:substring(item.INFO_AGREEMENT_TM,0,19)}</td>
                                        <td>${fn:substring(item.CREATE_TM,0,19)}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="adm_btn_wrap">
                                <ul>
                                    <!--
                                    <li class="register">
                                        <a href="javascript:schoolNumberUpdate();">학번일괄</a>
                                    </li>
                                    -->
                                    
                                    <li class="register" id="member_excel">
                                        <a href="#">회원 엑셀 업로드</a>
                                    </li>
                                    <li class="register">
                                        <a href="javascript:dormancyUpdate();">휴먼회원처리</a>
                                    </li>
                                    <li class="register">
                                        <a href="javascript:Info_AgreementUpdate();">개인정보동의초기화</a>
                                    </li>
                                    <li class="register">
                                        <a href="${pageContext.request.contextPath}/admin/member/insert.do">등록하기</a>
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

                            <!-- 모달창 -->
                            <form action="./excelMemberUpload.do?" method="post" name="memberExcelform" id="memberExcelform" enctype="multipart/form-data">
                                <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                <div class="member_modal_wrap">
                                    <div class="member_modal_con member_input_wrap">
                                        <div class="modal_title">
                                            <h2>회원 엑셀 업로드</h2>
                                        </div>
                                        <ul class="modal_form member_input">
                                            <li>
                                                <span class="list_t">설명 다운로드</span>
                                                <button type="button" id="fileDownBtn1">다운로드</button>	
                                                <span class="relate_c">엑셀 작성에 대한 설명서 내용입니다.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">양식 다운로드</span>
                                                <button type="button"  id="fileDownBtn2">다운로드</button>
                                                <span class="relate_c">회원 일괄 등록에 필요한 엑셀 양식입니다.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">엑셀 업로드</span>
                                                <input type="file" id="file1" name="file" accept=".xls">
                                                <span class="relate_c">양식에 맞는 엑셀을 업로드 해주세요.</span>
                                            </li>
                                        </ul>
                                        
                                        <div class="member_btn adm_btn_wrap mr-0">
                                            <ul>
                                                <li class="register modal_close" ><a href="#">취소</a></li>
                                                <li class="register modal_upload" ><a href="javascript:memberXlexUpload()">회원 업로드</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- 모달창 end-->

						<form action="./comparing.do?" method="post" name="membercomparingExcelform" id="membercomparingExcelform" enctype="multipart/form-data">
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
                                                <li class="register modal_upload" ><a href="javascript:membercomparingUpload()">회원 업로드</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </form>


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
    
    $('a[href="#"]').click(function(e) {
        e.preventDefault();
    });

    $('#fileDownBtn1').click(function(e) {

        var url = '${pageContext.request.contextPath}/resources/files/member_explanation.pptx'; 
        location.href = url;
    });
    
    $('#fileDownBtn2').click(function(e) {
        var url = '${pageContext.request.contextPath}/resources/files/member_explanation.xls'; 
        location.href = url;
    });
    
    var uploadCheckBtn = false;
    function memberXlexUpload() {
        if(uploadCheckBtn == false) {
            uploadCheckBtn = true;
            $('#memberExcelform').submit();	
        }else {
            alert('처리중입니다.');	
        }
    }
    
    function membercomparingUpload() {
        $('#membercomparingExcelform').submit();	
    }


    function update() {
        cnt =  0;
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                cnt = cnt + 1;
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == '') {
            alert('수정할 대상을를 선택 하여 주세요');
            return;
        }

        deleteArrIdx = deleteArrIdx.substring(0, deleteArrIdx.length-1);
        location.href = './'+deleteArrIdx+'/update.do';
    }

    function deleteArrClick() {
        cnt =  0;
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true) {
                cnt = cnt + 1;
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == '') {
            alert('삭제할 대상을를 선택 하여 주세요');
            return;
        }

        var URL = './deleteArr.do?MEMBER_ID='+ deleteArrIdx;
        console.log(URL);
        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : "",
            success: function(result) {
                var s = result.indexOf("true");
                console.log(s);
                if(s != -1) {
                    alert('삭제되었습니다.');
                    
                    var moveUrl = "?SEARCH_TEXT="+encodeURI('${model.boforeDomain.SEARCH_TEXT}');
                    moveUrl = moveUrl + "&SEARCH_TYPE="+encodeURI('${model.boforeDomain.SEARCH_TYPE}');

                    if("${model.boforeDomain.page}" != "") {
                        moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
                    }

                    idchk = true;
                    location.href = './list.do'+moveUrl;
                    return;
                }else {
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

    function searchBtnClick() {
        URL = './list.do';
        URL = URL + "?PAGE=0";
        
        if($('#ITEM_COUNT').val() == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + $('#ITEM_COUNT').val();
        }
		URL = URL + "&LEVEL=" + $('#LEVEL').val();
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
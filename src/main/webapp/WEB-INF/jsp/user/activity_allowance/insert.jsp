<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
    </header>


    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <c:if test="${
                            fn:indexOf(requestURI, '/member/') > -1
                            || fn:indexOf(requestURI, '/portfolio/') > -1
                            || fn:indexOf(requestURI, '/mypage/program/') > -1
                            || fn:indexOf(requestURI, '/mypage/survey/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/activity_allowance/') > -1 }">
                            <h2>마이페이지</h2>
                            </c:if>
                        </div>
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>활동수당신청서</p>
                                    </div>

                                    <form action="./insert.do?" method="post" name="updateform" id="updateform" >
                                        <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="MEMBER_ID" value="<%=ssion_user_id %>" />
                                        <div>
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>영재키움 프로젝트 수당지급을 위한 개인정보 수집 동의서</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p>
                                                            KAIST 과학영재교육연구원이 진행하는 “영재키움 프로젝트”와 관련하여 해당 대상자에 대해 아래와 같이 개인정보를 수집·이용 하고자 합니다. 정보제공자는 수집·이용 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 불이익이 있을 수 있습니다.
                                                        </p>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보의 수집·이용 목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 개인정보를 제공 받는 자: KAIST 과학영재교육연구원</p>
                                                                <p>■ 개인정보를 제공받는 자의 개인정보 이용목적: 영재키움 프로젝트 멘토 교사 수당지급</p>
                                                                <p>■ 제공되는 개인정보의 항목: 성명, 주민등록번호, 계좌정보</p>
                                                                <p>■ 개인정보를 제공받는자의 개인정보 보유 및 이용기간: 현재부터~수당지급완료시</p>
                                                                <p>■ 수집 및 이용 거부에 따른 불이익 또는 제한사항: 활동 수당 지급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        개인정보 제공자가 동의한 내용 외의 다른 목적으로 개인정보를 이용하지 않으며, 정보주체는 개인정보처리자(KAIST 과학영재교육연구원)에게 본인의 개인정보에 대한 열람, 정정, 삭제를 요구할 수 있습니다.
                                                    </li>
                                                </ul>
                                                <ul class="category_list">
                                                    <p>
                                                        『 개인정보 보호법 제15조(개인정보의 수집•이용), 제17조(개인정보의 제공), 제18조(개인정보의 이용•제공 제한), 제22조(동의를 받는 방법) 』에 의거<br>개인정보 처리에 관하여     고지를 받았으며, 본인은 위와 같이 개인정보 수집 및 이용•제공에 동의합니다.
                                                    </p>
                                                    <div class="category_con">
                                                        <form>
                                                            <input type="radio" name="agree" value="Y" id="agree_1">
                                                            <label for="agree_1">동의함</label>
                                                            <input type="radio" name="agree" value="N" id="agree_2">
                                                            <label for="agree_2">동의안함</label>
                                                        </form>
                                                    </div>
                                                </ul>
                                            </div>
                                            <div class="member_input_wrap nanumgothic">
                                                <ul class="member_input">
                                                    <li>
                                                        <span class="list_t">이름</span>
                                                        <input class="input_size" type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="<%=ssion_name %>" readonly="readonly">
                                                        <label class="blind" for="MEMBER_NAME">이름</label>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">주민등록번호<b class="relate_c">＊</b></span>
                                                        <input class="input_size" type="text" name="MEMBER_NUMBER" id="MEMBER_NUMBER">
                                                        <label class="blind" for="MEMBER_NUMBER"></label>
                                                        <span class="relate_c">주민등록번호 입력시 - 입력</span>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">학교명</span>
                                                        <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME">
                                                        <label class="blind" for="SCHOOL_NAME"></label>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">성별</span>
                                                        <input type="radio" name="SEX" id="man" value="남자" checked>
                                                        <label for="man">남자</label>
                                                        <input type="radio" name="SEX" id="woman" value="여자">
                                                        <label for="woman">여자</label>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">휴대전화<b class="relate_c">＊</b></span>
                                                        <input class="input_size" type="number" name="PHONE" id="PHONE">
                                                        <span class="relate_c">휴대전화 입력시 -없이 입력</span>
                                                        <label class="blind" for="PHONE">휴대전화</label>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">은행명<b class="relate_c">＊</b></span>
                                                        <input class="input_size" type="text" name="BANK_NAME" id="BANK_NAME">
                                                        <label class="blind" for="BANK_NAME">은행명</label>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">계좌번호<b class="relate_c">＊</b></span>
                                                        <input class="input_bank" type="text" name="BANK_NUMBER" id="BANK_NUMBER">
                                                        <label class="blind" for="BANK_NUMBER">계좌번호</label>
                                                        <span class="relate_c">e.g. 111-111-111111</span>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">예금주성명<b class="relate_c">＊</b></span>
                                                        <input class="input_size" type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT">
                                                        <label class="blind" for="BANK_ACCOUNT">예금주성명</label>
                                                    </li>
                                                    <!-- 
                                                    <li>
                                                        <span class="list_t">통장사본</span>
                                                        <input class="input_size" type="text" name="fileName" id="fileName">
                                                        <input type="file" id="file" name="file" onchange="changeValue(this)" style="display: none;" accept=".gif, .jpg, .png"/>
                                                        <button type="button" id="btn-upload">파일선택</button>
                                                        <span class="relate_c">* 이미지 파일만 업로드 가능</span>
                                                    </li>
                                                    -->
                                                </ul>
                                                <ul class="category_list mr-0">
                                                    <p>'상기에 입력하신 본인 명의의 정보는 모두 정확하신지 확인하시고, 확인이 완료되셨으면 "제출하기"를 선택하여 주십시오.</p>
                                                    <form>
                                                        <input type="checkbox" name="match" id="match">
                                                        <label for="match">기입정보와 통장사본 정보의 일치 합니다.</label>
                                                    </form>
                                                </ul>
                                            </div>
                                        </div>
                                    </form>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            <a class="delete" href="javascript:insertClick();">제출하기</a>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>
    
</body>

</html>

<script type="text/javascript">
    $(function() {
        $('#btn-upload').click(function(e) {
            e.preventDefault();
            $('#file').click();
        });
    });

    function changeValue(obj) {
        var fileObj = obj.value;
        var pathHeader, pathMiddle, pathEnd, allFilename, fileName, extName;
        pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader + 1, pathMiddle);
        extName = fileObj.substring(pathMiddle + 1, pathEnd);
        allFilename = fileName + "." + extName;

        $('#fileName').val(allFilename);
    }

    function insertClick() {

        var radiochk = $(":input:radio[name=agree]:checked").val();

        if (radiochk != 'Y') {
            alert('개인정보 수집·활용 동의 항목에 동의 해주세요.');
            return;
        }

        if ($("#MEMBER_NUMBER").val() == '') {
            alert('주민등록번호 입력해주세요.');
            return;
        }

        /*var regexp = /^[0-9]*$/
        mNum = $("#MEMBER_NUMBER").val();
        if( !regexp.test(mNum) ) {
        alert("숫자만 입력하세요");
        $("#MEMBER_NUMBER").focus();
        $(this).val(v.replace(regexp,''));
        }*/

        if ($("#BANK_NAME").val() == '') {
            alert('은행명 입력해주세요.');
            return;
        }
        if ($("#BANK_NUMBER").val() == '') {
            alert('계좌번호 입력해주세요.');
            return;
        }

        /* bNum = $("#BANK_NUMBER").val();
        if( !regexp.test(bNum) ) {
        alert("숫자만 입력하세요");
        $("#BANK_NUMBER").focus();
        $(this).val(v.replace(regexp,''));
        } */

        if ($("#BANK_ACCOUNT").val() == '') {
            alert('예금주 성명 입력해주세요.');
            return;
        }

        if (!$("input:checkbox[name='match']").is(":checked")) {
            alert('기입정보와 통장사본 정보 일치여부 체크 해주세요.');
            return;
        }

        //$('#updateform').submit();

        var URL = '${pageContext.request.contextPath}/user/activity_allowance/insert.do'
        var formData = $("#updateform").serialize();

        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result)
            {
                chk = 'Y';
                var s = result.indexOf("true");
                if(s != -1)
                {
                    alert('교사 수당 신청이 완료되었습니다.');
                    location.href = '${pageContext.request.contextPath}/user/activity_allowance/insert.do';
                    return;
                }else {
                    alert('등록오류');
                    return;
                }   
            } 
        });
    }

</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">

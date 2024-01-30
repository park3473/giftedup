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
                                <span>포트폴리오 모니터링</span>
                            </div>

                            <div class="member_seach_form">
                                <div class="member_01_wrap mr-0">
                                    <form>
                                        <div class="form_01">
                                            <div class="page">
                                                <input style="width: 44px; margin-right: 10px" type="number" value="${model.beforeDomain.ITEM_COUNT}" name="ITEM_COUNT" id="ITEM_COUNT">
                                                <span>/ 페이지</span>
                                            </div>
                                            <div class="page_seach">
                                                <select name="SEARCH_TYPE" id="SEARCH_TYPE">
                                                    <option VALUE="ALL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ALL'}">selected</c:if>>전체</option>
                                                    <option VALUE="MEMBER_ID" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'MEMBER_ID'}">selected</c:if>>아이디</option>
                                                    <option VALUE="NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>학생명</option>
                                                    <option VALUE="ADDRESS_LOCAL" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ADDRESS_LOCAL'}">selected</c:if>>지역</option>
                                                    <option VALUE="SCHOOL_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_NAME'}">selected</c:if>>학교</option>
                                                    <option VALUE="SCHOOL_YEAR" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_YEAR'}">selected</c:if>>학년</option>                                                    
                                                    <option VALUE="SEX" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SEX'}">selected</c:if>>성별</option>
                                                </select>
                                                <input type="hidden" name="YEAR" value="${model.beforeDomain.YEAR}">
                                                <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT">
                                                <button type="submit" value="검색" onClick="searchBtnClick()">검색</button>
                                                <a class="w_btn" href="./list.do">새로고침</a>
                                                <button type="button" value="검색" onClick="excel_down('1')">포트폴리오 출력</button>
                                            	<button type="button" value="검색" onClick="excel_down('2')">포트폴리오 세부출력</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="table_wrap">
                                <table>
                                    <tr>
                                        <th rowspan="2" class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                        <th rowspan="2" class="sch_year">아이디</th>
                                        <th rowspan="2" class="name">학생 명</th>
                                        <th rowspan="2" class="affi">학교</th>
                                        <th rowspan="2" class="process">학년</th>
                                        <th rowspan="2" class="area">지역</th>
                                        <th rowspan="2" class="sex">성별</th>
                                        <th rowspan="2" class="level">학생만족도</th>
                                        <th colspan="2">찾아가는 영재교육</th>
                                        <th colspan="2">체험진로탐색 프로그램</th>
                                        <th colspan="2">창의융합캠프</th>
                                        <th colspan="2">기타</th>
                                        <th colspan="2">합계</th>
                                        <th rowspan="2">수료여부</th>
                                    </tr>
                                    <tr>
                                        <th>활동횟수</th>
                                        <th>시간</th>
                                        <th>활동횟수</th>
                                        <th>시간</th>
                                        <th>활동횟수</th>
                                        <th>시간</th>
                                        <th>활동횟수</th>
                                        <th>시간</th>
                                        <th>활동횟수</th>
                                        <th>시간</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" value="${item.IDX}" name="chk_calc" data-id="${item.MEMBER_ID}" data-phone="${item.PHONE}"></td>
                                        <td><a href="/user/portfolio/detail/${item.MEMBER_ID}/list.do?YEAR=${model.beforeDomain.YEAR}" target=_black">${item.MEMBER_ID}</a></td>
                                        <td><a href="/user/portfolio/detail/${item.MEMBER_ID}/list.do?YEAR=${model.beforeDomain.YEAR}" target=_black">${item.NAME}</a></td>
                                        <td>${item.SCHOOL_NAME}</td>
                                        <td>
                                         	<c:choose>
                                            <c:when test="${item.SCHOOL_YEAR == '24'}">전체</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '23'}">초등학교</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '22'}">중학교</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '21'}">고등학교</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '4'}">초등학교4학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '5'}">초등학교5학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '6'}">초등학교6학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '7'}">중학교1학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '8'}">중학교2학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '9'}">중학교3학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '10'}">고등학교1학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '11'}">고등학교2학년</c:when>
                                            <c:when test="${item.SCHOOL_YEAR == '12'}">고등학교3학년</c:when>
                                            <c:otherwise></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${item.ADDRESS_LOCAL}</td>
                                        <td>
                                            <c:if test="${item.SEX == '남자'}">남자</c:if>
                                            <c:if test="${item.SEX == '여자'}">여자</c:if>
                                        </td>
                                        <td>
	                                        <c:choose>
	                                            <c:when test="${item.AVG_STFT == '0.0000'}">
	                                            0점
	                                            </c:when>
	                                            <c:otherwise>
	                                            <fmt:formatNumber value="${item.AVG_STFT}" pattern="0.00"/>점
	                                            </c:otherwise>
	                                            </c:choose>
	                                                                                       
										</td>
                                        <td>${item.COURSE_CNT_1}</td>
                                        <td>

                                        ${item.COURSE_1}</td>
                                        <td>${item.COURSE_CNT_2}</td>
                                        <td>${item.COURSE_2}</td>
                                        <td>${item.COURSE_CNT_3}</td>
                                        <td>${item.COURSE_3}</td>
                                        <td>${item.COURSE_CNT_4}</td>
                                        <td>${item.COURSE_4}</td>
                                        <td>${item.COURSE_CNT_5}</td>
                                        <td>${item.COURSE_5}</td>
                                        <td>
                                        	<c:if test="${item.COURSE_5 >= 40}">수료</c:if>
                                        	<c:if test="${item.COURSE_5 < 40}">미수료</c:if>
										</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
							
							<!--관리자 버튼-->
                            <!-- <div class="adm_btn_wrap">
                                <ul>
                                    <li class="delete">
                                        <a href="javascript:deleteArrClick()">삭제하기</a>
                                    </li>
                                </ul>
                            </div> -->
                            <!--관리자 버튼 end-->
							
                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <%@ include file="../include/pageing.jsp"%>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/portfolio.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body>
</html>


<script>
    $( document ).ready(function() {
        var oldVal = "";
        $("#sms_text").on("change keyup paste", function() {
            var currentVal = $(this).val();
            if(currentVal == oldVal) {
                return;
            }

            oldVal = currentVal;
            $('#sms_text_size').text(oldVal.length);
        });
        $("#RESERVATION").change(function(){
            if($("#RESERVATION").is(":checked")){
                $("#RESERVATION_TM").show();
                $("#RESERVATION_TM2").hide();
                
            }else{
                $("#RESERVATION_TM").hide();
                $("#RESERVATION_TM2").show();
            }
        });
    });

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
		alert(deleteArrIdx);
        if(deleteArrIdx == '') {
            alert('삭제할 대상을를 선택 하여 주세요');
            return;
        }

        var URL = './deleteArr.do?IDX='+ deleteArrIdx;
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

    $("#bootstrap-data-table tr").click(function(){     
        console.log($(this).data("id"));
        if($(this).data("role") == 'button') {
            var URL = './'+$(this).data("id")+'/update.do?';
            URL = URL + "PAGE=${model.beforeDomain.PAGE}";
            URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
            URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
            location.href = URL;
        }	    
    });
    function excel_down(st)
    {
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

        if(cnt > 20)
        {
        	alert("20개만 다운로드 가능합니다.");
        	return;	
        }
       
        location.href = './'+st+'/excelDown.do?MEMBER_ID='+deleteArrIdx+'&YEAR=${model.beforeDomain.YEAR}';
        
    }

    function searchBtnClick() {
        URL = './list.do';
        URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&YEAR=${model.beforeDomain.YEAR}";
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

</script>
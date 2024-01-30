<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %> 
        
        <!-- 중단메뉴시작 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %> 
        </section>
        <!-- 중단메뉴종료 -->
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
                            fn:indexOf(requestURI, '/subpage/program/study/') > -1
                            || fn:indexOf(requestURI, '/notices_data/6/') > -1
                            || fn:indexOf(requestURI, '/program/104/') > -1
                            || fn:indexOf(requestURI, '/program/101/') > -1
                            || fn:indexOf(requestURI, '/notices_data/7/') > -1
                            || fn:indexOf(requestURI, '/notices_data/8/') > -1
                            || fn:indexOf(requestURI, '/notices_data/9/') > -1
                            || fn:indexOf(requestURI, '/notices_data/10/') > -1
                            || fn:indexOf(requestURI, 'user/mentoring/') > -1}">
                            <h2>찾아가는 영재교육 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                            || fn:indexOf(requestURI, '/user/program/110/') > -1
                            || fn:indexOf(requestURI, '/user/program/111/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                            || fn:indexOf(requestURI, '/user/program/105/') > -1}">
                            <h2>체험 진로탐색 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/program/201/') > -1
                            || fn:indexOf(requestURI, '/program/202/') > -1
                            || fn:indexOf(requestURI, '/program/203/') > -1
                            || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <h2>교사 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/program/103/') > -1}">
                            <h2>멘토링 데이</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/program/106/') > -1}">
                            <h2>기타</h2>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1
                            || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                            <h2>창의융합캠프 소개</h2>
                            </c:if>
                        </div>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/104/list.do">고등자율연구 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a></li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1 || fn:indexOf(requestURI, '/program/101/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a></li>
                                    </c:if>
                                </ul>
                            </li>
                            <c:if test="${fn:indexOf(requestURI, '/program/104/') > -1} || fn:indexOf(requestURI, '/program/101/') > -1">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>

                                <!--
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링</a></li>
                                    </c:if>
                                </ul>
                                -->

                            </li>

                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->

                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="#" onclick="alert('페이지 준비중입니다.');return false;">문화체험 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->

                            <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                            <li>
                                <a href="#" onclick="alert('페이지 준비중입니다.');return false;">진로탐색 소개<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/program/110/') > -1 || fn:indexOf(requestURI, '/program/111/') > -1 || fn:indexOf(requestURI, '/program/105/') > -1}">
                                    <li><a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/201/list.do">교사연수 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/program/201/') > -1 || fn:indexOf(requestURI, '/program/202/') > -1 || fn:indexOf(requestURI, '/program/203/') > -1 || fn:indexOf(requestURI, '/program/204/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1 || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">창의융합캠프 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/subpage/program/camp/') > -1 || fn:indexOf(requestURI, '/user/program/102/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/102/list.do">창의융합캠프 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>프로그램 정보</p>
                                </div>
                                <table class="txt project_info">
                                    <tr>
                                        <th class="sortation">구분</th>
                                        <th class="pro_txt">내용</th>
                                    </tr>
                                        <tr>
                                        <td class="sortation">학년도</td>
                                        <td class="pro_txt">${model.pageDomain.YEAR}</td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">과정</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '24'}">전체</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '23'}">초등학교</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '22'}">중학교</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '21'}">고등학교</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '4'}">초등학교4학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '5'}">초등학교5학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '6'}">초등학교6학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '7'}">중학교1학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '8'}">중학교2학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '9'}">중학교3학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '10'}">고등학교1학년</c:when>
                                            <c:when test="${model.pageDomain.SCHOOL_YEAR == '11'}">고등학교2학년</c:when>
                                            <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">프로그램명</td>
                                        <td class="pro_txt">${model.pageDomain.NAME}</td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">신청기간</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.START_TM == null}">-</c:when>
                                            <c:otherwise>${fn:substring(model.pageDomain.START_TM,0,19)} ~ ${fn:substring(model.pageDomain.END_TM,0,19)}</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <c:if test="${model.pageDomain.TYPE != '101'}">
                                    <tr>
                                        <td class="sortation">체험기간</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.EXPERIENCE_START_TM == null}">-</c:when>
                                            <c:otherwise>${fn:substring(model.pageDomain.EXPERIENCE_START_TM,0,19)} ~ ${fn:substring(model.pageDomain.EXPERIENCE_END_TM,0,19)}</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">정원</td>
                                        <td class="pro_txt">
                                            <c:choose>
                                            <c:when test="${model.pageDomain.SCHOOL_CNT == null}">-</c:when>
                                            <c:otherwise>${model.pageDomain.APPLY_CNT}/${model.pageDomain.SCHOOL_CNT}명</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sortation">버스탑승지</td>
                                        <td class="pro_txt">${model.pageDomain.BUS_STATION}</td>
                                    </tr>
                                    </c:if>
                                    <tr>
                                        <td class="sortation">내용</td>
                                        <td class="pro_txt">${model.pageDomain.MEMO}</td>
                                    </tr>
                                </table>
                            </div>

                            <c:if test="${model.pageDomain.START_TM_STEP== '1' && model.pageDomain.END_TM_STEP== '1' && ssion_user.TYPE == '2'}">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>교사정보</p>
                                </div>
                                <table class="txt student_list">
                                    <tr>
                                        <th class="name">교사명</th>
                                        <th class="sex">성별</th>
                                        <th class="class_num">직급</th>
                                        <th class="school">학교명</th>
                                        <th class="phone">교사연락처</th>

                                        <!--
                                        <th class="parents_tel">연수번호</th>
                                        -->

                                        <th class="infor">교사참석여부</th>
                                        <th class="check">신청하기</th>
                                    </tr>
                                    <tr>
                                        <td>${model.MEMBER.pageDomain.NAME}</td>
                                        <td>
                                            <c:if test="${model.MEMBER.pageDomain.SEX == '남자'}">남자</c:if>
                                            <c:if test="${model.MEMBER.pageDomain.SEX == '여자'}">여자</c:if>
                                        </td>
                                        <td>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '21'}">초등학교</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '22'}">중학교</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '23'}">고등학교</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '4'}">초등학교4학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '5'}">초등학교5학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '6'}">초등학교6학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '7'}">중학교1학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '8'}">중학교2학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '9'}">중학교3학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '10'}">고등학교1학년</c:if>
                                            <c:if test="${model.MEMBER.SCHOOL_YEAR == '11'}">고등학교2학년</c:if>
                                        </td>
                                        <td>${model.MEMBER.pageDomain.SCHOOL_NAME}</td>
                                        <td>${model.MEMBER.pageDomain.PHONE}</td>
                                        <td>
                                            <input type="radio" value="1" name="attend" <c:if test="${model.APPLY.pageDomain.ATTEND == '1' || model.APPLY.pageDomain.ATTEND == ''}">checked</c:if>>
                                            <label for="attend">참석</label>
                                            <input type="radio" value="0" name="attend" <c:if test="${model.APPLY.pageDomain.ATTEND == '0'}">checked</c:if>>
                                            <label for="attend">불참</label>
                                        </td>
                                        <td>
                                            <label class="request_label">신청하기</label>
                                            <input type="checkbox" value="신청하기" name="checkBoxInsert" id="checkBoxInsert" <c:if test="${model.APPLY.pageDomain.APPLY != ''}">checked</c:if>>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </c:if>

                            <!--보드 검색_버튼-->
                            <div class="board_btn_wrap">
                                <div class="board_btn">
                                    <!-- <a class="delete request_btn" href="../sub/sub_05_c-3.html">신청하기</a> -->
                                    <a class="register prev_btn" href="../../list.do">이전화면</a>
                                </div>
                            </div>
                            <!--보드 검색_버튼 end-->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %> 
    </footer>
    <%@ include file="../../include/footerJs.jsp" %> 

</body>

</html>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">

<script>
    
    $(document).ready(function(){
        $("#checkBoxInsert").change(function(){
            <c:if test="${model.pageDomain.SCHOOL_CNT != '' && model.pageDomain.SCHOOL_CNT != null && model.pageDomain.SCHOOL_CNT != '0'}">
                if(${model.pageDomain.SCHOOL_CNT} < ${model.pageDomain.APPLY_CNT}) {
                    alert('정원이 초과 하였습니다.');
                    return;	
                }
            </c:if>


            var URL = '';
            if($("#checkBoxInsert").is(":checked")){
                URL = './insert.do?ATTEND='+ $(':radio[name="attend"]:checked').val();    
            }else {
                URL = './delete.do?MEMBER_ID=${model.APPLY.pageDomain.MEMBER_ID}&ATTEND='+ $(':radio[name="attend"]:checked').val();
            }

            $.ajax({
                type : "POST",
                url : URL,
                cache : false,
                data : "",
                success: function(result) {
                    var s = result.indexOf("true");
                    console.log(s);
                    if(s != -1) {
                        if($("#checkBoxInsert").is(":checked")){
                            alert('신청 하였습니다..');
                        }else {
                            alert('신청을 취소 하였습니다.');
                        }
                        return;
                    }else {
                        alert('실패하였습니다.');
                        return;
                    }
                }
            });
        });
    });
    
</script>

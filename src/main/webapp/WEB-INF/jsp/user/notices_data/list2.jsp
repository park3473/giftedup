<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <div class="sub_hd_area">
                <div class="sub_hd_con">
                    <div class="sub_hd_size">
                        <div class="min_size">
                            <nav class="sub_nav">
                                <div class="home">
                                    <a href="${pageContext.request.contextPath}/index.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_home.png" alt="홈" />
                                    </a>
                                </div>
                                <ul class="main_menu">
                                    <li class="sub_nav_menu">
                                        <a href="#">커뮤니티<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
                                        <ul class="sub_ul_menu">
                                            <li><a href="../sub/sub_01_a.html">영재키움프로젝트</a></li>
                                            <li><a href="../sub/sub_02_a.html">학생 프로그램</a></li>
                                            <li><a href="../sub/sub_03_a.html">교사 프로그램</a></li>
                                            <li><a href="../sub/sub_04_c.html">커뮤니티</a></li>
                                            <li><a href="#">마이페이지</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub_nav_menu">
                                        <a href="#">공지사항<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
                                        <ul class="sub_ul_menu">
                                            <li><a href="../sub/sub_04_a.html">공지사항</a></li>
                                            <li><a href="../sub/sub_04_b.html">홍보자료</a></li>
                                            <li><a href="../sub/sub_04_c.html">설문조사</a></li>
                                            <li><a href="../sub/sub_04_d.html">자료실</a></li>
                                            <li><a href="../sub/sub_04_e.html">신입생선발</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="options">
                                    <div class="font_plus">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/plus.png" alt="크게" /></a>
                                    </div>
                                    <div class="font_minus">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/minus.png" alt="작게" /></a>
                                    </div>
                                    <div class="print">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/print.png" alt="작게" /> 프린트</a>
                                    </div>
                                </div>
                            </nav>
                            <div class="title">
                                <h2>
                                    ${model.NOTICES.pageDomain.NAME}
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page_con">
                                <div class="sub_page sub_learning">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p> 
                                            <c:choose>
                                            <c:when test="${notices == '1' }">공지사항</c:when>
                                            <c:when test="${notices == '3' }">홍보자료</c:when>
                                            <c:when test="${notices == '5' }">자료실</c:when>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <table class="txt learning_con">
                                        <tr>
                                            <th class="number">번호</th>
                                            <th class="txt_title">제목</th>
                                            <th class="views">조회수</th>
                                            <th class="writer">작성자</th>
                                            <th class="date">작성일</th>
                                        </tr>
                                        <c:forEach var="item" items="${model.list}" varStatus="status">
                                        <tr>
                                            <c:if test="${item.TYPE == '2'}">
                                            <td class="td_number">공지</td>	
                                            </c:if>
                                            <c:if test="${item.TYPE != '2'}">
                                            <td class="td_number">${model.itemtotalcount-((model.itemCount * model.page) + status.index)}</td>
                                            </c:if>                                        
                                            <td><a href="javascript:view(${item.IDX});">[${item.TYPE}]${item.TITLE}</a></td>
                                            <td>${item.READ_CNT}</td>
                                            <td>item.NAME</td>
                                            <td>${fn:substring(item.CREATE_TM,0,19)}</td>
                                        </tr>
                                        </c:forEach>
                                    </table>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_seach">
                                            <form>
                                                <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                                    <option value="ALL">전체</option>
                                                    <option value="MEMBER_NAME">작성자</option>
                                                    <option value="TITLE">제목</option>
                                                    <option value="CONTENT">내용</option>
                                                </select>
                                                <input type="text" value="" name="SEARCH_TEXT" id="SEARCH_TEXT"  />
                                                <button type="button" name="seach" value="검색" onClick="searchBtnClick()">검색</button>
                                            </form>
                                        </div>
                                        <c:if test="${notices == '5' }">
                                        <div class="board_btn">
                                            <!-- <a class="delete" href="#">선택삭제</a> -->
                                            <a class="register" href="./insert.do">글쓰기</a>
                                        </div>
                                        </c:if>
                                    </div>
                                    <!--보드 검색_버튼 end-->

                                    <!--페이지 넘버-->
                                    <nav class="paging_number">
                                        <%@ include file="../include/pageing.jsp" %> 
                                    </nav>
                                    <!--페이지 넘버 end-->
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slider_sub.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
</body>
</html>

<script>

    function searchBtnClick() {
        
        URL = './list.do';
        URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

    function view(id) {

        var URL = './'+id+'/update.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
    }
</script>
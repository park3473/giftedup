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
                                        <a href="#">커뮤니티<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
                                        </a>
                                        <ul class="sub_ul_menu">
                                            <li><a href="../sub/sub_01_a.html">영재키움프로젝트</a></li>
                                            <li><a href="../sub/sub_02_a.html">학생 프로그램</a></li>
                                            <li><a href="../sub/sub_03_a.html">교사 프로그램</a></li>
                                            <li><a href="../sub/sub_04_a.html">커뮤니티</a></li>
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
                              		 <c:choose>
		                                <c:when test="${notices == '1' }">공지사항</c:when>
		                                <c:when test="${notices == '3' }">홍보자료</c:when>
		                                <c:when test="${notices == '5' }">자료실</c:when>
	                                </c:choose>
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
          </header>
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page" id="sub_page">
                                <div class="info_wrap">
                                    <div class="title mr-0">
                                        <h2>${model.pageDomain.TITLE}</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th>작성자</th>
                                            <td>${fn:substring(model.pageDomain.NAME,0,19)}</td>
                                            <th>작성일</th>
                                            <td>${fn:substring(model.pageDomain.CREATE_TM,0,19)}</td>
                                        </tr>
                                        <tr>
                                            <!-- <th>아이피</th>
                                            <td>143.248.220.86</td> -->
                                            <th>조회수</th>
                                            <td colspan="3">${model.pageDomain.READ_CNT}</td>
                                        </tr>
                                        <tr>
                                            <th>사진</th>
                                            <td colspan="3">
                                                <div class="pic">
                                                    <a href="#">
                                                        <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/member/${model.pageDomain.IMAGE}" alt="${model.pageDomain.IMAGE}">
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <c:if test="${ fn:length(model.pageDomain.LINKS) > 1 && model.pageDomain.LINKS != '' && model.pageDomain.LINKS != null}">
                                        <tr>
                                            <th>바로가기</th>
                                            <td colspan="3"><a href="${model.pageDomain.LINKS}" target="${model.pageDomain.LINKS_TYPE}"/>${model.pageDomain.LINKS}</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${ fn:length(model.pageDomain.LINKS2) > 1 && model.pageDomain.LINKS2 != '' && model.pageDomain.LINKS2 != null}">
                                        <tr>
                                            <th>바로가기</th>
                                            <td colspan="3"><a href="${model.pageDomain.LINKS2}" target="${model.pageDomain.LINKS2_TYPE}"/>${model.pageDomain.LINKS2}</td>
                                        </tr>
                                        </c:if>                                        
                                        <tr>
                                            <th>파일</th>
                                            <td colspan="3">
                                            	<c:forEach var="item" items="${model.fileLIst}" varStatus="status">
                                                <c:if test="${item != '' && item != null}">
                                            	<div id="fileDiv_${status.index}">
                                            	<a class="relate_c" href="${pageContext.request.contextPath}/fileDown.do?path=/resources/${pageContext.request.contextPath}/upload/notices_data/${item}">다운로드</a>
                                            	&nbsp; &nbsp; 
                                            	</div>
                                            	</c:if>
                                            	</c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="content">
                                                    ${model.pageDomain.CONTENT}
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                           <!--  <a class="delete" href="#">삭제하기</a>
                                            <a class="register" href="#">수정하기</a> -->
                                            <a class="register" onclick="window.print();">내용인쇄</a>
                                            <a class="register" href="../../${notices}/list.do">목록보기</a>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->

                                </div>


                                <!--코멘트창-->
                                 <c:if test="${notices == '5' }">
                                <div class="comment_wrap">
                                    <div class="comment_area">
                                        <ul class="comment_list">
                                            <li>
                                                <span>홍길동</span>
                                                <p>Cras eget metus ac est suscipit finibus in eu metus.</p>
                                                <div class="date">
                                                    <span>2019.11.18</span>
                                                    <a href="#"><i class="fas fa-times"></i></a>
                                                </div>
                                            </li>
                                            
                                        </ul>
                                        <div class="comment_write">
                                            <form>
                                                <div class="comment_textarea_wrap">
                                                    <textarea class="comment_textarea"></textarea>
                                                </div>
                                            </form>
                                        </div>
                                        <!--보드 검색_버튼-->
                                        <div class="board_btn_wrap">
                                            <div class="board_btn">
                                                <a class="delete" href="#">등록</a>
                                            </div>
                                        </div>
                                        <!--보드 검색_버튼 end-->
                                    </div>
                                </div>
                                <!--코멘트창 end-->
								</c:if>




                                
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
</body></html>
<script type="text/javascript">


</script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <!--추가 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">

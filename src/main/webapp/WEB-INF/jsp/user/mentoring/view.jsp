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
           <%@ include file="../include/menu_sub.jsp" %>
        </section>
  </header>
  
  
  
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
                                        || fn:indexOf(requestURI, 'user/mentoring/') > -1}"><h2>찾아가는 영재교육 프로그램</h2></c:if>
                		</div>
                		<ul class="right_nav_area">
                			<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<!--<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>-->
                			<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/program/104/list.do">고등자율연구 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<li>
                				<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></c:if>
                				<ul>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a></li></c:if>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a></li></c:if>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a></li></c:if>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a></li></c:if>
                				</ul>
               				</li>
               				<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                		</ul>
                	</nav>
                	<!-- 메뉴바  end-->
                
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="info_wrap">
                                    <div class="title mr-0">
                                        <h2>${model.pageDomain.TYPE }</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th style="width:20%;">전문가</th>
                                            <td>${model.pageDomain.NAME }</td>
                                            <th style="width:20%;">작성일</th>
                                            <td>${fn:substring(model.pageDomain.CREATE_TM,0,19)}</td>
                                        </tr>
                                        <tr>
                                            <th>소속</th>
                                            <td colspan="3">${model.pageDomain.GROUP}</td>
                                        </tr>
                                        <tr>
                                            <th>근무지주소</th>
                                            <td colspan="3">${model.pageDomain.ADDRESS}</td>
                                        </tr>
                                        <tr>
                                            <th>지역</th>
                                            <td colspan="3">${model.pageDomain.LOCATION}</td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td colspan="3">${model.pageDomain.EMAIL}</td>
                                        </tr>
                                        <tr>
                                            <th>연락처</th>
                                            <td colspan="3">${model.pageDomain.PHONE}</td>
                                        </tr>
                                        <tr>
                                            <th>사진</th>
                                            <td colspan="3">
                                                <div class="pic">
                                                    <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/mentoring/${model.pageDomain.IMAGE}" alt="${model.pageDomain.IMAGE}">
                                                </div>
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
                                            <c:if test="${'1' == ssion_level || model.pageDomain.MEMBER_ID == ssion_user_id}">            
                                            <a class="register" href="./update.do">수정하기</a>
                                            </c:if>
                                            <!-- <a class="register" href="#">내용인쇄</a> -->
                                            <a class="register" href="javascript:history.back();">목록보기</a>
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
</body></html>
<script type="text/javascript">


</script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <!--추가 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">

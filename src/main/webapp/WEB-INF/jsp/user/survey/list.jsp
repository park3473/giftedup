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
 	

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                
                	<!-- 메뉴바 -->
                	<nav class="right_nav_wrap">
                		<div class="title">
                			<c:if test="${
                                        fn:indexOf(requestURI, '/notices_data/1/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/2/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/3/') > -1
                                        || fn:indexOf(requestURI, '/user/survey/') > -1
                                        || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1
                                        }"><h2>커뮤니티</h2></c:if>
                		</div>
                		<ul>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1|| fn:indexOf(requestURI, '/user/notices_data/11/') > -1 || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 }"><li><a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1|| fn:indexOf(requestURI, '/user/notices_data/11/') > -1 || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 }"><li><a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1|| fn:indexOf(requestURI, '/user/notices_data/11/') > -1 || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 }"><li><a href="${pageContext.request.contextPath}//user/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1|| fn:indexOf(requestURI, '/user/notices_data/11/') > -1 || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 }"><li><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1|| fn:indexOf(requestURI, '/user/notices_data/11/') > -1 || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 }"><li><a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">FAQ <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 || fn:indexOf(requestURI, '/user/survey/') > -1 || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1|| fn:indexOf(requestURI, '/user/notices_data/11/') > -1 || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 }"><li><a href="${pageContext.request.contextPath}/user/member_re/insert.do">신입생 선발 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                		</ul>
                	</nav>
                	<!-- 메뉴바  end-->
                
                
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>설문조사</p>
                                </div>
                                <table class="txt project_txt counseling">
                                    <tr>
                                        <th class="number">번호</th>
                                        <th class="program_name">제목</th>
                                        <th class="join_time">기간</th>
                                        <th class="regi">진행상황</th>
                                        <th class="apply">참여하기</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr>
                                        <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                        <td class="align_lt">${item.TITLE }</td>
                                        <td>${fn:substring(item.START_TM,0,11)} ~ ${fn:substring(item.END_TM,0,11)}
                                        <td>
                                       
                                       <c:if test="${item.START_STATUS == 1 && item.END_STATUS == 1}">
                                       		진행중
                                       </c:if>
                                       
                                       <c:if test="${item.START_STATUS == 0 && item.END_STATUS == 1}">
                                       		진행예정
                                       </c:if>
                                       
                                       <c:if test="${item.START_STATUS == 1 && item.END_STATUS == 0}">
                                       		마감
                                       </c:if>
                                       
                                        </td>
                                        
                                        <c:if test="${item.START_STATUS == 1 && item.END_STATUS == 1}">
                                       		<td class="apply"><a href="${pageContext.request.contextPath}/user/survey/${item.IDX}/detail.do">참여하기</a></td>
                                       </c:if>
                                       
                                       <c:if test="${item.START_STATUS == 0 && item.END_STATUS == 1}">
                                       		<td></td>
                                       </c:if>
                                       
                                       <c:if test="${item.START_STATUS == 1 && item.END_STATUS == 0}">
                                       		<td class="apply vote_end"><a href="javascript:alert('종료되었습니다.');">참여종료</a></td>
                                       </c:if>
                                        
                                        
                                        <c:choose>
                                        <c:when test="${item.STATUS == 'DONE'}">
                                        	
                                        </c:when>
                                        <c:when test="${item.STATUS == 'ING'}">
                                        	
                                        </c:when>
                                        </c:choose>
                                    </tr>
                                    </c:forEach>
                                    
                                     
                                    
                                </table>

                                <!--보드 검색_버튼-->
                                <div class="board_btn_wrap">
                                    <div class="board_seach">
                                        <form>
                                            <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                                <option value="ALL">전체</option>
                                                <option value="TITLE">설문주제</option>
			                                    <option value="CONTENT">설문개요</option>
                                            </select>
                                            <input type="text" value="" name="SEARCH_TEXT" id="SEARCH_TEXT"  />
                                            <button type="button" name="seach" value="검색" onClick="searchBtnClick()">검색</button>
                                        </form>
                                    </div>
                                </div>
                                <!--보드 검색_버튼 end-->


                                 <!--페이지 넘버-->
                                    <nav class="paging_number">
                                        <%@ include file="../include/pageing.jsp" %> 
                                    </nav>
                                    <!--페이지 넘버 end-->
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

function searchBtnClick()
{
	
	URL = './list.do';
	URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
	URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
	URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
	location.href = URL;
}


</script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <!--추가 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
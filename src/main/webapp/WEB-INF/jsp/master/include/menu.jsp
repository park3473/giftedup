
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

             <%@ include file="../include/top.jsp" %>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/master/index.do"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                       <c:if test="${ssion_level == '1'}">    
                    <h3 class="menu-title"></h3><!-- /.menu-title -->
                    <!-- <li class="menu-item-has-children dropdown active"> -->
                    
               
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>권한관리</a>
                        <ul class="sub-menu children dropdown-menu">
                            
                            <c:if test="${ssion_level == '1'}">
                            	<li><i class="fa fa-puzzle-piece"></i><a href="${pageContext.request.contextPath}/master/member_auth/list.do">관리자메뉴</a></li>
                            </c:if>
                            <c:if test="${ssion_level == '1'}">
                            	<li><i class="fa fa-id-badge"></i><a href="${pageContext.request.contextPath}/master/notices_auth/list.do">게시판권한</a></li>
                            </c:if>
                            <c:if test="${ssion_level == '1'}">
                            	<li><i class="fa fa-bars"></i><a href="${pageContext.request.contextPath}/master/menu_auth/list.do">메뉴권한</a></li>
                            </c:if>
                            
                            
                        </ul>
                    </li>
					</c:if>
                    
					<c:if test="${(CHK_MEMBER == '1' and ssion_level == '2') or ssion_level == '1'}">                    
                    <li>
                        <a href="${pageContext.request.contextPath}/master/member/list.do"> <i class="menu-icon fa fa-user"></i>사용자관리 </a>
                    </li>
                    </c:if>
                    <c:if test="${(CHK_NOTICES == '1' and ssion_level == '2') or ssion_level == '1'}">
                    <li>
                        <a href="${pageContext.request.contextPath}/master/notices/list.do"> <i class="menu-icon fa fa-list-ul"></i>게시판관리 </a>
                    </li>
					</c:if>
					
					<c:if test="${ssion_level == '1'}">                    
                    <li>
                        <a href="${pageContext.request.contextPath}/master/jspfile/list.do"> <i class="menu-icon fa fa-user"></i>VIEW JSP 관리 </a>
                    </li>
                    </c:if>
                    
					
                    <h3 class="menu-title">홈페이지 운영</h3><!-- /.menu-title -->
                    <c:if test="${(CHK_BANNER == '1' and ssion_level == '2') or ssion_level == '1' }">
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list-ul"></i>게시판</a>
                        <ul class="sub-menu children dropdown-menu">
                         <c:forEach var="item" items="${ssion_noticesList.List}" varStatus="status">
                         	<li><i class="menu-icon fa fa-fort-awesome"></i><a href="${pageContext.request.contextPath}/master/notices_data/${item.IDX}/list.do">${item.TITLE}</a></li>
                          </c:forEach>
                        </ul>
                    </li>
                    </c:if>
                    
                     <c:if test="${(CHK_MENU == '1' and ssion_level == '2') or ssion_level == '1'}">
                     <li>
                        <a href="${pageContext.request.contextPath}/master/menu/list.do"> <i class="menu-icon fa fa-bars"></i>메뉴 </a>
                     </li>
                    
                     </c:if>
                     <c:if test="${(CHK_BANNER == '1' and ssion_level == '2') or ssion_level == '1'}">
                     <li>
                        <a href="${pageContext.request.contextPath}/master/banner/list.do"> <i class="menu-icon fa fa-thumb-tack"></i>배너 </a>
                     </li>
                     </c:if>
                     
                     <c:if test="${(CHK_POPUP == '1' and ssion_level == '2') or ssion_level == '1'}">
                   	 <li>
                        <a href="${pageContext.request.contextPath}/master/popup/list.do"> <i class="menu-icon fa fa-thumb-tack"></i>팝업 </a>
                   	 </li>
                     </c:if>
                     <c:if test="${(CHK_CALENDAR == '1' and ssion_level == '2') or ssion_level == '1'}">     
                     <li>
                        <a href="${pageContext.request.contextPath}/master/calendar/list.do"> <i class="menu-icon fa fa-calendar"></i>캘린더 </a>
                     </li>
                     </c:if>                              
                         
                    
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-gear (alias)"></i>설정</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="${pageContext.request.contextPath}/master/familysite/list.do">패밀리사이트</a></li>
                            <!-- <li><i class="menu-icon fa fa-line-chart"></i><a href="#">E-Mail 설정</a></li> -->
                           	<c:forEach var="item" items="${seion_langageList}" varStatus="status">
		                        <li><i class="menu-icon fa fa-area-chart"></i><a href="${pageContext.request.contextPath}/master/setting/COPYRIGHT_${item.TITLE}/update.do">Copyright(${item.TITLE})</a></li>
                            </c:forEach>
                            
                            
                            
                            
                            
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="${pageContext.request.contextPath}/master/setting/ANALYTICS/update.do">통계(구글)</a></li>
                        </ul>
                    </li>
<!-- 
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>관리정보</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="#">통계정보</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="#">로그정보</a></li>
                        </ul>
                    </li>
-->
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->
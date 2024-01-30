<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                            <a href="#">영재키움프로젝트<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
                            </a>
                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">영재키움프로젝트</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/101/list.do">학생 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/program/201/list.do">교사 프로그램</a></li>
                                <li><a href="#">커뮤니티</a></li>
                                <li><a href="#">마이페이지</a></li>
                            </ul>
                        </li>
                        <li class="sub_nav_menu">
                            <a href="#">프로젝트 기본방향<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
                            <ul class="sub_ul_menu">
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">프로젝트 기본방향</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/program/index.do">주요 프로그램</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/project/index.do">사업추친체계</a></li>
                                <!--<li><a href="${pageContext.request.contextPath}/user/subpage/project/faq/index.do">FAQ</a></li>-->
                                <li><a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길</a></li>
                            </ul>
                        </li>
                    </ul>

                    <div class="options">
                        <!-- 
                        <div class="font_plus">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/plus.png" alt="크게" /></a>
                        </div>
                        <div class="font_minus">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/minus.png" alt="작게" /></a>
                        </div>
                        -->
                        <div class="print">
                            <a id="print_btn" href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/print.png" alt="작게" /> 프린트</a>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $('#print_btn').on("click", function() {
                            $("#new_sub").printThis({
                                debug: true,
                                importCSS: true,
                                importStyle: true,
                                canvas: true,
                                copyTagClasses: true,
                            });
                        });
                    </script>
                </nav>
                
                <div class="title">
                    <div class="title">
                        <c:if test="${fn:indexOf(requestURI, '/project/base/') > -1}">
                            <h2>프로젝트 기본방향</h2>
                        </c:if>
                        <c:if test="${fn:indexOf(requestURI, '/project/program/') > -1}">
                            <h2>주요 프로그램</h2>
                        </c:if>
                        <c:if test="${fn:indexOf(requestURI, '/project/project/') > -1}">
                            <h2>사업추친체계</h2>
                        </c:if>
                        <c:if test="${fn:indexOf(requestURI, '/project/faq/') > -1}">
                            <h2>FAQ</h2>
                        </c:if>
                        <c:if test="${fn:indexOf(requestURI, '/project/map/') > -1}">
                            <h2>오시는길</h2>
                        </c:if>
                        <p>영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
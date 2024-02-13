<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*,java.text.*" %>
<%
Calendar cal = Calendar.getInstance();

int year = cal.get(cal.YEAR);

String NowYear = String.valueOf(year);
%>
<link type="text/css" rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<style>
.adm_menu_area i{font-size:36px;color:#999;padding:15px 0 0 15px}
.adm_menu_con li a {
    font-weight: 600 !important;
}
</style>
<!DOCTYPE html>
<meta charset="UTF-8">
    <header id="adm_hd">
        <div id="adm_hd_area">
            <div id="adm_hd_con">
                <div class="adm_hd_size nanumgothic">

                    <div class="hd_menu">
                        <!--관리자 메뉴-->
                        <div class="adm_menu_area">
                            <div class="home">
                                <a href="${pageContext.request.contextPath}/admin/member/list.do">
                                    <img src="${pageContext.request.contextPath}/resources/img/admin/home.png" alt="홈" />
                                </a>
                            </div>
                            <ul class="adm_menu_con">
                                <li <c:if test="${fn:indexOf(requestURI, '/member/') > -1 
                                    && fn:indexOf(requestURI, 'matching') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/member/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/member_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>학사관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, '/member/allstudentlist') > -1}">class="nav_active"</c:if>>
                                        	<a href="${pageContext.request.contextPath}/admin/member/allstudentlist.do" >· 학적부 관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, '/member/studentrecord') > -1}">class="nav_active"</c:if>>
                                        	<a href="${pageContext.request.contextPath}/admin/member/studentrecordlist.do?YEAR=<%=NowYear%>" >· 학생부 관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, '/member/mentolist') > -1}">class="nav_active"</c:if>>
                                        	<a href="${pageContext.request.contextPath}/admin/member/mentolist.do?YEAR=<%=NowYear%>" >· 멘토 관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, '/member/matching') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/matching/list.do?YEAR=<%=NowYear%>">· 멘티 - 멘토 매칭관리</a>
                                            <ul class="sub_menu_ob">
											<c:forEach var="i" begin="2020" end="${sysYear }">
												<%String CheckYear = request.getParameter("YEAR"); pageContext.setAttribute("CheckYear",CheckYear);%>
												<li <c:if test="${fn:indexOf(CheckYear, i) > -1}">class="nav_active"</c:if>>
													<a class="<%=request.getParameter("YEAR") %>" id="${fn:indexOf(CheckYear, i) > -1}" year="${i }"href="${pageContext.request.contextPath }/admin/matching/list.do?YEAR=${i}">· ${i}년 매칭관리</a>
												</li>
											</c:forEach>
										</ul>
                                        </li>
                                        
                                        <li <c:if test="${fn:indexOf(requestURI, '/member/list') > -1}">class="nav_active"
                                            </c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/list.do">· 회원그룹관리</a>
                                            <c:if test="${fn:indexOf(requestURI, '/member/list') > -1 }" >
                                            <ul class="sub_menu_ob">
                                            	<li <c:if test="${fn:indexOf(requestURI, '/member/list.do') > -1 && model.beforeDomain.LEVEL == ''}">class="nav_active"</c:if> >
                                            		<a href="${pageContext.request.contextPath}/admin/member/list.do" >통합</a>
                                            	</li>
                                            	<li <c:if test="${fn:indexOf(requestURI, '/member/list.do') > -1 && model.beforeDomain.LEVEL == '8' && model.beforeDomain.COMM_TYPE == ''}">class="nav_active"</c:if> >
                                            		<a href="${pageContext.request.contextPath}/admin/member/list.do?LEVEL=8&TYPE=2" >멘토</a>
                                            	</li>
                                            	<li <c:if test="${fn:indexOf(requestURI, '/member/list.do') > -1 && model.beforeDomain.LEVEL == '11'}">class="nav_active"</c:if> >
                                            		<a href="${pageContext.request.contextPath}/admin/member/list.do?LEVEL=11&TYPE=1">멘티</a>
                                            	</li>
                                            	<li <c:if test="${fn:indexOf(requestURI, '/member/list.do') > -1 && model.beforeDomain.COMM_TYPE == 'ok'}">class="nav_active"</c:if> >
                                            		<a href="${pageContext.request.contextPath}/admin/member/list.do?LEVEL=8&COMM_TYPE=ok&TYPE=2">강사</a>
                                            	</li>
                                            	<li <c:if test="${fn:indexOf(requestURI, '/member/list.do') > -1 && model.beforeDomain.LEVEL == '10'}">class="nav_active"</c:if> >
                                            		<a href="${pageContext.request.contextPath}/admin/member/list.do?LEVEL=10">웹회원</a>
                                            	</li>
                                            </ul>
                                            </c:if>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'program') > -1
                                    && fn:indexOf(requestURI, '/sms_log/program/list.do') == -1 
                                    && fn:indexOf(requestURI, 'participation') == -1 
                                    && fn:indexOf(requestURI, 'activity_allowance') == -1
                                    }">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/program/105/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/program_icon.png" alt="프로그램관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>프로그램 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/program/communicator') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/communicator/list.do">· 커뮤니케이터</a>
                                                </li>
                                                <li><a href="#" onclick="alert('아직 준비중입니다.')">· 학교 방문 프로그램</a></li>
                                                <li><a href="#" onclick="alert('아직 준비중입니다.')">· KAIST 온라인 학습 지원</a></li>
                                                <li><a href="#" onclick="alert('아직 준비중입니다.')">· 멘토링 페스티벌</a></li>
                                                <li><a href="#" onclick="alert('아직 준비중입니다.')">· 추가 프로그램 모듈 관리</a></li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data') > -1 
                                    && fn:indexOf(requestURI, 'banner') == -1
                                    && fn:indexOf(requestURI, 'popup') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/notices_data/1/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/board_icon.png" alt="게시판관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>게시판 관리</span>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/1/') > -1}">class="nav_active"</c:if>>
                                        	<a href="${pageContext.request.contextPath}/admin/notices_data/1/list.do">· 전체 공지사항</a>
                                        	<ul class="sub_menu_ob">
                                        		<c:choose>
                                        			<c:when test="${ssion_local == '서울'}">
	                                            	<li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/15/') > -1}">class="nav_active"</c:if> >
		                                            	<a href="${pageContext.request.contextPath}/admin/notices_data/15/list.do">· 서울 공지사항</a>
		                                            </li>
		                                            </c:when>
		                                            <c:when test="${ssion_local == '인천'}">
	                                            	<li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/16/') > -1}">class="nav_active"</c:if> >
		                                            	<a href="${pageContext.request.contextPath}/admin/notices_data/16/list.do">· 인천 공지사항</a>
		                                            </li>
		                                            </c:when>
                                        			<c:when test="${ssion_local == '대전'}">
	                                            	<li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/17/') > -1}">class="nav_active"</c:if> >
		                                            	<a href="${pageContext.request.contextPath}/admin/notices_data/17/list.do">· 대전 공지사항</a>
		                                            </li>
		                                            </c:when>
		                                            <c:when test="${ssion_local == '부산'}">
	                                            	<li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/18/') > -1}">class="nav_active"</c:if> >
		                                            	<a href="${pageContext.request.contextPath}/admin/notices_data/18/list.do">· 부산 공지사항</a>
		                                            </li>
		                                            </c:when>
	                                            </c:choose>
                                            </ul>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/2/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/2/list.do">· 홍보자료관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/3/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/3/list.do">· 자료실</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/12/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/12/list.do">· FAQ</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/11/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/11/list.do">· 알림마당</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'banner') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/banner/list.do">· 배너관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'popup') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/popup/list.do">· 팝업관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, '/stats') > -1 
                                    && fn:indexOf(requestURI, '/participation/') == -1
                                    && fn:indexOf(requestURI, '/survey') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/stats/student/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/stats_icon.png" alt="통계관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>통계관리</span>
                                        </div>
                                        <li><a href="#" onclick="alert('아직 준비중입니다.')">· 참여자 정보 통계</a></li>
                                        <li><a href="#" onclick="alert('아직 준비중입니다.')">· 프로그램 관련 통계</a></li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'member_re') > -1
                                    && fn:indexOf(requestURI, '/member_re/excelUpload.do') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/member_re/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/freshman_icon.png" alt="신입생관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>신규 참가자 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI , 'member_re/list') > -1 }">class="nav_active"</c:if> ><a href="#" onclick="location.href='${pageContext.request.contextPath}/admin/member_re/list.do'">· 접수자 관리</a></li>
                                        <li <c:if test="${fn:indexOf(requestURI , 'member_re/pass') > -1}">class="nav_active"</c:if> ><a href="${pageContextPath.request.contextPath }/admin/member_re/pass.do?RESULT=pass" >· 대상자 관리</a></li>
                                        <li <c:if test="${fn:indexOf(requestURI , '/member_re/dcmnt.do') > -1 }">class=nav_active</c:if> ><a href="${pageContext.request.contextPath}/admin/member_re/dcmnt.do" >· 지원 자격 관리</a></li>
                                        <li <c:if test="${fn:indexOf(requestURI , '/member_re/config.do') > -1 }">class="nav_active"</c:if> >
                                        	<a href="${pageContext.request.contextPath }/admin/member_re/config.do?YEAR=<%=NowYear%>" >· 신입생 선발 관리</a>
                                        	<ul class="sub_menu_ob" >
                                        		<c:forEach var="i" begin="2022" end="<%=year %>">
                                        		<%String CheckYear = request.getParameter("YEAR"); pageContext.setAttribute("CheckYear",CheckYear);%>
                                        			<li <c:if test="${CheckYear == i}">class="nav_active"</c:if> >
                                        				<a href="${pageContext.request.contextPath }/admin/member_re/config.do?YEAR=${i}" >- ${i }년도</a>
                                        			</li>
                                        		</c:forEach>
                                        	</ul>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'portfolio') > -1
                                    && fn:indexOf(requestURI, '/stat/') == -1}">
                                    class="adm_menu_active"
                                    </c:if> >
                                    <a href="${pageContext.request.contextPath}/admin/portfolio/stat.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/portfolio_icon.png" alt="포트폴리오" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>포트폴리오 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, 'portfolio/stat.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/portfolio/stat.do">· 포트폴리오 통계</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'portfolio/list.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/portfolio/list.do?YEAR=<%=NowYear%>">· 포트폴리오 모니터링</a>
                                            <ul class="sub_menu_ob">
											<c:forEach var="i" begin="2020" end="${sysYear }">
												<%String ss = request.getParameter("YEAR"); pageContext.setAttribute("ss",ss);%>
												<li <c:if test="${fn:indexOf(ss, i) > -1}">class="nav_active"</c:if>>
													<a class="<%=request.getParameter("YEAR") %>" id="${fn:indexOf(ss, i) > -1}" year="${i }"href="${pageContext.request.contextPath }/admin/portfolio/list.do?YEAR=${i}">· ${i}년 모니터링</a>
												</li>
											</c:forEach>
										</ul>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'exam') > -1
                                    || fn:indexOf(requestURI, 'question') > -1
                                    || fn:indexOf(requestURI, 'select') > -1}">
                                    class="adm_menu_active"
                                    </c:if> >
                                    <a href="${pageContext.request.contextPath}/admin/exam/list.do">
                                        <i class="las la-bars"></i>
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>설문 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, 'exam/list.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/exam/list.do">· 설문 폼 관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'question/list.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/question/list.do">· 설문 문제 관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'award') > -1
                                    || fn:indexOf(requestURI, 'submission') > -1}">
                                    class="adm_menu_active"
                                    </c:if> >
                                    <a href="${pageContext.request.contextPath}/admin/award/list.do">
                                        <i class="las la-bars"></i>
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>참여 게시판 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, 'award/list.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/award/list.do">· 참여 게시판 관리</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--관리자 메뉴 end-->

                        <!--서브메뉴 및 배너카드-->
                        <div class="adm_banner_area">
                            <div class="adm_logo">
                                <h2>ADMINISTRATOR</h2>
                            </div>
                            <div class="adm_banner_con">
                                <div class="card_area">
                                    <ul class="card_con">
                                        <li>
                                            <span>로그인 시간</span>
                                            <span>${session_login_tm }</span>
                                        </li>
                                        <li>
                                            <span>관리자 아이디</span>
                                            <span>${ssion_user_id }</span>
                                        </li>
                                        <li>
                                        	<span>관리자 관리 지역</span>
                                            <span>${ssion_local_type }</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="phone_area">
                                    <div class="phone_con">
                                        <div class="phone_icon">
                                            <span><img src="${pageContext.request.contextPath}/resources/img/admin/phone.png" alt="전화기"></span>
                                        </div>
                                        <div class="phone_txt">
                                            <p>이용불편문의</p>
                                            <h2>042.935.5421</h2>
                                        </div>
                                    </div>
                                    <p>E-mail : inct@inct.co.kr</p>
                                </div>
                            </div>
                        </div>
                        <!--서브메뉴 및 배너카드 end-->

                    </div>
                    
                    <ul class="hd_adm_menu">
                        <li class="hd_active">
                            <a href="${pageContext.request.contextPath}/admin/member/list.do">MAIN</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/index.do">HOMEPAGE</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/member/logout.do">LOGOUT</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </div>
    </header>

    <script>
        function fileDown(url) {
            location.href = encodeURI(url);
        }
    </script>


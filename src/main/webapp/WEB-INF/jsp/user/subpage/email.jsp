<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <%@ include file="../include/head.jsp" %>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
   <!--추가 css-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
</head>

<body>
    <header id="new_hd" class="hd_wrap">
	<%@ include file="../include/header.jsp" %> 
	
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
	                                <a href="#">부가서비스<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
	                                </a>
	                                <ul class="sub_ul_menu">
	                                    <li><a href="../sub/sub_01_a.html">영재키움 프로젝트</a></li>
	                                    <li><a href="#">학생 프로그램</a></li>
	                                    <li><a href="#">교사 프로그램</a></li>
	                                    <li><a href="#">커뮤니티</a></li>
	                                    <li><a href="#">마이페이지</a></li>
	                                </ul>
	                            </li>
	                            <li class="sub_nav_menu">
	                                <a href="#">이메일무단수집거부<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
	                                <ul class="sub_ul_menu">
	                                    <li><a href="#">로그인</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/user/subpage/policy/index.do">개인정보처리방침</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/user/subpage/individual/index.do">웹접근성정책</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/user/subpage/email/index.do">이메일무단수집거부</a></li>
	                                </ul>
	                            </li>
	                        </ul>
	                        <!-- 
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
	                         -->
                    	</nav>
                    	<div class="title">
	                        <h2>이메일무단수집거부</h2>
	                        <p><span>영재키움프로젝트</span>에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용합니다.</p>
                        </div>
					</div>
				</div>
			</div>
		</div>
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
                			<h2>부가서비스</h2>
                		</div>
                		<ul class="right_nav_area">
                			<li><a href="#">로그인 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                			<li><a href="${pageContext.request.contextPath}/user/subpage/policy/index.do">개인정보처리방침<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                			<li><a href="${pageContext.request.contextPath}/user/subpage/individual/index.do">웹접근성정책<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                			<li><a href="${pageContext.request.contextPath}/user/subpage/email/index.do">이메일무단수집거부<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                		</ul>
                	</nav>
                	<!-- 메뉴바  end-->
					
					<nav class="sub_min_size">
						<div class="program_wrap">
							<div class="program intro_con">
								<div class="txt_con_box">
									<p>
    									<b>영재키움 프로젝트</b>에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,
    									이를 위반 시 정보통신망법에 의해 형사처벌 됨을 유념하시기 바랍니다. 정보통신망이용촉진및정보보호등에관한법률 [일부개정2002.12.18 법률제06797호]
   									<p>
								</div>
								<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제50조의2 (전자우편주소의 무단 수집행위 등 금지)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <p style="width:100%;">■ 누구든지 전자우편주소의 수집을 거부하는 의사가 명시된 인터넷 홈페이지에서 자동 전자우편 주소를 수집하는 프로그램 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집 하여서는 아니된다.</p>
                                    </li>
                                    <li>
                                        <p style="width:100%;">■ 누구든지 제1항의 규정을 위반하여 수집된 전자우편주소를 판매, 유통하여서는 아니된다.</p>
                                    </li>
                                    <li>
                                        <p style="width:100%;">■ 누구든지 제1항 및 제2항의 규정에 의하여 수집·판매 및 유통이 금지된 전자우편주소임을 알고 이를 정보전송에 이용하여서는 아니된다.</p>
                                    </li>
                                </ul>
							</div>
						</div>
						<div class="program_wrap mr-t-50">
							<div class="program intro_con">
								<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제65조의2 (벌칙) 다음 각호의 1에 해당하는 자는 1천만원 이하의 벌금에 처한다.</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<p style="width:100%;">■ 제50조제4항의 규정을 위반하여 기술적 조치를 한 자</p>
                                	</li>
                                	<li>
                                		<p style="width:100%;">■ 제50조제6항의 규정을 위반하여 영리목적의 광고성 정보를 전송한 자</p>
                                	</li>
                                	<li>
                                		<p style="width:100%;">■ 제50조의2의 규정을 위반하여 전자우편주소를 수집ㆍ판매ㆍ유통 또는 정보전송에 이용한 자</p>
                                	</li>
                                </ul>
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

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
	                                <a href="#">웹접근성정책<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
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
	                        <h2>웹접근성정책</h2>
	                        <p><span>영재키움프로젝트</span>장애인, 노인 등 정보취약계층의 인터넷 정보 접근을 보장해줍니다.</p>
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
    									<b>영재키움 프로젝트</b>은 장애인, 노인 등 정보취약계층의 인터넷 정보 접근을 보장하기 위해 의무화된 「장애인 차별금지 및 권리구제 등에 관한 법률」
    									에 의거하여 2010년 12월 국가표준(KICS)으로 제정된 “한국형 웹 콘텐츠 접근성 지침 2.1(KICS.OT-10.0003/R1)”을 준수하여 제작하였습니다.
   									<p>
    							</div>
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>1. 인식의 용이성</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <p style="width:100%;">1.1 (대체 텍스트) 텍스트 아닌 콘텐츠에는 대체 텍스트를 제공합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (적절한 대체 텍스트 제공) 텍스트 아닌 콘텐츠는 그 의미나 용도를 이해할 수 있도록 대체 텍스트를 제공합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">1.2 (멀티미디어 대체 수단) 동영상,음성 등 멀티미디어 콘텐츠를 이해할 수 있도록 대체 수단을 제공합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (자막 제공) 멀티미디어 콘텐츠에는 자막, 원고 또는 수화를 제공합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">1.3 (명료성) 콘텐츠는 명확하게 전달합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (색에 무관한 콘텐츠 인식) 콘텐츠는 색에 관계없이 인식될 수 있도록 합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (명확한 지시 사항 제공) 지시 사항은 모양, 크기, 위치, 방향, 색, 소리 등에 관계 없이 인식될 수 있도록 합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (텍스트 콘텐츠의 명도 대비) 텍스트 콘텐츠와 배경 간의 명도 대비는 4.5대 1 이상이 되도록 합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (배경음 사용 금지) 자동으로 재생되는 배경음을 사용하지 않습니다.
                                        	</li>
                                        </ul>
                                    </li>
                                </ul>
							</div>
						</div>
						<div class="program_wrap mr-t-50">
							<div class="program intro_con">
								<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>2. 운용의 용이성</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                        <p style="width:100%;">2.1 (키보드 접근성) 콘텐츠는 키보드로 접근할 수 있습니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (키보드 사용 보장) 모든 기능은 키보드만으로도 사용할 수 있습니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (초점 이동) 키보드에 의한 초점은 논리적으로 이동해야 하며, 시각적으로 구별할 수 있습니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">2.2 (충분한 시간 제공) 콘텐츠를 읽고 사용하는 데 충분한 시간을 제공 합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (응답시간 조절) 시간 제한이 있는 콘텐츠는 응답시간을 조절할 수 있습니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (정지 기능 제공) 자동으로 변경되는 콘텐츠는 움직임을 제어할 수 있습니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">2.3 (광과민성 발작 예방) 광과민성 발작을 일으킬 수 있는 콘텐츠를 제공하지 않습니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (깜빡임과 번쩍임 사용 제한) 초당 3~50회의 주기로 깜빡이거나 번쩍이는 콘텐츠를 제공하지 않습니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">2.4 (쉬운 내비게이션) 콘텐츠는 쉽게 내비게이션할 수 있도록 합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (반복 영역 건너뛰기) 콘텐츠의 반복되는 영역은 건너뛸 수 있도록 합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (제목 제공) 페이지, 프레임, 콘텐츠 블록에는 적절한 제목을 제공합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (적절한 링크 텍스트) 링크 텍스트는 용도나 목적을 이해할 수 있도록 제공합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                </ul>
							</div>
						</div>
						<div class="program_wrap mr-t-50">
							<div class="program intro_con">
								<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>3. 이해의 용이성</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                        <p style="width:100%;">3.1 (가독성) 콘텐츠는 읽고 이해하기 쉽게 제공합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> 3.1.1(기본 언어 표시) 주로 사용하는 언어를 명시합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">3.2 (예측 가능성) 콘텐츠의 기능과 실행 결과는 예측 가능하도록 합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (사용자 요구에 따른 실행) 사용자가 의도하지 않은 기능(새 창, 초점변화 등)은 실행되지 않도록 합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">3.3 (콘텐츠의 논리성) 콘텐츠는 논리적으로 구성합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (콘텐츠의 선형화) 콘텐츠는 논리적인 순서로 제공합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (표의 구성) 표는 이해하기 쉽게 구성합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                    <li>
                                        <p style="width:100%;">3.4 (입력 도움) 입력 오류를 방지하거나 정정할 수 있도록 합니다.</p>
                                        <ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (레이블 제공) 입력 서식에는 대응하는 레이블을 제공해야 합니다.
                                        	</li>
                                        	<li>
                                        		<span></span> (오류 정정) 입력 오류를 정정할 수 있는 방법을 제공합니다.
                                        	</li>
                                        </ul>
                                    </li>
                                </ul>
							</div>
						</div>
						<div class="program_wrap mr-t-50">
							<div class="program intro_con">
								<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>4. 견고성</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<p style="width:100%;">4.1 (문법 준수) 웹 콘텐츠는 마크업 언어의 문법을 준수 합니다.</p>
                                		<ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (마크업 오류 방지) 마크업 언어의 요소는 열고 닫음, 중첩 관계 및 속성 선언에 오류가 없습니다.
                                        	</li>
                                        </ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">4.2 (웹 애플리케이션 접근성) 웹 애플리케이션은 접근성이 있습니다.</p>
                                		<ul class="intro_sub_txt">
                                        	<li>
                                        		<span></span> (웹 애플리케이션 접근성 준수) 콘텐츠에 포함된 웹 애플리케이션은 접근성이 있습니다.
                                        	</li>
                                        </ul>
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

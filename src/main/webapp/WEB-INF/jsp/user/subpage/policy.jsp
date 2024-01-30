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
	                                <a href="#">개인정보처리방침<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
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
	                        <h2>개인정보처리방침</h2>
	                        <p><span>영재키움프로젝트</span>에서 취급하는 모든 개인정보는 관련 법령에 근거하여 수집·보유 및 처리되고 있습니다.</p>
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
    									<b>영재키움 프로젝트</b>에서 취급하는 모든 개인정보는 관련 법령에 근거하여 수집∙보유 및 처리되고 있으며,
    									<b>개인정보보호법 제30조(개인정보 처리방침의 수립 및 공개)</b>에 따라 정보주체의 개인정보 및 권익을 보호하고 개인정보와 관련한 고충을
    									원활하게 처리할 수 있도록 다음과 같이 개인정보 처리방침을 수립∙공개하고 있습니다.
   									<p>
    							</div>
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제1조(개인정보의 처리목적)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <span>
                                        	<b>영재키움프로젝트</b>은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며,
                                        	 이용 목적이 변경될 시에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
                                        </span>
                                    </li>
                                </ul>
                                <div class="sub_page">
	                            	<table class="txt select_table">
		                        		<thead>
			                                <tr>
				                                <th style="width:20%;">개인정보파일의 명칭</th>
				                                <th>처리목적</th>
				                                <th style="width:15%;">운영근거</th>
				                                <th style="width:15%;">처리항목</th>
				                                <th style="width:15%;">보유기간</th>
			                                </tr>
		                                </thead>
		                                <tbody>
		                                	<tr>
		                                		<td>홈페이지 관리자정보</td>
		                                		<td>홈페이지 운영</td>
		                                		<td>정보주체의 동의</td>
		                                		<td>ID, 성명</td>
		                                		<td>인사발령시</td>
		                                	</tr>
		                                	<tr>
		                                		<td>홈페이지 회원정보</td>
		                                		<td>
		                                			홈페이지 회원관리<br>
		                                			(회원제 서비스 이용에 따른 본인확인, 불량 회원의 부정이용 방지, 가입의사 확인, 불만처리 등 민원처리, 고지사항 전달 등)
		                                		</td>
		                                		<td>정보주체의 동의</td>
		                                		<td>ID, 이름, 휴대전화, 이메일</td>
		                                		<td>회원탈퇴시까지</td>
		                                	</tr>
		                                </tbody>
	                            	</table>
                            	</div>
                            </div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제2조(개인정보의 제3자 제공)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <span>
                                        	<b>영재키움프로젝트</b>은 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
                                        </span>
                                    </li>
                                </ul>
                            </div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제3조(개인정보 처리 위탁)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <span>
                                        	<b>영재키움프로젝트</b>은 원칙적으로 이용자의 동의없이 해당 개인정보의 처리를 타인에게 위탁 및 위임하지 않습니다. 개인정보처리 위탁및 위임 사유가 생길경우, 
                                        	그 사항을 개인정보처리방침을 통해 고지하겠습니다.
                                        </span>
                                    </li>
                                    <li>
                                    	<span>
                                    		<b>영재키움프로젝트</b>은 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보처리업무를 위탁하고 있습니다.
                                    	</span>
                                    </li>
                                </ul>
                                <div class="sub_page">
	                            	<table class="txt select_table">
		                        		<thead>
			                                <tr>
				                                <th style="width:33.3%;">위탁업무</th>
				                                <th style="width:33.3%;">위탁기간</th>
				                                <th style="width:33.3%;">수탁기간</th>
			                                </tr>
		                                </thead>
		                                <tbody>
		                                	<tr>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                	</tr>
		                                </tbody>
	                            	</table>
                            	</div>
                            </div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제4조(정보주체의 권리∙ 의무 및 그 행사방법)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                    <li>
                                        <span>
                                        	정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
                                        </span>
                                    </li>
                                    <li>
                                    	<p style="width:100%;">1. 개인정보 열람요구</p>
                                    </li>
                                    <li>
                                    	<p style="width:100%;">2. 오류 등이 있을 경우 정정 요구</p>
                                    </li>
                                    <li>
                                    	<p style="width:100%;">3. 삭제요구</p>
                                    </li>
                                    <li>
                                    	<p style="width:100%;">4. 처리정지 요구</p>
                                    	<ul class="intro_sub_txt">
                                    		<li>① 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.</li>
                                    		<li>② 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</li>
                                    		<li>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</li>
                                    		<li>④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</li>
                                    		<li>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
                                    		<li>⑥ 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</li>
                                    		<li><span></span> [개인정보보호법 시행규칙 별지 제8호] 개인정보(열람, 정정·삭제, 처리정지) 요구서</li>
                                    		<li><span></span> [개인정보보호법 시행규칙 별지 제11호] 위임장</li>
                                    	</ul>
                                    </li>
                                </ul>
    						</div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제5조 (개인정보의 파기)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<span><b>영재키움프로젝트</b>은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</span>
                                	</li>
                                	<li>
                                		<p style="width:100%;">1.파기절차</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보는 목적 달성 후 즉시 또는 별도의 공간에 옮겨져 내부 방침 및 기타 관련법령에 따라 일정기간 저장된 후 파기됩니다. 별도의 공간으로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">2. 파기기한 및 방법</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 보유기간이 만료되었거나 개인정보의 처리 목적 달성, 해당 업무의 폐지 등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다</li>
                                			<li><span></span> 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
                                			<li><span></span> 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</li>
                                			<li><span></span> <b>보존기간이 만료된 개인정보는 회원정보를 제외하고는 "공공기관 기록물관리법"에 따라 심의를 거쳐 파기됩니다. 보존기간 만료에서 파기 시 까지는 별도의 DB에 관리함을 알려 드립니다.</b></li>
                                		</ul>
                                	</li>
                                </ul>
    						</div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제6조 (개인정보의 안전성 확보조치)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<span><b>영재키움프로젝트</b>은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적, 관리적 및 물리적 조치를 하고 있습니다.</span>
                                	</li>
                                	<li>
                                		<p style="width:100%;">1.개인정보 취급 직원의 최소화 및 교육</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">2. 내부관리계획의 수립 및 시행</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">3. 개인정보의 암호화</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 이용자의 개인정보는 암호화 되어 저장 및 관리되고 있습니다. 중요한 데이터는 저장 및 전송시 암호화 하여 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">4. 해킹 등에 대비한 기술적 대책</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적, 물리적으로 감시 및 차단하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">5. 개인정보처리시스템 접근 제한</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">6. 접속기록의 보관</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보처리시스템에 접속한 기록(웹로그, 요약정보 등)을 최소 6개월 이상 보관, 관리하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">7. 문서보안을 위한 잠금장치 사용</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">8. 비인가자에 대한 출입 통제</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</li>
                                		</ul>
                                	</li>
                                </ul>
    						</div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제7조 (개인정보보호 책임자 및 담당자)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<span><b>영재키움프로젝트</b>은 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 실무담당자를 지정하고 있습니다. (개인정보보호법 제31조 제1항에 따른 개인정보 보호책임자)</span>
                                	</li>
                                	<li>
                                		<p style="width:100%;">개인정보 보호책임자</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 담당부서 :</li>
                                			<li><span></span> 성명 :</li>
                                			<li><span></span> 전화 :</li>
                                			<li><span></span> 이메일 :</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">개인정보 보호담당자</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 담당부서 :</li>
                                			<li><span></span> 성명 :</li>
                                			<li><span></span> 전화 :</li>
                                			<li><span></span> 이메일 :</li>
                                		</ul>
                                	</li>
                                </ul>
    						</div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제8조(권익침해 구제 방법)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<span>정보주체는 개인정보 침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다.</span>
                                	</li>
                                	<li>
                                		<p style="width:100%;">가. 개인정보 침해신고센터 (한국인터넷진흥원 운영)</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 소관업무 : 개인정보 침해사실 신고, 상담 신청</li>
                                			<li><span></span> 홈페이지 : privacy.kisa.or.kr</li>
                                			<li><span></span> 전화 : (국번없이) 118</li>
                                			<li><span></span> 주소 : (138-950) 서울 송파구 중대로 135 한국인터넷진흥원 개인정보침해신고센터</li>
                                		</ul>
                                	</li>
                                	<li>
                                		<p style="width:100%;">나. 개인정보 분쟁조정위원회 (한국인터넷진흥원 운영)</p>
                                		<ul class="intro_sub_txt">
                                			<li><span></span> 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)</li>
                                			<li><span></span> 홈페이지 : privacy.kisa.or.kr</li>
                                			<li><span></span> 전화 : (국번없이) 118</li>
                                			<li><span></span> 주소 : (138-950) 서울 송파구 중대로 135 한국인터넷진흥원 개인정보침해신고센터</li>
                                		</ul>
                                	</li>
                                </ul>
    						</div>
    					</div>
    					<div class="program_wrap mr-t-50">
    						<div class="program intro_con">
    							<div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>제9조(개인정보처리방침의 변경)</p>
                                </div>
                                <ul class="txt career_txt intro_txt">
                                	<li>
                                		<p style="width:100%;">① 본 방침은 2016-01-01부터 시행됩니다.</p>
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
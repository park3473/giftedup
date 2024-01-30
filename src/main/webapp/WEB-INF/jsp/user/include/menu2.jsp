<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="left">
		  <!-- 로고 -->
	        <div class="logo pointer" onclick="location.href='${pageContext.request.contextPath}/index.do'">
	            <img src="${pageContext.request.contextPath}/resources/img/2022/logo.png" alt="">
	            <p class="font_noto gray_10 c_hide">영재키움프로젝트</p>
	        </div>
	        <!-- 로고끝 -->
	        <!-- 로그인 -->
	        <ul class="nav gab_02">
	        	<c:if test="${ssion_login == null || ssion_login == 'nono' }">
	            	<li><a href="${pageContext.request.contextPath}/user/member/login.do">로그인</a></li>
	            </c:if>
	            <c:if test="${ssion_login == 'okok' }">
	            	<li><a href="${pageContext.request.contextPath}/user/member/logout.do">로그아웃</a></li>
	            	<c:if test="${ssion_level == '1' || ssion_level == '2'}">
	            		<li><a href="${pageContext.request.contextPath}/admin/member/list.do">관리자</a></li>
	            	</c:if>
	            </c:if>
	        </ul>
	        <!-- 로그인끝 -->
	        <!-- 메뉴 -->
	      <div class="sidebarMenu">
		    <div id='cssmenu'>
			    <ul>
			        <li class='has-sub 
			        <c:if test="${
			        fn:indexOf(requestURI , '/user/subpage/project/base/index.do') > -1 
			        || fn:indexOf(requestURI , '/user/program/101/list.do') > -1
			        || fn:indexOf(requestURI , '/user/notices_data/13/list.do') > -1
			        || fn:indexOf(requestURI , '/user/mentoring/list.do') > -1
			        || fn:indexOf(requestURI , '/user/notices_data/13/list.do') > -1
			      	|| fn:indexOf(requestURI , '/user/notices_data/7/list.do') > -1
			      	|| fn:indexOf(requestURI , '/user/notices_data/8/list.do') > -1
			      	|| fn:indexOf(requestURI , '/user/subpage/program/find/index.do') > -1
			      	|| fn:indexOf(requestURI , '/user/subpage/program/mentoring/index.do') > -1
			      	|| fn:indexOf(requestURI , '/user/subpage/program/patent/index.do') > -1
			      	|| fn:indexOf(requestURI , '/user/program/105/list.do') > -1
			      	|| fn:indexOf(requestURI , '/user/subpage/program/camp/index.do') > -1
			      	|| fn:indexOf(requestURI , '/user/program/102/list.do') > -1
			      	|| fn:indexOf(requestURI , '/user/program/104/list.do') > -1
			      	|| fn:indexOf(requestURI , '/user/program/106/list.do') > -1
			        }">active</c:if>
			        '>
			        <a href='#'>학생프로그램</a>
			        <ul>
			            <li class='has-sub
			            <c:if test="${
				        fn:indexOf(requestURI , '/user/subpage/project/base/index.do') > -1 
				        || fn:indexOf(requestURI , '/user/program/101/list.do') > -1
				        || fn:indexOf(requestURI , '/user/notices_data/13/list.do') > -1
				        || fn:indexOf(requestURI , '/user/mentoring/list.do') > -1
				        || fn:indexOf(requestURI , '/user/notices_data/13/list.do') > -1
				      	|| fn:indexOf(requestURI , '/user/notices_data/7/list.do') > -1
				      	|| fn:indexOf(requestURI , '/user/notices_data/8/list.do') > -1
				        }">active</c:if>
			            '><a href='#'>영재교육프로그램</a>
			                <ul>
							    <li><a href='${pageContext.request.contextPath}/user/subpage/project/base/index.do'>프로그램소개</a></li>
			                    <li><a href='${pageContext.request.contextPath}/user/program/101/list.do'>융합과학프로젝트</a></li>
			                    <li><a href='${pageContext.request.contextPath}/user/notices_data/13/list.do'>온라인학습멘토링</a></li>
								<li><a href='${pageContext.request.contextPath}/user/mentoring/list.do'>전문가멘토링</a></li>
								<li><a href='${pageContext.request.contextPath}/user/notices_data/13/list.do'>공지사항</a></li>
								<li><a href='${pageContext.request.contextPath}/user/notices_data/7/list.do'>학습도전</a></li>
								<li><a href='${pageContext.request.contextPath}/user/notices_data/8/list.do'>학습질문</a></li>
			                </ul>
			            </li>
			            <li class='has-sub
			            <c:if test="${
				        fn:indexOf(requestURI , '/user/subpage/program/find/index.do') > -1 
				        || fn:indexOf(requestURI , '/user/subpage/program/mentoring/index.do') > -1
				        || fn:indexOf(requestURI , '/user/subpage/program/patent/index.do') > -1
				        || fn:indexOf(requestURI , '/user/program/105/list.do') > -1
				        }">active</c:if>
			            '><a href='#'>체험진로탐색프로그램</a>
						    <ul>
							    <li><a href='${pageContext.request.contextPath}/user/subpage/program/find/index.do'>프로그램소개</a></li>
			                    <li><a href='${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do'>또래멘토링소개</a></li>
			                    <li><a href='javascript:alert("준비중입니다.")'>문화체험소개</a></li>
								<li><a href='javascript:alert("준비중입니다.")'>진로탐색소개</a></li>
								<li><a href='${pageContext.request.contextPath}/user/subpage/program/patent/index.do'>발명특허 및 교육</a></li>
								<li><a href='${pageContext.request.contextPath}/user/program/105/list.do'>발명특허 및 교육 신청</a></li>
			                </ul>
						</li>
			            <li class='has-sub
			            <c:if test="${
				        fn:indexOf(requestURI , '/user/subpage/program/camp/index.do') > -1 
				        || fn:indexOf(requestURI , '/user/program/102/list.do') > -1
				        || fn:indexOf(requestURI , '/user/program/104/list.do') > -1
				        || fn:indexOf(requestURI , '/user/program/106/list.do') > -1
				        }">active</c:if>
			            '><a href='#'>창의융합캠프</a>
						    <ul>
							    <li><a href='${pageContext.request.contextPath}/user/subpage/program/camp/index.do'>창의융합캠프 소개</a></li>
			                    <li><a href='${pageContext.request.contextPath}/user/program/102/list.do'>창의융합캠프 신청</a></li>
			                </ul>
						</li>
			            <li><a href='${pageContext.request.contextPath}/user/program/104/list.do'>자율연구</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/communicator/list.do'>커뮤니케이터</a></li>
						<li><a href='${pageContext.request.contextPath}/user/program/106/list.do'>기타</a></li>
			        </ul>
			        </li>
			        <li class='has-sub
			        <c:if test="${
				        fn:indexOf(requestURI , '/user/program/201/list.do') > -1 
				        || fn:indexOf(requestURI , '/user/program/202/list.do') > -1
				        || fn:indexOf(requestURI , '/user/program/203/list.do') > -1
				        || fn:indexOf(requestURI , '/user/program/204/list.do') > -1
				        }">active</c:if>
			        '>
			        <a href='#'>교사프로그램</a>
			        <ul>
			            <li><a href='${pageContext.request.contextPath}/user/program/201/list.do'>교사연수</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/program/202/list.do'>중앙컨설팅</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/program/203/list.do'>성과발표회</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/program/204/list.do'>발대식</a></li>
			        </ul>
			        </li>
			        <li class='has-sub
			        <c:if test="${
				        fn:indexOf(requestURI , '/user/subpage/project/base/index.do') > -1 
				        || fn:indexOf(requestURI , '/user/subpage/project/program/index.do') > -1
				        || fn:indexOf(requestURI , '/user/subpage/project/project/index.do') > -1
				        || fn:indexOf(requestURI , '/user/subpage/project/map/index.do') > -1
				        }">active</c:if>
			        '>
			        <a href='#'>영재키움프로젝트</a>
			        <ul>
			            <li><a href='${pageContext.request.contextPath}/user/subpage/project/base/index.do'>프로젝트 기본방향</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/subpage/project/program/index.do'>주요프로그램</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/subpage/project/project/index.do'>사업추진체계</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/subpage/project/map/index.do'>오시는길</a></li>
			        </ul>
			        </li>
			        <li class='has-sub
			        <c:if test="${
				        fn:indexOf(requestURI , '/user/notices_data/1/list.do') > -1 
				        || fn:indexOf(requestURI , '/user/notices_data/2/list.do') > -1
				        || fn:indexOf(requestURI , '/user/notices_data/4/list.do') > -1
				        || fn:indexOf(requestURI , '/user/notices_data/12/list.do') > -1
				        || fn:indexOf(requestURI , '/user/notices_data/11/list.do') > -1
				        }">active</c:if>
			        '>
			        <a href='#'>커뮤니티</a>
			        <ul>
			            <li><a href='${pageContext.request.contextPath}/user/notices_data/1/list.do'>공지사항</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/notices_data/2/list.do'>홍보자료</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/notices_data/4/list.do'>자료실</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/notices_data/12/list.do'>FAQ</a></li>
			            <li><a href='${pageContext.request.contextPath}/user/notices_data/11/list.do'>알림마당</a></li>
			        </ul>
			        </li>
			        <li class='has-sub
			        <c:if test="${
				        fn:indexOf(requestURI , '/user/member_re/intro.do') > -1 
				        }">active</c:if>
			        '>
			        <a href='#'>모집</a>
			        <ul>
			            <li><a href='${pageContext.request.contextPath}/user/member_re/intro.do'>신규 참가자 지원</a></li>
			            <li><a href='javascript:alert("2022 신규 참가자 모집은 종료되었습니다.")'>지원서 조회 및 수정</a></li>
			            <li><a href='javascript:alert("2022 신규 참가자 모집은 종료되었습니다.")'>합격자 조회</a></li>
			        </ul>
			        </li>
			        <c:if test="${ssion_login == 'okok' }">
			        <li class='has-sub'>
			        <a href='#'>마이페이지</a>
			        <ul>
			            
			            <li><a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a></li>
                       	<li><a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">나의 커뮤니케이터</a></li>
						<li><a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오</a></li>
						<li><a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a></li>
						<li><a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a></li>
						 
						 <!--
						 <li><a onclick="alert('아직 준비중 입니다..')">기본정보수정</a></li>
                       	<li><a onclick="alert('아직 준비중 입니다..')">나의 커뮤니케이터</a></li>
						<li><a onclick="alert('아직 준비중 입니다..')">포트폴리오</a></li>
						<li><a onclick="alert('아직 준비중 입니다..')">프로그램 신청</a></li>
						<li><a onclick="alert('아직 준비중 입니다..')">설문조사</a></li>
						-->
			        </ul>
			        </li>
			        </c:if>
			    </ul>
			</div>
		  </div>
	        <!-- 메뉴끝 -->
	    </div>
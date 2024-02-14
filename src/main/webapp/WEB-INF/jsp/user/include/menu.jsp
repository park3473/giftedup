<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member_re.js"></script>
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
			        <li class="has-sub 
			        <c:if test="${
			        fn:indexOf(requestURI , '/user/subpage/project/main/index.do') > -1 
			        || fn:indexOf(requestURI , '/user/subpage/project/direction/index.do') > -1
			        || fn:indexOf(requestURI , '/user/subpage/project/system/index.do') > -1
			        || fn:indexOf(requestURI , '/user/subpage/project/student/index.do') > -1
			        || fn:indexOf(requestURI , '/user/subpage/program/camp/index.do') > -1
			        || fn:indexOf(requestURI , '/user/program/102/list.do') > -1
			        || fn:indexOf(requestURI , '/user/program/104/list.do') > -1
			        || fn:indexOf(requestURI , '/user/program/106/list.do') > -1
			        || fn:indexOf(requestURI , '/user/subpage/project/mento/index.do') > -1
			        || fn:indexOf(requestURI , '/user/program/201/list.do') > -1
			        || fn:indexOf(requestURI , '/user/program/202/list.do') > -1
			        || fn:indexOf(requestURI , '/user/program/203/list.do') > -1
			        || fn:indexOf(requestURI , '/user/program/204/list.do') > -1
			        }">active</c:if>
			        
			         ">
			        	<a href="#">영재키움 프로젝트</a>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/subpage/project/main/index.do">영재키움 프로젝트 소개</a>
			        		</li>
			        	</ul>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/subpage/project/direction/index.do">사업 추진방향</a>
			        		</li>
			        	</ul>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/subpage/project/system/index.do">사업 추진체계</a>
			        		</li>
			        	</ul>
			        	<ul>
			        		<li class="has-sub
			        		
			        		<c:if test="${
					        fn:indexOf(requestURI , '/user/subpage/project/student/index.do') > -1 
					        || fn:indexOf(requestURI , '/user/subpage/program/camp/index.do') > -1
					        || fn:indexOf(requestURI , '/user/program/102/list.do') > -1
					        || fn:indexOf(requestURI , '/user/program/104/list.do') > -1
					        || fn:indexOf(requestURI , '/user/program/106/list.do') > -1
					        }">active</c:if>
			        		
			        		">
			        			<a href="#">학생 프로그램</a>
			        			<ul>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/subpage/project/student/index.do">학생 프로그램 소개</a>
			        				</li>
			        				<li class="has-sub
			        				
			        				<c:if test="${
							        fn:indexOf(requestURI , '/user/subpage/program/camp/index.do') > -1 
							        || fn:indexOf(requestURI , '/user/program/102/list.do') > -1
							        }">active</c:if>
			        				
			        				">
			        					<a href="#">창의 융합캠프</a>
			        					<ul>
			        						<li>
			        							<a href="${pageContext.request.contextPath}/user/subpage/program/camp/index.do">창의 융합캠프 소개</a>
			        						</li>
			        						<li>
			        							<a href="${pageContext.request.contextPath}/user/program/102/list.do">창의 융합캠프 신청</a>
			        						</li>
			        					</ul>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/program/104/list.do">자율연구</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/program/106/list.do">기타</a>
			        				</li>
			        			</ul>
			        		</li>
			        	</ul>
			        	<ul>
			        		<li class="has-sub
			        		
			        		<c:if test="${
					        fn:indexOf(requestURI , '/user/subpage/project/mento/index.do') > -1 
					        || fn:indexOf(requestURI , '/user/program/201/list.do') > -1
					        || fn:indexOf(requestURI , '/user/program/202/list.do') > -1
					        || fn:indexOf(requestURI , '/user/program/203/list.do') > -1
					        || fn:indexOf(requestURI , '/user/program/204/list.do') > -1
					        }">active</c:if>
			        		
			        		">
			        			<a href="#">교사 프로그램</a>
			        			<ul>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/subpage/project/mento/index.do">교사 프로그램 소개</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/program/201/list.do">교사 연수</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/program/202/list.do">중앙컨설팅</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/program/203/list.do">성과발표회</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/program/204/list.do">발대식</a>
			        				</li>
			        			</ul>
			        		</li>
			        	</ul>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길</a>
			        		</li>
			        	</ul>
			        </li>
			        <li class="has-sub 
			        
			        <c:if test="${
			        fn:indexOf(requestURI , '/user/notices_data/13/list.do') > -1 
			        || fn:indexOf(requestURI , '/user/notices_data/14/list.do') > -1
			        || fn:indexOf(requestURI , '/user/communicator/list.do') > -1
			        }">active</c:if>
			        
			        ">
			        	<a href="#">주요 프로그램</a>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/notices_data/13/list.do">온라인 학습멘토링</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/notices_data/14/list.do">과학고 영재학교<br>방문 프로그램</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/communicator/list.do">창의융합 커뮤니케이터</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/award/list.do">참여 게시판</a>
			        		</li>
			        	</ul>
			        </li>
			        <li class="has-sub
			        
			        <c:if test="${
			        fn:indexOf(requestURI , '/user/notices_data/1/list.do') > -1 
			        || fn:indexOf(requestURI , '/user/notices_data/2/list.do') > -1
			        || fn:indexOf(requestURI , '/user/notices_data/3/list.do') > -1
			        || fn:indexOf(requestURI , '/user/notices_data/12/list.do') > -1
			        || fn:indexOf(requestURI , '/user/notices_data/15/list.do') > -1
			        || fn:indexOf(requestURI , '/user/notices_data/16/list.do') > -1
					|| fn:indexOf(requestURI , '/user/notices_data/17/list.do') > -1
					|| fn:indexOf(requestURI , '/user/notices_data/18/list.do') > -1
			        }">active</c:if>
			        
			        ">
			        	<a href="#">커뮤니티</a>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">전체 공지사항</a>
			        		</li>
			        		<li class="has-sub
			        			<c:if test="${
						        fn:indexOf(requestURI , '/user/notices_data/15/list.do') > -1 
						        || fn:indexOf(requestURI , '/user/notices_data/16/list.do') > -1
						        || fn:indexOf(requestURI , '/user/notices_data/17/list.do') > -1
						        || fn:indexOf(requestURI , '/user/notices_data/18/list.do') > -1
						        }">active</c:if>
			        			">
			        			<a href="#">지역 공지사항</a>
			        			<ul>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/notices_data/15/list.do">서울 지역 공지사항</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/notices_data/16/list.do">인천 지역 공지사항</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/notices_data/17/list.do">대전 지역 공지사항</a>
			        				</li>
			        				<li>
			        					<a href="${pageContext.request.contextPath}/user/notices_data/18/list.do">부산 지역 공지사항</a>
			        				</li>	
			        			</ul>
					        </li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실 (QR코드)</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ</a>
			        		</li>
			        	</ul>
			        </li>
			        <li class="has-sub
			        
			        <c:if test="${
			        fn:indexOf(requestURI , '/user/member_re/intro.do') > -1 
			        }">active</c:if>
			        
			        ">
			        	<a href="#">신입생 선발</a>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/member_re/intro.do">신규 참가자 지원</a>
			        		</li>
			        		<li>
			        			<a onclick="MemberReCheckForm()">지원서 조회 및 수정</a>
			        		</li>
			        		<li>
			        			<a onclick="MemberRePassCheck()">합격자 조회</a>
			        		</li>
			        	</ul>
			        </li>
			        <li class="has-sub
			        
			        <c:if test="${
			        fn:indexOf(requestURI , '/user/member/view.do') > -1
			        || fn:indexOf(requestURI , '/user/mypage/communicator/list.do') > -1
			        || fn:indexOf(requestURI , '/user/portfolio/detail/list.do') > -1
			        || fn:indexOf(requestURI , '/user/mypage/program/list.do') > -1
			        || fn:indexOf(requestURI , '/user/mypage/survey/list.do') > -1 
			        }">active</c:if>
			        
			        ">
			        	<a href="#">마이페이지</a>
			        	<ul>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">나의 커뮤니케이터</a>
			        		</li>
			        		<c:if test="${ssion_member_type == '2' }">
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오</a>
			        		</li>
			        		</c:if>
			        		<c:if test="${ssion_member_type == '1' }">
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오</a>
			        		</li>
			        		</c:if>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청</a>
			        		</li>
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/exam/result/list.do?member_id=${ssion_user_id}">설문결과리스트</a>
			        		</li>
			        		<!-- 
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사</a>
			        		</li>
			        		-->
			        		<li>
			        			<a href="${pageContext.request.contextPath}/user/submission/list.do?member_id=${ssion_user_id }">참여 게시판</a>
			        		</li>
			        	</ul>
			        </li>
			    </ul>
			</div>
		  </div>
	        <!-- 메뉴끝 -->
	    </div>
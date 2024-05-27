<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>  

<style>
	.tabs .tab-contents ul li{
    	white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: block;
    }

</style>
<body>
    
	<a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		 <div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="../include/menu.jsp" %>

    <!-- 본문 -->
   <div class="content">
    <div class="sub_cont_wrap">
		
        <!-- 타이틀 -->
        <c:if test="${model.PROGRAM_TYPE != '101'}">
        <div class="font_noto all_tit_30">프로그램 목록</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>프로그램 목록</div>
        <table class="table table-bordered align_c">
        <tbody>
        <tr class="cell_bg">
            <th>순번</th>
            <th>프로그램명</th>
            <th>신청기간</th>
            <c:if test="${item.TYPE != '1'}">
            <th>체험기간</th>
            </c:if>
            <th>신청하기</th>
        </tr>
        
        <c:forEach var="item" items="${model.list}" varStatus="status">
        <tr>
            <td class="td_num">${(model.itemCount * model.page) + status.index + 1}</td>
            <td class="td_tit align_c">${item.NAME}</td>
            <td class="td_data_01">${fn:substring(item.START_TM,0,11)}~${fn:substring(item.END_TM,0,11)}</td>
            <c:if test="${item.TYPE != '1'}">
          	<td class="td_data_02">${fn:substring(item.EXPERIENCE_START_TM,0,11)}~${fn:substring(item.EXPERIENCE_END_TM,0,11)}</td>
           	</c:if>
            <td>신청</td>
        </tr>
        </c:forEach>
        </tbody>
        </table>

		<!-- 현재 데이터가 없음 -->
		<!-- 
		<div class="page_list">
		    <ul class="pagination justify-content-center">
		        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		        <li class="page-item"><a class="page-link" href="#">1</a></li>
		        <li class="page-item active"><a class="page-link" href="#">2</a></li>
		        <li class="page-item"><a class="page-link" href="#">3</a></li>
		        <li class="page-item"><a class="page-link" href="#">Next</a></li>
		    </ul>
		</div>
		-->
		</c:if>
		
		<!-- 융합 과학 프로젝트 -->
		<c:if test="${model.PROGRAM_TYPE == '101'}">
        <div class="font_noto all_tit_30">프로그램 목록</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">1차분류<i class="las la-angle-right"></i>2차분류<i class="las la-angle-right"></i><b class="blue_01">3차분류</b></span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>프로그램 목록</div>
        <table class="table table-bordered align_c">
        <tbody>
        <tr class="cell_bg">
            <th>순번</th>
            <th>학년</th>
            <th>프로그램명</th>
            <th>교육자료</th>
        </tr>

							<tr>
								<td class="td_num">19</td>
								<td>고등학교</td>
								<td class="td_tit align_lt">오또봇</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/고등_오또봇_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">18</td>
								<td>중학교 3학년</td>
								<td class="td_tit align_lt">휴대용 스피커 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중3_휴대용 스피커 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">17</td>
								<td>중학교 3학년</td>
								<td class="td_tit align_lt">아두이노 로봇팔</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중3_아두이노 로봇팔_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">16</td>
								<td>중학교 3학년</td>
								<td class="td_tit align_lt">스네이크봇 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중3_스네이크봇 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">15</td>
								<td>중학교 2학년</td>
								<td class="td_tit align_lt">아크릴 이모티콘</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중2_아크릴 이모티콘_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">14</td>
								<td>중학교 2학년</td>
								<td class="td_tit align_lt">아두이노 자율주행 CAR</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중2_아두이노 자율주행 CAR_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">13</td>
								<td>중학교 2학년</td>
								<td class="td_tit align_lt">빛 추적 로봇</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중2_빛 추적 로봇_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">12</td>
								<td>중학교 2학년</td>
								<td class="td_tit align_lt">DIY 아크릴 램프</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중2_DIY 아크릴 램프_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">11</td>
								<td>중학교 1학년</td>
								<td class="td_tit align_lt">태양광 주택 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중1_태양광 주택 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">10</td>
								<td>중학교 1학년</td>
								<td class="td_tit align_lt">지진 감지기 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중1_지진 감지기 만들기.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">09</td>
								<td>중학교 1학년</td>
								<td class="td_tit align_lt">RGB 무드등 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/중1_RGB 무드등 만들기.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">08</td>
								<td>초등학교 6학년</td>
								<td class="td_tit align_lt">스마트 가로등 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초6_스마트 가로등 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">07</td>
								<td>초등학교 6학년</td>
								<td class="td_tit align_lt">드라디오 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초6_드라디오 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">06</td>
								<td>초등학교 5학년</td>
								<td class="td_tit align_lt">프로펠러 자동차</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초5_프로펠러 자동차_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">05</td>
								<td>초등학교 5학년</td>
								<td class="td_tit align_lt">큐브 현미경 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초5_큐브 현미경 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">04</td>
								<td>초등학교 5학년</td>
								<td class="td_tit align_lt">무한회전 연필</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초5_무한회전 연필_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">03</td>
								<td>초등학교 4학년</td>
								<td class="td_tit align_lt">미니 진동 로봇</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초4_미니 진동 로봇_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">02</td>
								<td>초등학교 4학년</td>
								<td class="td_tit align_lt">무한거울 액자 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초4_무한거울 액자 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
							<tr>
								<td class="td_num">01</td>
								<td>초등학교 4학년</td>
								<td class="td_tit align_lt">나만의 별자리판 만들기</td>
								<td class="td_data_03 data"><a
									href="${pageContext.request.contextPath}/resources/files/programfile/초4_나만의 별자리판 만들기_temp.pdf">다운로드</a>
								</td>
							</tr>
						</tbody>
        </table>

		<!-- 현재 데이터가 없음 -->
		<!-- 
		<div class="page_list">
		    <ul class="pagination justify-content-center">
		        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		        <li class="page-item"><a class="page-link" href="#">1</a></li>
		        <li class="page-item active"><a class="page-link" href="#">2</a></li>
		        <li class="page-item"><a class="page-link" href="#">3</a></li>
		        <li class="page-item"><a class="page-link" href="#">Next</a></li>
		    </ul>
		</div>
		-->
		
		</c:if>


    </div>
</div>
<!-- 본문 끝 -->
    
    <!-- 오른쪽 시작 -->
		<%@ include file="../include/right.jsp" %>
	<!--  오른쪽 끝 -->
	<!-- 하단 -->
		<div class="footer">
		    <div class="container">
		        <div class="link">
		            <span><a href="">센터소개</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이용약관</a></span><span class="gab">ㅣ</span>
		            <span><a href="">개인정보처리방침</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이메일무단수집거부</a></span>
		        </div>
		        <div class="all_copy">
		            <span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</span><span class="gab">ㅣ</span>
		            <span>TEL : 042-350-6223</span><span class="gab">ㅣ</span>
		            <span>FAX : 042-350-8660</span><span class="gab">ㅣ</span>
		            <span>E-MAIL : giftedup@kaist.ac.kr</span>
		        </div>
		        <div class="copy">
		            <span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
		        </div>
		    </div>
		</div>
		<!-- 하단 --> 
    </div>
    <!--본문 end-->
    
</body>
</html>

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
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>

<style>
.tabs .tab-contents ul li {
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
		<%@ include file="../include/menu.jsp"%>

		<!-- 본문 -->
		<div class="content">
			<div class="sub_cont_wrap">

				<!-- 타이틀 -->
				<div class="font_noto all_tit_30">기본정보수정</div>
				<div class="t_pad_15">
					<span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여
						맞춤형 교육을 지원합니다.</span> <span class="all_sort">마이페이지<i
						class="las la-angle-right"></i><b class="blue_01">기본정보수정</b></span>
				</div>
				<div class="line_gab_15"></div>
				<!-- 타이틀끝 -->

				<section id="new_sub" class="sub_wrap">
					<div id="new_sub_area" class="sub_area">
						<div id="new_sub_con" class="sub_con">
							<div class="sub_size">
								<!-- 교사 comm list start -->
 					<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page" id="sub_page">
                                <div class="info_wrap">
                                    <div class="title mr-0">
                                        <h2>${model.pageDomain.TITLE}</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <tr>
                                            <th>작성자</th>
                                            <td>${fn:substring(model.pageDomain.NAME,0,19)}</td>
                                            <th>작성일</th>
                                            <td>${fn:substring(model.pageDomain.CREATE_TM,0,19)}</td>
                                        </tr>
                                        <tr>
                                            <!-- <th>아이피</th>
                                            <td>143.248.220.86</td> -->
                                            <th>조회수</th>
                                            <td colspan="3">${model.pageDomain.READ_CNT}</td>
                                        </tr>
                                        <tr>
                                            <th>사진</th>
                                            <td colspan="3">
                                                <div class="pic">
                                                    <a href="#">
                                                        <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/member/${model.pageDomain.IMAGE}" alt="${model.pageDomain.IMAGE}">
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <c:if test="${ fn:length(model.pageDomain.LINKS) > 1 && model.pageDomain.LINKS != '' && model.pageDomain.LINKS != null}">
                                        <tr>
                                            <th>바로가기</th>
                                            <td colspan="3"><a href="${model.pageDomain.LINKS}" target="${model.pageDomain.LINKS_TYPE}"/>${model.pageDomain.LINKS}</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${ fn:length(model.pageDomain.LINKS2) > 1 && model.pageDomain.LINKS2 != '' && model.pageDomain.LINKS2 != null}">
                                        <tr>
                                            <th>바로가기</th>
                                            <td colspan="3"><a href="${model.pageDomain.LINKS2}" target="${model.pageDomain.LINKS2_TYPE}"/>${model.pageDomain.LINKS2}</td>
                                        </tr>
                                        </c:if>                                        
                                        <tr>
                                            <th>파일</th>
                                            <td colspan="3">
                                            	<c:forEach var="item" items="${model.fileLIst}" varStatus="status">
                                                <c:if test="${item != '' && item != null}">
                                            	<div id="fileDiv_${status.index}">
                                            	<a class="relate_c" href="${pageContext.request.contextPath}/fileDown.do?path=/resources/${pageContext.request.contextPath}/upload/notices_data/${item}">다운로드</a>
                                            	&nbsp; &nbsp; 
                                            	</div>
                                            	</c:if>
                                            	</c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="content">
                                                    ${model.pageDomain.CONTENT}
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                           <!--  <a class="delete" href="#">삭제하기</a>
                                            <a class="register" href="#">수정하기</a> -->
                                            <a class="register" onclick="window.print();">내용인쇄</a>
                                            <a class="register" href="../../${notices}/list.do">목록보기</a>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->

                                </div>


                                <!--코멘트창-->
                                 <c:if test="${notices == '5' }">
                                <div class="comment_wrap">
                                    <div class="comment_area">
                                        <ul class="comment_list">
                                            <li>
                                                <span>홍길동</span>
                                                <p>Cras eget metus ac est suscipit finibus in eu metus.</p>
                                                <div class="date">
                                                    <span>2019.11.18</span>
                                                    <a href="#"><i class="fas fa-times"></i></a>
                                                </div>
                                            </li>
                                            
                                        </ul>
                                        <div class="comment_write">
                                            <form>
                                                <div class="comment_textarea_wrap">
                                                    <textarea class="comment_textarea"></textarea>
                                                </div>
                                            </form>
                                        </div>
                                        <!--보드 검색_버튼-->
                                        <div class="board_btn_wrap">
                                            <div class="board_btn">
                                                <a class="delete" href="#">등록</a>
                                            </div>
                                        </div>
                                        <!--보드 검색_버튼 end-->
                                    </div>
                                </div>
                                <!--코멘트창 end-->
								</c:if>




                                
                            </div>
                        </div>
                    </nav>
							</div>
						</div>
					</div>
				</section>



			</div>
		</div>
		<!-- 본문 끝 -->

		<!-- 오른쪽 시작 -->
		<%@ include file="../include/right.jsp"%>
		<!--  오른쪽 끝 -->
		<!-- 하단 -->
		<div class="footer">
			<div class="container">
				<div class="link">
					<span><a href="">센터소개</a></span><span class="gab">ㅣ</span> <span><a
						href="">이용약관</a></span><span class="gab">ㅣ</span> <span><a href="">개인정보처리방침</a></span><span
						class="gab">ㅣ</span> <span><a href="">이메일무단수집거부</a></span>
				</div>
				<div class="all_copy">
					<span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트
						과학영재교육연구원(34051)</span><span class="gab">ㅣ</span> <span>TEL :
						042-350-6227</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-6224</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
	</div>
	<!--본문 end-->
	<script type="text/javascript">


</script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <!--추가 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
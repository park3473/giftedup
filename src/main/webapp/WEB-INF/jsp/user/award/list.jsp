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
        <div class="font_noto all_tit_30">참여 게시판</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
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
                            <div class="sub_page_con">
                                <div class="sub_page">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>참여 게시판</p>
                                    </div>
                                    <table class="txt learning_con board_txt">
                                        <caption class="blind">참여 게시판</caption>
                                        <tr>
                                            <th class="number">번호</th>
                                            <th class="txt_title">제목</th>
                                            <th class="start_tm">시작일</th>
                                        	<th class="end_tm">종료일</th>
                                        	<th class="submission">참여하기</th>
                                        </tr>

                                        <c:forEach var="item" items="${model.list}" varStatus="status">
                                        <tr>
                                            <td>${model.itemtotalcount - (status.index + model.page *  model.itemcount)}</td>
	                                        <td>${item.title }</td>
	                                        <td>${fn:substring(item.start , 0 , 11) }</td>
	                                        <td>${fn:substring(item.end , 0 , 11) }</td>
	                                        <td>
	                                        	<button type="button" onclick="location.href='/user/award/view.do?idx=${item.idx}'">참여하기</button>
	                                        </td>
                                        </tr>
                                        </c:forEach>
                                    </table>


                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_seach">
                                            <form>
                                                <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                                    <option value="ALL">전체</option>
                                        			<option value="title" <c:if test="${model.before.SEARCH_TYPE == 'title'}">selected</c:if>>제목</option>
                                                </select>
                                                <label class="blind" for="SEARCH_TYPE">검색조건</label>
                                                <input type="text" value="${model.before.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT"  />
                                                <label class="blind" for="SEARCH_TEXT">검색창</label>
                                                <button type="button" name="seach" value="검색" onClick="searchBtnClick()">검색</button>
                                            </form>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->


                                    <!--페이지 넘버-->
                                    <nav class="paging_number">
                                        <%@ include file="../include/pageing.jsp" %> 
                                    </nav>
                                    <!--페이지 넘버 end-->
                                </div>
                            </div>
                        </div>
                    </nav>
        
        					</div>
						</div>
					</div>
				</section>
    <%@ include file="../include/footerJs.jsp" %> 


    </div>
</div>
<%@ include file="../include/right.jsp"%>
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
</body>
</html>

<script>
    function searchBtnClick()
    {
        
        URL = './list.do';
        URL = URL + "?PAGE=${model.before.PAGE}";
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }
</script>

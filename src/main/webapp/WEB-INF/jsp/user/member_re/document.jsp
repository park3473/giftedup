<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
</head>

<style>
    #new_sub_hd .title > p:first-of-type {
        display: none;
    }
    .tabs .tab-contents ul li{
    	white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: block;
    }
</style>
<%
	String TYPE = request.getParameter("TYPE") != null? request.getParameter("TYPE") : "no";
	pageContext.setAttribute("TYPE", TYPE);
%>

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
        <div class="font_noto all_tit_30">신입생 선발 신청</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->
        
        
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
					
                    <nav class="sub_min_size" id="dcmnt_list">
                    	<input type="hidden" name="MEMBER_NAME" id="MEMBER_NAME" value="${model.beforeData.MEMBER_NAME }">
                    	<input type="hidden" name="BIRTH" id="BIRTH" value="${model.beforeData.BIRTH }">
                    	<input type="hidden" name="TYPE" id="TYPE" value="${TYPE }">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>유형 제출확인</p>
                                    </div>
                                    <c:if test="${TYPE == '1' }">
                                   <table class="txt dcmnt_tbl">
                                    <tr>
                                    	<th class="th_index">순번</th>
                                    	<th class="th_title">이름</th>
                                    	<th class="th_check">제출여부</th>
                                    </tr>
                                    <tr>
                                    	<td>1</td>
                                    	<td>보호자 서약서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('보호자 서약서') }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_1_1" id="dcmnt_1_1" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="보호자 서약서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_1_1')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('보호자 서약서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="보호자 서약서">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="보호자 서약서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_1_1" id="dcmnt_1_1" enctype="multipart/form-data" style="display:none">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="보호자 서약서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_1_1')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<td>2</td>
                                    	<td>지원자 서약서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('지원자 서약서') }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_1_2" id="dcmnt_1_2" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="지원자 서약서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_1_2')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('지원자 서약서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="지원자 서약서">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="지원자 서약서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_1_2" id="dcmnt_1_2" enctype="multipart/form-data" style="display:none">
	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="지원자 서약서">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_1_2')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<td>3</td>
                                    	<td>학교장 확인서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('학교장 확인서') }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_1_3" id="dcmnt_1_3" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="학교장 확인서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_1_3')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('학교장 확인서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="학교장 서약서">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="학교장 확인서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_1_3" id="dcmnt_1_3" enctype="multipart/form-data" style="display:none">
	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="학교장 확인서">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_1_3')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                	</table>
                                	</c:if>
                                	
                                	<c:if test="${TYPE == '2' }">
                                   <table class="txt dcmnt_tbl">
                                    <tr>
                                    	<th class="th_index">순번</th>
                                    	<th class="th_title">이름</th>
                                    	<th class="th_check">제출여부</th>
                                    </tr>
                                    <tr>
                                    	<td>1</td>
                                    	<td>보호자 서약서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('보호자 서약서') }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_2_1" id="dcmnt_2_1" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="보호자 서약서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_2_1')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('보호자 서약서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="보호자 서약서">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="보호자 서약서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_2_1" id="dcmnt_2_1" enctype="multipart/form-data" style="display:none">	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="보호자 서약서">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_2_1')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<td>2</td>
                                    	<td>지원자 서약서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('지원자 서약서') }">
											<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_2_2" id="dcmnt_2_2" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="지원자 서약서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_2_2')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('지원자 서약서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="지원자 서약서">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="지원자 서약서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_2_2" id="dcmnt_2_2" enctype="multipart/form-data" style="display:none">
	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="지원자 서약서">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_2_2')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
										</td>
                                    </tr>
                                    <tr>
                                    	<td>3</td>
                                    	<td>학교장 확인서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('학교장 확인서') }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_2_3" id="dcmnt_2_3" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="학교장 확인서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_2_3')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('학교장 확인서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="학교장 서약서">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="학교장 확인서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_2_3" id="dcmnt_2_3" enctype="multipart/form-data" style="display:none">
	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="학교장 확인서">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_2_3')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                	</table>
                                	</c:if>
                                	
                                	<!-- 
                                	<c:if test="${TYPE == '3' }">
                                   <table class="txt dcmnt_tbl">
                                    <tr>
                                    	<th class="th_index">순번</th>
                                    	<th class="th_title">이름</th>
                                    	<th class="th_check">제출여부</th>
                                    </tr>
                                    <tr>
                                    	<td>1</td>
                                    	<td>지원자 서약서</td>
                                    	<td>
                                    		<c:if test="${!model.list_1.contains('지원자 서약서') }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_3_1" id="dcmnt_3_1" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="지원자 서약서">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_3_1')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_1.contains('지원자 서약서') }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="지원자 서약서" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_3_1" id="dcmnt_3_1" enctype="multipart/form-data" style="display:none">
	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="지원자 서약서">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="1">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_3_1')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                	</table>
                                	</c:if>
                                	 -->
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>학생 지원자격 제출확인</p>
                                    </div>
                                   <table class="txt dcmnt_tbl">
                                    <tr>
                                    	<th class="th_index">순번</th>
                                    	<th class="th_title">주제</th>
                                    	<th class="th_check">제출여부</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.document }" varStatus="status">
                                    <tr>
                                    	<td>${status.index + 1 }</td>
                                    	<td>${item.DCMNT_NAME }</td>
                                    	<td>
                                    		<c:if test="${!model.list_2.contains(item.DCMNT_NAME) }">
                                    		<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_4_${status.index + 1 }" id="dcmnt_4_${status.index + 1 }" enctype="multipart/form-data">
                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="${item.DCMNT_NAME }">
                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="2">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_4_${status.index + 1 }')">제출</button>
                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
                                    		</form>
                                    		</c:if>
                                    		<c:if test="${model.list_2.contains(item.DCMNT_NAME) }">
                                    			<span>제출 완료!</span>
                                    			<button type="button" onclick="DcmntFileDown(this)" class="FileDownload" FILENAME="${item.DCMNT_NAME }">다운로드</button>
                                    			<button type="button" onclick="file_re(this)" class="FileComplete" FILENAME="${item.DCMNT_NAME }" >파일 삭제</button>
                                    			<form action="/user/member_re/document_upload.do" method="post" name="dcmnt_4_${status.index + 1 }" id="dcmnt_4_${status.index + 1 }" enctype="multipart/form-data" style="display:none">
	                                                <input class="input_size" type="hidden" name="fileName" id="fileName" />
	                                                <input type="hidden" name="NAME" id="NAME" class="NAME" value="${item.DCMNT_NAME }">
	                                                <input type="hidden" name="TITLE" id="TITLE" class="TITLE" value="2">
	                                                <input type="file" id="file1" name="file1" onchange="changeValue(this)" />
	                                                <button type="button" id="btn-upload" class="btn-upload" value="" onclick="MemberReFileSet('dcmnt_4_${status.index + 1 }')">제출</button>
	                                                <input type="hidden" name="DCMNT_FILE" id="DCMNT_FILE">
	                                    		</form>
                                    		</c:if>
                                    	</td>
                                    </tr>
                                    </c:forEach>
                                	</table>
                                  	<div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="cancel" onclick="window.history.go(-1)">뒤로가기</a>
                                  			<a class="cancel" onclick="FinalUploadButton()">최종 제출</a>
                                  		</div>
                                  </div>
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
					<p><span>TEL : </span>서울・강원・제주권역 (서울대학교) : 02-880-4477~8, 경기・인천권역 (인천대학교) : 032-835-4915, 충청・호남권역 (대전대학교) : 042-226-0701(혹은 0705), 경상권역 (부산대학교) : 051-510-1840~2</p>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
    
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function MemberReUpdate(name,birth,type){
		
		location.href="${pageContext.request.contextPath}/user/member_re/update.do?NAME="+name+"&BIRTH="+birth+"&TYPE="+type+"";
		
	}
	
	function MemberReFileSet(form){
		
		if($('#'+form+' #fileName').val() != ''){
		
		
			var NAME = '${model.beforeData.MEMBER_NAME}';
			var BIRTH = '${model.beforeData.BIRTH}';
			var IDX = '${model.beforeData.IDX}';
			var TYPE = '${TYPE}';
			var Form = $('#'+form)[0];
			
			var formData = new FormData(Form); 
			
			formData.append('MEMBER_NAME',NAME);
			formData.append('BIRTH',BIRTH);
			formData.append('MEMBER_IDX',IDX);
			formData.append('TYPE',TYPE);
			console.log(formData);
			
			for(var pair of formData.entries()){
				console.log(pair[0] + ',' + pair[1]);
			}
			
			$.ajax({
				type : "POST",
				url : "/user/member_re/document_upload.do",
				cache : false,
				data : formData,
				dataType : 'json',
				contentType : false,
				processData : false,
				success : function(result , status){
					console.log(result);
					
					if(result == true){
						alert('등록 성공');
						location.reload();
						
					}else{
						alert('등록 실패');
						console.log('등록 실패');
					}
					
				},
				error : function(error , xhr , status){
					
					console.log('실패')
					
				}
				
			})
		
		}else{
			
			alert('파일을 등록후 제출해주세요.');
			
		}
	}
	
	function MemberReDcmnt(name,birth,type){
		var ELIGIBILITY = "";
		if(type != '3'){
			ELIGIBILITY = $('#ELIGIBILITY').attr('value');
		}
		
		location.href="${pageContext.request.contextPath}/user/member_re/document.do?MEMBER_NAME="+name+"&BIRTH="+birth+"&TYPE="+type+"&ELIGIBILITY="+ELIGIBILITY+"";
		
	}
	
	function changeValue(obj){
        var fileObj = obj.value;
        var pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
        pathHeader = fileObj.lastIndexOf("\\");
        pathMiddle = fileObj.lastIndexOf(".");
        pathEnd = fileObj.length;
        fileName = fileObj.substring(pathHeader+1, pathMiddle);
        extName = fileObj.substring(pathMiddle+1, pathEnd);
        allFilename = fileName+"."+extName;

        $(obj).prevAll('#fileName').val(allFilename);
    }

	function file_re(e){
		
		var TYPE = '${TYPE}';
		var NAME = $(e).attr('FILENAME');
		var MEMBER_NAME = '${model.beforeData.MEMBER_NAME}';
		var BIRTH = '${model.beforeData.BIRTH}';
		
		var result = confirm('정말 제출된 서류를 삭제하시겠습니까?\n삭제한 서류는 복구할수 없습니다.');
		
		if(result == true){
			$.ajax({
				url : '${pageContext.request.contextPath}/user/member_re/document_delete.do',
				type : 'POST',
				data : ({
					TYPE : TYPE,
					NAME : NAME,
					MEMBER_NAME : MEMBER_NAME,
					BIRTH : BIRTH
				}),
				success : function(data , xhr , status){
					
					console.log(data);
					
					alert('파일삭제가 완료되었습니다.');
					$(e).prev().hide();
					$(e).hide();
					$(e).next().show();
					$(e).next().next().show();	
					
					location.reload();
				},
				error : function(error , status , xhr){
					
				}
			})
			
			
		}else if(result == false){
			
		}
	}
	
	
	function FinalUploadButton(){
		
		const upload = $('.btn-upload').length
		const complete = $('.FileComplete').length
		
		if(upload == complete){
			alert(' 2024 영재키움 프로젝트 지원서 제출이 완료되었습니다. 감사합니다. ');
		}else{
			alert('모든 서류를 제출해야지 최종제출이 가능합니다.');
		}
	}
	
	function DcmntFileDown(e){
		var BIRTH = '${model.beforeData.BIRTH }';
		var MEMBER = '${model.beforeData.MEMBER_NAME }';
		var NAME = $(e).attr('FILENAME');
		console.log(NAME);
		$.ajax({
			url : '/user/member_re/FileLinkCheck.do',
			type : 'POST',
			data : ({
				NAME : NAME,
				MEMBER_NAME : MEMBER,
				BIRTH : BIRTH
			}),
			success : function(data , status , xhr){
				
				console.log(data);
				location.href='/fileDown.do?path=/resources/upload/member_re/delete/'+BIRTH+MEMBER+'/'+data+'';
				
			},
			error : function(status , xhr){
				
			}
			
		})
	}
	
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">

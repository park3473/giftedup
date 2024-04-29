<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<script src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor2/ckcontent.css">
<head>
    <%@ include file="../../include/head.jsp" %>
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
	    	<%@ include file="../../include/menu.jsp" %>

    <!-- 본문 -->
<div class="content">
    <div class="sub_cont_wrap">

        <!-- 타이틀 -->
        <div class="font_noto all_tit_30">${model.NOTICES.pageDomain.NAME}</div>
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
                            <div class="sub_page" id="sub_page">
                                <div class="info_wrap">
                                    <div class="title mr-0">
                                        <h2>${model.pageDomain.TITLE}</h2>
                                    </div>
                                    <table class="txt info_table">
                                        <caption class="blind">게시판</caption>
                                        <tr>
                                            <th>작성자</th>
                                            <td>${fn:substring(model.pageDomain.MEMBER_NAME,0,19)}</td>
                                            <th>작성일</th>
                                            <td>${fn:substring(model.pageDomain.CREATE_TM,0,19)}</td>
                                        </tr>
                                        <tr>
                                            <!--
                                            <th>아이피</th>
                                            <td>143.248.220.86</td>
                                            -->
                                            <th>조회수</th>
                                            <td colspan="3">${model.pageDomain.READ_CNT}</td>
                                        </tr>
                                        <c:if test="${ fn:length(model.pageDomain.LINKS) > 1 && model.pageDomain.LINKS != '' && model.pageDomain.LINKS != null}">
                                        <tr>
                                            <th>바로가기</th>
                                            <td colspan="3"><a href="${model.pageDomain.LINKS}" target="${model.pageDomain.LINKS_TYPE}" />${model.pageDomain.LINKS}</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${ fn:length(model.pageDomain.LINKS2) > 1 && model.pageDomain.LINKS2 != '' && model.pageDomain.LINKS2 != null}">
                                        <tr>
                                            <th>바로가기</th>
                                            <td colspan="3"><a href="${model.pageDomain.LINKS2}" target="${model.pageDomain.LINKS2_TYPE}" />${model.pageDomain.LINKS2}</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${model.pageDomain.IMAGE != ''}">
                                        <tr>
                                            <th>사진</th>
                                            <td colspan="3">
                                                <div class="pic">
                                                    <a href="#">
                                                        <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/notices_data/${model.pageDomain.IMAGE}" alt="${model.pageDomain.IMAGE}">
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        </c:if>
                                        <tr>
                                            <th>파일</th>
                                            <td colspan="3">
                                                <c:forEach var="item" items="${model.fileLIst}" varStatus="status">
                                                <c:if test="${item != '' && item != null}">
                                                <div id="fileDiv_${status.index}" class="file_btn_con">
                                                    <a class="pro_file_btn" href="${pageContext.request.contextPath}/fileDown.do?path=${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/notices_data/${item.FILE_PATH}">
                                                        ${fn:substring(item.FILE_NAME,13,fn:length(item.FILE_NAME))}
                                                    </a>
                                                    <span class="file_name" style="margin-left: 10px;"></span>
                                                </div>
                                                </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="content contents ck-content">
                                                    ${model.pageDomain.CONTENT}
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            
                                            
                                            
                                            
                                            
                                            <!-- <a class="register" onclick="window.print();">내용인쇄</a> -->
                                            <c:if test="${'1' == ssion_level || model.pageDomain.MEMBER_ID == ssion_user_id}">
                                            <c:if test="${model.notices != '1' && model.notices != '2'}">
                                            	<a class="delete" href="javascript:deleteClick2()">삭제하기</a>
                                            	<a class="register" href="./update.do">수정하기</a>
                                            </c:if>
                                            </c:if>
                                            <a class="register" href="../../${notices}/list.do">목록보기</a>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->
                                </div>
                                
                                <!--코멘트창-->
                                <c:if test="${model.COMMENT_VIEW == 'TRUE'}">
                                <div class="comment_wrap">
                                    <div class="comment_area">
                                        <ul class="comment_list">
                                            <c:forEach var="item" items="${model.COMMENT.list}" varStatus="status">
                                            <li>
                                                <span>${item.NAME }</span>
                                                <p>${item.COMMENT }</p>
                                                <div class="date">
                                                    <span>${fn:substring(item.CREATE_TM,0,19)}</span>
                                                    <a href="javascript:deleteClick('${item.IDX}')"><i class="fas fa-times"></i></a>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </ul>

                                        <form action="../../../notices_comment/${model.pageDomain.NOTICES_IDX}/${model.pageDomain.IDX}/insert.do?" method="post" name="updateform" id="updateform">
                                            <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                            <input type="hidden" name="NOTICES_IDX" value="${model.pageDomain.NOTICES_IDX}" />
                                            <input type="hidden" name="NOTICES_DATA_IDX" value="${model.pageDomain.IDX}" />
                                            <input type="hidden" name="PASSWORD" value="" />
                                            <input type="hidden" name="NAME" value="${ssion_name} }" />
                                            <input type="hidden" name="MEMBER_ID" value="${ssion_user_id }" />
                                            <div class="comment_write">
                                                <div class="comment_textarea_wrap">
                                                    <textarea class="comment_textarea" id="COMMENT" name="COMMENT"></textarea>
                                                </div>
                                            </div>
                                        </form>
                                        
                                        <!--보드 검색_버튼-->
                                        <div class="board_btn_wrap">
                                            <div class="board_btn">
                                                <a class="delete" href="javascript:insertClick()">등록</a>
                                            </div>
                                        </div>
                                        <!--보드 검색_버튼 end-->
                                    </div>
                                </div>
                                </c:if>
                                <!--코멘트창 end-->

                            </div>
                        </div>
                    </nav>
        
        					</div>
						</div>
					</div>
				</section>
    <%@ include file="../../include/footerJs.jsp" %> 


    </div>
</div>
<%@ include file="../../include/right.jsp"%>
<!-- 하단 -->
		<div class="footer">
			<div class="container">
				<div class="link">
					<span><a href="">센터소개</a></span><span class="gab">ㅣ</span> <span><a
						href="">이용약관</a></span><span class="gab">ㅣ</span> <span><a href="">개인정보처리방침</a></span><span
						class="gab">ㅣ</span> <span><a href="">이메일무단수집거부</a></span>
				</div>
				<div class="all_copy">
					<p><span>TEL : </span>서울・강원・제주권역 : 02-880-4477~8, 경기・인천권역 : 032-835-4915, 충청・호남권역 : 042-226-0701(혹은 0705), 경상권역 : 051-510-1840~2</p>					
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->

<script type="text/javascript">
	function deleteClick2(idx) {
	    var formData = "IDX=" + idx;
	    var URL = './delete.do';

	    $.ajax({
	        type: "POST",
	        url: URL,
	        cache: false,
	        data: formData,
	        success: function(result) {
	            var s = result.indexOf("true");
	            console.log(s);
	            if (s != -1) {
	            	 location.href = '../list.do';
	                return;
	            } else {
	                alert('실패하였습니다.');
	                return;
	            }
	        }
	    });
	}
	
    function deleteClick(idx) {
        var formData = "IDX=" + idx;
        var URL = '../../../notices_comment/${model.pageDomain.NOTICES_IDX}/${model.pageDomain.IDX}/' + idx + '/delete.do';
        
        $.ajax({
            type: "POST",
            url: URL,
            cache: false,
            data: formData,
            success: function(result) {
                var s = result.indexOf("true");
                console.log(s);
                if (s != -1) {
                    location.reload();
                    return;
                } else {
                    alert('실패하였습니다.');
                    return;
                }
            }
        });
    }

    function insertClick() {
        
        //내용
        if ($('#COMMENT').val() == '') {
            alert('내용 입력해주세요.');
            $('#COMMENT').focus();
            return;
        }
        var formData = $("#updateform").serialize();
        var URL = '../../../notices_comment/${model.pageDomain.NOTICES_IDX}/${model.pageDomain.IDX}/insert.do';
        
        $.ajax({
            type: "POST",
            url: URL,
            cache: false,
            data: formData,
            success: function(result) {
                var s = result.indexOf("true");
                console.log(s);
                if (s != -1) {
                    location.reload();
                    return;
                } else {
                    alert('실패하였습니다.');
                    return;
                }
            }
        });
    }

</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %>

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %>
        </section>
    </header>

    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <c:if test="${
                            fn:indexOf(requestURI, '/subpage/program/study/') > -1
                            || fn:indexOf(requestURI, '/notices_data/6/') > -1
                            || fn:indexOf(requestURI, '/program/104/') > -1
                            || fn:indexOf(requestURI, '/program/101/') > -1
                            || fn:indexOf(requestURI, '/notices_data/7/') > -1
                            || fn:indexOf(requestURI, '/notices_data/8/') > -1
                            || fn:indexOf(requestURI, '/notices_data/9/') > -1
                            || fn:indexOf(requestURI, '/notices_data/10/') > -1
                            || fn:indexOf(requestURI, 'user/mentoring/') > -1}">
                            <h2>찾아가는 영재교육 프로그램</h2>
                            </c:if>
                            
                            <c:if test="${
                            fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                            || fn:indexOf(requestURI, '/user/program/110/') > -1
                            || fn:indexOf(requestURI, '/user/program/111/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                            || fn:indexOf(requestURI, '/user/program/105/') > -1}">
                            <h2>체험 진로탐색 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/notices_data/1/') > -1
                            || fn:indexOf(requestURI, '/notices_data/2/') > -1
                            || fn:indexOf(requestURI, '/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/notices_data/11/') > -1
                            || fn:indexOf(requestURI, '/notices_data/12/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}">
                            <h2>알림마당</h2>
                            </c:if>
                        </div>
                        
                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a>
                                    </li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a>
                                    </li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a>
                                    </li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </li>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </li>

                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                        
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1  
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1
                             || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                             || fn:indexOf(requestURI, '/user/notices_data/12/') > -1  
                             || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                         
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1  
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/12/list.do">FAQ <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>                             
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>                            
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 || fn:indexOf(requestURI, '/user/notices_data/3/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/insert.do">신입생 지원 모집 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

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
                                                <div class="content">
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
                                            <input type="hidden" name="NAME" value="<%=ssion_name %>" />
                                            <input type="hidden" name="MEMBER_ID" value="<%=ssion_user_id %>" />
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
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %>
    </footer>
    <%@ include file="../../include/footerJs.jsp" %>
</body>

</html>

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

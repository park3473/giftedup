<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>
<script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %> 

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %> 
        </section>
    </header>
    
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <c:if test="${
                            fn:indexOf(requestURI, '/member/') > -1
                            || fn:indexOf(requestURI, '/portfolio/') > -1
                            || fn:indexOf(requestURI, '/mypage/program/') > -1
                            || fn:indexOf(requestURI, '/mypage/survey/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/activity_allowance/') > -1 }">
                            <h2>마이페이지</h2>
                            </c:if>
                        </div>
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '1'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>포트폴리오 보기</p>
                                </div>
                                <style>
                                	#pdf_wrap {
									  background-color:black;
									  text-align:center;
									}
									
									#pdf_wrap > h1 {
									  color:blue;
									}
									
									#pdf_wrap > h2 {
									  color:yellow;
									}
                                </style>
                                <div id="pdf_wrap" class="member_input_wrap">
                               		<h2>
								        javascript
								    </h2>
								    <h1>
								        	안녕하세요!
								    </h1>
								    <h2>
								        	저는 Mosball입니다.
								    </h2>
                               		${model.pageDomain.EVALUATION}
                                </div>
                                <a id="pdf_create" class="delete" href="#">PDF저장</a>
                                
                                <div class="board_btn_wrap">
                                    <div class="board_btn">
                                    	<!-- <a id="pdf_create" class="delete" href="#" onclick="javascript:savePdf('${model.pageDomain.IDX}');">PDF저장</a> -->
                                    	<a id="pdf_create" class="delete" href="#">PDF저장</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section> 	

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %> 
    </footer>
    
    <%@ include file="../../include/footerJs.jsp" %>
    
</body>

</html>
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>


<script type="text/javascript">

	$('#pdf_create').click(function() {
		//pdf_wrap을 canvas객체로 변환
		html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
			var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    doc.save('sample-file.pdf'); //pdf저장
		});
	});

	function update(idx) {
	    var URL = '/user/portfolio/detail/' +idx +'/update.do?';
	    URL = URL + "PAGE=${model.beforeDomain.PAGE}";
	    URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
	    URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
	    location.href = URL;
	}
	
	function savePdf() {
		alert("준비중입니다.");
		return false;
	}
	
	function del() {
		
		/* alert($("input[name=IDX]").val()) */
		
		if(${!empty model.pageDomain.PROF_STFT}){
			alert("피드백이 작성된 포트폴리오는 삭제 할 수 없습니다.");
			return false;
		}

		if(!confirm("삭제된 포트폴리오는 복구되지 않습니다. 삭제를 진행하시겠습니까?")){
			return false;
		}
		
		$('#updateform').attr("action","/user/portfolio/detail/delete.do");
    	$('#updateform').attr("method","post");
        $('#updateform').submit();
	}
	
	function list(idx) {
	    var URL = '/user/portfolio/detail/list.do?';
	    URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
	    URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
	    location.href = URL;
	}
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
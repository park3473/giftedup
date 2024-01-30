<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/head.jsp" %> 
</head>

<body>
	<!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->
    
    <!--본문-->
	<section id="adm_sc">
		<div id="adm_sc_area">
			<div id="adm_sc_con">
				<div class="adm_sc_size">
					
						<!-- 본문 내용 시작 -->
						<section class="adm_sc_txt">
							<div class="sc_con">
								<div class="title">
									<span></span>
									<span>개인정보동의서</span>
								</div>
							</div>
						</section>
						<!-- 본문 내용 end -->
				</div>
			</div>
		</div>
	</section>
	<!--본문 end-->
	
	
	<!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->
    
    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    
</body>
</html>
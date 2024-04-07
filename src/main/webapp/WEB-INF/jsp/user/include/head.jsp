<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!--부트스트랩 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" type="text/css">

<!--JQuery-UI-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

<!--css-->
<script src="https://kit.fontawesome.com/8f1c0fb453.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/jquery.datetimepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 2022 start -->
<link type="text/css" rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/owl.carousel.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/owl.theme.default.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/basic_style.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/menu.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/home_style.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/animate.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/2022/aos.css">
<!-- style end-->
<!-- script start-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/2022/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/2022/owl.carousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/2022/js_cont.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/2022/aos.js"></script>
<!--  2022 end -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/font-kopub/1.0/kopubdotum.css" type="text/css">
<title>영재키움 프로젝트</title>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<!--폰트어썸/라인어썸-->
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
<style>
    input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {-webkit-appearance: none;margin: 0;}
	.swal2-container{
		z-index:999999 !important;
	}
	.swal2-styled.swal2-confirm{
		height:auto !important;
	}
	.swal2-styled.swal2-deny{
		height:auto !important;
	}
</style>
<!--  -->
<style type="text/css">
@media only screen and (max-width:1024px) {

/* 서브페이지 오른쪽 처리 */
.right{display:none}

}

</style>
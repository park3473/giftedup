<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kr">
<script type="text/javascript">
			
	function login()
	{
		if($('#MEMBER_ID').val() == '')
		{
			alert('아이디를 입력 해주세요');
			return;
		}
		if($('#PASSWORD').val() == '')
		{
			alert('패스워드 입력 해주세요');
			return;
		}

		var URL = '${pageContext.request.contextPath}/admin/member/login.do'
		var formData = $("#updateform").serialize();
			 
		console.log(formData);
		
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : formData,
			success: function(result)
			{
				var s = result.indexOf("true");
				if(s != -1)
				{
					idchk = true;
					location.href = '${pageContext.request.contextPath}/admin/member/list.do';
					return;
				}else if(result.indexOf("false:-1") > -1)
				{
					alert('패스워드가 틀립니다.');
					return;
				}else if(result.indexOf("false:-2") > -1)
				{
					alert('아이디가 존재 하지 않습니다.');
					return;
				}else if(result.indexOf("false:-3") > -1)
				{
					alert('인증시도 회수가 초과 되었습니다.');
					return;
				}else if(result.indexOf("false:-4") > -1)
				{
					alert('접근 권한이 없습니다.');
					return;
				}
				
			}
		});
			
		
	}
	
</script>
  <head>

	<title>:: OMS Secure Print Admin Login ::</title>
	<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
	<meta charset="utf-8">
	<title>영재키움프로젝트</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,minimum-scale=1,maximum-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta content="ClipTwo - Responsive Admin Template build with Bootstrap" name="description">
	<meta content="ClipTheme" name="author">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="theme-color" content="#ffffff">

	<link rel="manifest" href="assets/images/manifest.json">
	<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,400italic,600,700|Raleway:100,300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/vendors.bundle.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/theme.bundle.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/themes/theme-1.min.css" id="skin_color">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/login.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/css/login.css">
    
    <script src='${pageContext.request.contextPath}/resources/admin/js/2.1.3/jquery.min.js'></script>
    <script src="${pageContext.request.contextPath}/resources/admin/assets/js/func.js"></script>

  </head>
   <body>
   
      <div id="background">
      <ul>
        <li><img src="${pageContext.request.contextPath}/resources/admin/assets/images/background_image_login.jpg"></li>
      </ul>
    </div>
	
	<div class="row">
		
	  <div class="main-login col-10 offset-1 col-sm-8 offset-sm-2 col-md-4 offset-md-4">
	    <div class="margin-top-30 logo_top">
			</div>
			
			<div class="screen_title">ID / PASSWORD LOGIN</div>
	    <div class="box-login">
	      <form method="post" action="#" id="updateform" name="updateform" return false;">
	        <fieldset>
	          <div class="form-group"><span class="input-icon">
	            <input type="text" class="form-control" name="MEMBER_ID" id="MEMBER_ID" placeholder="User ID">
	            <i class="fa fa-user"></i></span></div>
	          <div class="form-group form-actions"><span class="input-icon">
	            <input type="password" class="form-control password" name="PASSWORD" id="PASSWORD" placeholder="Password">
	            <i class="fa fa-lock"></i></span></div>
	          <div class="form-actions button-panel">
	            <input type="button"  onClick="login()" class="button" title="Sign In" value="Login" />
	          </div>
	        </fieldset>
	      </form>
	      <div class="copyright">
				<span class="copyright">© 2019 OneMoreSecurity Inc.<br>
				All Right Reserved.</span>
				</div>
	    </div>
	  </div>
	</div>
	<script src="assets/js/vendors.bundle.min.js"></script>
	<script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/js/main.min.js"></script><script>NProgress.configure({showSpinner:!1}),NProgress.start(),NProgress.set(.4);var interval=setInterval(function(){NProgress.inc()},1e3);jQuery(document).ready(function(){NProgress.done(),clearInterval(interval),Main.init()})</script><script src="assets/js/login.min.js"></script>

  

</html>

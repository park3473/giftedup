 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <%@ include file="../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
	<%@ include file="../include/header.jsp" %> 
    
     <!-- 본문 -->
     <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <div class="sub_hd_area">
                <div class="sub_hd_con">
                    <div class="sub_hd_size">
                        <div class="min_size">
                            <nav class="sub_nav">
                                <div class="home">
                                    <a href="${pageContext.request.contextPath}/index.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/sub/sub_home.png" alt="홈" />
                                    </a>
                                </div>
                                <ul class="main_menu">
                                    <li class="sub_nav_menu">
                                        <a href="#">부가서비스<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span>
                                        </a>
                                        <ul class="sub_ul_menu">
                                            <li><a href="../sub/sub_01_a.html">영재키움 프로젝트</a></li>
                                            <li><a href="#">학생 프로그램</a></li>
                                            <li><a href="#">교사 프로그램</a></li>
                                            <li><a href="#">커뮤니티</a></li>
                                            <li><a href="#">마이페이지</a></li>
                                        </ul>
                                    </li>
                                    <li class="sub_nav_menu">
                                        <a href="#">로그인<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="다운" /></span></a>
                                        <ul class="sub_ul_menu">
                                            <li><a href="#">로그인</a></li>
	                                    	<li><a href="${pageContext.request.contextPath}/user/subpage/policy/index.do">개인정보처리방침</a></li>
	                                    	<li><a href="${pageContext.request.contextPath}/user/subpage/individual/index.do">웹접근성정책</a></li>
	                                    	<li><a href="${pageContext.request.contextPath}/user/subpage/email/index.do">이메일무단수집거부</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <!-- 
                                <div class="options">
                                    <div class="font_plus">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/plus.png" alt="크게" /></a>
                                    </div>
                                    <div class="font_minus">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/minus.png" alt="작게" /></a>
                                    </div>
                                    <div class="print">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sub/print.png" alt="작게" /> 프린트</a>
                                    </div>
                                </div>
                                 -->
                            </nav>
                            <div class="title">
                                <h2>로그인</h2>
                                <p><span>학생 및 교사</span>는 반드시 부여받은 <span>아이디와 비밀번호</span>로 로그인해주세요. 로그인 하시면 더욱 더 많은 정보와 서비스를 이용하실 수 있습니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <nav class="sub_min_size" style="width: 100%;">
                        <div class="sub_page_wrap">
                            <div class="login_wrap">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>학생.교사</p>
                                </div>
                                <p>아이디와 비밀번호를 부여받은 회원만 이용이 가능합니다.</p>

                                <div class="login_form">
                                     <form method="post" action="#" id="updateform" name="updateform" return false;">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob id_ob">
                                                    <span>아이디</span>
                                                    <input type="text" placeholder="아이디를 입력해주세요." name="MEMBER_ID" id="MEMBER_ID" >
                                                </div>
                                                <div class="input_ob pw_ob">
                                                    <span>비밀번호</span>
                                                    <input type="password" placeholder="비밀번호를 입력해주세요." name="PASSWORD" id="PASSWORD" >
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button type="button" onClick="login()" id="loginbtn">로그인</button>
                                            </div>
                                        </div>
                                        <div class="form_con password_find_wrap">
                                            <div class="form_size">
                                                <p>비밀번호를 잊으셨나요?</p>
                                            </div>
                                            <div class="form_btn form_btn_m">
                                                <button type="button" onClick="password()">비밀번호 찾기</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="phone_login_wrap">
                                <p>휴대전화번호를 입력하신 후 인증번호요청 버튼을 클릭하시면 인증번호가 전송됩니다.</p>


                                <div class="login_form">
                                    <form method="post" action="#" id="updateform2" name="updateform2" return false;">
                                        <div class="form_con login_input_wrap">
                                            <div class="form_size">
                                                <div class="input_ob phone_ob">
                                                    <span>휴대전화</span>
                                                    <input type="number" placeholder="번호를 입력해주세요." name="PHONE" id="PHONE">
                                                </div>
                                                <div class="input_ob name_ob">
                                                    <span>아이디</span>
                                                    <input type="text" placeholder="성명을 입력해주세요." name="MEMBER_ID" id="MEMBER_ID">
                                                </div>
                                                <div class="input_ob number_ob">
                                                    <span>인증번호</span>
                                                    <input type="text" name="CERNUMBER" id="CERNUMBER">
                                                </div>
                                            </div>
                                            <div class="form_btn login_btn">
                                                <button id="number_btn" type="button" onClick="certify()">인증번호 요청</button>
                                                <button type="button" onClick="login2()">로그인</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>


                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
	<%@ include file="../include/footer.jsp" %> 
    </footer>
	<%@ include file="../include/footerJs.jsp" %> 
</body></html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <!--추가 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    
    <script type="text/javascript">
    function password()
    {
    	location.href = '${pageContext.request.contextPath}/user/member/findPassword.do';
    }
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

		var URL = '${pageContext.request.contextPath}/user/member/login.do'
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
				if(s > -1)
				{
					idchk = true;
					
					
					//location.href = '${pageContext.request.contextPath}/index.do';
					location.href = '${model.URL}';
					
					
					
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
	var chk = 'N';
	function certify(){
		if($('#PHONE').val() == '')
		{
			alert('번호를 입력 해주세요');
			return;
		}
		if($('#NAME').val() == '')
		{
			alert('이름을 입력 해주세요');
			return;
		}
		
		var URL = '${pageContext.request.contextPath}/user/member/certify.do'
		var formData = $("#updateform2").serialize();
	
			$.ajax({
				type : "GET",
				url : URL,
				cache : false,
				data : formData,
				success: function(result)
				{
					chk = 'Y';
					var s = result.indexOf("true");
					console.log(s);
					console.log(result);
					if(s > -1)
					{
						alert('인증번호가 발송되었습니다.');
						return;
					}else if(result.indexOf("false:-2") > -1)
					{
						alert('계정이 존재 하지 않습니다.');
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
	
	function login2()
	{
		if($('#PHONE').val() == '')
		{
			alert('번호를 입력 해주세요');
			return;
		}
		if($('#NAME').val() == '')
		{
			alert('이름을 입력 해주세요');
			return;
		}

		if(chk != 'Y'){
			alert('인증번호 발송을 해주세요');
			return;
		}
		
		var URL = '${pageContext.request.contextPath}/user/member/smsLogin.do'
		var formData = $("#updateform2").serialize();
			 
		console.log(formData);
		
		$.ajax({
			type : "POST",
			url : URL,
			cache : false,
			data : formData,
			success: function(result)
			{
				var s = result.indexOf("true");
				if(s > -1)
				{
					idchk = true;
					location.href = '${pageContext.request.contextPath}/index.do';
					return;
				}else if(result.indexOf("false:-2") > -1)
				{
					alert('계정이 존재 하지 않습니다.');
					return;
				}else if(result.indexOf("false:-3") > -1)
				{
					alert('인증번호가 틀렸습니다.');
					return;
				}
				
			}
		});
			
		
	}
			
			
	 $('input[type="password"]').keydown(function() 
	 {
			    	
   	  	if (event.keyCode === 13) 
   	  	{
     		login();
     		event.preventDefault();	
         };
	});
			    
	
</script>